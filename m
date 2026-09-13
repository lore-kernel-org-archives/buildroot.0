Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BABEC88E63
	for <buildroot@archiver.kernel.org>; Sun, 13 Sep 2026 16:40:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BAECD60600;
	Sun, 13 Sep 2026 16:40:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Uv2GoO5yaEsm; Sun, 13 Sep 2026 16:40:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org CB969605F7
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789317608;
	b=ROLVCK73GAuaDvD0Nx8KIaY61sO+9HA/0er9MT/ZwzV/KiTicwjGvYu6mUMEYOHuMQVP
	 NEabxo16avun8hPWluspr6M8VdMH3lOT+0n7OCCG6d8wp2+zZhHZaIK4YbHdu7POM7VoM
	 n401hV7LUWiAyyYZjkomy6SMwdcJ2Gjv4/T7EHziVQ/4ViznkUJqkpgxox4Mh7s/1Dr/e
	 1DHs+Rwj3mpNPmE9/396uqCV9qzsBI/Nq2Odss0qFGW4q/9wAlOXovGwerwFGBAhl0DFH
	 5mrdzbIiU/RG7fHTlHbLoqFxcQfANZnkf4cVIdPtkNdTooOkzSBkdNwaXYJVzSIlmGg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789317608;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 X-Last-TLS-Session-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Type:Content-Transfer-Encoding:
	 Errors-To:Sender;
	bh=Ymgp1u9HRUrWT4itb3hue0UnqbAxYXaATVaPD4wToag=;
	b=jIb/lUIymp6DXguZSvLTpPWUDXm+eHVxjJ9X0OeIQx/6LiWe4aovANWvlLZdev4aynzp
	 q743MO+I+kfsW+DrX0UaI2unvCNaLQds/NRoeTfcPM3AGgS9IK63ZiUcdvu9Uvzk+786a
	 /dG0m5e8jnDe3BeWfYvY+kiABZHbQwByAr9i1x2qz9l2UzP5L+tF9qDM4+GU+/igdEYFZ
	 Rvc9NzAQFqJmYM7W2dJDxdGEKpokJOtTxnC5MWlpxQ91Sx/M1G85ZvobP1MIcJbjNYchu
	 6sAklMAzymMAoWV3GG3wur69OtvGDJ2JUE28wDl42E+5Zpxso9JPU7Y5neUsCStVRZQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789317608;
	bh=Ymgp1u9HRUrWT4itb3hue0UnqbAxYXaATVaPD4wToag=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=W6S8adI5vkY6rphmfnEcBrKKMeDDJSAhnxz1tfMWkbrqrf/vjHv35LiGibjJWYhGD
	 z5mYVZ3vo0r0CRH6ECBihrsZ3DfzY2ojSzGX6q62mnqljPHyvboL87aZVyc7siTKmI
	 jpl1ZAna7YzLLqmimWfqgs1NTisdLlcZnP+6ynPU4adp2e/lpQ5dUYcWP4dfUeWu4U
	 Jp9bhI5Pp+BDAGk7GSfWlMpsuBnFmP2zNCzkL39vSRy/Z4Ms4Eqpp/dJLvh8Ave9nx
	 TpS68VVzP+cy6aa6BFLPLamsx9/v73tGJOvK6x+TFb/JkhiOfQbVjjEC8A40XoQIoM
	 ctPWDGtKSZNTw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CB969605F7;
	Sun, 13 Sep 2026 16:40:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id E099329B
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 16:40:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C6EF6605F7
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 16:40:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MOMlpZGr_-N4 for <buildroot@buildroot.org>;
 Sun, 13 Sep 2026 16:40:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 980A6605F5
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789317606;
 b=H1P/pZ71H22ir75qe4QSsw1agYQbaEtlWkPLLTCLfoTu2XYTV5xsWUDRc4h17YSwd594
 aR1Pgl1M5C8eWNL3Gp/AVoJrmSJQLHAQRo1ofjmVvb4QOCNYnwsMzle2wLTi8F0SiCgxu
 7UYdThZgDBhiucWjVPp1YSsEmMzCd8xMLwYV8jRrRW78qYG6e0FKTE262kpSKawAWFlM0
 nE7Spnk1+VT2t1ojRpBThU1jR7wtovGbnlHY1ib5TG9djMDB/TLt2vXn7TTfu/yJFqXwx
 tDuh9VtffwqMKqvu9QZdpK/Pmu2Nboj4ITQmxtuZ/0y89Sp0SaYoAjAa2Sv8QLRifQA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789317606;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
 bh=xKKcVICICnfO7l0e0d00FddDdL1pRNLw0DStEBTYjPQ=;
 b=pXDB7kXPQZRR3+gFNI3DMhQHsUHbMYR5OartK3+5gI6jyhNOJlDv43JBLfBqvYqciDnk
 4uqXmfTeHHNkcga7imgstAuQy7D8dDcP4P52/hiws3Oecom/6E/itS6TAGetQS/FRF63c
 G5hXT5vSdH4GbPNMs+6I4tcMGXRF290Zd+ZHInFo0HlxAb7350Cce6KWqzPkyrJ2hBvm4
 yP1oAQRe6dK6wnZWcd99IiqMeMtzemqYPHk3UrLpzo69bItDKWw0BLCzP3WEt8uE9LZ6h
 YOGw9fjX/eh7UaQeSo/gMgJRWWlgqWYeAnU49QS3+FyRXxclJwPZgF8MzhFyrrmRYlA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=z6qm1Ivx; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 980A6605F5
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 16:40:05 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id D970E1A051C
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 16:40:02 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id AD9C560435
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 16:40:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id DDDC811C78D5A; 
 Sun, 13 Sep 2026 18:40:01 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 13 Sep 2026 18:39:59 +0200
Message-ID: <20260913164000.1689498-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Subject: [Buildroot] [PATCH] package/libssh: fix select
 BR2_PACKAGE_LIBOPENSSL_ENGINES
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

BR2_PACKAGE_LIBSSH_OPENSSL unconditionnally selects
BR2_PACKAGE_LIBOPENSSL_ENGINES even though libressl is also supported
as an OpenSSL provider (and BR2_PACKAGE_LIBOPENSSL_ENGINES doesn't
make sense for libressl).

This causes the following Kconfig warning:

WARNING: unmet direct dependencies detected for BR2_PACKAGE_LIBOPENSSL_ENGINES
  Depends on [n]: <choice> && BR2_PACKAGE_LIBOPENSSL [=n]
  Selected by [y]:
  - BR2_PACKAGE_LIBSSH_OPENSSL [=y] && <choice> && BR2_PACKAGE_OPENSSL [=y]

We checked that libssh, with OpenSSL support and libressl selected as
an OpenSSL provider works fine, using the following defconfig:

BR2_aarch64=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
BR2_PACKAGE_LIBSSH=y
BR2_PACKAGE_LIBSSH_SERVER=y
BR2_PACKAGE_LIBRESSL=y

Fixes: 62103be918e7a155749b1b3b680a9e4ecba6af87 ("package/libssh: select BR2_PACKAGE_LIBOPENSSL_ENGINES")
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libssh/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libssh/Config.in b/package/libssh/Config.in
index eaec754414..bc9a02d9b0 100644
--- a/package/libssh/Config.in
+++ b/package/libssh/Config.in
@@ -36,7 +36,7 @@ config BR2_PACKAGE_LIBSSH_LIBGCRYPT
 config BR2_PACKAGE_LIBSSH_OPENSSL
 	bool "openssl"
 	depends on BR2_PACKAGE_OPENSSL
-	select BR2_PACKAGE_LIBOPENSSL_ENGINES
+	select BR2_PACKAGE_LIBOPENSSL_ENGINES if BR2_PACKAGE_LIBOPENSSL
 
 endchoice
 
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
