Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 483F5C5B543
	for <buildroot@archiver.kernel.org>; Wed,  4 Jun 2025 18:28:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 16E8683D38;
	Wed,  4 Jun 2025 18:28:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6Awsxc05FzlW; Wed,  4 Jun 2025 18:28:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3CD4383BD8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3CD4383BD8;
	Wed,  4 Jun 2025 18:28:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5EF38DA
 for <buildroot@buildroot.org>; Wed,  4 Jun 2025 18:28:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5E7DF40077
 for <buildroot@buildroot.org>; Wed,  4 Jun 2025 18:28:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Jzz1XZRBqYsk for <buildroot@buildroot.org>;
 Wed,  4 Jun 2025 18:28:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9C07A4023C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9C07A4023C
 for <buildroot@buildroot.org>; Wed,  4 Jun 2025 18:27:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9A451876CD; Wed,  4 Jun 2025 18:27:58 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 27 May 2025 18:36:13 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 59dc9dcbe112162c41e618e36d443bafe4275a63
X-Git-Newrev: 2a63098209c459c0c265d75558c6725920ee4165
X-Patchwork-Hint: ignore
Message-Id: <20250604182758.9A451876CD@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x]
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=2a63098209c459c0c265d75558c6725920ee4165
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
[Arnout: give a bit more explanation, simplify the example]
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
(cherry picked from commit 36f9436488c5fc640836eda96799305e114c6e9d)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
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
