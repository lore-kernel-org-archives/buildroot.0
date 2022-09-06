Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BF3CECAAD5
	for <buildroot@archiver.kernel.org>; Tue,  6 Sep 2022 14:58:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C554182B81;
	Tue,  6 Sep 2022 14:58:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C554182B81
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2gAaMnQhNMxI; Tue,  6 Sep 2022 14:58:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D34D682B93;
	Tue,  6 Sep 2022 14:58:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D34D682B93
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3D76E1BF36A
 for <buildroot@lists.busybox.net>; Tue,  6 Sep 2022 14:57:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2884D606BF
 for <buildroot@lists.busybox.net>; Tue,  6 Sep 2022 14:57:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2884D606BF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NdKyOvJzH20K for <buildroot@lists.busybox.net>;
 Tue,  6 Sep 2022 14:57:30 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 42EAB607AA
 for <buildroot@buildroot.org>; Tue,  6 Sep 2022 14:57:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 42EAB607AA
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id B701281964; Tue,  6 Sep 2022 14:42:10 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 6 Sep 2022 16:50:02 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: f89f8aa1554bf04282112b789a209b85a2e9133a
X-Git-Newrev: ec1b5c59a183ecbaf5774856b8b3228363993fef
X-Patchwork-Hint: ignore
Message-Id: <20220906144210.B701281964@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/openlayers: bump to
 version 7.1.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=ec1b5c59a183ecbaf5774856b8b3228363993fef
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

OpenLayers changed its release format again, only two weeks after the
previous change.  The good news is, though, that they now ship a
single release archive that includes the compiled JavaScript code
together with the source code.  Furthermore, they ship both code with
a single license, which file is part of the archive.

Hence, we still do not need to rely on host-nodejs for this package,
at least not for this version.

Signed-off-by: Thomas Claveirole <thomas.claveirole@green-communications.fr>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/openlayers/openlayers.hash |  3 ++-
 package/openlayers/openlayers.mk   | 10 ++++------
 2 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/package/openlayers/openlayers.hash b/package/openlayers/openlayers.hash
index 1c93b9a729..1b3f3cce51 100644
--- a/package/openlayers/openlayers.hash
+++ b/package/openlayers/openlayers.hash
@@ -1,2 +1,3 @@
 # Locally computed:
-sha256  8a9fda6e392688c049ebb88fb2c73b5788b4965b625443de4cca7d4688b1fb82  v6.14.1-dist.zip
+sha256  37a0e5fde4df3db6e6c11ed0ceb8e20608121afe5f8f7f91cf03990e89a919ca  v7.1.0-package.zip
+sha256  6c4347b83a8c9feef18d57b18e3b6c44cf901b3c344a4a1fbd837e421555ab8e  LICENSE.md
diff --git a/package/openlayers/openlayers.mk b/package/openlayers/openlayers.mk
index 4626e7545a..7396e38fb9 100644
--- a/package/openlayers/openlayers.mk
+++ b/package/openlayers/openlayers.mk
@@ -4,21 +4,19 @@
 #
 ################################################################################
 
-OPENLAYERS_VERSION = 6.14.1
-OPENLAYERS_SOURCE = v$(OPENLAYERS_VERSION)-dist.zip
+OPENLAYERS_VERSION = 7.1.0
+OPENLAYERS_SOURCE = v$(OPENLAYERS_VERSION)-package.zip
 OPENLAYERS_SITE = https://github.com/openlayers/openlayers/releases/download/v$(OPENLAYERS_VERSION)
 OPENLAYERS_LICENSE = BSD-2-Clause
-# There's no separate license file in the archive, only minified files.
+OPENLAYERS_LICENSE_FILES = LICENSE.md
 
 define OPENLAYERS_EXTRACT_CMDS
 	unzip $(OPENLAYERS_DL_DIR)/$(OPENLAYERS_SOURCE) -d $(@D)
-	mv $(@D)/v$(OPENLAYERS_VERSION)-dist/* $(@D)
-	rmdir $(@D)/v$(OPENLAYERS_VERSION)-dist/
 endef
 
 define OPENLAYERS_INSTALL_TARGET_CMDS
 	$(INSTALL) -D -m 0644 $(@D)/ol.css $(TARGET_DIR)/var/www/ol.css
-	$(INSTALL) -D -m 0644 $(@D)/ol.js $(TARGET_DIR)/var/www/ol.js
+	$(INSTALL) -D -m 0644 $(@D)/dist/ol.js $(TARGET_DIR)/var/www/ol.js
 endef
 
 $(eval $(generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
