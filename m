Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25382C7EE39
	for <buildroot@archiver.kernel.org>; Sat, 28 Jun 2025 21:08:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C813940E1F;
	Sat, 28 Jun 2025 21:08:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AOEdE8WBEIc7; Sat, 28 Jun 2025 21:08:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F0A6A40B6D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id F0A6A40B6D;
	Sat, 28 Jun 2025 21:08:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 56F9C1C9
 for <buildroot@buildroot.org>; Sat, 28 Jun 2025 21:08:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3DB1260720
 for <buildroot@buildroot.org>; Sat, 28 Jun 2025 21:08:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B9zZSiv_GOCk for <buildroot@buildroot.org>;
 Sat, 28 Jun 2025 21:08:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7F447606E3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7F447606E3
 for <buildroot@buildroot.org>; Sat, 28 Jun 2025 21:08:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 75FC4848AE; Sat, 28 Jun 2025 21:08:19 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 28 Jun 2025 22:57:28 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6f231d3003502282710a0da7ecd98344ec868095
X-Git-Newrev: 2f2a83fdc49de38148066ab1689411ce6e760bff
X-Patchwork-Hint: ignore
Message-Id: <20250628210819.75FC4848AE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libmpeg2: switch to videolan
 Gitlab repository
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

commit: https://git.buildroot.net/buildroot/commit/?id=2f2a83fdc49de38148066ab1689411ce6e760bff
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The source code archives don't seem to be available anymore from the libmpeg2
website (Sourceforge) [1], and their SVN repository [2] doesn't seem
reachable either.

This fixes recent autobuilder failures, such as
https://autobuild.buildroot.net/results/ede/edeef6a480350880b12eebd94654644e43c2670e/

[1] https://libmpeg2.sourceforge.io/
[2] svn://svn.videolan.org/libmpeg2/trunk

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libmpeg2/libmpeg2.hash | 2 +-
 package/libmpeg2/libmpeg2.mk   | 6 +++++-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/package/libmpeg2/libmpeg2.hash b/package/libmpeg2/libmpeg2.hash
index 615d0ea6bf..96b71fb1c8 100644
--- a/package/libmpeg2/libmpeg2.hash
+++ b/package/libmpeg2/libmpeg2.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  dee22e893cb5fc2b2b6ebd60b88478ab8556cb3b93f9a0d7ce8f3b61851871d4  libmpeg2-0.5.1.tar.gz
+sha256  1b3adfb73e7d34ce9259130683d884b0b1af67572c9fd8229d45f55794b6dc0c  libmpeg2-v41f78cf4d30d0da0a24c8ecbc38b0c9dfd43f871.tar.gz
 sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
diff --git a/package/libmpeg2/libmpeg2.mk b/package/libmpeg2/libmpeg2.mk
index db9b2f8bbb..cab800162c 100644
--- a/package/libmpeg2/libmpeg2.mk
+++ b/package/libmpeg2/libmpeg2.mk
@@ -5,7 +5,11 @@
 ################################################################################
 
 LIBMPEG2_VERSION = 0.5.1
-LIBMPEG2_SITE = http://libmpeg2.sourceforge.net/files
+# Gitlab repository does not have a 0.5.1 git tag,
+# use the corresponding commit sha instead
+LIBMPEG2_VERSION_SHA = 41f78cf4d30d0da0a24c8ecbc38b0c9dfd43f871
+LIBMPEG2_SOURCE = libmpeg2-v$(LIBMPEG2_VERSION_SHA).tar.gz
+LIBMPEG2_SITE = https://code.videolan.org/videolan/libmpeg2/-/archive/$(LIBMPEG2_VERSION_SHA)
 LIBMPEG2_LICENSE = GPL-2.0+
 LIBMPEG2_LICENSE_FILES = COPYING
 LIBMPEG2_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
