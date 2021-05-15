Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 397F4C4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 21:33:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F1C3A60F70
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 21:33:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F1C3A60F70
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BC82F82C1E;
	Tue,  3 Aug 2021 21:33:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wmzt8S2_WHSG; Tue,  3 Aug 2021 21:33:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 378AE832C6;
	Tue,  3 Aug 2021 21:33:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 160F41BF9AA
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6EB76404F6
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:09:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wGFjMjHqHHWJ for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:09:46 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E44C540480
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:09:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 3B1E48B43C; Tue,  3 Aug 2021 21:09:37 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 15 May 2021 14:11:22 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 4a321afa836123c4887cff0c3309eb77caf30751
X-Git-Newrev: 98a74d81a8c26ce0d0692bbb5235579f81afba36
X-Patchwork-Hint: ignore
Message-Id: <20210803210937.3B1E48B43C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/jh71xx-tools: new
 package
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

commit: https://git.buildroot.net/buildroot/commit/?id=98a74d81a8c26ce0d0692bbb5235579f81afba36
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Add jh71xx-tools as a new host package, it includes a tool that allows
to recover the bootloader of JH71xx-based platforms, such as the
BeagleV.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
[yann.morin.1998@free.fr:
  - fix alphabetical order, spotted by Bin
  - use LICENSE as license file, update license hash accordingly
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 DEVELOPERS                             |  1 +
 package/Config.in.host                 |  1 +
 package/jh71xx-tools/Config.in.host    |  7 +++++++
 package/jh71xx-tools/jh71xx-tools.hash |  3 +++
 package/jh71xx-tools/jh71xx-tools.mk   | 20 ++++++++++++++++++++
 5 files changed, 32 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index ed86dc82ba..a90ad1c354 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2633,6 +2633,7 @@ F:	package/heirloom-mailx/
 F:	package/hiawatha/
 F:	package/igh-ethercat/
 F:	package/intltool/
+F:	package/jh71xx-tools/
 F:	package/libcap/
 F:	package/libffi/
 F:	package/libsha1/
diff --git a/package/Config.in.host b/package/Config.in.host
index ba6a68c728..064c98af3d 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -39,6 +39,7 @@ menu "Host utilities"
 	source "package/imagemagick/Config.in.host"
 	source "package/imx-mkimage/Config.in.host"
 	source "package/imx-usb-loader/Config.in.host"
+	source "package/jh71xx-tools/Config.in.host"
 	source "package/jq/Config.in.host"
 	source "package/jsmin/Config.in.host"
 	source "package/kmod/Config.in.host"
diff --git a/package/jh71xx-tools/Config.in.host b/package/jh71xx-tools/Config.in.host
new file mode 100644
index 0000000000..08872f295c
--- /dev/null
+++ b/package/jh71xx-tools/Config.in.host
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_HOST_JH71XX_TOOLS
+	bool "host jh71xx-tools"
+	depends on BR2_riscv
+	help
+	  Bootloader recovery and updater tool for StarFive JH7100 SoCs.
+
+	  https://github.com/kprasadvnsi/JH71xx-tools
diff --git a/package/jh71xx-tools/jh71xx-tools.hash b/package/jh71xx-tools/jh71xx-tools.hash
new file mode 100644
index 0000000000..6bc7abe9d0
--- /dev/null
+++ b/package/jh71xx-tools/jh71xx-tools.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  0f16ea896164f6e8bfe0a03bbbd95ff14d474445ba6f045f9377d01282c9364f  jh71xx-tools-7a29f4b9d2355aa39afa8680680909bb74e4991d.tar.gz
+sha256  cf03c59b41f6d8a5046f7bff4bbe3576075314299a4d0828d7855bf60af81001  LICENSE
diff --git a/package/jh71xx-tools/jh71xx-tools.mk b/package/jh71xx-tools/jh71xx-tools.mk
new file mode 100644
index 0000000000..f082e2a453
--- /dev/null
+++ b/package/jh71xx-tools/jh71xx-tools.mk
@@ -0,0 +1,20 @@
+################################################################################
+#
+# jh71xx-tools
+#
+################################################################################
+
+JH71XX_TOOLS_VERSION = 7a29f4b9d2355aa39afa8680680909bb74e4991d
+JH71XX_TOOLS_SITE = $(call github,kprasadvnsi,JH71xx-tools,$(JH71XX_TOOLS_VERSION))
+JH71XX_TOOLS_LICENSE = MIT
+JH71XX_TOOLS_LICENSE_FILES = LICENSE
+
+define HOST_JH71XX_TOOLS_BUILD_CMDS
+	$(HOSTCC) -o $(@D)/jh7100-recover $(@D)/jh7100-recover.c
+endef
+
+define HOST_JH71XX_TOOLS_INSTALL_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/jh7100-recover $(HOST_DIR)/bin/jh7100-recover
+endef
+
+$(eval $(host-generic-package))
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
