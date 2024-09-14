Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89FBCC02192
	for <buildroot@archiver.kernel.org>; Sat, 14 Sep 2024 11:32:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A0E1C60796;
	Sat, 14 Sep 2024 11:32:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ok5MaNvafGyP; Sat, 14 Sep 2024 11:32:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AF3066075B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AF3066075B;
	Sat, 14 Sep 2024 11:32:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CB17B1BF86C
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 11:31:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B96564034B
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 11:31:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sLKkyYZoiKGt for <buildroot@lists.busybox.net>;
 Sat, 14 Sep 2024 11:31:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4E5AB40130
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4E5AB40130
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 11:31:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4581A82895; Sat, 14 Sep 2024 11:31:56 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 14 Sep 2024 13:31:35 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 480d667a1907f84630bf061537c14fdb73a33eda
X-Git-Newrev: e5459a3f6a9a83f2cbf8d2e9a2a32a8d27e99c90
X-Patchwork-Hint: ignore
Message-Id: <20240914113156.4581A82895@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/iana-assignments: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=e5459a3f6a9a83f2cbf8d2e9a2a32a8d27e99c90
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The fixing of [1] and related code reviews [2] and [3] highlighted the
need for a package providing a versioned PEN (Enterprise Numbers)
registry file from IANA (Internet Assigned Numbers Authority).
The GitHub repository from which this package originates is a mirror of
the IANA registries periodically updated from https://www.iana.org/protocols.

[1] http://autobuild.buildroot.org/results/5ae5ee948d99679cd50d1115a7d46f4368347b4f
[2] https://patchwork.ozlabs.org/project/buildroot/patch/20240902210055.239859-1-dario.binacchi@amarulasolutions.com
[3] https://patchwork.ozlabs.org/project/buildroot/patch/20240904174021.2670289-1-dario.binacchi@amarulasolutions.com/
Co-Developed-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Co-Developed-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
[yann.morin.1998@free.fr: add licensing info]
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 DEVELOPERS                                     |  1 +
 package/Config.in                              |  1 +
 package/iana-assignments/Config.in             | 15 +++++++++++++++
 package/iana-assignments/iana-assignments.hash |  2 ++
 package/iana-assignments/iana-assignments.mk   | 22 ++++++++++++++++++++++
 5 files changed, 41 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 479ebeed37..cbc2040165 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -792,6 +792,7 @@ F:	configs/imx8mn_bsh_smm_s2_pro_defconfig
 F:	configs/stm32f769_disco_sd_defconfig
 F:	package/armadillo/
 F:	package/babeld/
+F:	package/iana-assignments/
 F:	package/sscep/
 F:	package/tinyinit/
 F:	package/uuu/
diff --git a/package/Config.in b/package/Config.in
index 599e3e9c3f..187ba3a154 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2467,6 +2467,7 @@ endif
 	source "package/htpdate/Config.in"
 	source "package/httping/Config.in"
 	source "package/i2pd/Config.in"
+	source "package/iana-assignments/Config.in"
 	source "package/ibrdtn-tools/Config.in"
 	source "package/ibrdtnd/Config.in"
 	source "package/ifenslave/Config.in"
diff --git a/package/iana-assignments/Config.in b/package/iana-assignments/Config.in
new file mode 100644
index 0000000000..f1b803cfec
--- /dev/null
+++ b/package/iana-assignments/Config.in
@@ -0,0 +1,15 @@
+config BR2_PACKAGE_IANA_ASSIGNMENTS
+	bool "IANA assignments"
+	select BR2_PACKAGE_IANA_ASSIGNMENTS_PEN_REG
+	help
+	  Mirror of the IANA registries periodically updated
+	  from https://www.iana.org/protocols.
+
+	  https://github.com/larseggert/iana-assignments
+
+if BR2_PACKAGE_IANA_ASSIGNMENTS
+
+config BR2_PACKAGE_IANA_ASSIGNMENTS_PEN_REG
+	bool "PEN (Enterprise Numbers) registry"
+
+endif
diff --git a/package/iana-assignments/iana-assignments.hash b/package/iana-assignments/iana-assignments.hash
new file mode 100644
index 0000000000..c58fb61df2
--- /dev/null
+++ b/package/iana-assignments/iana-assignments.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256  e7a1f8153715fa9e0f4c5d102f9271bce425a468f58a445e7c5ecdf7105fd460  iana-assignments-bf358dc8d89b7939557220b8055699b42a4133e9.tar.gz
diff --git a/package/iana-assignments/iana-assignments.mk b/package/iana-assignments/iana-assignments.mk
new file mode 100644
index 0000000000..df069b94f1
--- /dev/null
+++ b/package/iana-assignments/iana-assignments.mk
@@ -0,0 +1,22 @@
+################################################################################
+#
+# iana-assignments
+#
+################################################################################
+
+IANA_ASSIGNMENTS_VERSION = bf358dc8d89b7939557220b8055699b42a4133e9
+IANA_ASSIGNMENTS_SITE = $(call github,larseggert,iana-assignments,$(IANA_ASSIGNMENTS_VERSION))
+
+# The licensing is defined by IANA: https://www.iana.org/help/licensing-terms
+# The repository we use is not a real upstream, and contains no license file.
+IANA_ASSIGNMENTS_LICENSE = CC0-1.0
+
+ifeq ($(BR2_PACKAGE_IANA_ASSIGNMENTS_PEN_REG),y)
+define IANA_ASSIGNMENTS_INSTALL_PEN_REG
+	$(INSTALL) -D -m 0644 $(@D)/enterprise-numbers/enterprise-numbers \
+		$(TARGET_DIR)/usr/share/misc/iana/enterprise-numbers
+endef
+IANA_ASSIGNMENTS_POST_INSTALL_TARGET_HOOKS += IANA_ASSIGNMENTS_INSTALL_PEN_REG
+endif
+
+$(eval $(generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
