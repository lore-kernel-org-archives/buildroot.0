Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF084C32774
	for <buildroot@archiver.kernel.org>; Thu, 25 Aug 2022 15:12:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 486E58329E;
	Thu, 25 Aug 2022 15:12:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 486E58329E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CnXGk2eyknPO; Thu, 25 Aug 2022 15:12:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 41A2B813A4;
	Thu, 25 Aug 2022 15:12:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 41A2B813A4
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 73A741BF36D
 for <buildroot@lists.busybox.net>; Thu, 25 Aug 2022 15:12:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4938B4169E
 for <buildroot@lists.busybox.net>; Thu, 25 Aug 2022 15:12:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4938B4169E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3aMqKe8UOk0H for <buildroot@lists.busybox.net>;
 Thu, 25 Aug 2022 15:12:48 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 48FD0401C3
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.131])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 48FD0401C3
 for <buildroot@buildroot.org>; Thu, 25 Aug 2022 15:12:48 +0000 (UTC)
Received: from harderbit.localdomain ([92.154.77.116]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.168]) with ESMTPSA (Nemesis)
 id 1MZkd5-1ouCJG0nqR-00WlsA; Thu, 25 Aug 2022 17:12:45 +0200
From: Thomas Claveirole <thomas.claveirole@green-communications.fr>
To: buildroot@buildroot.org
Date: Thu, 25 Aug 2022 17:12:04 +0200
Message-Id: <20220825151204.390615-1-thomas.claveirole@green-communications.fr>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:Akqu9rVZeH9ZRa93vql+7CEliRwS7iYObR68UVJ88ZA5ipzwmBc
 C9tLWSWlFLOznamZmjawLg2eIXmCwS8ckhPXawm16pJrRltVg7KwBNiR/RrVCjG+1gDZjLm
 dOxNei9NNkrbsuXmd6tvp4NMiJ1f6SYNzuiTljpd5JBeDFFvUWFVV+t1j/NxaVfq6tabmgC
 Dh4mK2izVAUQo+1tCy0VQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:N+gZaN7tbWM=:sc9BEVAuB8Q3TFvnI7e1EK
 V867vkVBHHweVLHgvYNSqMaRUt2X4RoHueruMbtTCS/eI+oUpuYT0/fybWyvrHLM07+pOnX9N
 SOcb5MaRn3R61/1Dj5YbkmhMUC0E9/yJYyKQopMVzx39ZJXBEKqEx8tdVmdk7SwGtRcIj1Ire
 IpAAWKO686yJcFFUNrFM69CeQXHpiAdqZiGyPsAMEFd1Z+qRpCHfXXnf3xjrJDuwRXfTmIO4a
 gyC13i7ywL5p/h7HVQngeU9nMGsSPtC47aaWvhlYPasEMBB1GBvClbR+c+/zI662waWLRRXC2
 kzjzYKUKlXLUMW8zjhMFBq4nvVAQRvfrTEi4W+kSOQG9oKkeluJKDuhcxmMl+4NyMe+VzGHrf
 OGNZWLCnzCw2StwgfX2vlK02GBLUVXZYWnNKynyJgJSi2gJmdTBw/Fh/DpbfGFtet3STFaWx7
 ouKevxjt+9d+M3MkN1Z4etxiqrzOFNh2TlkQFeW55+TFGDLFF46Fhoo8se4/IkxT8Q7Uekibr
 sdpID/53NQNqh+bm+72o3XzJjfYJF+8DNQSDj3NGNpAfjZkOr6I/gsxZQPPP9hEZbipZxrpH2
 d/nmjDD9x4ZhCJnn7cUkIcGc0sWmTGslme7cFiY4hNhGWxXMqITHZTnHIRxKPqHcdg0FuQVJN
 vqqzhWXm3YUb/wMfEWxEenbTitjvTIxQzoA1an/lqM+H95GxS4eSH5K+j2OCwLeRyBFv+Mmbk
 GmuFvAuCHwmCeoCLxEACa5wx5/cX7UQxKdV03PXcq7BegPuCIxuwSm0yobGBjEay+jbribl1z
 e8zfGRa
Subject: [Buildroot] [PATCH 1/1] package/openlayers: bump to version 7.0.0
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
Cc: Thomas Claveirole <thomas.claveirole@green-communications.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Do not rely on the "dist" archive anymore (or the "legacy" archive as
OpenLayers calls it now).  Build the JavaScript directly from the
source archive instead, using host-nodejs.

Note that the v6.14.1-dist.zip archive for the previous version did
change, hence the hash for previous version is broken.  See
https://github.com/openlayers/openlayers/issues/14053 for details.

Signed-off-by: Thomas Claveirole <thomas.claveirole@green-communications.fr>
---
 package/openlayers/Config.in       |  5 +++++
 package/openlayers/openlayers.hash |  3 ++-
 package/openlayers/openlayers.mk   | 27 ++++++++++++++++-----------
 3 files changed, 23 insertions(+), 12 deletions(-)

diff --git a/package/openlayers/Config.in b/package/openlayers/Config.in
index a7b7f334cf..55ce17ecb7 100644
--- a/package/openlayers/Config.in
+++ b/package/openlayers/Config.in
@@ -1,5 +1,10 @@
 config BR2_PACKAGE_OPENLAYERS
 	bool "openlayers"
+
+	depends on BR2_PACKAGE_HOST_QEMU_USER_ARCH_SUPPORTS # host-nodejs
+	depends on BR2_HOST_GCC_AT_LEAST_8 # host-nodejs
+	select BR2_PACKAGE_HOST_NODEJS
+
 	help
 	  OpenLayers makes it easy to put a dynamic map in any web
 	  page. It can display map tiles, vector data and markers
diff --git a/package/openlayers/openlayers.hash b/package/openlayers/openlayers.hash
index 1c93b9a729..e1fa859e14 100644
--- a/package/openlayers/openlayers.hash
+++ b/package/openlayers/openlayers.hash
@@ -1,2 +1,3 @@
 # Locally computed:
-sha256  8a9fda6e392688c049ebb88fb2c73b5788b4965b625443de4cca7d4688b1fb82  v6.14.1-dist.zip
+sha256  290568a9f1243fbbf21a1140f1763399a4126cd3e6c308892507c2d5fc9601e7  openlayers-7.0.0.tar.gz
+sha256  6c4347b83a8c9feef18d57b18e3b6c44cf901b3c344a4a1fbd837e421555ab8e  LICENSE.md
diff --git a/package/openlayers/openlayers.mk b/package/openlayers/openlayers.mk
index 4626e7545a..08a58cd796 100644
--- a/package/openlayers/openlayers.mk
+++ b/package/openlayers/openlayers.mk
@@ -4,21 +4,26 @@
 #
 ################################################################################
 
-OPENLAYERS_VERSION = 6.14.1
-OPENLAYERS_SOURCE = v$(OPENLAYERS_VERSION)-dist.zip
-OPENLAYERS_SITE = https://github.com/openlayers/openlayers/releases/download/v$(OPENLAYERS_VERSION)
-OPENLAYERS_LICENSE = BSD-2-Clause
-# There's no separate license file in the archive, only minified files.
+OPENLAYERS_VERSION = 7.0.0
+OPENLAYERS_SITE = $(call github,openlayers,openlayers,v$(OPENLAYERS_VERSION))
 
-define OPENLAYERS_EXTRACT_CMDS
-	unzip $(OPENLAYERS_DL_DIR)/$(OPENLAYERS_SOURCE) -d $(@D)
-	mv $(@D)/v$(OPENLAYERS_VERSION)-dist/* $(@D)
-	rmdir $(@D)/v$(OPENLAYERS_VERSION)-dist/
+# OpenLayers itself is BSD-2-Clause, but not all of the dependencies
+# it brings in are.  See $(@D)/build/legacy/*.LICENSE.txt after build
+# for details.
+OPENLAYERS_LICENSE = BSD-2-Clause, BSD-3-Clause (ieee754), Apache-2.0
+OPENLAYERS_LICENSE_FILES = LICENSE.md
+
+OPENLAYERS_DEPENDENCIES = host-nodejs
+
+define OPENLAYERS_BUILD_CMDS
+	cd $(@D) && $(NPM) install && $(NPM) run build-legacy
 endef
 
 define OPENLAYERS_INSTALL_TARGET_CMDS
-	$(INSTALL) -D -m 0644 $(@D)/ol.css $(TARGET_DIR)/var/www/ol.css
-	$(INSTALL) -D -m 0644 $(@D)/ol.js $(TARGET_DIR)/var/www/ol.js
+	$(INSTALL) -D -m 0644 \
+		$(@D)/build/legacy/ol.js $(TARGET_DIR)/var/www/ol.js
+	$(INSTALL) -D -m 0644 \
+		$(@D)/build/legacy/ol.css $(TARGET_DIR)/var/www/ol.css
 endef
 
 $(eval $(generic-package))
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
