Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FCE1C47074
	for <buildroot@archiver.kernel.org>; Sun,  7 Jan 2024 16:24:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 527324037C;
	Sun,  7 Jan 2024 16:24:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 527324037C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qIyhqq4rObbt; Sun,  7 Jan 2024 16:24:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1DD89403A5;
	Sun,  7 Jan 2024 16:24:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1DD89403A5
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 14FAB1BF870
 for <buildroot@lists.busybox.net>; Sun,  7 Jan 2024 16:23:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CBCED415EC
 for <buildroot@lists.busybox.net>; Sun,  7 Jan 2024 16:23:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CBCED415EC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id STnjATunXoaF for <buildroot@lists.busybox.net>;
 Sun,  7 Jan 2024 16:23:42 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id F0D23415E6
 for <buildroot@buildroot.org>; Sun,  7 Jan 2024 16:23:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F0D23415E6
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DA2EF847B5; Sun,  7 Jan 2024 16:23:41 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 7 Jan 2024 12:09:34 +0100
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: cc3a88b9eca3fb9cdc458c1423bb02a73c020a0c
X-Git-Newrev: ce7a6e4af1e3a8d980dca91d87b6313ef9e0a3fe
X-Patchwork-Hint: ignore
Message-Id: <20240107162341.DA2EF847B5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/jq: bump to
 version 1.7
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

commit: https://git.buildroot.net/buildroot/commit/?id=ce7a6e4af1e3a8d980dca91d87b6313ef9e0a3fe
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

- Update site to get latest release
- Drop autoreconf as official tarball is now used
- _GNU_SOURCE is correctly set since
  https://github.com/jqlang/jq/commit/52d5988afb5999c71fd24484a93efefa2a9e9a8f
- maintainer mode is disabled by default since
  https://github.com/jqlang/jq/commit/54fef09ac39d6fb003367d65709349c43078405e
- Update hash of COPYING (BSD-2-Clause for Windows build using jv thread
  added by
  https://github.com/jqlang/jq/commit/34182cca7babec086bbc93dec209275be896ca9e,
  mispelling fixed by
  https://github.com/jqlang/jq/commit/5cebe86a7b90e5718077c5e1d5c2165939d3f3cb)

https://github.com/jqlang/jq/releases/tag/jq-1.7

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 3026934aa0a1a6b375d11e322b72476a7f6aedaf)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/jq/Config.in |  2 +-
 package/jq/jq.hash   |  4 ++--
 package/jq/jq.mk     | 17 +++++------------
 3 files changed, 8 insertions(+), 15 deletions(-)

diff --git a/package/jq/Config.in b/package/jq/Config.in
index 5edb5d0989..ed2e0fa34f 100644
--- a/package/jq/Config.in
+++ b/package/jq/Config.in
@@ -6,7 +6,7 @@ config BR2_PACKAGE_JQ
 	  filter and map and transform structured data with the same
 	  ease that sed, awk, grep and friends let you play with text.
 
-	  http://stedolan.github.io/jq/
+	  https://jqlang.github.io/jq/
 
 comment "jq needs a toolchain w/ threads"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/jq/jq.hash b/package/jq/jq.hash
index 125781385c..6c2db98e87 100644
--- a/package/jq/jq.hash
+++ b/package/jq/jq.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  20249104d4df2247253df6df4a980b8be1f5232f03fef7cd41bacb7e6eab04fd  jq-a17dd3248a666d01be75f6b16be37e80e20b0954.tar.gz
-sha256  c8437d414ca5b394718784c3bf5bdff7f01fee417625fabf1fb722ca263037da  COPYING
+sha256  402a0d6975d946e6f4e484d1a84320414a0ff8eb6cf49d2c11d144d4d344db62  jq-1.7.tar.gz
+sha256  10e974638a41fadfd72357f2f3a4325e20b856c563365128f72feaa406f8c92d  COPYING
diff --git a/package/jq/jq.mk b/package/jq/jq.mk
index 7f890f8998..d886459dcc 100644
--- a/package/jq/jq.mk
+++ b/package/jq/jq.mk
@@ -4,25 +4,18 @@
 #
 ################################################################################
 
-JQ_VERSION = a17dd3248a666d01be75f6b16be37e80e20b0954
-JQ_SITE = $(call github,stedolan,jq,$(JQ_VERSION))
+JQ_VERSION = 1.7
+JQ_SITE = https://github.com/jqlang/jq/releases/download/jq-$(JQ_VERSION)
 JQ_LICENSE = MIT (code), ICU (decNumber), CC-BY-3.0 (documentation)
 JQ_LICENSE_FILES = COPYING
 JQ_CPE_ID_VENDOR = jq_project
 JQ_INSTALL_STAGING = YES
 
-# currently using git version directly
-JQ_AUTORECONF = YES
-
 # uses c99 specific features
-# _GNU_SOURCE added to fix gcc6+ host compilation
-# (https://github.com/stedolan/jq/issues/1598)
-JQ_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -std=c99 -D_GNU_SOURCE"
-HOST_JQ_CONF_ENV += CFLAGS="$(HOST_CFLAGS) -std=c99 -D_GNU_SOURCE"
+JQ_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -std=c99"
+HOST_JQ_CONF_ENV += CFLAGS="$(HOST_CFLAGS) -std=c99"
 
-# jq explicitly enables maintainer mode, which we don't need/want
-JQ_CONF_OPTS += --disable-maintainer-mode
-HOST_JQ_CONF_OPTS += --disable-maintainer-mode --without-oniguruma
+HOST_JQ_CONF_OPTS += --without-oniguruma
 
 ifeq ($(BR2_PACKAGE_ONIGURUMA),y)
 JQ_DEPENDENCIES += oniguruma
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
