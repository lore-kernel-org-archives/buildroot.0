Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E11A107BCFF
	for <buildroot@archiver.kernel.org>; Sat, 14 Mar 2026 08:00:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 70E2B61087;
	Sat, 14 Mar 2026 08:00:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q1ExlGn9dx8R; Sat, 14 Mar 2026 08:00:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7D8B561050
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773475225;
	bh=JHThQd+8gpjBemz5RTqeFIRE0lfu4mAVNzQDnhezAYo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=amKyw7REjFH4OqPHXTt2HmBihiONQy9L5UB9yn5fLChCpW63eQnmKFjO8r0GYk3I9
	 Y3+0kNAh9aKQAxBZbeXdrhtJl2flXLGYn8SmaHl3dzOXqLPfnkfMH8tx+8o1aceg4Z
	 9eZ6iqnhTKW0AiauZ3OBMNqXElouHV0pM7p88GDjrA86QcuMzjFnPTX8oNQkVdeeNU
	 VLbVFMdLKV2wAA9B/YbP1TH8z4leKDvUPb+ois3lVgEQav79c6H9mAEF1eV/lA3wFp
	 GjNuP0m1hYQF6dBjnMdZY6Elojj0DppecSpfV0pox5N25PVpPJBik6UVd6mH+NpAuU
	 vtCt3N7b4MVzg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7D8B561050;
	Sat, 14 Mar 2026 08:00:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 697961B4
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 08:00:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4FD9E822CD
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 08:00:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V2hAYbbg7Fwa for <buildroot@buildroot.org>;
 Sat, 14 Mar 2026 08:00:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E9DEF822D1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E9DEF822D1
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 08:00:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1F1D384380; Sat, 14 Mar 2026 08:00:10 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 13 Mar 2026 16:17:17 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: 13241770277b4809c3633c6855a216f3ecbfaed4
X-Git-Newrev: 0e13702babe6081ac9ffb57b72f0c5868ded8224
X-Patchwork-Hint: ignore
Message-Id: <20260314080010.1F1D384380@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/libvips: fix
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/0e13702babe6081ac9ffb57b72f0c5868ded8224
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.11.x

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
