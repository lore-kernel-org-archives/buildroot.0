Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C2FFD59F70
	for <buildroot@archiver.kernel.org>; Wed,  6 Nov 2024 20:22:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BC28581456;
	Wed,  6 Nov 2024 20:22:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Hq6DOjLEdqEe; Wed,  6 Nov 2024 20:22:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C614A8145C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C614A8145C;
	Wed,  6 Nov 2024 20:22:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5770C4C3B
 for <buildroot@buildroot.org>; Wed,  6 Nov 2024 20:22:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 386D8408AA
 for <buildroot@buildroot.org>; Wed,  6 Nov 2024 20:22:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RTw44tm11HlI for <buildroot@buildroot.org>;
 Wed,  6 Nov 2024 20:22:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0EB4D408A9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0EB4D408A9
 for <buildroot@buildroot.org>; Wed,  6 Nov 2024 20:22:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EE71C85E1D; Wed,  6 Nov 2024 20:21:59 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 6 Nov 2024 21:15:36 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c26d111175097143c0e50862bd1571bd1b32d3a3
X-Git-Newrev: fb4be7eea13d9a6796fe697bd3d2e1f717c164bb
X-Patchwork-Hint: ignore
Message-Id: <20241106202159.EE71C85E1D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pv: bump to version 1.9.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=fb4be7eea13d9a6796fe697bd3d2e1f717c164bb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For release note, see:
https://codeberg.org/a-j-wood/pv/src/tag/v1.9.0/docs/NEWS.md

This commit also updates the PV_SITE url from http to https, to
follow the download url published on the home page:
https://www.ivarch.com/programs/pv.shtml

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pv/pv.hash | 2 +-
 package/pv/pv.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/pv/pv.hash b/package/pv/pv.hash
index e6b1b9bd69..6b0ffbc02e 100644
--- a/package/pv/pv.hash
+++ b/package/pv/pv.hash
@@ -1,7 +1,7 @@
 # Locally calculated after checking pgp signature
 # using key: 4267B4F90F2678A112169BD61D1EF7581B45E9A0
 # from: https://codeberg.org/a-j-wood.gpg
-sha256  0cc18811a4809a587d4b11d47691bbc0ad83a5d95d2c2606af74ea7b4a674756  pv-1.8.14.tar.gz
+sha256  b38d69d7fc0785eb5eb3c57e8b12a7334f862047bf84b18f414365335399469a  pv-1.9.0.tar.gz
 
 # Hash for license file
 sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  docs/COPYING
diff --git a/package/pv/pv.mk b/package/pv/pv.mk
index 0c0fc55fab..1266d83a07 100644
--- a/package/pv/pv.mk
+++ b/package/pv/pv.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PV_VERSION = 1.8.14
-PV_SITE = http://www.ivarch.com/programs/sources
+PV_VERSION = 1.9.0
+PV_SITE = https://www.ivarch.com/programs/sources
 PV_LICENSE = GPL-3.0+
 PV_LICENSE_FILES = docs/COPYING
 PV_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
