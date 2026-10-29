Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58E47606A31A
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 14:08:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=DU7uxxsI
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 36AE1813B7;
	Fri, 30 Oct 2026 14:08:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qQ5SaTfNwBf3; Fri, 30 Oct 2026 14:08:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 3474B81336
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793369285;
	b=PeH1hm6f+kmMmD1t9JgptN6CnDFQrAlmyrz3HHK/8RpUut7P35cAt1NZkrGBYCi9jirO
	 BLEztmw3LLHCgnS/wr37piMk0f0W37+GG7mW6SFaCyFmQn/UhA0TCRCtm72/A+AaS02Ec
	 9tSLMjPVMiU8N7SKRhD0D/r9GsusQuEgL+VmNbV7OPoIUjpuQV6EZkcQQDW8m5PfHZlVM
	 Auf5q+4dzfoFqzpCr7wHXOftIuH61+B+3HkbBET1efZidO7smBVsbgFky+bWfmlKK2Icr
	 fdAXzygGzhEm3yEtqf56T4WkUuL176lBvnETc8a8S2K2e0n3h8wouIV2WbDhKJUxlQA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793369285;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=7PHD+W7j7fjCq6GwR1xuJ1g3LY8R4ffytiewkjfRQ9A=;
	b=TWiUZu4shoeEBo3BUexX6soVRk/abKdPe2kSNEzDHjt6flxKLMPyWy2lGHZqMvmrnUdJ
	 m+zempJNaOdDqkSReA4vK0jU9BVAdZBXD2BRJhs+u1hIWVhDVUoFAgxriTAbI4veC96em
	 XecM6o6LPzH2xvol7aZFLx2kncKsNGRko6uE0n3+Zmg5ZlhomI0f/DHL7BNTkoGMiv1CR
	 qNHkbGPhgVW7tRYJoFy6FS6w4rWXbBr21r7YGff6f+hEDBGq5KMngSfUf7bsThV6UI8L7
	 f29gYRQMbjSkR30MtCPmwoiFzglq1W3bGdv3VSQkpfcBmlASUggI7y/Z/1ww+0Wb/ow==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793369285;
	bh=7PHD+W7j7fjCq6GwR1xuJ1g3LY8R4ffytiewkjfRQ9A=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=DU7uxxsIoyuyn+ALQX8JvMaQCCwMUfbNzsAvFIrDMpyHw7JVZb2JJrlIKOokbq3bx
	 EZRPnD8z4pZRLdaNFhZ7d6cHIhS1efifbZeWpFBWDq/L295JQwmUnzjS2myTRY52b0
	 bGqf0ATTBFMV2zWl3HGzTiaXQ6W8z1CBH6G4bJdW+3ZG0rvtl9jnoXD6Pguu5zwcko
	 HtU9k4Uf7lHkHqSCl2xN1tcEGXKMsM8a3YiYDKDZ4IYkQpVk9A4c3/ZmwjPI/6a5wJ
	 sOVF/KSEDMJRZp9Q86n2PZp1h3yPWPH8lVcv+AgBWh//vSXUUnsWraThF3MmjU3Oou
	 m/xyw29fkg2EQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3474B81336;
	Fri, 30 Oct 2026 14:08:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 95A89362
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:06:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7BA5A40B38
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:06:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iwrQtSkfdXfn for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 14:06:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 7207140B36
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793369167;
 b=BtiPGoXRsq5goE7wm+i2L408jtvPUKg3lvWSz2FbK3TTLfkpq/RQrUA2iLS8q3wpAszX
 YhEThNWJAz1gRrizv5B/0RU3IuagQc3VlFDgY2WP2iu3hAUjFYK13ngnlld7MXUC4OMiW
 1pSN5kMKiZUUF+Fmulx7/UmYywBZuOGUwgpJfaqccBT9drhNYTFhvOirh5lJzj3BCfygG
 rNoJC6YiljdpDBF2bqCZGNH37PRZUB2EQcadQ1v+JH6a/xpJ2ltV71hIDC6M4wSvg7i5+
 IKd6dJqqyKQQHCzT05fPTYGiVFQGzbfHQ3giqaOjlv8bs50HzSX9kJ9IrQ2DU7De7xA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793369167;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=iDsHrk24C+uKq72AGLZml7oTVg6I6OE9W1syKufggvg=;
 b=qGdsZv3Y1PXL0+DgAmPLa5oIIxZ7YnRFnPUl6yukxoz5N01hONwPoA4jEnGR/Q4hY2UL
 zvIi/7OMkjMaFOP0M3FSfpjcqHtcRVkiToGimZyGP2eEVPgXNL8o38xvWlhZtz2pMZcCK
 a9FBgZ87CdRT159yduWyehANdWNh4sHBghp3zAeO2gKeun2Rzrfbo7cotqqDGOxK9y324
 jyK/sr5bb+ZbjJdgXS8PiofM5iR+Hh5An8If5axmy9hN/Z6FPWKoDeO8N8bR7u/Tm4Kl0
 FbCyMVoWpX22SvP548fIlPXs0Ka3BMAxw0nZgYCBepNekxpT9l4do5huG1rOUPsvHmQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7207140B36
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:06:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9115B9D388; Fri, 30 Oct 2026 14:04:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 29 Oct 2026 21:20:00 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 8605f7585dd02ded3a7a6c2d50ac9af9182fbb4d
X-Git-Newrev: 914d97da0612b64befd83a1889a883040b0981b9
X-Patchwork-Hint: ignore
Message-Id: <20261030140439.9115B9D388@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/libepoxy: needs
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
Content-Type: multipart/mixed; boundary="===============5142927522492955574=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_NONE autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============5142927522492955574==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/914d97da0612b64befd83a1889a883040b0981b9
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

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
[
Raphaël: fix conflicts.
libfm/pcmanfm/xscreensaver/menu-cache hunks dropped (still on libgtk2)
]
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/libepoxy/Config.in       | 5 +++--
 package/libgtk3/Config.in        | 2 +-
 package/libgtk4/Config.in        | 2 +-
 package/wpebackend-fdo/Config.in | 2 +-
 4 files changed, 6 insertions(+), 5 deletions(-)

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
index 5a9c5700b1..8d69246df1 100644
--- a/package/libgtk4/Config.in
+++ b/package/libgtk4/Config.in
@@ -14,7 +14,7 @@ comment "libgtk4 needs an OpenGL(ES) EGL backend"
 config BR2_PACKAGE_LIBGTK4
 	bool "libgtk4"
 	depends on BR2_USE_WCHAR # glib2
-	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2, graphene
+	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2, graphene, libepoxy
 	depends on BR2_USE_MMU # glib2
 	depends on BR2_INSTALL_LIBSTDCPP # pango
 	depends on !BR2_STATIC_LIBS # libepoxy
diff --git a/package/wpebackend-fdo/Config.in b/package/wpebackend-fdo/Config.in
index 026a18e8ed..bdc3000129 100644
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

--===============5142927522492955574==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5142927522492955574==--
