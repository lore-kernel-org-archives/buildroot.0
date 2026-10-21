Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D3A7606A319
	for <buildroot@archiver.kernel.org>; Wed, 21 Oct 2026 21:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=SdQuXO0C
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DB8A340E57;
	Wed, 21 Oct 2026 21:15:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mRIZXu8fcfft; Wed, 21 Oct 2026 21:14:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 8035440E55
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792617299;
	b=EFnkeUkR+OSrK18kRWjQJLUCwY2fXwaL3WQOhp344WRM62leMQ3Ay2V+i7iA/ergS/Zx
	 yfKeCcwxLrffFKQUFNmoa/Op5zvD/8UkK3Hqw5ADvmO0ijLaE/SvQv4vjAXXzSdAElOZt
	 oO3hYgVrEinFrfeLo6ECy+SUtkkJ+JNeyGp73WGhqSiPEBfsfNpaREsREpTh2u8fHwiDX
	 FV+FF4cYPSBigNmCSwFvpQQ/gAHcx5pOVGIyyskhmxTrYs+VEOlNLrM9LEtPIPdSJg1cl
	 OyajTlRN4fNCLoY3WQi2VtrqYB10QifhbxAkYfF5tHKmeMoIPq7dRkDt825/bmDUW6Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792617299;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=FRHgNMhWxElsTSA6qsvzzO15cV81lizvZwgeTExDLvQ=;
	b=bkuOUhYDlBj3ngMCQ76VEUsBM3r2Xc3rv04YFI4zMAlQdVWs3rOFvp0dBcR9ptEVcJqf
	 BFixuFj/uwnl4xVm3CIHeHI8WGJuTCXu3qMEAgbh6TNRCiuPYhOV7GLVp3m3F3lXJvFdS
	 jWiehIcaERLPIewWm9WFul55AmMmwIKdKutG/wRpBXFudWM95PukUH/MBsY/yhh6+nC9N
	 ixdcMVCz84RS4l5N6KQvXmd10+B8yNJd8RswGM5i0vQTCejzYEkA0dF4fTFhi5dDOJolk
	 fDj8fk2VwYHBxrp4c+SfovKjPF90y46cRvnzEqHxIxjm20DLtYm4SEZymQu/c/hWwUg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792617299;
	bh=FRHgNMhWxElsTSA6qsvzzO15cV81lizvZwgeTExDLvQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=SdQuXO0CZzQIos49YDpQWPw2hpSM70M4gBRNgE1A4Itp3ZgEmzECk/lDKHMnk964w
	 NE0AmBG6PT79O8KcJQ+/h7USAhD940XPE4dk3+1Yh+Q05/zQC5KOS1rk5mq3y33Faj
	 ppxav8ZkyF4IAyemXBdj3US+BEZn3IcI0AHcc30jPUsGd3yTh4WdGd7/Hfwpm77r7j
	 f2VjVXLA8aU+qVzCw623KAq5uuwr1lTzvkrsf2WTJSNeUOtKfPgXts6x/3iKjPOZhH
	 ZTudFQSj0nXb0eW0VwctWtUNiPvWYuu2PCEGQYzNkv+ON9XtJ9kc7RuhsGBn+xJpQc
	 sxgfidb8P3Uyw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8035440E55;
	Wed, 21 Oct 2026 21:14:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 51FC61AB
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 21:14:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4FAE68146E
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 21:14:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2ZgPB8sf3ayQ for <buildroot@buildroot.org>;
 Wed, 21 Oct 2026 21:14:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 77D8481467
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792617297;
 b=iJ/V7rAkHFSg16JmZtHR8PKDrtdoujdtqemNKDXSx7B+jY/l2o1bOov3s3/YRIxpJmVc
 aJeGYiFEjyYEjb4KmbBW7wDpW07ydB2zUbTKvEVpc86hXrswYAj8+0IRBkq9NAPizmSUv
 RZLlxAtYwET+veFSjrUYFd6TzuQAfdOjLibSGMZB1talIaO1CdXYLd20GXpvB13iTOmwR
 2waRuDftKBp61PdDJ48zWzuDmwal1K59sjXfTdmSjCLVznCebvAXkM/QqtsOZTogem4Db
 eWpsR89Bxw7cTDH9fQeInUi+ommMqNS9BC5DQSRQyC0cp5YN5ixDYot7md0r0yqbl8w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792617297;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=kC4yloQvAQIh72hCsifqjGaWkaLSAKXctcDJh/p6ZjI=;
 b=hir8984E7R32LVoZJ7Jdej1H3ycA7XYtX3CsS4XtCY6XAlGWHtm4RnAnS2Q2+4udMvSy
 2VPs45GrksGJyNmCvIOfy7rfCYcOyq+2HM+QVs6SI8KenDHDfQ5AoIfg5ENoahYIEhSdj
 OlCAgXToGa2MzLpERAwNRCiKOneJj5Zo3KRlavgrC5Qz6fYVk6pyG6AOvsN9y1d6rXMHI
 XxLcX+PFXhG39WZsfXQmjxQJP8R3oPpdn2Ah51wtlID5N/n4moMDmLpj8UFQKhR0HHcNr
 oVBfdVofNYHKdE6MzwI3QmfTVVbHmuSa49AjXmaeFJ6hzTaQgzbsmSVsBaEwkCmc12w==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 77D8481467
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 21:14:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BF07C99A6F; Wed, 21 Oct 2026 21:13:33 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 21 Oct 2026 23:14:25 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: dc270b1ac31551bbfada680727ad1f743ef5d8cb
X-Git-Newrev: e2b1f95d4bc7a36f358136dd208ebd46973ac9cf
X-Patchwork-Hint: ignore
Message-Id: <20261021211333.BF07C99A6F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libepoxy: needs threads
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/e2b1f95d4bc7a36f358136dd208ebd46973ac9cf
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
