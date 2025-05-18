Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 867DAC3ABC9
	for <buildroot@archiver.kernel.org>; Sun, 18 May 2025 16:35:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 35B684073D;
	Sun, 18 May 2025 16:35:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P-MBuVzyq9h9; Sun, 18 May 2025 16:35:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5476840873
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5476840873;
	Sun, 18 May 2025 16:35:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8DDDCE4
 for <buildroot@buildroot.org>; Sun, 18 May 2025 16:35:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7330840873
 for <buildroot@buildroot.org>; Sun, 18 May 2025 16:35:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vpNKRzA-woTI for <buildroot@buildroot.org>;
 Sun, 18 May 2025 16:35:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AEF10405F7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id AEF10405F7
 for <buildroot@buildroot.org>; Sun, 18 May 2025 16:35:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9928587156; Sun, 18 May 2025 16:35:20 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 18 May 2025 18:20:28 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 37167915dbd542d265d573e1e3ac8dba32045c2e
X-Git-Newrev: 36f9436488c5fc640836eda96799305e114c6e9d
X-Patchwork-Hint: ignore
Message-Id: <20250518163520.9928587156@busybox.osuosl.org>
Subject: [Buildroot] [git commit]
 docs/manual/customize-directory-structure.adoc: suggest a custom top
 Makefile
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=36f9436488c5fc640836eda96799305e114c6e9d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
[Arnout: give a bit more explanation, simplify the example]
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 docs/manual/customize-directory-structure.adoc | 42 ++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/docs/manual/customize-directory-structure.adoc b/docs/manual/customize-directory-structure.adoc
index e0eecb5641..b4b5d50e1a 100644
--- a/docs/manual/customize-directory-structure.adoc
+++ b/docs/manual/customize-directory-structure.adoc
@@ -49,6 +49,7 @@ to you.
 |           +-- package2.mk
 |
 +-- Config.in (if using a br2-external tree)
++-- Makefile (if using a custom top makefile)
 +-- external.mk (if using a br2-external tree)
 +-- external.desc (if using a br2-external tree)
 ----
@@ -109,3 +110,44 @@ BR2_GLOBAL_PATCH_DIR="board/<company>/common/patches board/<company>/fooboard/pa
 
 then first the patches from the 'common' layer would be applied,
 followed by the patches from the 'fooboard' layer.
+
+==== Custom top Makefile
+
+You normally launch Buildroot from the buildroot source directory, pointing
++BR2_EXTERNAL+ and +O+ to the right places for the build you want to make.
+You can simplify this by adding a Makefile to your br2-external that sets
+these variables and calls into buildroot.
+
+You can add additional, custom rules to this Makefile for various tasks you
+need to perform, e.g. integrate multiple configurations into a single image,
+upload to a release server or to a test device, include multiple
+br2-external configurations, etc.
+
+A basic Makefile looks like this. It assumes the buildroot source is available
+(e.g. as a git submodule) in the +buildroot+ subdirectory. It makes sure that
+the download directory is shared between different builds, and it organizes
+the output directories in a structure under +outputs/+.
+
+----
+# SPDX-License-Identifier: GPL-2.0
+
+# Avoid surprises by disabling default rules
+MAKEFLAGS += --no-builtin-rules
+.SUFFIXES:
+
+THIS_EXTERNAL_PATH := $(abspath $(dir $(lastword $(MAKEFILE_LIST))))
+
+# Put downloads in this directory instead of in the Buildroot directory
+ifeq ($(BR2_DL_DIR),)
+BR2_DL_DIR = $(THIS_EXTERNAL_PATH)/dl
+endif
+
+OUTPUT_BASEDIR = $(THIS_EXTERNAL_PATH)/output
+OUTPUT_DIR = $(OUTPUT_BASEDIR)/$(patsubst %_defconfig,%,$@)
+
+MAKE_BUILDROOT = $(MAKE) -C $(THIS_EXTERNAL_PATH)/buildroot BR2_EXTERNAL=$(THIS_EXTERNAL_PATH)
+
+%: $(THIS_EXTERNAL_PATH)/configs/%
+	$(MAKE_BUILDROOT) O=$(OUTPUT_DIR) $@
+	sed -i /^BR2_DL_DIR=.*/s%%BR2_DL_DIR=$(BR2_DL_DIR)% $(OUTPUT_DIR)/.config
+----
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
