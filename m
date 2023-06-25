Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C399BEB64DD
	for <buildroot@archiver.kernel.org>; Sun, 25 Jun 2023 13:55:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7BEB281E3D;
	Sun, 25 Jun 2023 13:55:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7BEB281E3D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kTTJ3IcwqSbV; Sun, 25 Jun 2023 13:55:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A03F081EE9;
	Sun, 25 Jun 2023 13:55:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A03F081EE9
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6FF381BF3BA
 for <buildroot@lists.busybox.net>; Sun, 25 Jun 2023 13:54:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AB8F24094C
 for <buildroot@lists.busybox.net>; Sun, 25 Jun 2023 13:54:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AB8F24094C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1XZV7oxd7fAw for <buildroot@lists.busybox.net>;
 Sun, 25 Jun 2023 13:54:15 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7ADE840926
 for <buildroot@buildroot.org>; Sun, 25 Jun 2023 13:54:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7ADE840926
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 659D8849D1; Sun, 25 Jun 2023 13:54:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 25 Jun 2023 15:33:59 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c4eb3544a0fb8023678f35556a9a359d806cac4a
X-Git-Newrev: 8436a33d0fe95678152fcf7f1f8451fdff675ccb
X-Patchwork-Hint: ignore
Message-Id: <20230625135415.659D8849D1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libcgroup: bump to version 2.0.3
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=8436a33d0fe95678152fcf7f1f8451fdff675ccb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/libcgroup/libcgroup/releases/tag/v2.0.3

Also remove redundant LIBCGROUP_SOURCE definition, since there's no
longer an uploaded bz2 archive.

Signed-off-by: Oleg Lyovin <ovlevin@sberdevices.ru>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/libcgroup/libcgroup.hash | 4 ++--
 package/libcgroup/libcgroup.mk   | 3 +--
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/libcgroup/libcgroup.hash b/package/libcgroup/libcgroup.hash
index 70671212ef..65b98d94e2 100644
--- a/package/libcgroup/libcgroup.hash
+++ b/package/libcgroup/libcgroup.hash
@@ -1,5 +1,5 @@
-# From https://github.com/libcgroup/libcgroup/releases/download/v0.42.2/libcgroup-0.42.2.tar.bz2.sha256
-sha256  18939381324d418e11be4f5fdca37b01652c18917bfaf1f6b0c505f157e18d07  libcgroup-0.42.2.tar.bz2
+# From https://github.com/libcgroup/libcgroup/releases/download/v2.0.3/libcgroup-2.0.3.tar.gz.sha256
+sha256  b29b5704de3d0fadf199fe4e17eeeaecba7f0dd1b85569c96eec37c7672e3026  libcgroup-2.0.3.tar.gz
 
 # Hash for license file
 sha256  a9bdde5616ecdd1e980b44f360600ee8783b1f99b8cc83a2beb163a0a390e861  COPYING
diff --git a/package/libcgroup/libcgroup.mk b/package/libcgroup/libcgroup.mk
index 156b066162..fb0b646c51 100644
--- a/package/libcgroup/libcgroup.mk
+++ b/package/libcgroup/libcgroup.mk
@@ -4,8 +4,7 @@
 #
 ################################################################################
 
-LIBCGROUP_VERSION = 0.42.2
-LIBCGROUP_SOURCE = libcgroup-$(LIBCGROUP_VERSION).tar.bz2
+LIBCGROUP_VERSION = 2.0.3
 LIBCGROUP_SITE = https://github.com/libcgroup/libcgroup/releases/download/v$(LIBCGROUP_VERSION)
 LIBCGROUP_LICENSE = LGPL-2.1
 LIBCGROUP_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
