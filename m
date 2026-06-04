Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2097CD6E7C
	for <buildroot@archiver.kernel.org>; Fri,  5 Jun 2026 12:40:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8A69F60E37;
	Fri,  5 Jun 2026 12:40:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XLcgb86vb4V8; Fri,  5 Jun 2026 12:40:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4BF9660E2D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780663208;
	bh=WMWR6kzDnhheRcEmXTUT/tJLPWYshMbCbC3zq2Fawoo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=nbc6wSunoxNopQnu2bTqlwKN45+hZcPOPdqJLGt7NkDsRvU8nTa5HDBN7PbgJOLDb
	 wZlRCAdYDIF2ZfQMHXQdDCFXwVQDUtofeQJgn1exmS+JwYU+XxcFqqMELqHCjDcoMb
	 fSbaykRfq+QiYwx9RBdR7CEo4lXQjAzVfitTjvAT0UizFT0A6NsvRZiMT5joY9tdhz
	 SegHOhfJR49wyH4kBBpzYkNB4UVfnb3jxFHVucsz7rNDz5iJAnGSmbDEAKEXGaQF5j
	 1YcVTLx/rWHiTTNv66eCr+ZUm874mUPMvt5RmlKd3hie7MClWQQkmyHxP2XXND66kV
	 6NBkB9+dCIEPw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4BF9660E2D;
	Fri,  5 Jun 2026 12:40:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0E9433B7
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:39:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 03A2382024
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:38:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z2KfgbbpJ67E for <buildroot@buildroot.org>;
 Fri,  5 Jun 2026 12:38:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DBC0A8200D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id DBC0A8200D
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:38:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0FE7087B3B; Fri,  5 Jun 2026 12:38:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 4 Jun 2026 11:54:04 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: 4039ed47718b5b4721913283f3aea2c71a114dd2
X-Git-Newrev: ba410d9a153d24c7c2cc2c2995d9b2adfa24e869
X-Patchwork-Hint: ignore
Message-Id: <20260605123837.0FE7087B3B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] Makefile: add
 'show-info-all'
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/ba410d9a153d24c7c2cc2c2995d9b2adfa24e869
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

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
(cherry picked from commit 723b321bb03d7526f7583d64ac1d34eca429920d)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 Makefile                      | 32 ++++++++++++++++++++++++--------
 docs/manual/common-usage.adoc | 12 ++++++++++++
 2 files changed, 36 insertions(+), 8 deletions(-)

diff --git a/Makefile b/Makefile
index 6c1a4c417e..5a44df1fda 100644
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
