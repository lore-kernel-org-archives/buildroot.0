Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E2CBEE57DF
	for <buildroot@archiver.kernel.org>; Mon, 11 Sep 2023 20:06:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A7C0981E81;
	Mon, 11 Sep 2023 20:06:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A7C0981E81
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Jt9EtVkTA8-i; Mon, 11 Sep 2023 20:06:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D4FD281D46;
	Mon, 11 Sep 2023 20:06:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D4FD281D46
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 23CA21BF357
 for <buildroot@lists.busybox.net>; Mon, 11 Sep 2023 20:06:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 073EE81D46
 for <buildroot@lists.busybox.net>; Mon, 11 Sep 2023 20:06:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 073EE81D46
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qyOvlLMch0Tw for <buildroot@lists.busybox.net>;
 Mon, 11 Sep 2023 20:06:40 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 246EE8194C
 for <buildroot@buildroot.org>; Mon, 11 Sep 2023 20:06:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 246EE8194C
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 11AE986D11; Mon, 11 Sep 2023 20:06:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 11 Sep 2023 22:06:29 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1cebe962ff23f2a13e5b874d7814d823f72a97fd
X-Git-Newrev: 076974bae6297c2cab18ba784011bafe6da70c61
X-Patchwork-Hint: ignore
Message-Id: <20230911200640.11AE986D11@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mmc-utils: bump version to
 2023-08-07
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

commit: https://git.buildroot.net/buildroot/commit/?id=076974bae6297c2cab18ba784011bafe6da70c61
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Starting from commit:
https://git.kernel.org/pub/scm/utils/mmc/mmc-utils.git/commit/?id=958227890690290ee766aaad1b92f3413f67048c
VERSION macro should be defined by mmc-utils Makefile itself but it doesn't
work in Buildroot because it needs to be in a git repository clone. So
let's mimic what they do in the Makefile by picking the first 6 SHA1 git
commit digits and set them to -DVERSION.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mmc-utils/mmc-utils.hash |  2 +-
 package/mmc-utils/mmc-utils.mk   | 10 +++++++---
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/package/mmc-utils/mmc-utils.hash b/package/mmc-utils/mmc-utils.hash
index 0d0b6ac1b9..1bdb545cbc 100644
--- a/package/mmc-utils/mmc-utils.hash
+++ b/package/mmc-utils/mmc-utils.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  e5a8dacf26a178010202c8fa7cb28b01f50fe967da98cdbdf320b2f110920106  mmc-utils-d4c2910981ff99b983734426dfa99632fb81ac6b-br1.tar.gz
+sha256  9ac9718343ffa36ab9ef192728e60cce6504febe29d43fb8003c2e2ef5a7c7d7  mmc-utils-613495ecaca97a19fa7f8f3ea23306472b36453c-br1.tar.gz
 sha256  4207d81122a02555f78c5a11b61c83a331ee03dc933e1ef9dd932ef9b434d12d  README
diff --git a/package/mmc-utils/mmc-utils.mk b/package/mmc-utils/mmc-utils.mk
index 9da9c30293..7f88c40024 100644
--- a/package/mmc-utils/mmc-utils.mk
+++ b/package/mmc-utils/mmc-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MMC_UTILS_VERSION = d4c2910981ff99b983734426dfa99632fb81ac6b
+MMC_UTILS_VERSION = 613495ecaca97a19fa7f8f3ea23306472b36453c
 MMC_UTILS_SITE = https://git.kernel.org/pub/scm/utils/mmc/mmc-utils.git
 MMC_UTILS_SITE_METHOD = git
 MMC_UTILS_LICENSE = GPL-2.0
@@ -19,11 +19,15 @@ endif
 # override AM_CFLAGS as the project Makefile uses it to pass
 # -D_FILE_OFFSET_BITS=64 -D_FORTIFY_SOURCE=2, and the latter conflicts
 # with the _FORTIFY_SOURCE that we pass when hardening options are
-# enabled.
+# enabled. Starting from commit:
+# https://git.kernel.org/pub/scm/utils/mmc/mmc-utils.git/commit/?id=958227890690290ee766aaad1b92f3413f67048c
+# they use AM_CFLAGS to set VERSION to first 6 digit of git SHA1, so
+# let's do this here otherwise it won't be automatically set and build
+# will fail
 define MMC_UTILS_BUILD_CMDS
 	$(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS) \
 		CFLAGS="$(MMC_UTILS_CFLAGS)" \
-		AM_CFLAGS=
+		AM_CFLAGS='-DVERSION=\"$(shell echo $(MMC_UTILS_VERSION) | head -c 6)\"'
 endef
 
 define MMC_UTILS_INSTALL_TARGET_CMDS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
