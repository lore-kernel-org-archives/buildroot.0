Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B0EEC433F5
	for <buildroot@archiver.kernel.org>; Sun,  9 Jan 2022 14:05:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2CA594032C;
	Sun,  9 Jan 2022 14:05:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VodlQVEtTUDz; Sun,  9 Jan 2022 14:05:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 589454030F;
	Sun,  9 Jan 2022 14:05:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D041A1BF4D6
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 14:05:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BFF0B4030F
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 14:05:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uDVn6LMMVesh for <buildroot@lists.busybox.net>;
 Sun,  9 Jan 2022 14:05:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AC2B24030A
 for <buildroot@buildroot.org>; Sun,  9 Jan 2022 14:05:26 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 x18-20020a7bc212000000b00347cc83ec07so3402706wmi.4
 for <buildroot@buildroot.org>; Sun, 09 Jan 2022 06:05:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Chb1F0YgKgIsNhRDepuw/ey3KFpqmaUf3iLJmb6omos=;
 b=Lq5OqqNzoee+f0mt5/ZKxBh0DbhcedBsZIWchhNmkixoEmlIdXr1UNjpw+zDghtokE
 ekpy7kmo4/Oud2i11pszh7pHf5JNg0qQg8qSft2pfVn2gIrh450KlwNLymD7q31wFRJI
 V9xsV4US2Tw24pYdtj1M7L6MQ7Q+ZSPPBe3vkeRBhpj34fW+rySSD+4/zjjmKH28DZLw
 O7mzSnL4p1MK+GK2PaZQEJIRd5W/jvyPUJBxUwRl30mUXYWmDrmTKVl1SXeZ9wuYXLcA
 Ao/6Muv+Kw5Ged3U7YdgbjRyvgzdfmoqUc97PptK3RohY2G8nECiT94Lvll8Xd3NTd0z
 P6pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Chb1F0YgKgIsNhRDepuw/ey3KFpqmaUf3iLJmb6omos=;
 b=6nJpfDbaLsqBgnuyGDWqTniNS0hTg/4We033on0/FncP0iQz1iD4E+pH93X4bX9Ll0
 udSGT6OnuOG82ZR88ty0R6rnZ2K+S9OYLxbVHKmeHCRjyS8HqGZpM6I6nIrD9CU8ogH2
 fDWGzgPAtJlsmOkC8TLOrVJe/ood6jfMKioKzeho0WieVWg+viaruhf+Wphb3AOOakm6
 h6lfRbPS6M3M1kKwR0xHvmaJFfr3j66iyJ7ATlYwCna3T4jRNp9tRxbVP6Wx5V5tCQtI
 xpLb3te5uZbr6D2FTUgqmcToDbJLf0/HgYbipczFFDRDrMhbZ2Mq/vBc69SMLB+asOC3
 uSew==
X-Gm-Message-State: AOAM532XBSQ2qeZEtO2i5OhSoWQ5TkE73fMd1HdN8F3qM8yuD6EQ+Kit
 zqWG7O7moGBZKzi2k+QXfKMJSGrw2Uo=
X-Google-Smtp-Source: ABdhPJxqenhJGKt8/suy2CplejxjKJyITOD1HtiXPTZl8DCnswp6+luKp0y2/sd3RgYsOWSjqoUQcQ==
X-Received: by 2002:a05:600c:4e10:: with SMTP id
 b16mr18423503wmq.146.1641737124854; 
 Sun, 09 Jan 2022 06:05:24 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2129-201.w92-167.abo.wanadoo.fr.
 [92.167.208.201])
 by smtp.gmail.com with ESMTPSA id i4sm4243565wmd.34.2022.01.09.06.05.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Jan 2022 06:05:24 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  9 Jan 2022 15:03:01 +0100
Message-Id: <20220109140301.663692-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/gvfs: bump to version 1.48.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Drop patch (not needed since
https://gitlab.gnome.org/GNOME/gvfs/-/commit/eee4bb846038e4440ffc8a591869974639c72bb0)

https://gitlab.gnome.org/GNOME/gvfs/-/blob/1.48.1/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...n.build-fix-linking-with-libmetadata.patch | 78 -------------------
 package/gvfs/gvfs.hash                        |  4 +-
 package/gvfs/gvfs.mk                          |  2 +-
 3 files changed, 3 insertions(+), 81 deletions(-)
 delete mode 100644 package/gvfs/0001-meson.build-fix-linking-with-libmetadata.patch

diff --git a/package/gvfs/0001-meson.build-fix-linking-with-libmetadata.patch b/package/gvfs/0001-meson.build-fix-linking-with-libmetadata.patch
deleted file mode 100644
index 3ee4a28e94..0000000000
--- a/package/gvfs/0001-meson.build-fix-linking-with-libmetadata.patch
+++ /dev/null
@@ -1,78 +0,0 @@
-From 731256d7517f0d9cf0b999bb22f864080d5e8690 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sat, 18 Jul 2020 10:00:50 +0200
-Subject: [PATCH] meson.build: fix linking with libmetadata
-
-libmetadata is built as a static library and depends on libgvfscommon so
-change the dependencies order to put libgvfscommon_dep after
-libmetadata_dep or gvfsd-metadata will fail to link on:
-
-FAILED: metadata/gvfsd-metadata
-/home/naourr/work/instance-3/output-1/host/bin/arm-none-linux-gnueabi-gcc  -o metadata/gvfsd-metadata 'metadata/45447b7@@gvfsd-metadata@exe/meta-daemon.c.o' -Wl,--as-needed -Wl,--no-undefined -Wl,-O1 -Wl,--start-group common/libgvfscommon.so metadata/libmetadata.a /home/naourr/work/instance-3/output-1/host/arm-buildroot-linux-gnueabi/sysroot/usr/lib/libgio-2.0.so /home/naourr/work/instance-3/output-1/host/arm-buildroot-linux-gnueabi/sysroot/usr/lib/libgobject-2.0.so /home/naourr/work/instance-3/output-1/host/arm-buildroot-linux-gnueabi/sysroot/usr/lib/libglib-2.0.so -Wl,--end-group '-Wl,-rpath,$ORIGIN/../common:$ORIGIN/' -Wl,-rpath-link,/home/naourr/work/instance-3/output-1/build/gvfs-1.44.1/build/common -Wl,-rpath-link,/home/naourr/work/instance-3/output-1/build/gvfs-1.44.1/build/metadata
-metadata/libmetadata.a(metatree.c.o): In function `safe_open':
-metatree.c:(.text+0x9c8): undefined reference to `gvfs_randomize_string'
-collect2: error: ld returned 1 exit status
-
-Apply this change in the whole source code and not only for
-gvfsd-metadata to avoid any other build failures.
-
-Fixes:
- - http://autobuild.buildroot.org/results//fa892c41b6b9285839a0164b000e37fb04dcc194
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status:
-https://gitlab.gnome.org/GNOME/gvfs/-/merge_requests/92]
----
- client/meson.build   | 2 +-
- metadata/meson.build | 5 +++--
- 2 files changed, 4 insertions(+), 3 deletions(-)
-
-diff --git a/client/meson.build b/client/meson.build
-index 8f57d0d3..1d251481 100644
---- a/client/meson.build
-+++ b/client/meson.build
-@@ -33,8 +33,8 @@ sources = uri_parser_sources + uri_utils + files(
- 
- deps = [
-   gio_unix_dep,
--  libgvfscommon_dep,
-   libmetadata_dep,
-+  libgvfscommon_dep,
- ]
- 
- cflags = [
-diff --git a/metadata/meson.build b/metadata/meson.build
-index 4e120d18..5699e6f2 100644
---- a/metadata/meson.build
-+++ b/metadata/meson.build
-@@ -72,8 +72,8 @@ libmetadata_dep = declare_dependency(
- )
- 
- deps = [
--  libgvfscommon_dep,
-   libmetadata_dep,
-+  libgvfscommon_dep,
- ]
- 
- if enable_gudev
-@@ -105,8 +105,8 @@ if enable_devel_utils
-       app + '.c',
-       include_directories: top_inc,
-       dependencies: [
--        libgvfscommon_dep,
-         libmetadata_dep,
-+        libgvfscommon_dep,
-       ],
-       c_args: cflags,
-     )
-@@ -119,6 +119,7 @@ if enable_devel_utils
-       include_directories: top_inc,
-       dependencies: [
-         libmetadata_dep,
-+        libgvfscommon_dep,
-         libxml_dep,
-       ],
-       c_args: cflags,
--- 
-2.27.0
-
diff --git a/package/gvfs/gvfs.hash b/package/gvfs/gvfs.hash
index 2ee945e710..f4a5364f1f 100644
--- a/package/gvfs/gvfs.hash
+++ b/package/gvfs/gvfs.hash
@@ -1,5 +1,5 @@
-# From http://ftp.gnome.org/pub/GNOME/sources/gvfs/1.44/gvfs-1.44.1.sha256sum
-sha256  50ef3245d1b03666a40455109169a2a1bd51419fd2d51f9fa6cfd4f89f04fb46  gvfs-1.44.1.tar.xz
+# From http://ftp.gnome.org/pub/GNOME/sources/gvfs/1.48/gvfs-1.48.1.sha256sum
+sha256  b2ea4f271aad2711f16b43c03151e2ec5a9874ff1a21142ef6d6406486a19dc2  gvfs-1.48.1.tar.xz
 
 # Hash for license file
 sha256  45cf336e2e48176993babc5aabf44437390f40e6a86a472c6abfc7ce9c035db4  COPYING
diff --git a/package/gvfs/gvfs.mk b/package/gvfs/gvfs.mk
index fc77e8e1aa..4174592455 100644
--- a/package/gvfs/gvfs.mk
+++ b/package/gvfs/gvfs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GVFS_VERSION_MAJOR = 1.44
+GVFS_VERSION_MAJOR = 1.48
 GVFS_VERSION = $(GVFS_VERSION_MAJOR).1
 GVFS_SOURCE = gvfs-$(GVFS_VERSION).tar.xz
 GVFS_SITE = http://ftp.gnome.org/pub/GNOME/sources/gvfs/$(GVFS_VERSION_MAJOR)
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
