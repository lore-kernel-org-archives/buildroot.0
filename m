Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54ABFC433F5
	for <buildroot@archiver.kernel.org>; Sun,  3 Apr 2022 20:25:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 095F4404A6;
	Sun,  3 Apr 2022 20:25:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gBGe8OBqg-z7; Sun,  3 Apr 2022 20:25:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id ED6A5401AF;
	Sun,  3 Apr 2022 20:25:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4D7DB1BF31F
 for <buildroot@lists.busybox.net>; Sun,  3 Apr 2022 20:25:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3AFA882422
 for <buildroot@lists.busybox.net>; Sun,  3 Apr 2022 20:25:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bgooD-NW213x for <buildroot@lists.busybox.net>;
 Sun,  3 Apr 2022 20:25:01 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7FF06823C0
 for <buildroot@buildroot.org>; Sun,  3 Apr 2022 20:25:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 0036A860F8; Sun,  3 Apr 2022 20:15:36 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 3 Apr 2022 22:23:27 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f6b6e0b68bd2d84a245981583c492c009678c7b0
X-Git-Newrev: b1d80083781f844cc70229c4a592253c9a34cbaa
X-Patchwork-Hint: ignore
Message-Id: <20220403201537.0036A860F8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/minizip: bump to version 3.0.5
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=b1d80083781f844cc70229c4a592253c9a34cbaa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This bump will fix the following build failure with zlib-ng thanks to
https://github.com/zlib-ng/minizip-ng/commit/9184ba1216589077803b3e4e85f2b226f861ab2d:

/home/autobuild/autobuild/instance-10/output-1/build/minizip-3.0.4/mz_crypt.c:19:14: fatal error: zlib-ng.h: No such file or directory
   19 | #    include "zlib-ng.h"
      |              ^~~~~~~~~~~

https://github.com/zlib-ng/minizip-ng/releases/tag/3.0.5

Fixes:
 - http://autobuild.buildroot.org/results/530fee780557941356dcd6aabb8cc9eb048574f3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/minizip/minizip.hash | 2 +-
 package/minizip/minizip.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/minizip/minizip.hash b/package/minizip/minizip.hash
index 3e87e64dae..e73637670c 100644
--- a/package/minizip/minizip.hash
+++ b/package/minizip/minizip.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  2ab219f651901a337a7d3c268128711b80330a99ea36bdc528c76b591a624c3c  minizip-3.0.4.tar.gz
+sha256  1a248c378fdf4ef6c517024bb65577603d5146cffaebe81900bec9c0a5035d4d  minizip-3.0.5.tar.gz
 sha256  675181c03fc1302a1c8554c00f7be9bb420c5dbc9dcc2013433cec144413de03  LICENSE
diff --git a/package/minizip/minizip.mk b/package/minizip/minizip.mk
index 07f67c1354..b9259f0c54 100644
--- a/package/minizip/minizip.mk
+++ b/package/minizip/minizip.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MINIZIP_VERSION = 3.0.4
+MINIZIP_VERSION = 3.0.5
 MINIZIP_SITE = $(call github,nmoinvaz,minizip,$(MINIZIP_VERSION))
 MINIZIP_DEPENDENCIES = host-pkgconf
 MINIZIP_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
