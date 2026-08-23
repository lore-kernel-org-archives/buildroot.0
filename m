Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A6C0C5DF8C
	for <buildroot@archiver.kernel.org>; Sun, 23 Aug 2026 20:41:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D88AA8083A;
	Sun, 23 Aug 2026 20:41:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OT3iDzQXi93v; Sun, 23 Aug 2026 20:41:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787517678;
	bh=rxu5571sQqoJCtcoRJIv0eguS4ycnYfn8FJmLWX3Elk=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=FQb+fy1SGjtRM+lBHp2Qho9PDOSYuAD6AeqGdwlBqkucv3X2mCuF0ct2jzZ7otarv
	 dFhtHxoez4OcD7+65hsj48uuDQjYSEviwP03UN/R512zU82CZ4UkHeKHlRhpNyhQP7
	 06bn7jj2cCpcJH97CuRbzblQKp14zS8FdenpdKoy/WrSTxehH5z2HgP2zr3keol+2O
	 L0Wrvqm1Z3VzfXFbPG7RHZQ47kKZy3L8/mYbjvajZ1Y6VltHfEJrYC9VIqp0mUnRTf
	 RtAAI2StvLp/mI6onCeITmUnG22Htc9X+42gdVVRligtU1wEJR+hIIt+4qQsvaRDMW
	 bOM1ir+9JtruQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0B1FA80CF1;
	Sun, 23 Aug 2026 20:41:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id B221E41A
 for <buildroot@buildroot.org>; Sun, 23 Aug 2026 20:41:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 983CB60615
 for <buildroot@buildroot.org>; Sun, 23 Aug 2026 20:41:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id axTbxckyQqdb for <buildroot@buildroot.org>;
 Sun, 23 Aug 2026 20:41:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0E13660614
 for <buildroot@buildroot.org>; Sun, 23 Aug 2026 20:41:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 63E2A8EFD8; Sun, 23 Aug 2026 20:40:20 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 23 Aug 2026 22:34:03 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9fdc16a79d31337264304c9c7f94ccf0a44daff8
X-Git-Newrev: df9e3f9b30e1343a3642a6421600bdda1eea848d
X-Patchwork-Hint: ignore
Message-Id: <20260823204020.63E2A8EFD8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Revert "package/fakeroot: bump to version
 2.1.4"
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/df9e3f9b30e1343a3642a6421600bdda1eea848d
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

This major fakeroot bump is introducing xattr issues on hosts with
SELinux enabled (for example a Fedora 44 default installation).

Trying to build defconfigs such as:

    make qemu_aarch64_virt_defconfig
    make

produces error when building the filesystem image:

    >>>   Generating filesystem image rootfs.ext2
    ...
    mke2fs 1.47.4 (6-Mar-2025)
    ...
    Copying files into the device: set_inode_xattr: No data available while reading attribute "security.selinux" of /buildroot/output/build/buildroot-fs/ext2/target"
    populate_fs3: No data available while copying xattrs on root directory
    mkfs.ext4: No data available while populating file system

This reverts commit 344d64f38539b28a5b8753d18ceb43ff2ee969bd.

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/fakeroot/fakeroot.hash | 6 +++---
 package/fakeroot/fakeroot.mk   | 9 +++------
 2 files changed, 6 insertions(+), 9 deletions(-)

diff --git a/package/fakeroot/fakeroot.hash b/package/fakeroot/fakeroot.hash
index 0c330b7792..82a6214380 100644
--- a/package/fakeroot/fakeroot.hash
+++ b/package/fakeroot/fakeroot.hash
@@ -1,5 +1,5 @@
-# From https://snapshot.debian.org/archive/debian/20260711T202405Z/pool/main/f/fakeroot/fakeroot_2.1.4-1.dsc
-sha1  9d55e62a34612316058166f7c528d9fc2f30c719  fakeroot_2.1.4.orig.tar.xz
-sha256  0822bd5a9f0cf19d2ba0546b88b0432d4d3d9917db62c57b74044ccadba06e49  fakeroot_2.1.4.orig.tar.xz
+# From https://deb.debian.org/debian/pool/main/f/fakeroot/fakeroot_1.37.2-1.dsc
+sha1  1a721c2b4093a4e83dc091dc41a028f19340c1b3  fakeroot_1.37.2.orig.tar.gz
+sha256  0eea60fbe89771b88fcf415c8f2f0a6ccfe9edebbcf3ba5dc0212718d98884db  fakeroot_1.37.2.orig.tar.gz
 # License files, locally calculated
 sha256  fc82ca8b6fdb18d4e3e85cfd8ab58d1bcd3f1b29abe782895abd91d64763f8e7  COPYING
diff --git a/package/fakeroot/fakeroot.mk b/package/fakeroot/fakeroot.mk
index 8354f994ee..12d7f1c4a1 100644
--- a/package/fakeroot/fakeroot.mk
+++ b/package/fakeroot/fakeroot.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-FAKEROOT_VERSION = 2.1.4
-FAKEROOT_SOURCE = fakeroot_$(FAKEROOT_VERSION).orig.tar.xz
-FAKEROOT_SITE = https://snapshot.debian.org/archive/debian/20260711T202405Z/pool/main/f/fakeroot
+FAKEROOT_VERSION = 1.37.2
+FAKEROOT_SOURCE = fakeroot_$(FAKEROOT_VERSION).orig.tar.gz
+FAKEROOT_SITE = https://snapshot.debian.org/archive/debian/20260401T000000Z/pool/main/f/fakeroot
 
 HOST_FAKEROOT_DEPENDENCIES = host-acl
 # Force capabilities detection off
@@ -18,7 +18,4 @@ HOST_FAKEROOT_CONF_ENV = \
 FAKEROOT_LICENSE = GPL-3.0+
 FAKEROOT_LICENSE_FILES = COPYING
 
-# source archive does not contain pre-generated configure script
-FAKEROOT_AUTORECONF = YES
-
 $(eval $(host-autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
