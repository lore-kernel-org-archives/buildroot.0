Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 209BFD5B15D
	for <buildroot@archiver.kernel.org>; Sat, 13 Dec 2025 19:06:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7872160859;
	Sat, 13 Dec 2025 19:06:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5l8NSqFgV2gt; Sat, 13 Dec 2025 19:06:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8987760806
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765652776;
	bh=XKTnD0R6iNlerUsrnDL9p4D3+PxjYkB1lW+yt47lTPY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=EQtxu25Q9463f+mOmpx4pTIDLzoEMB1m0VGKiSlB8gxjDL7110G/e/qbRLHWosw3b
	 uVDU9zdWBK9L2UolPgh3oJlHX9mukDa7WcwMUJQ0azVcHxkRDGLDYs+Q2MPtDsxYdJ
	 5qSpfliRua30BGd+D6Z90gVOTCI1hTY2NEy6y0gDoUm9YCUpdAysl2XEse994dnxkh
	 y+Y2MdDbizca/CKZSf4d9vT20C63w6ftDjRNuKTW1njiixFIwAbyYsEn4jn15IgHe+
	 +nwnI1FiP7OO0q2S3MIzJtlA0gsNQuHKujO2gIVG8jfOQwz5pkSZ33A6igAbRPvxpa
	 Ror8+JBnuGexw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8987760806;
	Sat, 13 Dec 2025 19:06:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3CAAC2EB
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 19:06:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2F04E81D19
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 19:06:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9CoEjXEDIVfc for <buildroot@buildroot.org>;
 Sat, 13 Dec 2025 19:06:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3EF4181C0A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3EF4181C0A
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 19:06:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 32A4A86DBE; Sat, 13 Dec 2025 19:06:10 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 13 Dec 2025 20:05:27 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 14f279184e85d44ecd71c797d09b53fa8c296214
X-Git-Newrev: bbbc6c9d9e7f19df04f23c26445132863a0e4070
X-Patchwork-Hint: ignore
Message-Id: <20251213190610.32A4A86DBE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xwayland: add nettle and
 libmd as SHA1 providers
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=bbbc6c9d9e7f19df04f23c26445132863a0e4070
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Xwayland can use either nettle or libmd for SHA1 support. When one of
these libraries is selected, use it as the SHA1 provider.

Also reorder the preferred SHA1 libraries to match the order used by
meson [1].

[1]: https://gitlab.freedesktop.org/xorg/xserver/-/blob/xwayland-24.1.9/meson.build?ref_type=tags#L235-239

Signed-off-by: Raphael Pavlidis <raphael.pavlidis@gmail.com>
[Julien: fix package path in commit title]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/x11r7/xwayland/Config.in   |  8 ++++----
 package/x11r7/xwayland/xwayland.mk | 17 ++++++++++++-----
 2 files changed, 16 insertions(+), 9 deletions(-)

diff --git a/package/x11r7/xwayland/Config.in b/package/x11r7/xwayland/Config.in
index 311dae25ec..3df8677545 100644
--- a/package/x11r7/xwayland/Config.in
+++ b/package/x11r7/xwayland/Config.in
@@ -3,12 +3,12 @@ config BR2_PACKAGE_XWAYLAND
 	depends on BR2_USE_MMU # fork()
 	depends on !BR2_STATIC_LIBS # wayland
 	depends on BR2_TOOLCHAIN_HAS_THREADS # wayland
-	# We need a SHA1 implementation. If either openssl or
-	# libgcrypt are already part of the build, we'll use one of
-	# them, otherwise, use the small libsha1 library.
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # xlib_libxshmfence
 	select BR2_PACKAGE_LIBDRM
-	select BR2_PACKAGE_LIBSHA1 if (!BR2_PACKAGE_OPENSSL && !BR2_PACKAGE_LIBGCRYPT)
+	# We need a SHA1 implementation. If either openssl, libgcrypt, nettle or
+	# libsha1 are already part of the build, we'll use one of them,
+	# otherwise, use the small libmd library.
+	select BR2_PACKAGE_LIBMD if (!BR2_PACKAGE_OPENSSL && !BR2_PACKAGE_LIBGCRYPT && !BR2_PACKAGE_NETTLE && !BR2_PACKAGE_LIBSHA1)
 	select BR2_PACKAGE_PIXMAN
 	select BR2_PACKAGE_WAYLAND
 	select BR2_PACKAGE_WAYLAND_PROTOCOLS
diff --git a/package/x11r7/xwayland/xwayland.mk b/package/x11r7/xwayland/xwayland.mk
index 59d607fb5b..98bc74200a 100644
--- a/package/x11r7/xwayland/xwayland.mk
+++ b/package/x11r7/xwayland/xwayland.mk
@@ -69,15 +69,22 @@ else
 XWAYLAND_CONF_OPTS += -Dxselinux=false
 endif
 
-ifeq ($(BR2_PACKAGE_OPENSSL),y)
-XWAYLAND_CONF_OPTS += -Dsha1=libcrypto
-XWAYLAND_DEPENDENCIES += openssl
+# The order of the preferred SHA1 libraries should match used by meson.build.
+ifeq ($(BR2_PACKAGE_LIBMD),y)
+XWAYLAND_CONF_OPTS += -Dsha1=libmd
+XWAYLAND_DEPENDENCIES += libmd
+else ifeq ($(BR2_PACKAGE_LIBSHA1),y)
+XWAYLAND_CONF_OPTS += -Dsha1=libsha1
+XWAYLAND_DEPENDENCIES += libsha1
+else ifeq ($(BR2_PACKAGE_NETTLE),y)
+XWAYLAND_CONF_OPTS += -Dsha1=libnettle
+XWAYLAND_DEPENDENCIES += nettle
 else ifeq ($(BR2_PACKAGE_LIBGCRYPT),y)
 XWAYLAND_CONF_OPTS += -Dsha1=libgcrypt
 XWAYLAND_DEPENDENCIES += libgcrypt
 else
-XWAYLAND_CONF_OPTS += -Dsha1=libsha1
-XWAYLAND_DEPENDENCIES += libsha1
+XWAYLAND_CONF_OPTS += -Dsha1=libcrypto
+XWAYLAND_DEPENDENCIES += openssl
 endif
 
 ifeq ($(BR2_PACKAGE_LIBUNWIND),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
