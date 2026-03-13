Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3F3C107BCFE
	for <buildroot@archiver.kernel.org>; Sat, 14 Mar 2026 07:49:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9621160EFD;
	Sat, 14 Mar 2026 07:49:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MYSSMY2x69mp; Sat, 14 Mar 2026 07:49:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A815860F40
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773474591;
	bh=KC0Ak3g4rsUC9Ez5iJ/wBebV+GyYcPOnn5yAEYI1GSM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=MlPyHEnS+bpoxhmvjLNU9U7EsuFOV5fjaERZDFglF1hiCmgjwguxS2dHL9qgQIWQV
	 K0o/n39CZ9Ls7TZ/FwfBOSwRoe4SS1zIqNKpDVgYvD1fuqlsFxVVBsMD7rrS+SLSfR
	 bVaiGUBu3aYG/2j6UrJCWaBwmQRRyARebKxZ35w1OBrp5MB+ZyLVgC2BzaOeFqUuUa
	 GdRQ2G8s7cb9zCgJHosRMJlEoHp+1BchOOWMvif4nE8H5rHWxRGi06BGbzk2tg/OET
	 XY4ikjSQk1ZI4dMtQspZIR5d+3tKkQHwk2rILNWt60mc76ipcQpMFnOMEw5EYZvP9I
	 4rpwTRT85LDcQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A815860F40;
	Sat, 14 Mar 2026 07:49:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id C8A7E201
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 07:49:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BA71940FE8
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 07:49:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0A_yZwfX3xZz for <buildroot@buildroot.org>;
 Sat, 14 Mar 2026 07:49:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 022FC40FEB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 022FC40FEB
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 07:49:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 383EF85EE5; Sat, 14 Mar 2026 07:49:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 13 Mar 2026 16:17:19 +0100
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: 40f1d20242bd594838c9a6133161a79a2ef3d0de
X-Git-Newrev: 9c2ea8a46321bcdc4d65f9f5f555e7e84d65ec52
X-Patchwork-Hint: ignore
Message-Id: <20260314074936.383EF85EE5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] package/libvips: fix
 static build
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/9c2ea8a46321bcdc4d65f9f5f555e7e84d65ec52
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

Buildroot commit 72c7d99e22eb7706e413992cf7084438fea657bb switched the
build system to meson which causes an error during configure:

output/build/libvips-8.17.2/meson.build:108:4:
 ERROR: Problem encountered: GModule is not supported on your system,
 please reconfigure with -Dmodules=disabled

using this defconfig:

  BR2_arm=y
  BR2_TOOLCHAIN_EXTERNAL=y
  BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
  BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
  BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-full-static-2020.11.2.tar.bz2"
  BR2_TOOLCHAIN_EXTERNAL_GCC_9=y
  BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_4=y
  BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
  # BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
  BR2_TOOLCHAIN_EXTERNAL_CXX=y
  BR2_STATIC_LIBS=y
  BR2_PACKAGE_LIBVIPS=y

Added configure options for -Dmodules to fix the problem which was not
yet caught by the autobuilders.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 86d0fcd77bba8f4fe0e4d1a054d903de3d40fd15)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/libvips/libvips.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/libvips/libvips.mk b/package/libvips/libvips.mk
index e7641fa8cd..729d5fb9e3 100644
--- a/package/libvips/libvips.mk
+++ b/package/libvips/libvips.mk
@@ -31,6 +31,12 @@ LIBVIPS_DEPENDENCIES = \
 	host-pkgconf expat libglib2 \
 	$(TARGET_NLS_DEPENDENCIES)
 
+ifeq ($(BR2_STATIC_LIBS),)
+LIBVIPS_CONF_OPTS += -Dmodules=enabled
+else
+LIBVIPS_CONF_OPTS += -Dmodules=disabled
+endif
+
 ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
 LIBVIPS_CONF_OPTS += -Dintrospection=enabled
 LIBVIPS_DEPENDENCIES += gobject-introspection
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
