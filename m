Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25058C88E63
	for <buildroot@archiver.kernel.org>; Sun, 13 Sep 2026 16:28:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 182424056B;
	Sun, 13 Sep 2026 16:28:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pGfKOA9kE5PU; Sun, 13 Sep 2026 16:28:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 4AE5440543
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789316921;
	b=Bwh9/okhgck6LDjAnieltV1/VTsV2fEOcGLqKGR9+opv8xzk0MoSnoxee+oimpbMi2p3
	 TFWM1Lv8shWxX0QYgrkXX9uwNYYCIKa+QnBNLUDmufQ4m0O3y6rrO/ErX/8ecsexnQ71n
	 9OkTEM5FyNQ7OoHQAAbLsIfyRfD45RbkVzMp+608dp+EJyE8XDjtYRLi23D0FyX4OGIZ/
	 EY/PMg4GcHk9L1wS7jUEOn6018lesOcilNAAPv0j4DvVVIJla5ZwQdOftLYIsSn4FjvEq
	 WjkptqZvIio8lUisChAqysHojwWcKfnFES1dkXGgWIkmJeYTOlFj/l0oU1iV+JzG9IQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789316921;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 X-Last-TLS-Session-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Type:Content-Transfer-Encoding:
	 Errors-To:Sender;
	bh=QFbZrrfxs/OSSGJ1BSCmteZ58j7/tGGrUPTi/fKvoTE=;
	b=lt989q/63C8YvGas34qALkO8zg0lDuhoeBNNGn6zmp6TKNH+0I/5+6MAZN1r7EkHbs01
	 l6bv1wQ6we1JSVv4YUbO9pfgAqEW+oEJcShWHu33PDxNNfCkpMuySyiP7BHSpkFhjdQVT
	 s7P2jWrL+jI/N4YcrreL5STABeK+wMZmWoE1V2cC7S53kvZ9BJJUg0Jn4xuT9EWGIOb0h
	 Wqa2nN1pbcUNST44xkfX/bBvWzgd5zWItFVESEcL8shFz9ArDdYrlJGwl3y3ZdQ7iE9nH
	 /uGSrkKsUGTtjMngf4gzLh/9LSTXgtneRrvuI2ibklDTnp4AKg+HKWrN6HOx2nTP15w==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789316921;
	bh=QFbZrrfxs/OSSGJ1BSCmteZ58j7/tGGrUPTi/fKvoTE=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=C/Z9WD2GREhTtvyL2+yq0L6tqHvAQIdXtuBredyMCsOlaVQsjZAdpK61VM31IjpuM
	 aLbwmdHHBIvY1JTkvABpG69RQtBOOz+RGY/jY7Lbm6E59F8aUbMPzlUhtaTWzdkpbD
	 TkO0O3lvZC9f5ffhzxIjXc8/sJokohg2s9oDYUija/IT0xLqo+yxf694Ib1LWTgLTH
	 DbKo3fIZJx14gOnLXB9BM+CeIGQjpgM6b6LjsDZf6Tp7wHG/WnPT7rz0RPfbiiyRH6
	 9b84r02f6NBeAhGltte4wZCVWp8AwdBtdQOyHdcEtsHP5V2z3fzj5To+uqRNEmVCPP
	 X9Ohz1QBN/Erg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4AE5440543;
	Sun, 13 Sep 2026 16:28:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 41EFB362
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 16:28:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3F73640076
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 16:28:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OO_SDK5GQZaO for <buildroot@buildroot.org>;
 Sun, 13 Sep 2026 16:28:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 8F05040022
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789316917;
 b=SjXbcVNrbJIvbMCdFrujJUT1d3PP5RX47N9Pic8hAOsiHorY+lyM3kjBe25PfvgjUDuH
 CUq4zxFtMUBaJLCxSvQQ8nRlKWk0riDwQrDtRUuydXDZrtR8imcxQm+Zm0mUqJNun1CJq
 5mO8Oe4SkDgpFwteY0rXmL/ADIE9UWmyN/kSl2Y3yLkOXFf9XW4aardj68CpRiH41ZjR+
 S0zOWY31RVkhOyZZCBfnt2Xd3WcVG779JwBLvgYZGTXPTfrwibxISSz/MHgtbYMF3Kg/0
 doqk8zBUlT7IpT++QtDGLo3MXXLwzBd6ovJh/KPmlwtMI6W+OJRtjssBY2ZMxgZGPGQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789316917;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
 bh=l3RpdgIbkH+mdASi1sB50x72LGyQDHOcQuxI1v5oVhM=;
 b=GDiItYY1FSJx1lhUIwSpNNMRW17oMj1cnvqzFfWZO7l0AyM3aKCdzDQZMiyCk9Ik5WJp
 gFlya2hu6l/3jQ2MVsc2IKk75SLnVNxon50xJLxM/EoDc3SbDXXjH+PdalCyGW3gdyMgJ
 h5zhddZdI+quzpFiLOay0KsNEpgZ8VWzUoQNh1NxSIKrnom7ewzKhSVPUTZzxF62pXIji
 ulcExLjQMHau57dkJAHnGt6WX6j96z3Iu2j1x3EjPRV/zhznv5g5O4jVJvQ59dZlzV9NO
 gKwJ6AVftYb45LLOUqtKdhBOMCC3gRpNj6lhDmrzDtnfjW8YquteUfrMWy+3ganTG2g==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b="GWWpU/tT"; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8F05040022
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 16:28:36 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id DE27B4E404BD;
 Sun, 13 Sep 2026 16:28:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 9794E60435;
 Sun, 13 Sep 2026 16:28:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 51F0F11C78D5A; 
 Sun, 13 Sep 2026 18:28:32 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Kamel Bouhara <kamel.bouhara@gmail.com>
Date: Sun, 13 Sep 2026 18:28:30 +0200
Message-ID: <20260913162831.1675846-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Subject: [Buildroot] [PATCH] package/usbguard: fix gcc version dependency
 after libabseil-cpp bump
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

In commit
76241e89e1fa7a7b46e23d0a22c3d4fc11a2475c ("package/libabseil-cpp: bump
to version 20260817.0"), libabseil-cpp was bumped, which required the
gcc >= 8.x dependency to be upgraded to a gcc >= 10.x dependency. This
was properly done in package/protobuf as part of this commit, as
protobuf is a reverse dependency of libabseil-cpp.

However, usbguard, which is a reverse dependency of protobuf, was
forgotten, and it no longer carries the correct gcc dependency.

This commit fixes this issue.

Fixes: 76241e89e1fa7a7b46e23d0a22c3d4fc11a2475c ("package/libabseil-cpp: bump to version 20260817.0")
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/usbguard/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/usbguard/Config.in b/package/usbguard/Config.in
index 254209ff64..b71333aed9 100644
--- a/package/usbguard/Config.in
+++ b/package/usbguard/Config.in
@@ -3,7 +3,7 @@ config BR2_PACKAGE_USBGUARD
 	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS # protobuf
 	depends on BR2_INSTALL_LIBSTDCPP # protobuf
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libqb, protobuf
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8 # protobuf, C++17 filesystem
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_10 # protobuf
 	depends on !BR2_STATIC_LIBS # libqb, protobuf
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # std::future
 	select BR2_PACKAGE_PROTOBUF
@@ -18,9 +18,9 @@ config BR2_PACKAGE_USBGUARD
 
 	  https://usbguard.github.io/
 
-comment "usbguard needs a toolchain w/ C++, threads, dynamic library, gcc >= 8"
+comment "usbguard needs a toolchain w/ C++, threads, dynamic library, gcc >= 10"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS \
-		|| BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_8
+		|| BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_10
 	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
 
 comment "usbguard needs a toolchain not affected by GCC bug 64735"
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
