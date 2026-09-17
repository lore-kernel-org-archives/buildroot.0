Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B45E0C982D1
	for <buildroot@archiver.kernel.org>; Thu, 17 Sep 2026 13:32:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B23E160863;
	Thu, 17 Sep 2026 13:32:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lWup-f00L7cM; Thu, 17 Sep 2026 13:32:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org EF5C8608AD
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789651936;
	b=aw9ezje9uoCXg0+dIJtTVkIwZv2c+6VwGPlYeE3pon73iSjnxaLP7aJp794TsZ8vXDun
	 OuE/kb4wtFjAN0GyB2EtS9lWbVX3JIOa0Dk+N6BM4JfycSAS1f93BuCJdmTM5ufzNGehN
	 yp5/lxQpKc/sMhIfXnqUULlA8QfHurERgX/pJIpmlYwp2q/HVHXk8WSAy/Um5jtKuEpTR
	 y+NtM/PTbOM1aE02z81pqw+k141RLIQdNMt5CjODkZQr6j1fakRHV1/xOmSYs6xUYAlwl
	 2ml0HtI8UFOx6UlPaV/5lqD/I1abh1Tgnsnkj6OQ0+RYpHIv9tdSvtKXn9agSPC/C1g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789651936;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:Date:Message-ID:
	 X-Mailer:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=n3f0S2bALG4pqOJvRiZCS/2pluaQV73UQwANU0uBpTk=;
	b=ZnpqxmGkxV758ur5l8tOT7QJbbM4qWlulkZwrm7IbvfGshuRJjCQwjSHCZNts04MuXll
	 W5TjCRjvSR/Ngr0pudZpuz+ke2x4gk931b13LviHQSGOwafmPrDJ6zce33m87tOnqkWXI
	 GNYEs3XzcIod0fB9I8wWrh5gAr74M9fHPkQz+FqKZtPkKriqn3x7HCQJZc+7hIrZplAJ9
	 pLUc6uGQaReBrBcKcDuRZs7/V4J7th8py7qvqwhBVZ4RsbChRRSGxPuV0+9m3L7Xg7rqk
	 EnQe3KOKZ8TPmuHYk8lIe4jfQO/L8XU4Y6K/DHHldtrszyGHFz8S0Rm7/bym1joKiLA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789651936;
	bh=n3f0S2bALG4pqOJvRiZCS/2pluaQV73UQwANU0uBpTk=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=n0efb6deWUAszEQL/0zLyFoVtWas7t0Mznh6MWYbWpX5ooJY2ieLPeQi0tY5rNI5x
	 iw+ioK14G1fui850P/Sl/fTaVLs4NnMEUF95jKte7t9OX6PpEIxe2tO9ZC703VwUTi
	 wTycO5iOdr+Svsz2gdg8LaEio+R3W43mbF2vKrAaz61DBquwDxZJMINYp/KWbCqlOY
	 4fTwtiftCwK1AoO+gOg5pV/ThRxCKiO89SKcybKvemuRGdPy79AZ8XiSz2RQxEVkOz
	 ss0D0+GYphFo+HHgCf3kuLpyeHXxahwFxnmx5aNPUm6XXz3p2AiS7mzaGZ+p//FQEw
	 Zr6N+f4xPHrkg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EF5C8608AD;
	Thu, 17 Sep 2026 13:32:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id E48B313D
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 13:32:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CA1DB80AA3
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 13:32:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2VjlktFNU-R5 for <buildroot@buildroot.org>;
 Thu, 17 Sep 2026 13:32:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 47CF080816
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789651933;
 b=T4l0TI650C88G/DbufQo7upSR0oKW+G4kacALAB0sc7gioo/q3BFX8KJ5jttQ+qr+3AK
 scsm/ZfMyFmn5fR0PyMAagJ+JiL04VGQl4osIPXoTHoWEMMJC6KDWocOLAe2Mng8/+4B1
 VFduJrflZF674U1p8nBX4yI5Z7vyw5LA+bumMUzhMWWZXHLrw8ft7YjaQgAHNrrgVlXPn
 0u8g5nVUKZby/PBPPRNb2XGRmohNGW8HBs4zt8ZbAH2AiiNY0DGdaSKBPep2ZsL6FMXDZ
 WXNTyjgGlSafbBpkHLKpCui158IIwInVe5LQJcb8A1MWIvZeDXvPpsJ7FGfswRmxglA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789651933;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=JQFeRfqx0L4UKSAbd02gNsybrxk/k/X6LWMAulO+qO0=;
 b=lbol/L6AEB9byMSAyu27sTKVQ+VY1NI+f9m7xxWSqYaSDLb+9yRqSI+WotJc7/Rp31tC
 Wx4mwxI8lMTU/pX9D888N4IL1ZxNxP6JWBGLbr59psNDQUgulALxZiLn1QkR181j1JjCo
 cfRTiBC/w0rpY8h5aBxaXOjD0v1Kv9CX0vIj6FuYpSwTp0G6Gc7yOzHoKN186rV7LQ8Jx
 ERFflR8S3jdwMAUEieN4HXx4Kd40VcUktJeLDXHfXlYJKHsHyQQZR5chNiq+5NK1GUzRi
 ur2qCmQBlg/ZTt8Bn+r3OFXkTMyQB9HXIjrWEzIS+7ew6421Pt1WePv8UZezRWEs48Q==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=Lx05Zv3J; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=Lx05Zv3J
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 47CF080816
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 13:32:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789651926;
 bh=JQFeRfqx0L4UKSAbd02gNsybrxk/k/X6LWMAulO+qO0=;
 h=From:To:Cc:Subject:Date:From;
 b=Lx05Zv3JLrq5gQxm/CLzZ3pFz4mkBQDrJ6naOtSueTXoJTP6OSIm5G2PjAzhjG149
 fDZvKUlkWvnLE0kTs+FZbc6L3PYGj5W3WUCm9W72wd0sEODOIhGrftyI6ieP5jMVRx
 PSluL9Sl04nQ2VB6Dk+sZg1jhs5WeOKXMNSCusfjfB5DrBpreUSgun67JEfk7csVCc
 qWkcYkvd9TA+xnqCgd1U4VpU5m1bJ7tQkN2HMnJAUd+hQ9FXz22PPO7rCKdjaXaPNf
 Vpq+FInSScsGj0QNdi3uNIkQlWJR/FUk3mU3wm83BbutD0W+3d7YZN58z5kZ+2i3er
 Wd46mKeYbRWyw==
X-KAS-Sym: v3:f51bdf72230551df:sMs6ifSh5g5ZcwhiKbV29yH8cPZk9c03bOH8P1Ly5xtgFbS2cUv4tIurUhS1TNHyoHTGCFu9eAdKHX038pGSrRCMC1RAJ9/vphiy5uUYRVZZdoiiVNllYz81Qbq9hUS/2dJAvrYwvJaeaQL7FPpVYu0k8cRol+VFDkxcDXjIryP/vtKCEd/VGNqrReHHh9Ml/LQblY5341YU+hwztGqcfnRNfqJxt2DcZdLfQPF+AKRp9EcpStQDvCw986oTjhwXLUzaNkc7LG0PxDsNgorYX+1fHvHLwHeS45EZtBmC2fn6pld8IEEmX3Eb4rZXHAVfCE4AhIU6jw5OimlAQe2brA==:c06TyfJjrkeZk85oYb5HnaxToUJrn7ToxIXKhhE9TrLP6JRNK6w8B20ofodzRCoz8I2GKflrL+Z7SqOsVD0EBQEyaLhh1ZDDBJD2U6JVoPll1Jjg3ZVeisIOVs1PSVhAybDMJcmvRdCzRVSHKts15NE/uet3ChMeTwTSXa/PZbeVs6eFt/cUKC6VGPkWx77KK0F0stJWWFV8B7sayXKaiThWON/7icASQZFEV6IFnham6axFq+RsA3kAU9xoQvfpx1UebEP1wJhjlmgtoASXQY5UYVXPd1WjK1M48NhVYIVP2cm3kyl2ITiAMc9fFS9RD3da5hfatsHb8xryBMN+yNN6RbfwPGPJRrGm262e7nI/iDGcW5NxPMukGnqJsUQuooQmIdQY0KEC3JlRoWh4bomoxeq+CwuSNLZJ63AzJkNyNDQBNFBw5oJd0MRUO9/tcCwTuFDWGG5s6nwcKTP54lT9cjWDogDxeoLCtr0zovtUcGfabdW9zZnZhzT9wpEXEw/k8DCfhtVwOUsBG3Xc+dpQyrtC40Zjqtv+GPAWUbLgrxh+d/Y6Q8dbipWT/xjpOcA05Iws6fY4hw4eawT+kG+jrOAcNA==
Received: from fli4l.lan.fli4l (p5b3a0ed0.dip0.t-ipconnect.de [91.58.14.208])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 0C399A4C45AB;
 Thu, 17 Sep 2026 15:32:06 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:37470)
 by fli4l.lan.fli4l with esmtp (Exim 4.100)
 (envelope-from <bernd@kuhls.net>) id 1x7CDd-000000002jC-12Wf;
 Thu, 17 Sep 2026 13:32:05 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Adrian Perez de Castro <aperez@igalia.com>
Date: Thu, 17 Sep 2026 15:32:05 +0200
Message-ID: <20260917133205.2732394-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH 1/1] package/wpewebkit: Fix build with CMake 4.4
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

Buildroot commit 526f8b43edb7ac1dbf9b86afc183a95b389a7bab bumped CMake
from 4.3.4 to 4.4.0 causing a configure error with this package:

CMake Error at Source/cmake/WebKitMacros.cmake:311 (if):
  if given arguments:

    "(" "NOT" "_linked_into" ")" "OR" "(" "WTF" "STREQUAL" ")" "OR" "("
 "NOT" "IN_LIST" "LLIntSettingsExtractor_FRAMEWORKS" ")"

  Unknown arguments specified
Call Stack (most recent call first):
  Source/cmake/WebKitMacros.cmake:393 (_WEBKIT_TARGET_LINK_FRAMEWORK)
  Source/JavaScriptCore/CMakeLists.txt:409 (WEBKIT_EXECUTABLE)

The error can be reproduced with this defconfig:

BR2_x86_64=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_FORCE_HOST_BUILD=y
BR2_PACKAGE_MESA3D=y
BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SOFTPIPE=y
BR2_PACKAGE_MESA3D_OPENGL_EGL=y
BR2_PACKAGE_MESA3D_OPENGL_ES=y
BR2_PACKAGE_WPEWEBKIT=y
BR2_PACKAGE_WPEWEBKIT_SANDBOX=y
BR2_PACKAGE_WPEWEBKIT_MULTIMEDIA=y
BR2_PACKAGE_WPEWEBKIT_MEDIA_STREAM=y
BR2_PACKAGE_WPEWEBKIT_WEBDRIVER=y

To fix the problem we add an upstream commit.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...EBKIT_TARGET_LINK_FRAMEWORK-reports-.patch | 51 +++++++++++++++++++
 1 file changed, 51 insertions(+)
 create mode 100644 package/wpewebkit/0001-CMake-4.4-WPE-_WEBKIT_TARGET_LINK_FRAMEWORK-reports-.patch

diff --git a/package/wpewebkit/0001-CMake-4.4-WPE-_WEBKIT_TARGET_LINK_FRAMEWORK-reports-.patch b/package/wpewebkit/0001-CMake-4.4-WPE-_WEBKIT_TARGET_LINK_FRAMEWORK-reports-.patch
new file mode 100644
index 0000000000..b8c9c0ea44
--- /dev/null
+++ b/package/wpewebkit/0001-CMake-4.4-WPE-_WEBKIT_TARGET_LINK_FRAMEWORK-reports-.patch
@@ -0,0 +1,51 @@
+From 4bfeff8c67ad47b7bb0f3d78390789f6f2af5dd2 Mon Sep 17 00:00:00 2001
+From: Fujii Hironori <fujii@igalia.com>
+Date: Wed, 5 Aug 2026 07:18:26 -0700
+Subject: [PATCH] [CMake 4.4][WPE] _WEBKIT_TARGET_LINK_FRAMEWORK reports
+ "Unknown arguments specified" error
+ https://bugs.webkit.org/show_bug.cgi?id=321081
+
+Reviewed by Adrian Perez de Castro.
+
+CMake 4.4 reports the following error for WPE.
+
+> -- Using platform-specific CMakeLists: /run/build/webkitwpe/Source/JavaScriptCore/shell/PlatformWPE.cmake
+> CMake Error at Source/cmake/WebKitMacros.cmake:554 (if):
+>   if given arguments:
+>
+>     "(" "NOT" "_linked_into" ")" "OR" "(" "JavaScriptCore" "STREQUAL" ")" "OR" "(" "NOT" "IN_LIST" "jsc_FRAMEWORKS" ")"
+>
+>   Unknown arguments specified
+> Call Stack (most recent call first):
+>   Source/cmake/WebKitMacros.cmake:756 (_WEBKIT_TARGET_LINK_FRAMEWORK)
+>   Source/JavaScriptCore/shell/CMakeLists.txt:126 (WEBKIT_EXECUTABLE)
+
+Replaced `${_linked_into}` with `_linked_into`.
+
+* Source/cmake/WebKitMacros.cmake(_WEBKIT_TARGET_LINK_FRAMEWORK):
+
+Canonical link: https://commits.webkit.org/318630@main
+
+Upstream: https://github.com/WebKit/WebKit/commit/4bfeff8c67ad47b7bb0f3d78390789f6f2af5dd2
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ Source/cmake/WebKitMacros.cmake | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Source/cmake/WebKitMacros.cmake b/Source/cmake/WebKitMacros.cmake
+index 9d79754186cb..9cbd52cc981d 100644
+--- a/Source/cmake/WebKitMacros.cmake
++++ b/Source/cmake/WebKitMacros.cmake
+@@ -551,7 +551,7 @@ macro(_WEBKIT_TARGET_LINK_FRAMEWORK _target)
+         get_property(_linked_into GLOBAL PROPERTY ${framework}_LINKED_INTO)
+ 
+         # See if the target is linking a framework that the specified framework is already linked into
+-        if ((NOT _linked_into) OR (${framework} STREQUAL ${_linked_into}) OR (NOT ${_linked_into} IN_LIST ${_target}_FRAMEWORKS))
++        if ((NOT _linked_into) OR (framework STREQUAL _linked_into) OR (NOT _linked_into IN_LIST ${_target}_FRAMEWORKS))
+             list(APPEND ${_target}_PRIVATE_LIBRARIES WebKit::${framework})
+ 
+             # The WebKit:: alias targets do not propagate OBJECT libraries so the
+-- 
+2.47.3
+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
