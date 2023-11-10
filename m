Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52D6BC4332F
	for <buildroot@archiver.kernel.org>; Fri, 10 Nov 2023 21:11:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0784042850;
	Fri, 10 Nov 2023 21:11:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0784042850
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BoQeQ-Q0CbAO; Fri, 10 Nov 2023 21:11:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 46183426D2;
	Fri, 10 Nov 2023 21:11:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 46183426D2
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 107C51BF997
 for <buildroot@lists.busybox.net>; Fri, 10 Nov 2023 21:11:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DE4F183C6C
 for <buildroot@lists.busybox.net>; Fri, 10 Nov 2023 21:11:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DE4F183C6C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PqY3B05uWeOJ for <buildroot@lists.busybox.net>;
 Fri, 10 Nov 2023 21:11:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0C89E83C9F
 for <buildroot@buildroot.org>; Fri, 10 Nov 2023 21:11:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0C89E83C9F
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id ED1E086FEA; Fri, 10 Nov 2023 21:11:08 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 10 Nov 2023 22:09:24 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6273b2f85d1d18f7f7afc8d3e321df134b36c2b3
X-Git-Newrev: ab3d5a5f5e9be354f8fcde9ebd85eebc21c4379c
X-Patchwork-Hint: ignore
Message-Id: <20231110211108.ED1E086FEA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/scons: bump version to 4.5.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=ab3d5a5f5e9be354f8fcde9ebd85eebc21c4379c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Switch to setuptools
- Update License hash due to a year change: 2019 -> 2021
- Install the packages to the site-packages directory, or else packages using
  scons fail to build with import errors.

Tested with benejson, gpsd, and mongodb.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/scons/scons.hash | 4 ++--
 package/scons/scons.mk   | 9 +++++----
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/package/scons/scons.hash b/package/scons/scons.hash
index a72fbaee5a..48b5077b2e 100644
--- a/package/scons/scons.hash
+++ b/package/scons/scons.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  7801f3f62f654528e272df780be10c0e9337e897650b62ddcee9f39fde13f8fb  scons-3.1.2.tar.gz
-sha256  72ed889165fb28378cadac14552be4a959f1ebab6b148abb5dd2b49712c3c6f6  LICENSE.txt
+sha256  ce26aac95d350a79a4192196b0beac3cb24f4ccabce0123eb28d3370f576f072  SCons-4.5.2.tar.gz
+sha256  2f6ac9a1fc98394d18b80dba9bedb9d5626006d44db3fecf7cf3e21cff7e8b1c  LICENSE
diff --git a/package/scons/scons.mk b/package/scons/scons.mk
index 6b75d3ddca..ffd6abf609 100644
--- a/package/scons/scons.mk
+++ b/package/scons/scons.mk
@@ -4,14 +4,15 @@
 #
 ################################################################################
 
-SCONS_VERSION = 3.1.2
+SCONS_VERSION = 4.5.2
+SCONS_SOURCE = SCons-$(SCONS_VERSION).tar.gz
 SCONS_SITE = http://downloads.sourceforge.net/project/scons/scons/$(SCONS_VERSION)
 SCONS_LICENSE = MIT
-SCONS_LICENSE_FILES = LICENSE.txt
-SCONS_SETUP_TYPE = distutils
+SCONS_LICENSE_FILES = LICENSE
+SCONS_SETUP_TYPE = setuptools
 
 HOST_SCONS_INSTALL_OPTS = \
-	--install-lib=$(HOST_DIR)/lib/scons-$(SCONS_VERSION)
+	--install-lib=$(HOST_DIR)/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages
 
 $(eval $(host-python-package))
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
