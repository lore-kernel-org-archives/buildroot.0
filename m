Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46F92C5DF94
	for <buildroot@archiver.kernel.org>; Fri, 21 Aug 2026 16:48:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D265B8124F;
	Fri, 21 Aug 2026 16:48:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TGIw-wxwi_Mb; Fri, 21 Aug 2026 16:48:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787330933;
	bh=cGbs/jdkyfO8TwKynMoXk5jjCmBGFgiGqaAhCRiVhrk=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=bIcGQYydyPJ1IAX5q52Gfd7Ox9b5Mjhse3H2KMigJTeNUkcpujSFebfiue+bzO08D
	 9X3LeWqVFcT0WDpkP6di5QBhQ9PpYoTnW0zqNpyRFU3E4kRzPnOdMzxAsInIEMSqOA
	 terhDU/1fruSzUT5Z/ovUV5nONFCn/xYdg3nVG8fVAlJbQ1lw+LGSCc92Hp9dJwgqM
	 D7ET2LJercQ83l1XgmMRzRwcIgRMOcacL13C0oW7jW34AJau84Tm77SMnwBMFaraci
	 bA7NCZDojviWWz/nduFqLzAdk2ctdV4tq8SreKuwlQbhqpli2Iiq9PmX6o7eJQacjO
	 o0xZhrl38Chnw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EBD1D813A4;
	Fri, 21 Aug 2026 16:48:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5FE54336
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 16:48:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 51D50813A4
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 16:48:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wkH0JQnNZkYQ for <buildroot@buildroot.org>;
 Fri, 21 Aug 2026 16:48:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2A2A68124F
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 16:48:49 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:1065:2100:52d9:65fe:2df3:c492])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 2DF715FFB4;
 Fri, 21 Aug 2026 18:48:43 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Fiona Klute <fiona.klute@gmx.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Julien Olivain <ju.o@free.fr>
Date: Fri, 21 Aug 2026 18:48:32 +0200
Message-ID: <20260821164832.1906581-2-ju.o@free.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260821164832.1906581-1-ju.o@free.fr>
References: <20260821164832.1906581-1-ju.o@free.fr>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] Revert "package/fakeroot: bump to version
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

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
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
