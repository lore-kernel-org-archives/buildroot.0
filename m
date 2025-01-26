Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DCB3C282C6
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 17:05:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2D2AC424D8;
	Fri, 28 Feb 2025 17:05:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JycXrm6hpFXi; Fri, 28 Feb 2025 17:05:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ED1235064C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id ED1235064C;
	Fri, 28 Feb 2025 17:05:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 07C8E68
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:41:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 79BC942EAB
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:31:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g3qCV1Sw_Xcx for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:31:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C3CD342EBA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C3CD342EBA
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BE6E187A09; Fri, 28 Feb 2025 16:30:20 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 26 Jan 2025 12:00:05 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 7b9dec5f3ae8a2f051e83f333a5e05fb0c7383ea
X-Git-Newrev: 84d03a38bf44bbb30b8fc876afa59b96e6965159
X-Patchwork-Hint: ignore
Message-Id: <20250228163020.BE6E187A09@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next]
 package/panel-mipi-dbi-firmware: replace host-python3 with
 BR2_PYTHON3_HOST_DEPENDENCY
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=84d03a38bf44bbb30b8fc876afa59b96e6965159
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The mipi-dbi-cmd script does not require a particular python3
version. Using BR2_PYTHON3_HOST_DEPENDENCY avoids the need to build
host-python3 if python3 is installed on the host, and nothing else in
the build depends on host-python3.

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
Suggested-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/panel-mipi-dbi-firmware/panel-mipi-dbi-firmware.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/panel-mipi-dbi-firmware/panel-mipi-dbi-firmware.mk b/package/panel-mipi-dbi-firmware/panel-mipi-dbi-firmware.mk
index c3a9fa7afc..859de027c0 100644
--- a/package/panel-mipi-dbi-firmware/panel-mipi-dbi-firmware.mk
+++ b/package/panel-mipi-dbi-firmware/panel-mipi-dbi-firmware.mk
@@ -11,13 +11,13 @@ PANEL_MIPI_DBI_FIRMWARE_LICENSE = CC0-1.0
 # license info is directly in the only source file
 PANEL_MIPI_DBI_FIRMWARE_LICENSE_FILES = mipi-dbi-cmd
 
-PANEL_MIPI_DBI_FIRMWARE_DEPENDENCIES = host-python3
+PANEL_MIPI_DBI_FIRMWARE_DEPENDENCIES = $(BR2_PYTHON3_HOST_DEPENDENCY)
 
 BR2_PACKAGE_PANEL_MIPI_DBI_FIRMWARE_BIN = $(addsuffix .bin,$(basename $(notdir $(shell echo $(BR2_PACKAGE_PANEL_MIPI_DBI_FIRMWARE_SOURCE)))))
 
 define PANEL_MIPI_DBI_FIRMWARE_BUILD_CMDS
 	for source in $(shell echo $(BR2_PACKAGE_PANEL_MIPI_DBI_FIRMWARE_SOURCE)) ; do \
-		$(HOST_DIR)/bin/python $(@D)/mipi-dbi-cmd "$(@D)/$$(basename $${source%.*}).bin" "$${source}" ; \
+		PATH=$(BR_PATH) $(@D)/mipi-dbi-cmd "$(@D)/$$(basename $${source%.*}).bin" "$${source}" ; \
 	done
 endef
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
