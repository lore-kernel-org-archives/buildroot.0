Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94165C433EF
	for <buildroot@archiver.kernel.org>; Mon,  4 Apr 2022 19:30:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3F67D4092A;
	Mon,  4 Apr 2022 19:30:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id v1z_RLl6iDXa; Mon,  4 Apr 2022 19:30:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 532884091C;
	Mon,  4 Apr 2022 19:30:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2AC5E1BF27E
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 19:30:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1AB2F826DE
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 19:30:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WM6ebAGWsCLE for <buildroot@lists.busybox.net>;
 Mon,  4 Apr 2022 19:30:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6AA5D826D5
 for <buildroot@buildroot.org>; Mon,  4 Apr 2022 19:30:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id BDDB2821B2; Mon,  4 Apr 2022 19:21:16 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 4 Apr 2022 21:29:46 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: fc9c97f0026191f3bab0cc1f37675de8e826a564
X-Git-Newrev: 3e36fa4c2200c63d7cae2239b5e9b82f008509b7
X-Patchwork-Hint: ignore
Message-Id: <20220404192116.BDDB2821B2@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/minizip: bump to
 version 3.0.5
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

commit: https://git.buildroot.net/buildroot/commit/?id=3e36fa4c2200c63d7cae2239b5e9b82f008509b7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

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
(cherry picked from commit b1d80083781f844cc70229c4a592253c9a34cbaa)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
