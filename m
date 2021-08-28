Return-Path: <SRS0=/RLo=NT=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABEE2C432BE
	for <buildroot@archiver.kernel.org>; Sat, 28 Aug 2021 14:46:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 52E9F60725
	for <buildroot@archiver.kernel.org>; Sat, 28 Aug 2021 14:46:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 52E9F60725
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4DB9A407DC;
	Sat, 28 Aug 2021 14:46:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fAKAVj-8eXZq; Sat, 28 Aug 2021 14:46:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1A5E5426FC;
	Sat, 28 Aug 2021 14:46:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A25A91BF37B
 for <buildroot@lists.busybox.net>; Sat, 28 Aug 2021 14:46:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 90B8D402B5
 for <buildroot@lists.busybox.net>; Sat, 28 Aug 2021 14:46:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7dpv3LLN702L for <buildroot@lists.busybox.net>;
 Sat, 28 Aug 2021 14:45:59 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9FB8F4029D
 for <buildroot@buildroot.org>; Sat, 28 Aug 2021 14:45:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 083C8840C5; Sat, 28 Aug 2021 14:44:54 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 28 Aug 2021 16:44:25 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: afde8fb8f36267e7b025c26e700f76e9bb75706f
X-Git-Newrev: 6c1d9995b5c418080db2b18208a9823b9826aa0f
X-Patchwork-Hint: ignore
Message-Id: <20210828144454.083C8840C5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/pkg-generic.mk: move
 python fixup to generic package infrastructure
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=6c1d9995b5c418080db2b18208a9823b9826aa0f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Fixing _sysconfigdata*.{py,pyc} was previously done by python package
infrastructure. Some packages use python stuff without using python
package infrastructure.
These packages perform overwrites and need the specific python fixup
to fix them.

In order to be sure to fix all of these packages, the python fixup
is moved to the generic package infrastructure and applied to all
packages.
This follows the same principle as for the .la libtool files fixup.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/pkg-generic.mk | 27 ++++++++++++++++++++++++++-
 package/pkg-python.mk  | 26 --------------------------
 2 files changed, 26 insertions(+), 27 deletions(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 97ee204b80..ded5176428 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -103,6 +103,30 @@ define fixup-libtool-files
 endef
 endif
 
+# Make sure python _sysconfigdata*.py files only reference the current
+# per-package directory.
+#
+# Can't use $(foreach d, $(HOST_DIR)/lib/python* $(STAGING_DIR)/usr/lib/python*, ...)
+# because those directories may be created in the same recipe this macro will
+# be expanded in.
+# Additionally, either or both may be missing, which would make find whine and
+# fail.
+# So we just use HOST_DIR as a starting point, and filter on the two directories
+# of interest.
+ifeq ($(BR2_PER_PACKAGE_DIRECTORIES),y)
+define FIXUP_PYTHON_SYSCONFIGDATA
+	$(Q)find $(HOST_DIR) \
+		\(    -path '$(HOST_DIR)/lib/python*' \
+		   -o -path '$(STAGING_DIR)/usr/lib/python*' \
+		\) \
+		\(    \( -name "_sysconfigdata*.pyc" -delete \) \
+		   -o \( -name "_sysconfigdata*.py" -print0 \) \
+		\) \
+	| xargs -0 --no-run-if-empty \
+		$(SED) 's:$(PER_PACKAGE_DIR)/[^/]\+/:$(PER_PACKAGE_DIR)/$($(PKG)_NAME)/:g'
+endef
+endif
+
 # Functions to collect statistics about installed files
 
 # $(1): base directory to search in
@@ -836,7 +860,8 @@ $(2)_PRE_LEGAL_INFO_HOOKS       ?=
 $(2)_POST_LEGAL_INFO_HOOKS      ?=
 $(2)_TARGET_FINALIZE_HOOKS      ?=
 $(2)_ROOTFS_PRE_CMD_HOOKS       ?=
-$(2)_POST_PREPARE_HOOKS         ?=
+
+$(2)_POST_PREPARE_HOOKS += FIXUP_PYTHON_SYSCONFIGDATA
 
 ifeq ($$($(2)_TYPE),target)
 ifneq ($$(HOST_$(2)_KCONFIG_VAR),)
diff --git a/package/pkg-python.mk b/package/pkg-python.mk
index ddf9e733fd..e6b81bdfd3 100644
--- a/package/pkg-python.mk
+++ b/package/pkg-python.mk
@@ -92,30 +92,6 @@ HOST_PKG_PYTHON_SETUPTOOLS_INSTALL_OPTS = \
 	--root=/ \
 	--single-version-externally-managed
 
-# Make sure python _sysconfigdata*.py files only reference the current
-# per-package directory.
-#
-# Can't use $(foreach d, $(HOST_DIR)/lib/python* $(STAGING_DIR)/usr/lib/python*, ...)
-# because those directories may be created in the same recipe this macro will
-# be expanded in.
-# Additionally, either or both may be missing, which would make find whine and
-# fail.
-# So we just use HOST_DIR as a starting point, and filter on the two directories
-# of interest.
-ifeq ($(BR2_PER_PACKAGE_DIRECTORIES),y)
-define PKG_PYTHON_FIXUP_SYSCONFIGDATA
-	$(Q)find $(HOST_DIR) \
-		\(    -path '$(HOST_DIR)/lib/python*' \
-		   -o -path '$(STAGING_DIR)/usr/lib/python*' \
-		\) \
-		\(    \( -name "_sysconfigdata*.pyc" -delete \) \
-		   -o \( -name "_sysconfigdata*.py" -print0 \) \
-		\) \
-	| xargs -0 --no-run-if-empty \
-		$(SED) 's:$(PER_PACKAGE_DIR)/[^/]\+/:$(PER_PACKAGE_DIR)/$($(PKG)_NAME)/:g'
-endef
-endif
-
 ################################################################################
 # inner-python-package -- defines how the configuration, compilation
 # and installation of a Python package should be done, implements a
@@ -260,8 +236,6 @@ $(2)_PYTHON_INTERPRETER = $$(HOST_DIR)/bin/$$($(2)_NEEDS_HOST_PYTHON)
 endif
 endif
 
-$(2)_PRE_CONFIGURE_HOOKS += PKG_PYTHON_FIXUP_SYSCONFIGDATA
-
 #
 # Build step. Only define it if not already defined by the package .mk
 # file.
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
