Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19F75C6FD1C
	for <buildroot@archiver.kernel.org>; Sat, 25 Mar 2023 21:07:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A15C481DE3;
	Sat, 25 Mar 2023 21:07:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A15C481DE3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id odYBQkzn28Iz; Sat, 25 Mar 2023 21:07:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E21A681DED;
	Sat, 25 Mar 2023 21:07:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E21A681DED
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 382DB1BF39A
 for <buildroot@lists.busybox.net>; Sat, 25 Mar 2023 21:07:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 11CBB404AF
 for <buildroot@lists.busybox.net>; Sat, 25 Mar 2023 21:07:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 11CBB404AF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id B9n-wBfHveOC for <buildroot@lists.busybox.net>;
 Sat, 25 Mar 2023 21:07:39 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 430C740141
 for <buildroot@buildroot.org>; Sat, 25 Mar 2023 21:07:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 430C740141
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2DBB482AA8; Sat, 25 Mar 2023 21:07:39 +0000 (UTC)
From: Arnout Vandecappelle <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 25 Mar 2023 21:21:44 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0c7ba302bd5d1d46d5f4e2a73a5ba235c08d9b22
X-Git-Newrev: 5672e74fdc89a8f5a25789b454c28d5b9c33c3d4
X-Patchwork-Hint: ignore
Message-Id: <20230325210739.2DBB482AA8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pkg-autotools: drop
 FOO_GETTEXTIZE_OPTS support
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

commit: https://git.buildroot.net/buildroot/commit/?id=5672e74fdc89a8f5a25789b454c28d5b9c33c3d4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

No package in the current tree is currently utilizing this option.

The long term solution is to use autopoint over gettextize in which case
these options aren't relevant anyway.

Signed-off-by: Vincent Fazio <vfazio@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/pkg-autotools.mk | 6 +-----
 package/pkg-generic.mk   | 9 ++++++++-
 2 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/package/pkg-autotools.mk b/package/pkg-autotools.mk
index 717ff81593..55d95d204e 100644
--- a/package/pkg-autotools.mk
+++ b/package/pkg-autotools.mk
@@ -92,7 +92,7 @@ endef
 #
 define GETTEXTIZE_HOOK
 	@$(call MESSAGE,"Gettextizing")
-	$(Q)cd $($(PKG)_SRCDIR) && $(GETTEXTIZE) $($(PKG)_GETTEXTIZE_OPTS)
+	$(Q)cd $($(PKG)_SRCDIR) && $(GETTEXTIZE)
 endef
 
 #
@@ -152,10 +152,6 @@ ifndef $(2)_GETTEXTIZE
  endif
 endif
 
-ifeq ($(4),host)
- $(2)_GETTEXTIZE_OPTS ?= $$($(3)_GETTEXTIZE_OPTS)
-endif
-
 ifeq ($(4),host)
  $(2)_AUTORECONF_OPTS ?= $$($(3)_AUTORECONF_OPTS)
 endif
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index d460251f48..fc873c045a 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -1206,9 +1206,16 @@ $(eval $(call check-deprecated-variable,$(2)_INSTALL_HOST_OPT,$(2)_INSTALL_HOST_
 $(eval $(call check-deprecated-variable,$(2)_AUTORECONF_OPT,$(2)_AUTORECONF_OPTS))
 $(eval $(call check-deprecated-variable,$(2)_CONF_OPT,$(2)_CONF_OPTS))
 $(eval $(call check-deprecated-variable,$(2)_BUILD_OPT,$(2)_BUILD_OPTS))
-$(eval $(call check-deprecated-variable,$(2)_GETTEXTIZE_OPT,$(2)_GETTEXTIZE_OPTS))
 $(eval $(call check-deprecated-variable,$(2)_KCONFIG_OPT,$(2)_KCONFIG_OPTS))
 
+# Check for deprecated variables that have no replacement
+ifneq ($$($(2)_GETTEXTIZE_OPT),)
+$$(error "$(2)_GETTEXTIZE_OPT is no longer supported. Please fix your .mk file.")
+endif
+ifneq ($$($(2)_GETTEXTIZE_OPTS),)
+$$(error "$(2)_GETTEXTIZE_OPTS is no longer supported. Please fix your .mk file.")
+endif
+
 PACKAGES += $(1)
 
 ifneq ($$($(2)_PERMISSIONS),)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
