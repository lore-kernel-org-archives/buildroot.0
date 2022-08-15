Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76CF7ECAAA1
	for <buildroot@archiver.kernel.org>; Sun, 11 Sep 2022 08:57:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 239076106E;
	Sun, 11 Sep 2022 08:57:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 239076106E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LxDySXI9GZ2Q; Sun, 11 Sep 2022 08:57:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 380ED61053;
	Sun, 11 Sep 2022 08:57:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 380ED61053
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B43661BF990
 for <buildroot@lists.busybox.net>; Sun, 11 Sep 2022 08:48:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C0CC960FCF
 for <buildroot@lists.busybox.net>; Sun, 11 Sep 2022 08:48:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C0CC960FCF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id M5uT-l7eIUbL for <buildroot@lists.busybox.net>;
 Sun, 11 Sep 2022 08:48:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4EF6360F7F
 for <buildroot@buildroot.org>; Sun, 11 Sep 2022 08:48:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4EF6360F7F
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 4CC5B8361F; Sun, 11 Sep 2022 08:48:24 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 15 Aug 2022 20:48:41 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 11e11b8fda94dd12d4b8cb6565808e91c4743fed
X-Git-Newrev: 1c3b7870cf4bbabb0b19abb2e28e8040980645f2
X-Patchwork-Hint: ignore
Message-Id: <20220911084824.4CC5B8361F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pkg-utils.mk: move
 FREESCALE_IMX_EXTRACT_HELPER
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

commit: https://git.buildroot.net/buildroot/commit/?id=1c3b7870cf4bbabb0b19abb2e28e8040980645f2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This helper was introduced before Freescale was part of NXP. Nowadays,
we have NXP packages, and they do use the same archiving format.

Move the Freescale-specific extract helper to a common location, so
that it can be used by other packages in the future.

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
[yann.morin.1998@free.fr: provide the rationale in the commit log]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/freescale-imx/freescale-imx.mk | 25 -------------------------
 package/pkg-utils.mk                   | 25 +++++++++++++++++++++++++
 2 files changed, 25 insertions(+), 25 deletions(-)

diff --git a/package/freescale-imx/freescale-imx.mk b/package/freescale-imx/freescale-imx.mk
index 84a1725cc1..5f32a098a2 100644
--- a/package/freescale-imx/freescale-imx.mk
+++ b/package/freescale-imx/freescale-imx.mk
@@ -6,29 +6,4 @@
 
 FREESCALE_IMX_SITE = http://www.nxp.com/lgfiles/NMG/MAD/YOCTO
 
-# Helper for self-extracting binaries distributed by Freescale.
-#
-# The --force option makes sure it doesn't fail if the source
-# directory already exists. The --auto-accept skips the license check,
-# as it is not needed in Buildroot because we have legal-info. Since
-# there's a EULA in the binary file, we extract it in this macro, and
-# it should therefore be added to the LICENSE_FILES variable of
-# packages using this macro. Also, remember to set REDISTRIBUTE to
-# "NO". Indeed, this is a legal minefield: the EULA specifies that the
-# Board Support Package includes software and hardware (sic!) for
-# which a separate license is needed...
-#
-# $(1): full path to the archive file
-#
-define FREESCALE_IMX_EXTRACT_HELPER
-	awk 'BEGIN      { start = 0; } \
-	     /^EOEULA/  { start = 0; } \
-	                { if (start) print; } \
-	     /<<EOEULA/ { start = 1; }' \
-	    $(1) > $(@D)/EULA
-	cd $(@D) && sh $(1) --force --auto-accept
-	find $(@D)/$(basename $(notdir $(1))) -mindepth 1 -maxdepth 1 -exec mv {} $(@D) \;
-	rmdir $(@D)/$(basename $(notdir $(1)))
-endef
-
 include $(sort $(wildcard package/freescale-imx/*/*.mk))
diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
index 6ece27baa2..57f4af04c5 100644
--- a/package/pkg-utils.mk
+++ b/package/pkg-utils.mk
@@ -275,3 +275,28 @@ legal-deps = \
         $(filter-out $(if $(1:host-%=),host-%),\
             $(call non-virtual-deps,\
                 $($(call UPPERCASE,$(1))_FINAL_RECURSIVE_DEPENDENCIES))),$(p) [$($(call UPPERCASE,$(p))_LICENSE)])
+
+# Helper for self-extracting binaries distributed by Freescale.
+#
+# The --force option makes sure it doesn't fail if the source
+# directory already exists. The --auto-accept skips the license check,
+# as it is not needed in Buildroot because we have legal-info. Since
+# there's a EULA in the binary file, we extract it in this macro, and
+# it should therefore be added to the LICENSE_FILES variable of
+# packages using this macro. Also, remember to set REDISTRIBUTE to
+# "NO". Indeed, this is a legal minefield: the EULA specifies that the
+# Board Support Package includes software and hardware (sic!) for
+# which a separate license is needed...
+#
+# $(1): full path to the archive file
+#
+define FREESCALE_IMX_EXTRACT_HELPER
+	awk 'BEGIN      { start = 0; } \
+	     /^EOEULA/  { start = 0; } \
+	                { if (start) print; } \
+	     /<<EOEULA/ { start = 1; }' \
+	    $(1) > $(@D)/EULA
+	cd $(@D) && sh $(1) --force --auto-accept
+	find $(@D)/$(basename $(notdir $(1))) -mindepth 1 -maxdepth 1 -exec mv {} $(@D) \;
+	rmdir $(@D)/$(basename $(notdir $(1)))
+endef
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
