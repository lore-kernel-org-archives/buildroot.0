Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F810C982C1
	for <buildroot@archiver.kernel.org>; Wed, 16 Sep 2026 19:42:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0DE6A402D2;
	Wed, 16 Sep 2026 19:42:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6q8xxvJhQmeV; Wed, 16 Sep 2026 19:42:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 0A41540441
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789587762;
	b=mt2qVBg2yzVDbF+9aT6GyY7twLPhG+gYUVLCY1CVEWhow/IGPLkt2rRWLt5b4Lv3W2S1
	 f18IUIuTQce/NCmJP/yfGlr3/T2uJs2r6+KUCS2jprVG7N+CYgjSrY4SB6t0vy0EsxpBQ
	 BKyN6t6rfBK9vgpTounkR+4tYTb4OBOX0oMihYLToKK4b+N1VYyQtW+P9CYYKr/H+rDmD
	 oePyh+U8rjSfHYBbOgwCH/0lrjen4vdjNaeOU/lSNtX7Bg+/iADXnFHizXNtETutim7lM
	 UpSqQb1jqJmjjpak0dMijnR9jV11OynEj1e1A6b2d02bdDSgX0mlhdH/SD1C8Flxtrw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789587762;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=LSzN40ZYVXgvMGqhKzpwuPYujQCMd5bDbY73OI0INn8=;
	b=gjyRvw721tbEJMPCbItM9U95gUCJt7x82KPdHXG+lX+D2NC1hDRpVjTu4sliPlIX8A8R
	 2KvAB6ihIFx6AgZnPNvcIFmKSPJ8cpSfBECsRix/vr8Z6U7iwBS/wAHNMIIlQj9byK0CB
	 DyvK19XK+OI/hzy2Mwj5BZp2AWFCtXMi5yUwXWm8yellVTe/rDb6qFTEj3WJcMSc46aZv
	 sNFT+Vei9Zjk2cm3FOsj0uEidGDvqu9Z2rMayNHmbwqie3I/Odz+FreCvJHr6Yn0ynUyQ
	 08LVKzKY6RRL0tujFwH/SfAlLrQMGI/+L7KGmT3aq6jFAOIxL3XG8Q8DBJoYngNFOLQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789587762;
	bh=LSzN40ZYVXgvMGqhKzpwuPYujQCMd5bDbY73OI0INn8=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GDynZ13FMBalKEnIUfe2Mkom1pxqEn2wFlW+jIc0VmeihF59R8EsUiBlqAUqrRkBS
	 SlOiFWzqYQAzl+yPSYlBxWndGUXRLmSMqrlbzvvSw0Qbsdb421oLgJAiPIW3Y4yZQd
	 CBXySLjHqbv1zZevtuwGFl22fM9DblMnwtH6thDaP6ik7dxjRgAxYkf2nPDcbPljUE
	 tlrd4GS/y53ibGOO+wLKalM17199sUFvoHzNFuL9HZCPsmpzahSUmsbnUlkuFl4SXf
	 YC4zTqNrkDrkdTh06G088yrlqLQNXMhjp/Y68ss80rZ14O9lhHAnDsA/I9v3FbE2dr
	 +2daFulYy2YLA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0A41540441;
	Wed, 16 Sep 2026 19:42:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 25DD22EB
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 19:42:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0C779605E6
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 19:42:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u7lbIFe5QBr3 for <buildroot@buildroot.org>;
 Wed, 16 Sep 2026 19:42:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 8B54F605AF
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789587759;
 b=AVNzHb/ECR5pNUJ8AfG3+DNqbkUOMqFLLnZIScvSC1luJLoPZp2FyF5qTPgz49OT4W1P
 ic2dwtlNcqm8eVSRi7sYJQ3oyz6oBjBh/bE+OUO7S3hB3ituOKfFfvPn7yJM+MUs10LHO
 qSQkhPc6FvXficQrsJqC8WlQwXsRvX4u3Hmw3ozKMCBnU19zfYnExponnvq/8yRdBV2Me
 ikhUaXty4E1yRRwJiLuOWtnQ48M1ircDx9yeMUfVL00xcV3MD7esy0gyXhuIqdMuOT6iv
 MTPdi7tP2S30LfTHxGcNj1RYeS2QxViNvuI/8hbGexsl9O4MH9nqQ1+5t8C+gbflReQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789587759;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=QYcy8tKnzUoC8M1noiNdpJfoBTDXjXCRiOIIQ8nku5c=;
 b=NW2LiWrsGXrJlW9hErDuk6gSTk+IMT0yove5ihfc1GeKL/9EI0fIpodOJ2xlSCPMI1c6
 0owWGKh6SbA++7dhBr0UpHyqu4SzKy8QDM0I2OgNgQszyzuHHBrdym4qUq+JjVFbRMqc9
 PUJQ8+QHrjKI2VOItb4g2hxNfCeiyDbMwEW+nExjpcc3qMYkgQYXLK9CKrJeh7pKdyial
 Pbh0QMhEqhgU2E/ytLICrCoqwD6dCP+6P2ubyRGXCPo2HIdb3a+fKXDQ+/ixY4MlWBmCL
 t+u7LLwZ/X1IYx0w1W4GwClKa6WkBWaMri/jA/GdLCqqQi2JWcB3ONrdhjw5Bpn+Z2g==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=JeLb8ETb; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=JeLb8ETb
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8B54F605AF
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 19:42:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789587742;
 bh=QYcy8tKnzUoC8M1noiNdpJfoBTDXjXCRiOIIQ8nku5c=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=JeLb8ETbdoRNBlF21fnWUR7fiE5wMPWUxZO55qf+XqoxgVKG14b3CpLLcSpThTsuI
 aPd7rW0UfPUmYmnHdiOGGFPdrpkwUxMLA47fDiow16StrJ5jQ7/w4iO4xEMSXviKE5
 98vdrO++VMRxZVcCtS40Zxffrg/dMP1Qy/6cu/xmU4yATwnZzm+JerbjHZw/yq0xkB
 FIRf4m/MhwYAhgBAU2ZNZMO03AF3o3P+KndOm1l4kLTYhcFkq7oYt8x9m2r+GpaKb2
 vxyaand7MqmHtsUOpD4AYS8/JWqMSfD6qpDmYdQqEBInbxdLE2p+UI9E0aM40a8lCU
 MSjgDIdDssJWQ==
X-KAS-Sym: v3:f51bdf72230551df:M/F/F4sw3pHiw0IiYsbbih9x5OE3bVA5mgINleQLQFuHJnDKx3NKUEFbUDEeaIQ14PThXGL/S9h8Rivsr4sK2Uco8JKIW4YvOU7LHcI2Kpt00lj6mX+D7FoEjeWZKj93x5ky5seWoof0aWuZkJzq77wL/K+If1tR/Bjy8plQaG7ugdEH7EHnYE1xDuvHO8i1i7YFFoZBb/nGyba2y83nwcJqb38J6wtZ2HsiyvsdItAFJazXhYa4/B90yfrgLDLeJnfxIdsVhVODBphiGxZEswKVvXxU+iLoWtNEsferYnbZtOExRX4BADKntXL+Kjg+So24KgX6b+/zBbHUktAdWA==:CandGtGsFlqK9cM3kvZFXfKLZZPl5VlUM5HusVPx38xdecJFffbgntw1cOw6XnMMCVcwRf2K3dENWUdm5xEbciAS1FUOLiGTcj9FiIMY/CmA+/nCrZDWwuHWHQsaTRRX/WNRqRkJsJa2OEy+fAOSjLBJSqxJ5Or6JTrynevs6v54ARXgNYtSdreYFfiBN2E3hSW3HKN+Ps8dVPIKh+zki7QJSt2XWzdr6frTiBU23wNzsX0RHtk5Jw9n2/3BQdoE/F1KtvGDDkz8srGrxlJxB45EHl+5pcS2LW3tx1Z6NV+qGTxev/WEI1riXNFTFL9GpXPVReQdpa7+QekDC46wKW0ZwcFF/caOZGjZ304vE23ONtjpNPuUdTGaAtDX8aFtHiN6N17FPEID1OnckhGYB9PccqJtDVlvYIrY6nqubKhcowDCRLwdhVmbpZAhVWpt38rrBSdy1P8SjwSBReFwlwLBnmFV5fqnlBw0ACrCyNJrzJ4yfQ9G22ha6NTsMNdbs0p5DotAvf/y7Pkb71o09R24yFY93q8qwGDgFekua8mlqbFNIjXeIMC8qYIGw6flEP9ZCrTVqGLfM6wtXZ6GnQuhKQgFUIDu5j22BMDEorccv3
 J9YNo1ljLjJs8FydwPPtkyv5g=
Received: from fli4l.lan.fli4l (p5b3a0ed0.dip0.t-ipconnect.de [91.58.14.208])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 9D30EA4C3C93;
 Wed, 16 Sep 2026 21:42:22 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:38832)
 by fli4l.lan.fli4l with esmtp (Exim 4.100)
 (envelope-from <bernd@kuhls.net>) id 1x6vWP-000000005Dd-3cqR;
 Wed, 16 Sep 2026 19:42:22 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Wed, 16 Sep 2026 21:42:22 +0200
Message-ID: <20260916194222.1478392-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260916194222.1478392-1-bernd@kuhls.net>
References: <20260916194222.1478392-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH 2/2] package/bind: security bump version to
 9.20.29
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

https://downloads.isc.org/isc/bind9/9.20.29/doc/arm/html/notes.html#notes-for-bind-9-20-28
"The BIND 9.20.28 release was withdrawn after the discovery of a
 regression in it during pre-release testing."

https://downloads.isc.org/isc/bind9/9.20.29/doc/arm/html/notes.html#notes-for-bind-9-20-29
https://downloads.isc.org/isc/bind9/9.20.29/doc/arm/html/changelog.html
https://seclists.org/oss-sec/2026/q3/801

Fixes CVE-2026-19033, CVE-2026-19662, CVE-2026-19666, CVE-2026-19667,
CVE-2026-19668, CVE-2026-19941, CVE-2026-75029, CVE-2026-76163,
CVE-2026-77119, CVE-2026-77692, CVE-2026-78301, CVE-2026-80274,
CVE-2026-81563 & CVE-2026-81736.

Raise the minimum gcc version to 8 to fix a build error found by the
Gitlab pipelines which would be introduced by this bump due to upstream
commit:
https://gitlab.isc.org/isc-projects/bind9/-/commit/a891e7423379e69340e5004a753dc121320ef244

opensslrsa_link.c:53:51: error: initializer element is not constant
 static const unsigned int rsa_max_modulus_bytes = (rsa_max_modulus_bits + 7) /

make[1]: *** [package/pkg-generic.mk:273:
 /builds/bkuhls/buildroot/br-test-pkg/bootlin-aarch64-glibc-old/build/bind-9.20.29/.stamp_built]
 Error 2

According to https://stackoverflow.com/a/67000730 the code needs gcc 8.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Series passed Gitlab pipelines:
https://gitlab.com/bkuhls/buildroot/-/commits/85e18ef8b3386843fe38f04881d39f1f8d9741d0

 package/bind/Config.in | 6 +++---
 package/bind/bind.hash | 4 ++--
 package/bind/bind.mk   | 2 +-
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/bind/Config.in b/package/bind/Config.in
index 4eb024b260..7e691a35ca 100644
--- a/package/bind/Config.in
+++ b/package/bind/Config.in
@@ -5,7 +5,7 @@ config BR2_PACKAGE_BIND
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # libuv
 	depends on BR2_INSTALL_LIBSTDCPP # liburcu
 	depends on !BR2_STATIC_LIBS # libuv
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libuv
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8
 	depends on BR2_PACKAGE_LIBURCU_ARCH_SUPPORTS # liburcu
 	select BR2_PACKAGE_LIBCAP
 	select BR2_PACKAGE_LIBURCU
@@ -48,9 +48,9 @@ config BR2_PACKAGE_BIND_TOOLS
 
 endif
 
-comment "bind needs a toolchain w/ NPTL, dynamic library, C++, gcc >= 4.9"
+comment "bind needs a toolchain w/ NPTL, dynamic library, C++, gcc >= 8"
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on BR2_PACKAGE_LIBURCU_ARCH_SUPPORTS
 	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS \
-		|| !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
+		|| !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_8
diff --git a/package/bind/bind.hash b/package/bind/bind.hash
index 2131f51978..8129fa2d2b 100644
--- a/package/bind/bind.hash
+++ b/package/bind/bind.hash
@@ -1,4 +1,4 @@
-# Verified from https://ftp.isc.org/isc/bind9/9.20.27/bind-9.20.27.tar.xz.asc
+# Verified from https://ftp.isc.org/isc/bind9/9.20.27/bind-9.20.29.tar.xz.asc
 # with key 706B6C28620E76F91D11F7DF510A642A06C52CEC
-sha256  145ab7a50b33a06d9d488b5e668c887e754f42acf8954e2b5dc7e238b080e4a0  bind-9.20.27.tar.xz
+sha256  587029508b3b1b43229fae416c97e5543aba45809cefaca98a5004a02a5736c1  bind-9.20.29.tar.xz
 sha256  9734825d67a3ac967b2c2f7c9a83c9e5db1c2474dbe9599157c3a4188749ebd4  COPYRIGHT
diff --git a/package/bind/bind.mk b/package/bind/bind.mk
index 2b42e87d62..a05ef6c362 100644
--- a/package/bind/bind.mk
+++ b/package/bind/bind.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BIND_VERSION = 9.20.27
+BIND_VERSION = 9.20.29
 BIND_SOURCE= bind-$(BIND_VERSION).tar.xz
 BIND_SITE = https://ftp.isc.org/isc/bind9/$(BIND_VERSION)
 BIND_INSTALL_STAGING = YES
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
