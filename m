Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4093FC5DF7D
	for <buildroot@archiver.kernel.org>; Tue, 18 Aug 2026 21:47:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 04348405D7;
	Tue, 18 Aug 2026 21:47:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eVRVDFN7rbaO; Tue, 18 Aug 2026 21:47:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787089666;
	bh=XbMlnqFe7eoXcGVhl/rnxrSC+2OMSwGePxwQ6mggonE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=gx0funp/JoQrEd7s8BOJafuLTE8bnGBvrNN4h4gJqJUkuoH1V4VgVcvL5XAAAdjdm
	 DamEYobtDza8IxuL9VQvy6fRGdZY4yXr8Ijs5sT2kte7EHuFd2m283bWN8ygd0iFKs
	 CXjqZdUvnOcrmuKTGjcLAR/lx0n/Qp51k0nA0BBKxvW7ydP5pFRR31IoCUj+/LJn/a
	 u17kx7hjPi1r1FY1smozdPlvswD7Xxxx7RpzQbk78hykuUcO6mFQurH+2hhIAa0kEu
	 4yuG/VPLzNYumOT7xAi5OLGiZaBJQ31cVQjw14MhxjoXzoyFkQLUI3osnNqkv5xyw8
	 XMdEe8INLl9Yw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 40B0040762;
	Tue, 18 Aug 2026 21:47:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 95A06333
 for <buildroot@buildroot.org>; Tue, 18 Aug 2026 21:47:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 87BFA80DC8
 for <buildroot@buildroot.org>; Tue, 18 Aug 2026 21:47:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YQp0i_Y2rEWP for <buildroot@buildroot.org>;
 Tue, 18 Aug 2026 21:47:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E8C6F80DBB
 for <buildroot@buildroot.org>; Tue, 18 Aug 2026 21:47:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B7A258DBFB; Tue, 18 Aug 2026 21:46:52 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 18 Aug 2026 23:47:30 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5e53766dec8f09daf5a06dc2ba25536e4bb63360
X-Git-Newrev: 344d64f38539b28a5b8753d18ceb43ff2ee969bd
X-Patchwork-Hint: ignore
Message-Id: <20260818214652.B7A258DBFB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/fakeroot: bump to version 2.1.4
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/344d64f38539b28a5b8753d18ceb43ff2ee969bd
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

The source archive does not contain a pre-build configure script any
more, so enable autoreconf. Fakeroot also contains an experimental
Meson build definition since 2.1, but Buildroot should keep using
autotools until the Meson build is stable.

Since v6.10.1 btrfs-progs uses nftw() [1], which package/fakeroot did
not support before v2.0 [2]. This update allows updating btrfs-progs
past v6.10 without breaking build of btrfs rootfs images.

Upstream changes:
https://salsa.debian.org/clint/fakeroot/-/compare/upstream%2F1.37.2...upstream%2F2.1.4

[1] https://git.kernel.org/pub/scm/linux/kernel/git/kdave/btrfs-progs.git/commit?id=c6464d3f99ed1dabceff1168eabb207492c37624
[2] https://salsa.debian.org/clint/fakeroot/-/commit/3502c515c73ee02e7f557e6a3bfc1af675dd3d34

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/fakeroot/fakeroot.hash | 6 +++---
 package/fakeroot/fakeroot.mk   | 9 ++++++---
 2 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/package/fakeroot/fakeroot.hash b/package/fakeroot/fakeroot.hash
index 82a6214380..0c330b7792 100644
--- a/package/fakeroot/fakeroot.hash
+++ b/package/fakeroot/fakeroot.hash
@@ -1,5 +1,5 @@
-# From https://deb.debian.org/debian/pool/main/f/fakeroot/fakeroot_1.37.2-1.dsc
-sha1  1a721c2b4093a4e83dc091dc41a028f19340c1b3  fakeroot_1.37.2.orig.tar.gz
-sha256  0eea60fbe89771b88fcf415c8f2f0a6ccfe9edebbcf3ba5dc0212718d98884db  fakeroot_1.37.2.orig.tar.gz
+# From https://snapshot.debian.org/archive/debian/20260711T202405Z/pool/main/f/fakeroot/fakeroot_2.1.4-1.dsc
+sha1  9d55e62a34612316058166f7c528d9fc2f30c719  fakeroot_2.1.4.orig.tar.xz
+sha256  0822bd5a9f0cf19d2ba0546b88b0432d4d3d9917db62c57b74044ccadba06e49  fakeroot_2.1.4.orig.tar.xz
 # License files, locally calculated
 sha256  fc82ca8b6fdb18d4e3e85cfd8ab58d1bcd3f1b29abe782895abd91d64763f8e7  COPYING
diff --git a/package/fakeroot/fakeroot.mk b/package/fakeroot/fakeroot.mk
index 12d7f1c4a1..8354f994ee 100644
--- a/package/fakeroot/fakeroot.mk
+++ b/package/fakeroot/fakeroot.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-FAKEROOT_VERSION = 1.37.2
-FAKEROOT_SOURCE = fakeroot_$(FAKEROOT_VERSION).orig.tar.gz
-FAKEROOT_SITE = https://snapshot.debian.org/archive/debian/20260401T000000Z/pool/main/f/fakeroot
+FAKEROOT_VERSION = 2.1.4
+FAKEROOT_SOURCE = fakeroot_$(FAKEROOT_VERSION).orig.tar.xz
+FAKEROOT_SITE = https://snapshot.debian.org/archive/debian/20260711T202405Z/pool/main/f/fakeroot
 
 HOST_FAKEROOT_DEPENDENCIES = host-acl
 # Force capabilities detection off
@@ -18,4 +18,7 @@ HOST_FAKEROOT_CONF_ENV = \
 FAKEROOT_LICENSE = GPL-3.0+
 FAKEROOT_LICENSE_FILES = COPYING
 
+# source archive does not contain pre-generated configure script
+FAKEROOT_AUTORECONF = YES
+
 $(eval $(host-autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
