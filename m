Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B1BDC636D6
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 22:54:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A50DC822FF;
	Mon, 20 Feb 2023 22:54:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A50DC822FF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WqKcHlxMBdaY; Mon, 20 Feb 2023 22:53:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E00E781EED;
	Mon, 20 Feb 2023 22:53:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E00E781EED
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 392AB1BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:56:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 38E2C40C2A
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 38E2C40C2A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vHdzWKwlNcAu for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6F07F4170B
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6F07F4170B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4BBA7828C8; Mon, 20 Feb 2023 20:52:18 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 29 Dec 2022 10:24:36 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: f99714d90e08994c697576ca2030cb9392d7b63e
X-Git-Newrev: 369ff9a88ff8e88b78287e37fbaf191e57598be2
X-Patchwork-Hint: ignore
Message-Id: <20230220205218.4BBA7828C8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/libmodplug: update to
 git version
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=369ff9a88ff8e88b78287e37fbaf191e57598be2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The libmodplug release has not been updated for over 5 years.
The git version contains many bug fixes, including for OOB
accesses, unaligned reads and writes, etc.

This git repository is the official home of libmodplug (by the original
author), however a new release does not seem likely anytime soon:
there are multiple open issues in the repository asking the author to
tag a release, all without a response.

Update buildroot to the current version of libmodplug from the official
git repository. The build system changed from autotools to cmake since
the last version.

We add a _CPE_ID_VERSION variable pointing to the latest stable
version, so that we don't get notified about all older CVEs that we
are not affected by.

Signed-off-by: Gleb Mazovetskiy <glex.spb@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libmodplug/libmodplug.hash | 2 +-
 package/libmodplug/libmodplug.mk   | 9 ++++++---
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/package/libmodplug/libmodplug.hash b/package/libmodplug/libmodplug.hash
index e75152e27f..01ff71014c 100644
--- a/package/libmodplug/libmodplug.hash
+++ b/package/libmodplug/libmodplug.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  457ca5a6c179656d66c01505c0d95fafaead4329b9dbaa0f997d00a3508ad9de  libmodplug-0.8.9.0.tar.gz
+sha256  d145910ca10c3ecab0019d45be7e31ea6be1d1ee951ef0e1f747c9752d20f043  libmodplug-d1b97ed.tar.gz
 sha256  49942e7b3b175f549e751feb08b5270ca6f6c5fb7a1be9f9517db275ec32c92e  COPYING
diff --git a/package/libmodplug/libmodplug.mk b/package/libmodplug/libmodplug.mk
index 98c38a3b00..735d0e704d 100644
--- a/package/libmodplug/libmodplug.mk
+++ b/package/libmodplug/libmodplug.mk
@@ -4,11 +4,14 @@
 #
 ################################################################################
 
-LIBMODPLUG_VERSION = 0.8.9.0
-LIBMODPLUG_SITE = http://downloads.sourceforge.net/project/modplug-xmms/libmodplug/$(LIBMODPLUG_VERSION)
+LIBMODPLUG_VERSION = d1b97ed
+LIBMODPLUG_SITE = $(call github,Konstanty,libmodplug,$(LIBMODPLUG_VERSION))
 LIBMODPLUG_INSTALL_STAGING = YES
 LIBMODPLUG_LICENSE = Public Domain
 LIBMODPLUG_LICENSE_FILES = COPYING
 LIBMODPLUG_CPE_ID_VENDOR = konstanty_bialkowski
+# Our version is actually newer than this, but having this allows to
+# not have reports about CVEs for versions older than 0.8.9.0.
+LIBMODPLUG_CPE_ID_VERSION = 0.8.9.0
 
-$(eval $(autotools-package))
+$(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
