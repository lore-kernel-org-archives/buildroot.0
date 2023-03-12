Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78D9EC6FA99
	for <buildroot@archiver.kernel.org>; Sun, 12 Mar 2023 09:03:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1F82A60FAE;
	Sun, 12 Mar 2023 09:03:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1F82A60FAE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2oyL4Fu4KV2Y; Sun, 12 Mar 2023 09:03:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4578260F81;
	Sun, 12 Mar 2023 09:03:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4578260F81
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0EDFA1BF865
 for <buildroot@lists.busybox.net>; Sun, 12 Mar 2023 09:03:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DA4F9606B0
 for <buildroot@lists.busybox.net>; Sun, 12 Mar 2023 09:03:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DA4F9606B0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Il9qi-UR5LQR for <buildroot@lists.busybox.net>;
 Sun, 12 Mar 2023 09:03:19 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id ED3B6605F6
 for <buildroot@buildroot.org>; Sun, 12 Mar 2023 09:03:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ED3B6605F6
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D925C86D72; Sun, 12 Mar 2023 09:03:18 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 12 Mar 2023 10:02:25 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: f969665d8f66864a760693b42b395a93cb4020a1
X-Git-Newrev: 5bfc02c0ad879f3e692cbe0330317e6a35507651
X-Patchwork-Hint: ignore
Message-Id: <20230312090318.D925C86D72@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/openfpgaloader: fix
 typos
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7085468566557675582=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7085468566557675582==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=5bfc02c0ad879f3e692cbe0330317e6a35507651
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Fix a typo in the name of two configuration options.
This repairs the selection of libgpiod support.

Signed-off-by: Vincent Stehlé <vincent.stehle@laposte.net>
Cc: Jean Burgat <jeanburgat33@gmail.com>
Acked-by: Gwenhael Goavec-merou <gwenhael.goavec-merou@trabucayre.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 Config.in.legacy                         | 9 +++++++++
 package/openfpgaloader/Config.in         | 2 +-
 package/openfpgaloader/openfpgaloader.mk | 4 ++--
 3 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 7f69462f2e..1d247fe1a0 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -144,6 +144,15 @@ endif
 
 ###############################################################################
 
+comment "Legacy options removed in 2023.05"
+
+config BR2_PACAKGE_OPENFPGALOADER_CMSIS
+	bool "openfpgaloader cmsis option name fixed"
+	select BR2_LEGACY
+	help
+	  A typo on BR2_PACAKGE_OPENFPGALOADER_CMSIS was fixed by
+	  renaming the option to BR2_PACKAGE_OPENFPGALOADER_CMSIS.
+
 comment "Legacy options removed in 2023.02"
 
 config BR2_KERNEL_HEADERS_6_0
diff --git a/package/openfpgaloader/Config.in b/package/openfpgaloader/Config.in
index 4ba01d12d3..bd83ad415b 100644
--- a/package/openfpgaloader/Config.in
+++ b/package/openfpgaloader/Config.in
@@ -12,7 +12,7 @@ config BR2_PACKAGE_OPENFPGALOADER
 
 if BR2_PACKAGE_OPENFPGALOADER
 
-config BR2_PACAKGE_OPENFPGALOADER_CMSIS
+config BR2_PACKAGE_OPENFPGALOADER_CMSIS
 	bool "CMSIS-DAP support"
 	depends on BR2_PACKAGE_HAS_UDEV # hidapi
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # hidapi
diff --git a/package/openfpgaloader/openfpgaloader.mk b/package/openfpgaloader/openfpgaloader.mk
index 042b16612e..6d7fbd9850 100644
--- a/package/openfpgaloader/openfpgaloader.mk
+++ b/package/openfpgaloader/openfpgaloader.mk
@@ -17,14 +17,14 @@ else
 OPENFPGALOADER_CONF_OPTS += -DENABLE_UDEV=OFF
 endif
 
-ifeq ($(BR2_PACAKGE_OPENFPGALOADER_CMSIS),y)
+ifeq ($(BR2_PACKAGE_OPENFPGALOADER_CMSIS),y)
 OPENFPGALOADER_DEPENDENCIES += hidapi
 OPENFPGALOADER_CONF_OPTS += -DENABLE_CMSISDAP=ON
 else
 OPENFPGALOADER_CONF_OPTS += -DENABLE_CMSISDAP=OFF
 endif
 
-ifeq ($(BR2_PACAKGE_OPENFPGALOADER_LIBGPIOD),y)
+ifeq ($(BR2_PACKAGE_OPENFPGALOADER_LIBGPIOD),y)
 OPENFPGALOADER_DEPENDENCIES += libgpiod
 OPENFPGALOADER_CONF_OPTS += -DENABLE_LIBGPIOD=ON
 else

--===============7085468566557675582==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7085468566557675582==--
