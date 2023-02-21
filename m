Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6E12C61DA3
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 17:22:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3335D61241;
	Tue, 21 Feb 2023 17:22:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3335D61241
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mO9uYPVAXOmB; Tue, 21 Feb 2023 17:22:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 86DC961249;
	Tue, 21 Feb 2023 17:22:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 86DC961249
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 608661BF42C
 for <buildroot@lists.busybox.net>; Tue, 21 Feb 2023 17:22:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 46BF74036F
 for <buildroot@lists.busybox.net>; Tue, 21 Feb 2023 17:22:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 46BF74036F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kkzvWahTkidB for <buildroot@lists.busybox.net>;
 Tue, 21 Feb 2023 17:22:19 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 81E7A4012E
Received: from mail.xes-mad.com (mail.xes-mad.com [162.248.234.2])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 81E7A4012E
 for <buildroot@buildroot.org>; Tue, 21 Feb 2023 17:22:19 +0000 (UTC)
Received: from vfazio2.xes-mad.com (vfazio2.xes-mad.com [10.52.16.113])
 by mail.xes-mad.com (Postfix) with ESMTP id F2B7D20259;
 Tue, 21 Feb 2023 11:22:17 -0600 (CST)
From: Vincent Fazio <vfazio@xes-inc.com>
To: buildroot@buildroot.org
Date: Tue, 21 Feb 2023 11:21:51 -0600
Message-Id: <20230221172205.2450111-1-vfazio@xes-inc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=xes-inc.com; s=mail; 
 t=1677000138; bh=g0wg87uMFSp2fcHel9rCZO1iRNxMDQkEc4or4O5YAZk=;
 h=From:To:Cc:Subject:Date:From;
 b=txmEvg0Vq85HpINmwYOPAay4RUTdS/Du/CKoe/52eZrnmhwyyTHLQvShdwOtFGN8C
 qbQCZLIs7vMalMtpj9ezMhe1I5Y78sFpdn7YQ8XvA8hIjhdgjnlhMUirY7gQ6JM6HQ
 HlVvPhe7YHim1iOsJ4a336JQzqydAYxTwaszAKpc=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=xes-inc.com header.i=@xes-inc.com
 header.a=rsa-sha256 header.s=mail header.b=txmEvg0V
Subject: [Buildroot] [PATCH 01/15] package/pkg-autotools: drop
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Vincent Fazio <vfazio@gmail.com>, Joris Lijssens <joris.lijssens@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Vincent Fazio <vfazio@gmail.com>

No package in the current tree is currently utilizing this option.

The long term solution is to use autopoint over gettextize in which case
these options aren't relevant anyway.

Signed-off-by: Vincent Fazio <vfazio@gmail.com>
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
index 82187d7db9..a6ef5efb5f 100644
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
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
