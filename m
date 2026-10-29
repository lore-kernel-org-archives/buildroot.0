Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AD57606A31A
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 14:20:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=hn9FIEit
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EE42060D5E;
	Fri, 30 Oct 2026 14:20:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Nd-5v_LnxrbN; Fri, 30 Oct 2026 14:20:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org E36CC60D6C
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793370002;
	b=OqDyby2yxwFCvvEkbL37MvhQRLfYaDdh9agPwDaxkAhUrIbwWu0SMZBk/wYCyPLOHEIu
	 W00oAVIUSaTbD8Pz3ib9iOfLqp6mHXUhER3l2iWlkqqAYFNQPgW1Sh2MRxyRYRtQxLHt2
	 gSqJlsDR3owgYhf/GPnnD8qj5CDQ+KDIW/ciqVqabVQwV4zVroAIChy2384bDWVC+JXcZ
	 KzCl0oO5w1YI0ft4YSKLA2Jh5QzLu1aCEvDrRz/9Fz7rjMC7H3AIQfvE44vjwteaZgtPk
	 a00ndvMMLuNKAstfEKTk1V3VZoIKMcVQ1EEq+sh6aXUIOucUNBI5neD8RSS1yZO7kZQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793370002;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=ls/7ZzIa/45b85KRN4RugZVxRL+2gSh/AlvrYQqC3Xo=;
	b=OJXb/NOAl+L77wrX5QCzRme+HN8JKYsP9b9ExEkb5KUJT3mm6zU/5914WyfczXkgJWfG
	 8ZiQFgdNPzjtIkrTlmK2JtzoAFU0NJbQem7N64VPLWRy0y0wwyNQoQYHeUdRDZ4qSqHMi
	 TLJLjOFYBCuiPjRsQVOs6zGiZpG1QN4pkSaA0PvHI5vflZY9msZIF1hbwsluGjEqX/RaF
	 GtQyfILSf3pm2IumXhG4QbH5HKVGL/+s8vmDqmKTQTssIdJc7b5V+SG+ELlYUn55msg2U
	 tWYR+MOLIeC99jpS0029RvI33nUWldpxmTuJzWnGAv1+t2FzfQ51Apu/Nl5s6QJ6UUg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793370002;
	bh=ls/7ZzIa/45b85KRN4RugZVxRL+2gSh/AlvrYQqC3Xo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=hn9FIEit6NmIdt9F+xPBnMltbT/eHAS7TEeRtrEHZiUbY80wB0YMaz15KIkHFPOM8
	 BrRQrsK8criQ3V1MLiYp5CWAzjJ0vFn1b6WZ4grkwEEg1Hi7BG+3fc9BtmUwoVLrPo
	 imAgJN2TwI6JLVEMdwL5j9uaCAnLqOYqhG4sPDJmHInl0Juujm2UUeYlOryk/CjaLV
	 NFh3TW7EGTFO3QWlX9kmDV77ryux4LpWvKiNpUYVOvGcUAgbLMx7AzevSbyRAhns3d
	 Ze9HiRG53B6uMejXEY9+chFHu7DZypStAyAwdif5kXBh4tW6ClHnpshu5eaJhv+c5t
	 33icQCrYW/YfA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E36CC60D6C;
	Fri, 30 Oct 2026 14:20:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9275C362
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 77D2A60B77
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id egfdiese2y62 for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 14:18:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 83F6560AEC
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793369894;
 b=bC93zF00j7B/mGfZnSetzJkrG5Nuo02/pcoFdLJjEQiRPqj1j9irl0jQElSV/OQjOocH
 k3J6gB2M1qdcKPFtrtEqxM+KDHaAp+QhR5vd8gjYnjr849VhLpLIl+E/yoF5dd2Wkua/w
 J/emEB476SF0EaMRqE9544uity88toeq8MStUytrvgHCNtExpa7/QzfWNNELmYCFh3Arr
 da/domrTtF+H07+VSys7fPK6TCxXe1sPsrLxPVElQSR5Up7vvO7lfQqZAi+Gk33cm/fx5
 3DwZMedxNfOutAxAfhN0f/VDNEXa5ERgqJ49V9ivhCrU9VEE85JIwJbIYVdVBfmbRPg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793369894;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=ZrKRUbKA6TMDKW2LMsRLj903NJJgmkV0OZjipBgiZ9s=;
 b=jC3C6XTRoKibCQUSAMZzVlh8IKtIhdkizjkv5C5VJkjeJKWC+1yG8TpOX45Fh9ecd+FJ
 KiDuH5Cjf6FPUL59V78jduiHHjxAxwYNSAVbVHm7LF+tcs5FuNI+h5qH1MflfRGVnw27P
 EhQIDGw5cJbfR9dwb7DRtFZBRwDKyuGxPNNo1mBoHq/2BEY0bq3SIfOMJKDrkg+KuZbES
 znfmaxmLHVIusXOwa85hOFQLrP14AddaE4K8ey54Tv0+5iDjb82dZm6TH/uwczmZwYKX7
 7H1fVxh87ET1kvJcNczIxIvmpfZkXS6pQkp8sZIhIkudjsuvnBKir4ic0f4oeU7mlkw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 83F6560AEC
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 967B29D388; Fri, 30 Oct 2026 14:16:46 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 29 Oct 2026 21:21:10 +0100
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 06c4fae57c1ed3591fb23f7d2133914e089f72ea
X-Git-Newrev: 8122355cf161804f2395f26ab91f35da6393e1f4
X-Patchwork-Hint: ignore
Message-Id: <20261030141646.967B29D388@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/libepoxy: needs
 threads
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7025231591848713349=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_NONE autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============7025231591848713349==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/8122355cf161804f2395f26ab91f35da6393e1f4
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

Buildroot commit cd2583ca0a993cb44e8822966f101e820ac2619e removed the
dependencies to gl/egl which revealed that libepoxy needs a toolchain
with threads:

../src/dispatch_common.c:168:10: fatal error: pthread.h:
 No such file or directory
  168 | #include <pthread.h>

Fixes:
https://autobuild.buildroot.net/results/dc2/dc27a008af73c7676e4f54e4846d87f9d5aef98e/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit e2b1f95d4bc7a36f358136dd208ebd46973ac9cf)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/libepoxy/Config.in       | 5 +++--
 package/libfm/Config.in          | 2 +-
 package/libgtk3/Config.in        | 2 +-
 package/libgtk4/Config.in        | 2 +-
 package/menu-cache/Config.in     | 2 +-
 package/pcmanfm/Config.in        | 2 +-
 package/wpebackend-fdo/Config.in | 2 +-
 package/xscreensaver/Config.in   | 2 +-
 8 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/package/libepoxy/Config.in b/package/libepoxy/Config.in
index 269b43be85..6ff0c6072f 100644
--- a/package/libepoxy/Config.in
+++ b/package/libepoxy/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_LIBEPOXY
 	bool "libepoxy"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_STATIC_LIBS # dlfcn.h
 	select BR2_PACKAGE_XUTIL_UTIL_MACROS
 	help
@@ -12,5 +13,5 @@ config BR2_PACKAGE_LIBEPOXY
 
 	  https://github.com/anholt/libepoxy
 
-comment "libepoxy needs a toolchain w/ dynamic library"
-	depends on BR2_STATIC_LIBS
+comment "libepoxy needs a toolchain w/ dynamic library, threads"
+	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/libfm/Config.in b/package/libfm/Config.in
index e4d6528db5..abb35ca3dd 100644
--- a/package/libfm/Config.in
+++ b/package/libfm/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_LIBFM
 	bool "libfm"
 	depends on BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS # libgtk3
 	depends on BR2_USE_WCHAR # libgtk3, libglib2
-	depends on BR2_TOOLCHAIN_HAS_THREADS # libgtk3, libglib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libepoxy, libgtk3, libglib2
 	depends on BR2_USE_MMU # libgtk3, libglib2
 	depends on BR2_INSTALL_LIBSTDCPP # libgtk3
 	depends on !BR2_STATIC_LIBS # libepoxy -> libgtk3
diff --git a/package/libgtk3/Config.in b/package/libgtk3/Config.in
index 79f00703fe..dac2d17974 100644
--- a/package/libgtk3/Config.in
+++ b/package/libgtk3/Config.in
@@ -17,7 +17,7 @@ config BR2_PACKAGE_LIBGTK3
 	bool "libgtk3"
 	depends on BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS # host-libgtk3 -> host-librsvg
 	depends on BR2_USE_WCHAR # glib2
-	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2, libepoxy
 	depends on BR2_USE_MMU # glib2
 	depends on BR2_INSTALL_LIBSTDCPP # pango
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # pango -> harfbuzz
diff --git a/package/libgtk4/Config.in b/package/libgtk4/Config.in
index 958742ae43..c1f3928b8a 100644
--- a/package/libgtk4/Config.in
+++ b/package/libgtk4/Config.in
@@ -16,7 +16,7 @@ config BR2_PACKAGE_LIBGTK4
 	bool "libgtk4"
 	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS # librsvg
 	depends on BR2_USE_WCHAR # glib2
-	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2, graphene
+	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2, graphene, libepoxy
 	depends on BR2_USE_MMU # glib2
 	depends on BR2_INSTALL_LIBSTDCPP # pango
 	depends on !BR2_STATIC_LIBS # libepoxy
diff --git a/package/menu-cache/Config.in b/package/menu-cache/Config.in
index 3e7137c7a8..a84f807625 100644
--- a/package/menu-cache/Config.in
+++ b/package/menu-cache/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_MENU_CACHE
 	bool "menu-cache"
 	depends on BR2_USE_WCHAR # libglib2
-	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libepoxy, libglib2
 	depends on !BR2_STATIC_LIBS # libepoxy -> libfm
 	depends on BR2_USE_MMU # libglib2
 	select BR2_PACKAGE_LIBGLIB2
diff --git a/package/pcmanfm/Config.in b/package/pcmanfm/Config.in
index 7e411b22ac..5250176c1f 100644
--- a/package/pcmanfm/Config.in
+++ b/package/pcmanfm/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_PCMANFM
 	bool "pcmanfm"
 	depends on BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS # libfm
 	depends on BR2_USE_WCHAR # libfm
-	depends on BR2_TOOLCHAIN_HAS_THREADS # libfm
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libepoxy, libfm
 	depends on BR2_USE_MMU # libfm
 	depends on BR2_INSTALL_LIBSTDCPP # libfm
 	depends on !BR2_STATIC_LIBS # libepoxy -> libgtk3 -> libfm
diff --git a/package/wpebackend-fdo/Config.in b/package/wpebackend-fdo/Config.in
index 0e59b8df1a..5dfbf678b6 100644
--- a/package/wpebackend-fdo/Config.in
+++ b/package/wpebackend-fdo/Config.in
@@ -6,7 +6,7 @@ config BR2_PACKAGE_WPEBACKEND_FDO
 	bool "wpebackend-fdo"
 	depends on !BR2_STATIC_LIBS # libepoxy, wayland
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_TOOLCHAIN_HAS_THREADS # wayland, libglib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libepoxy, libglib2, wayland
 	depends on BR2_USE_WCHAR # libglib2
 	depends on BR2_USE_MMU # libglib2
 	depends on BR2_PACKAGE_HAS_LIBEGL
diff --git a/package/xscreensaver/Config.in b/package/xscreensaver/Config.in
index 80fb1550f3..5763f12601 100644
--- a/package/xscreensaver/Config.in
+++ b/package/xscreensaver/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_XSCREENSAVER
 	depends on BR2_PACKAGE_HAS_LIBGL # libglu
 	depends on BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS # libgtk3
 	depends on BR2_USE_WCHAR # libgtk3, libglib2
-	depends on BR2_TOOLCHAIN_HAS_THREADS # libgtk3, libglib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libepoxy, libgtk3, libglib2
 	depends on BR2_USE_MMU # libgtk3, libglib2
 	depends on BR2_INSTALL_LIBSTDCPP # libgtk3
 	depends on !BR2_STATIC_LIBS # libepoxy -> libgtk3

--===============7025231591848713349==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7025231591848713349==--
