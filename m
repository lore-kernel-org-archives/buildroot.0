Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06665C433F5
	for <buildroot@archiver.kernel.org>; Mon,  6 Dec 2021 18:16:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B2A7B401F8;
	Mon,  6 Dec 2021 18:16:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 37kceh9BV1Tq; Mon,  6 Dec 2021 18:16:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 138BC401EF;
	Mon,  6 Dec 2021 18:16:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2F3E51BF989
 for <buildroot@lists.busybox.net>; Mon,  6 Dec 2021 18:12:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 06D2584B8E
 for <buildroot@lists.busybox.net>; Mon,  6 Dec 2021 18:12:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NYZLOktX6wXA for <buildroot@lists.busybox.net>;
 Mon,  6 Dec 2021 18:12:35 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6BC0884B4F
 for <buildroot@buildroot.org>; Mon,  6 Dec 2021 18:12:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 0769181468; Mon,  6 Dec 2021 18:07:38 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 14 Nov 2021 15:08:58 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c2c15af2b840c41d7bee34c1f244551eefce6ba5
X-Git-Newrev: 7fcf5f3152f2881e2db3357e61abb793782e90e2
X-Patchwork-Hint: ignore
Message-Id: <20211206180738.0769181468@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mxml: bump to version 3.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=7fcf5f3152f2881e2db3357e61abb793782e90e2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

mxml 3.3 is a bug fix release. Changes include:

  - Cleaned up usage of free throughout the library
  - Added more error handling to the library
  - Fixed potential memory leak in mxmlLoad* functions
  - Fixed mxmlSaveString with a buffer size of 0
  - Fixed MXML_MINOR_VERSION value in "mxml.h"
  - Fixed POSIX threading support for MingW
  - Fixed some minor memory leaks found by Coverity.

Signed-off-by: Pierre-Jean Texier <texier.pj2@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mxml/mxml.hash | 2 +-
 package/mxml/mxml.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mxml/mxml.hash b/package/mxml/mxml.hash
index 70f82cada8..38056f4c3a 100644
--- a/package/mxml/mxml.hash
+++ b/package/mxml/mxml.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  b894f6c64964f2e77902564c17ba00f5d077a7a24054e7c1937903b0bd42c974  mxml-3.2.tar.gz
+sha256  7cf976366f9e8e4f8cff7d35a59bcf6201c769fce9e58015d64f4b6de1fe3dd8  mxml-3.3.tar.gz
 sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
 sha256  ed63aec4c75b9c21a5156b40052138032269bd27fd6f4bc0c51389807cdc7db9  NOTICE
diff --git a/package/mxml/mxml.mk b/package/mxml/mxml.mk
index 85930ab388..5563015b02 100644
--- a/package/mxml/mxml.mk
+++ b/package/mxml/mxml.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MXML_VERSION = 3.2
+MXML_VERSION = 3.3
 MXML_SITE = https://github.com/michaelrsweet/mxml/releases/download/v$(MXML_VERSION)
 MXML_LICENSE = Apache-2.0 with exceptions
 MXML_LICENSE_FILES = LICENSE NOTICE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
