Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5F49C433EF
	for <buildroot@archiver.kernel.org>; Sun, 12 Dec 2021 12:23:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8595E42305;
	Sun, 12 Dec 2021 12:23:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PXNCQJFlVX_L; Sun, 12 Dec 2021 12:23:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BD8A2422FF;
	Sun, 12 Dec 2021 12:23:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7A2321BF373
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 12:22:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 706BC40264
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 12:22:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5LgshzmQuRjh for <buildroot@lists.busybox.net>;
 Sun, 12 Dec 2021 12:22:25 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6E5864052F
 for <buildroot@buildroot.org>; Sun, 12 Dec 2021 12:22:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id BB56E82B66; Sun, 12 Dec 2021 12:17:14 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 12 Dec 2021 13:21:41 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4efeea55ea6a07b795a2f002a3d4b51b5ef9c366
X-Git-Newrev: ca2753fd47d47e5ad0eec16ea62f7b7f096331b6
X-Patchwork-Hint: ignore
Message-Id: <20211212121714.BB56E82B66@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/frr: bump to version 8.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=ca2753fd47d47e5ad0eec16ea62f7b7f096331b6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- host-elfutils is mandatory since version 8.0 and
  https://github.com/FRRouting/frr/commit/5609b3af497c44d980aad2bc7d6332dedd7974e7
- This bump is needed to fix the following build failure since bump of
  libyang to version 2.0.112 in commit
  2a3edc5e00b38f4f927894d0911990c9060e4415:

In file included from lib/northbound.c:20:
lib/northbound.c: In function 'nb_node_check_config_only':
lib/northbound.c:97:22: error: dereferencing pointer to incomplete type 'const struct lys_node'
   97 |  if (CHECK_FLAG(snode->flags, LYS_CONFIG_R)) {
      |                      ^~

- Update indentation in hash file (two spaces)

https://github.com/FRRouting/frr/releases/tag/frr-8.0
https://github.com/FRRouting/frr/releases/tag/frr-8.1

Fixes:
 - http://autobuild.buildroot.org/results/bd779ee960ba2181bc60313569c77c1e60b4e726

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/frr/frr.hash | 4 ++--
 package/frr/frr.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/frr/frr.hash b/package/frr/frr.hash
index 3a044d4c2a..bb6c32b7bb 100644
--- a/package/frr/frr.hash
+++ b/package/frr/frr.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 030d4e66f577726dfea13bd3a9c669fd41d8fd89b25953a36b5b0966d406ff28  frr-7.5.1.tar.gz
-sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
+sha256  9d82c11b304ab89a30627fcbb4150f51e639f473f8563976e14101e796240599  frr-8.1.tar.gz
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/frr/frr.mk b/package/frr/frr.mk
index d1ca6e0b18..e707f50ca1 100644
--- a/package/frr/frr.mk
+++ b/package/frr/frr.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FRR_VERSION = 7.5.1
+FRR_VERSION = 8.1
 FRR_SITE = $(call github,FRRouting,frr,frr-$(FRR_VERSION))
 FRR_LICENSE = GPL-2.0
 FRR_LICENSE_FILES = COPYING
@@ -15,7 +15,7 @@ FRR_AUTORECONF = YES
 FRR_DEPENDENCIES = host-frr readline json-c \
 	libyang libnl c-ares
 
-HOST_FRR_DEPENDENCIES = host-flex host-bison host-python3
+HOST_FRR_DEPENDENCIES = host-flex host-bison host-elfutils host-python3
 
 FRR_CONF_OPTS = --with-clippy=$(HOST_DIR)/bin/clippy \
 	--sysconfdir=/etc/frr \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
