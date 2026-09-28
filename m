Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B421CA5FA5
	for <buildroot@archiver.kernel.org>; Mon, 28 Sep 2026 15:07:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 175D180E25;
	Mon, 28 Sep 2026 15:07:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vmm9SCtTr8QR; Mon, 28 Sep 2026 15:07:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 77BE780E84
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790608023;
	b=fWMNJH3OsEj5Tm9rcEgnLtI5dXquzJw9mYsPMA0R7ic30URAgPQYr2wwmC7DqdGo3JsM
	 mk0obNk9mONyQ0BEK1wvwZh/CzktsjRiu3Mvtg1w0LTIwdq2uQ2ECO9+yDa4dNTN5M86F
	 jMTr4SeNDFObnDyDmcE2I7k7RE83CL4AlE6IjSnJRMZGYw8j0Zg77OxJU1OoPoEK1eaB5
	 nXSJSoNFuE9zrEgUkk389JgurSPcQi2bMMSg3h4M7RzowECvoRssK8ltzTng1zrqBxpUD
	 lwYRPEGjYOEriZeMgG0VHiOi2DagkFG5p1s5BaCWNVNYppuoMh7NLVr/zxjUeU/cOLQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790608023;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:From:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 X-CMAE-Envelope:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=THLh5L1Ndz1IH6WMsgr2mVbFcaMOPknJhF8QuCgWXw0=;
	b=AorF+xDy0LIWLnZO0IUhX3JlWEmIN6phq0BDxqpqfX0+DyH2+reeLmW3r6HyeCCAhq7T
	 uRGP36w3SFqt2IKlGlP/MF19dxSSpVSy2OkhyblzhILzJu0SJrtzAFSL+4qg19RjLSVhR
	 aAzAl7S8gxvTDBLixGwaamPXtr2BAneAfrPMN0NBtiv+fZRPw0QoiwsHB9yUAD0ELSPtF
	 h8TYbFXqSp8CGn3UqiJ0HAMOsyIp0I+w8xKGMNsXOy9inW/0R+3Dm17rWHv+HU6xdpmTR
	 YiFMvtkQPvTe5KqS4kxrIvY+KgxVr8+2OY+02KfMn8bTYUOHOLvRq2zkWnr5PhWKW5g==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790608023;
	bh=THLh5L1Ndz1IH6WMsgr2mVbFcaMOPknJhF8QuCgWXw0=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=BAVewmPpq9RRqee3qxO+2aLJv1CMtKsjzbb3LDUgd9CuE05H3W371YqdtfcM98TMG
	 CAKrXpLJ7KerVn2YF+ayVeytsRTYrjFgs7WoZrdvYopDdE6ZIwOYGRxXU2pZz3MsuQ
	 zrm0lgcyREV5vsSQHSsobfvl2yrMlS8qc7IHFNtWNFy8m8haAIIqO25KUqsAF0ENAh
	 POP2V6NItYlWCSioll0zn8zRsXBAvAJGBF2MTC+Jcn3stZIejMb2AI0I3uU50QmCPb
	 HVNJg5313vetldBBcXy5GgJxJTarb8rivkpSZdyrBjDFipGsf5UgKF1k2jR7hh2s6h
	 WY+DcRJce0REA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 77BE780E84;
	Mon, 28 Sep 2026 15:07:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 01380D1
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 15:07:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DB603606C2
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 15:07:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0GDvS2GU5cGI for <buildroot@buildroot.org>;
 Mon, 28 Sep 2026 15:07:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org BC669606B0
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip=62.149.156.132
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790608020;
 b=cjbD0MzoNRtrNK+zIRV0K9kJYmVu8Va6tbAAJuBJzpAvQe0grQi716tmnKeo3bZmHih7
 R4V7ahWw73dCOftJ6SYjRivYPzd66MTw+F+Hb4KCyVseLldCj743GDdxWI8d3V/iyjK+G
 Vy5VYwfD4RZpkSS02qpkphm34dK4+lBsuVQXi5u/hp6dvLjAqetVT3TKmX1T+2hSBsD18
 +xvIdVbVuQhouprHJlymjsSXJB6oGQTNbBPsDdGPDamzzEXsIZZc46YpvY38VGBhzeRF9
 /ePLmohs9UUt3UzpZ85a9EA3rHlRNGaIp06eZT+/SK6E2vAQZPGiUiCIPxepz02jkug==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790608020;
 h=Received-SPF:Received:DKIM-Signature:From:To:Cc:Subject:Date:
 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
 X-CMAE-Envelope;
 bh=uzR3TSOvWAwJ2WVsYj3f3lITdum2iT3WluTEBFpRdHU=;
 b=S5wJ5YaCek0WcQRpwNwC5hZ9fgIn3G16oIFPWQHmcsIBawTg9IEXlm70DQpB4Z0vk5BO
 9G3ch8KJPpkVuCN579a/7idwdYawcYskMhkIHM0hKbbC7HNQGZ4+/IQsa5IIWQZ0MIuEL
 ppObNT/JKZkYOSOPlUMJDUGRCXN40rPv11i+U5W380LNgw/6ara9Q6f7mOyBQrqpl3qUG
 De/Yuan/YDFWnx8e/Wuv4Oe6M0ddux4M2V1Wz0D9AYhm6GAqUYUVKC5PPlrErh3K8kr7X
 T+6kJXEGHbUAtb3ugXxoyXIltu4nmep1VCQrGuzJPuCkjBlCGs9ZjOkdaGGUaKxoaKQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=benettiengineering.com; 
 dkim=pass header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256 header.s=a1
 header.b=lKqGnDmn; 
 arc=none smtp.remote-ip=62.149.156.132
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.132;
 helo=smtpcmd12132.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=lKqGnDmn
Received: from smtpcmd12132.aruba.it (smtpcmd12132.aruba.it [62.149.156.132])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BC669606B0
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 15:06:58 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id BCwRxNxVgxUh5BCwRxLC3q; Mon, 28 Sep 2026 17:06:55 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1790608015; bh=ldy2P5TeO+IbRpR9HBbJ+73PMGV/wdAEbLuq6ylUfnk=;
 h=From:To:Subject:Date:MIME-Version;
 b=lKqGnDmnyzcvfw2uqA+VthkrPhzfPkRCh3Gm7YVu3FE1mJJOyy8C7jGoM8zDlmmkx
 bakwN/ejbE+hF4xP7cR601cH2NVAJq1H5GfeF8l8i9R5jvqy/ybCJpuWOgE2LA72QG
 ZHaq7IHYjeY+NpRS7h8v+s9jP6dKOtG6Ug382YMwhZEWC/AK8j0I2KsPVqeUlx0IZN
 z54LSjGzbpCXCCQoLuOcsKVCuqw9AzJJBhRVO5aMzMhy3EHIg9TCamg1xcwHVW2VJs
 YxYvF3PYdCokm8JKwH2CZqRc/KTsPvLap8ZnPlPRmFEgg6OACaHjTnQad1cUG1s6wC
 oSqDz4D0e925A==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Mon, 28 Sep 2026 17:06:54 +0200
Message-ID: <20260928150654.295119-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfK+/l0ZF+b0H6exEcqsZtnaVQA1Ii4tQ2KrvUH8furLYhxL1L9Ok/Nc1AXdyEgxpmd0guyBq7J53oB2vWdASw7HureDVx8MYmEnoSRiv8d2yoEO90deQ
 zmj6SqQODLou/4V0mCi/SPJmVW+FUAeFMPLJX2Jp1xPUkobcaDCutSDNwigfuF2+tws0SMS86mljH3TiyUfYLvpyWaQtp+MfxISfc51ATH80SzXz3RLAl8Me
 C6tinbgpCkg2h8ToiHG3UkZocdTgFQTU0RXMojsgkok=
Subject: [Buildroot] [PATCH] package/cryptsetup: fix build failure due to
 wrong libtool/configure paths
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

At the moment cryptsetup is built using libtool/configure as they are,
but they don't take into account completely path we're building for.
This leads to build failure while libtool checks for:

  i686-buildroot-linux-gnu-gcc: ERROR: unsafe header/library path used
in cross-compilation: '-L/usr/lib'

So let's fix it by enabling CRYPTSETUP_AUTORECONF.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/cryptsetup/cryptsetup.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/cryptsetup/cryptsetup.mk b/package/cryptsetup/cryptsetup.mk
index 643a2b3f59..fbe92001fe 100644
--- a/package/cryptsetup/cryptsetup.mk
+++ b/package/cryptsetup/cryptsetup.mk
@@ -21,6 +21,7 @@ CRYPTSETUP_LICENSE_FILES = \
 	docs/licenses/COPYING.LGPL-2.1-or-later-WITH-cryptsetup-OpenSSL-exception
 CRYPTSETUP_CPE_ID_VALID = YES
 CRYPTSETUP_INSTALL_STAGING = YES
+CRYPTSETUP_AUTORECONF = YES
 
 CRYPTSETUP_CONF_ENV += LDFLAGS="$(TARGET_LDFLAGS) $(TARGET_NLS_LIBS)"
 CRYPTSETUP_CONF_OPTS += --enable-blkid --enable-libargon2 --disable-asciidoc
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
