Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C813C0218C
	for <buildroot@archiver.kernel.org>; Sat, 25 Jan 2025 22:36:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 45E9B60752;
	Sat, 25 Jan 2025 22:36:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zluAzDR47Om0; Sat, 25 Jan 2025 22:36:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3B2F46079C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3B2F46079C;
	Sat, 25 Jan 2025 22:36:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id B7098941
 for <buildroot@buildroot.org>; Sat, 25 Jan 2025 22:36:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 92AA840103
 for <buildroot@buildroot.org>; Sat, 25 Jan 2025 22:36:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vMDxc1RkGud8 for <buildroot@buildroot.org>;
 Sat, 25 Jan 2025 22:36:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.21;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 05E184063F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 05E184063F
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 05E184063F
 for <buildroot@buildroot.org>; Sat, 25 Jan 2025 22:36:13 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.lan ([85.22.115.60]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MFbVu-1thquD0JGI-00GMOz; Sat, 25
 Jan 2025 23:36:11 +0100
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>,
	"Fiona Klute (WIWA)" <fiona.klute@gmx.de>
Date: Sat, 25 Jan 2025 23:36:00 +0100
Message-ID: <20250125223600.3920642-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
X-Provags-ID: V03:K1:/XskEFQ32eGy+sRCnHZ9H3dWzbGZa0OwUbbJ/7kBgTmtMGyRHOI
 RqG/BfqvBO/D2OwMHujifG1kyC5j+3ed6v0jlhu50acVA6bk0Gm3+R4RAJxGDAtJgVum0Ly
 p+egfbLGMoy06kItDs9xBbu8cjs9QNxQhEXcJgAB5lfZPciwuY5Nb96RKYHFHY+JFaDro2w
 DkBk2qcfaZ5XzoQhJzK1A==
UI-OutboundReport: notjunk:1;M01:P0:KR1/sFZICUg=;idD7UTvfgDJWayBcW6WiyR8nK2E
 2CjKlPhs8g0TxbBFsBUGickKuQ/4VRph6nrZhTRJ2dD0/ll06ZdvBUVc7UC5Iq4dOKb+INGpK
 FLsbPMvh7wMTyaGJIxTUUpFAJdqL6TOp01mNrI94kmpIUJULfw1NGOmYqWsHH86sbtiu5cH14
 X5xYAVU5zBJa93zR+EBCYL1su7snw0jYxymDwANFYdSJO+vu04craFtA/Tnoh9N4zbtZYX0LP
 8oCMbZ49UJpZct/0bWP8GQOzVxFVA/4uBMB7bizVbh2jvirVvSe9KozaKnmuoj0YNNe+9LwMg
 g8zWcRVhvyZZbR5yUGzxTP+0Ykk+BFcRsrruMbGrFNc+mmgV55fd5s699a4CdSRtiQYsYwffu
 QVIDzAevy+HmfiiDf5ypB43Uue/T6pYewwTtmlf+L7b12bgS2nLWlnxBC65GK7v+VUh/Yz15/
 km2E1sI7Y1tO9dXOZUapMPd0r66CQWh7LYfmqdjZR3aq+4VGvDJM5mv7ltv7eOZSzgBmDX7yG
 gN5GXoSgouRHZRCk2XBc5lBX373aeZDNsL9CT+V+Z6yIs9zYkJLLx3oJz04wKmeMSLxm+1COc
 XU7AHa1fy9DBeibukkfWSre+7Yqwht3woY+vUPYx67IqYYFB02fyfCdbkIVLSedxi60EoLrNF
 0xOsBWiFdmV1m/mEG6v8tbHXVdYAjkNuY+WyeYCAutkuYyJ5Buf+DnfzVRAfsmu/ArVE065Wc
 DtEG4ESPR2St0TL8/d0PzxMRlOUbIo172/yUzZra2sCAsl6ivqptgkGGH1CVM6ilqfXeE9TGA
 4v4RQFR78qyCTT2CljYKRJxrtfw3E6veJqsqBBwoHugZI+4LyglF0VlZKYGf+YBtGC/U8LjBQ
 hroEQfSqByZMKcldNJFWDNwa5o5UQ3VEYGfbQYYTGuivgCDXeUiH12iNvwmdaDFgnmW6afCQc
 uRkkPcNeOP66DM6xqHP2QcWw/BuBYOJWXcnio8ayhJEcvtd3NntLTzBHrh1PrkN5yi8Px77Cs
 JBLfFSqPDSUUESH/0RP/9Z6mTamrUn1npZ7yIDteFDI1N0Op2FJbqTVtYTD5GY6zSHhKDgJyb
 9ycbNYLnhoypC8r9cxc6Iis0XoSoVw+Qyeceq9C42Ygc5GCXl52OFz/vEjb6D0RtnlxQnoKqI
 5uYMXuxdzKE0gnB9f5sZ6CfPQ40mUqRp4M2bNH4imGQ==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1737844571; x=1738449371; i=fiona.klute@gmx.de;
 bh=ucOHhyrnH4HIDETwqrWWLrSNqbjI4nAmqGXtSDJwakk=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=ZRRS7SgCXHrL0nQTaFEPQwwEA+xMXHpu0Ozd7GILuk8Hl4PPiXX4+d3zjC48RgeK
 fwPbLOUVsuSB8lMIy63Os1T6txdUazX1uqhpCdIjU+zOV72C5mTQxfkIFGvSvZ/6D
 fW9LKWPjEkd3qjXY83rPiX0zJ9qnfG5PcyJEJTyAZ9M9eTDVZVRMShU8qqb82OcfR
 lteEgs03tAnbW1hnMG2M0TU4qy8jS09cjjzQR27SHGNNCrz6A141m+w/PUuveD4AW
 M+Gaafw+1R9vHCfTfCv4bLiJCDXDt2bfltoGzXpJxiQ7ZT/Oq6ygHPgSNZiP5jcKK
 i+CeNVTaso0Nv7FlBg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=ZRRS7SgC
Subject: [Buildroot] [PATCH 1/1] package/panel-mipi-dbi-firmware: replace
 host-python3 with BR2_PYTHON3_HOST_DEPENDENCY
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>

The mipi-dbi-cmd script does not require a particular python3
version. Using BR2_PYTHON3_HOST_DEPENDENCY avoids the need to build
host-python3 if python3 is installed on the host, and nothing else in
the build depends on host-python3.

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
Suggested-by: Julien Olivain <ju.o@free.fr>
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
 
-- 
2.47.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
