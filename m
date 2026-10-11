Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B70A0CA9EBD
	for <buildroot@archiver.kernel.org>; Sun, 11 Oct 2026 14:55:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 58EA580D9F;
	Sun, 11 Oct 2026 14:55:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6NLagC-gL6WZ; Sun, 11 Oct 2026 14:55:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 955C980DD7
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791730546;
	b=oG+rFsYdPOveVEZQOf59BSZriDc/Z90cEdrBRC2wmR41lurlESseO7cJSfJzSJalid0u
	 wIt32qviV98z6tDNE1GWKws55ceYmiXt+OJl7dDvG9p8WsfkBP/qoRcUijsEXqr+NhUUh
	 LPFCOrXhq06Ae7DVLXShgYTF8cGpRIV1nCxIJ0f7tzPrrg7t6+y8BexPktfuAREIDVDT+
	 7FZRXCDLELYJNp67T/KUgMGWBt2RRcrMM5oP1Qfn42ODU6KJCEePpipSpqYEqgIwaCV2W
	 Fj0AQ1jGziiOynDLTPp+4K5eE3lcaw1POCEMnk+KCFfN7PNy7uPpAoIk9figYihJPHg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791730546;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=3QwNS+uWypLC0aAfefkqw/dpglG1+8UJoJ3MMHCdE1c=;
	b=ZWQ3s89xsefEREeEMh96r4r/1Xqsz0eQXhipUIiQECXtdBfSFDGBswmlGwUi3bDX4+P9
	 LJ9ZRQP5ZIJ8KOEvq4cE31FcmnTxU9QjeEDZpJKyAAf7jceiiAhONUTVFC4DrAMGFe4F1
	 BPQPBm66bB2OZGRrrmZUh/cEPaug4isvVHv82xJKJScym48vKaLA1YYibJpwjhFZJSCNZ
	 pjPWWD6NT0dnhvp+YFarhGyw1KcMKp7vdTCFs/VVAIWNJE76cZnITNMbXnsRYmxwh8xqT
	 /58kKhrSp/dxN8gf/kHl9Oq7AI9bkYHjGquq3WqxzbDYr+hXjF0UdBMHkZRygQO+daQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791730546;
	bh=3QwNS+uWypLC0aAfefkqw/dpglG1+8UJoJ3MMHCdE1c=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=WOJ1dZM2uSK/MmDm3KqI3QTPTOGf2ABj9hgAxIlvtu0nKhPMiUCNU9IVLQofseiLO
	 4095TvifSGdmT1jiL9CAjLznuGJgbI5HPORx9YC8r8irLJ+6NLe2sK+r3MXN8Ezons
	 g7scdVuYTgwxBL0005GGLuiU4P5fH4EvIJByVLxAPZOFQH2niZ0eDVa3lERxX0hSeH
	 jkZowpapnP/mAHXQ3e5kn1UA8bCB5CexQMWBUEB8ZvhKP5r5YKrjEwZtJtMfsLVq7u
	 HDrIx6faLmnXdrUAHHlzoHAlpLRZ2DqxLmE7Jqhv8ZzvSr0LkCfIegcF0/dSXETvh5
	 w7UpOg5JKdaQw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 955C980DD7;
	Sun, 11 Oct 2026 14:55:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8B592380
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 14:55:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7CDD940637
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 14:55:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tgNSDZgQWSYS for <buildroot@buildroot.org>;
 Sun, 11 Oct 2026 14:55:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org CB2284062F
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791730543;
 b=agrtvOM5fBUUQZ4/+mQB5zvNOGvgcc/sCo45SBAosH8Yi+Yw+KKKG8OmVeB9oXMlKFCc
 LUhSUvPPqyuhTjRCoHfQndj6ilIjmXHl11Py1t9qkCZDAP4f3f2+2tXqHWsv0ss2OLbOe
 RMrllyY3hVExUNzb65BkTvVZYea4TlICE8EbN2GikFKZJS0y68XgqshcFIld/9Iq87eDl
 De071AQGqa2ehHc1YgLP2rMxMLnWs8yf+G51ZKGBOxm+NQz+wHTPF5KH2smPWhezwg7eE
 +3VCfcrIO6HhmjdHU4Nrpai7e2SbRomZU3zq0i2gY/AeuIA5jr7wRLYnr5p1d6uGTrA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791730543;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=RYK4Giy968g4pr5GGfRnk4tmp3Yp+Yam/L8xjJmaIGY=;
 b=la/cWfF3uAYmY2uqpxX/q2fy2HAsvznHq7fCRBk4aFs1pajrOxYvexwarLxm3LRNdBpw
 zo8gLy+Jf2IfIQNeJTcV0WP4kKokqCJfdjkxhrZKBeURZQiNzZNEQ2tsUZ3DAM/TJIu2f
 LQP4pUl2FoJzx/VDkWEQHLcT/xCy1KIGWujLOs/ZytXe4x7n/iJdAZIiFbQseUC7dpuJm
 W2LiVh4PbK2Lsx7FUboWiCT7Je5vWBxvG18nhsm8HO6kUsHIReUiIT9XKBN160BcMYJXF
 //vp7qPJDuV3QaWHXLblezlS+FpvHPM+h2D2t4GyifrmRM0/YPMTiGeFMJS7wOrnFuw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id CB2284062F
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 14:55:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 14ABE94C5B; Sun, 11 Oct 2026 14:54:25 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 11 Oct 2026 16:50:55 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 66754d7f504075188b2ae7eca2530013986b3fb6
X-Git-Newrev: 2af78232fc87dcdf007cbda074c97dbc79e00082
X-Patchwork-Hint: ignore
Message-Id: <20261011145425.14ABE94C5B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/php: make sure ca-certificates can
 be found
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/2af78232fc87dcdf007cbda074c97dbc79e00082
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

If BR2_PACKAGE_CA_CERTIFICATES is present, add the ca-certificates.crt
to the php.ini, to not get SSL errors when using PHP.

Signed-off-by: Julian Vetter <julian@outer-limits.org>
Reviewed-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 package/php/php.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/php/php.mk b/package/php/php.mk
index 48525b7e29..cd1270be57 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -353,6 +353,14 @@ endef
 
 PHP_POST_INSTALL_TARGET_HOOKS += PHP_INSTALL_FIXUP
 
+ifeq ($(BR2_PACKAGE_CA_CERTIFICATES),y)
+define PHP_CERTIFICATES_FIXUP
+	$(SED) 's%;openssl.cafile=%openssl.cafile=/etc/ssl/certs/ca-certificates.crt%' \
+		$(TARGET_DIR)/etc/php.ini
+endef
+PHP_POST_INSTALL_TARGET_HOOKS += PHP_CERTIFICATES_FIXUP
+endif
+
 PHP_CONF_ENV += CFLAGS="$(PHP_CFLAGS)" CXXFLAGS="$(PHP_CXXFLAGS)"
 
 HOST_PHP_CONF_OPTS = \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
