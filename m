Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B26BCD5BD0
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 09:21:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C5B2440776;
	Sat, 30 May 2026 09:21:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ce_Eb7bss8Lu; Sat, 30 May 2026 09:21:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D82FA4062D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780132880;
	bh=ZBAye55i8NGX85XDc1kF9uW+1456VFdftO4ZLPLUesg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=JcSt1uujBsKc7u+6J6Y0oxt1JbBPolGz5qBM6sKIkW4UwAPCNfNxsoIKKwcg+kjMT
	 4mBEZjquBD9Jg3BZpVhcKYDUoX6Rp55qYJcMYMrqNHMkLGX15b5FnSKC6/eM3Z5UYX
	 7WQwRNcrsoui8oLJ53tIHRcPkT43z6yTXILpRaksvRnROUSZfNDGRNMX06N+Noal69
	 OaFGpaUgw1RCsOTUmdPbyLph1uBahJu9e6sSk3tUwTy113/KGr2C2H425ysXpZp5Ob
	 VN+Kxc2sLctAoimVzcUSVdaUdvxAMbl05rhSGcoXcR3ChO4vzQn1PiILwuOTRaXFrV
	 APDF97HgUKfdw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D82FA4062D;
	Sat, 30 May 2026 09:21:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id EA34AD3
 for <buildroot@buildroot.org>; Sat, 30 May 2026 09:21:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D8FB88495C
 for <buildroot@buildroot.org>; Sat, 30 May 2026 09:21:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4-e683weXUnv for <buildroot@buildroot.org>;
 Sat, 30 May 2026 09:21:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 096CD84953
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 096CD84953
 for <buildroot@buildroot.org>; Sat, 30 May 2026 09:21:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1A88F86C92; Sat, 30 May 2026 09:21:06 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 30 May 2026 11:19:02 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4a5b7d733c7391f39097d76eb95a6b761bc09d97
X-Git-Newrev: 723b321bb03d7526f7583d64ac1d34eca429920d
X-Patchwork-Hint: ignore
Message-Id: <20260530092106.1A88F86C92@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Makefile: add 'show-info-all'
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/723b321bb03d7526f7583d64ac1d34eca429920d
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

The maintenance and testing workflow sometimes requires to output a
list of every existing package on Buildroot:

- Generating an SBOM of the whole Buildroot tree, e.g. `for
  security.buildroot.org
- List every source for every package, e.g. for sources.buildroot.net

The previous solution relied on `make allyesconfig` but always ran into
conflicts that needed manual resolution. Also some packages would not be
present because they are architecture dependent.

To avoid having to manually modify the 'show-info' command this commit
adds the 'show-info-all' command. It accesses the PACKAGES_ALL variable
with all the packages present in Buildroot independently of the
architecture or any config entries.

It forces the `BR2_HAVE_DOT_CONFIG` variable to be set to force the
reading of the package mk files.

It is also added to noconfig_targets, to avoid the .config influencing
the output of show-info-all.

Note that this is not yet a complete solution - it doesn't take into
account the multiple versions that are possible for some packages like
GCC. Also for e.g. linux or uboot the version is empty and the URL is
invalid.

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
[Arnout: refactor with existing show-info]
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 Makefile                      | 32 ++++++++++++++++++++++++--------
 docs/manual/common-usage.adoc | 12 ++++++++++++
 2 files changed, 36 insertions(+), 8 deletions(-)

diff --git a/Makefile b/Makefile
index cb52a1d668..14ea241dc4 100644
--- a/Makefile
+++ b/Makefile
@@ -126,7 +126,7 @@ noconfig_targets := menuconfig nconfig gconfig xconfig config oldconfig randconf
 	defconfig %_defconfig allyesconfig allnoconfig alldefconfig syncconfig release \
 	randpackageconfig allyespackageconfig allnopackageconfig \
 	print-version olddefconfig distclean manual manual-% check-package \
-	check-package-external
+	check-package-external show-info-all
 
 # Some global targets do not trigger a build, but are used to collect
 # metadata, or do various checks. When such targets are triggered,
@@ -142,7 +142,7 @@ nobuild_targets := source %-source \
 	clean distclean help show-targets graph-depends \
 	%-graph-depends %-show-depends %-show-version \
 	graph-build graph-size list-defconfigs \
-	savedefconfig update-defconfig printvars show-vars
+	savedefconfig update-defconfig printvars show-vars show-info-all
 ifeq ($(MAKECMDGOALS),)
 BR_BUILDING = y
 else ifneq ($(filter-out $(nobuild_targets),$(MAKECMDGOALS)),)
@@ -236,6 +236,13 @@ BR2_CONFIG = $(CONFIG_DIR)/.config
 ifeq ($(filter $(noconfig_targets),$(MAKECMDGOALS)),)
 -include $(BR2_CONFIG)
 endif
+# show-info-all needs to access the PACKAGES_ALL variable. This variable
+# contains a reference to every package present in Buildroot.
+# Since the 'show-info-all' command might be used without actually having a
+# dotconfig this condition is forced to be set true.
+ifeq ($(MAKECMDGOALS),show-info-all)
+BR2_HAVE_DOT_CONFIG = y
+endif
 
 ifeq ($(BR2_PER_PACKAGE_DIRECTORIES),)
 # Disable top-level parallel build if per-package directories is not
@@ -934,15 +941,22 @@ check-dependencies:
 	$(TOPDIR)/support/scripts/graph-depends -C
 
 .PHONY: show-info
-show-info:
+show-info: show-info-inner
+show-info: SHOW_INFO_PACKAGES = \
+	$(foreach i,$(PACKAGES) $(TARGETS_ROOTFS), \
+		$(i) $($(call UPPERCASE,$(i))_FINAL_RECURSIVE_DEPENDENCIES) \
+	)
+
+.PHONY: show-info-all
+show-info-all: show-info-inner
+show-info-all: SHOW_INFO_PACKAGES = $(PACKAGES_ALL)
+
+.PHONY: show-info-inner
+show-info-inner:
 	@:
 	$(info $(call clean-json, \
 			{ $(foreach p, \
-				$(sort $(foreach i,$(PACKAGES) $(TARGETS_ROOTFS), \
-						$(i) \
-						$($(call UPPERCASE,$(i))_FINAL_RECURSIVE_DEPENDENCIES) \
-					) \
-				), \
+				$(sort $(SHOW_INFO_PACKAGES)), \
 				$(call json-info,$(call UPPERCASE,$(p)))$(comma) \
 			) } \
 		) \
@@ -1213,6 +1227,8 @@ help:
 	@echo '  external-deps          - list external packages used'
 	@echo '  legal-info             - generate info about license compliance'
 	@echo '  show-info              - generate info about packages, as a JSON blurb'
+	@echo '  show-info-all          - generate info about all packages in Buildroot,'
+	@echo '                           regardless of configuration or target architecture'
 	@echo '  pkg-stats              - generate info about packages as JSON and HTML'
 	@echo '  printvars              - dump internal variables selected with VARS=...'
 	@echo '  show-vars              - dump all internal variables as a JSON blurb; use VARS=...'
diff --git a/docs/manual/common-usage.adoc b/docs/manual/common-usage.adoc
index 7437a7c3c0..631c2f7788 100644
--- a/docs/manual/common-usage.adoc
+++ b/docs/manual/common-usage.adoc
@@ -170,6 +170,18 @@ by using the +show-info+ make target:
 make show-info
 ----
 
+Buildroot can also produce information in the +show-info+ format about all
+packages regardless of the configuration or architecture by using
++show-info-all+.
+This is used for maintenance tasks that require information about every
+package in the tree, such as generating a full-tree SBOM for
+https://security.buildroot.org[].
+It does not require a +.config+ file:
+
+----
+make show-info-all
+----
+
 Buildroot can also produce details about packages as HTML and JSON
 output using the +pkg-stats+ make target. Amongst other things, these
 details include whether known CVEs (security vulnerabilities) affect
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
