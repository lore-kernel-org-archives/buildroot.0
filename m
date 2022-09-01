Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69EDDECAAD1
	for <buildroot@archiver.kernel.org>; Thu,  1 Sep 2022 16:01:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D847381340;
	Thu,  1 Sep 2022 16:01:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D847381340
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CyjJc9BEf9ga; Thu,  1 Sep 2022 16:01:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E8D87812A7;
	Thu,  1 Sep 2022 16:01:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E8D87812A7
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0094A1BF3C4
 for <buildroot@lists.busybox.net>; Thu,  1 Sep 2022 16:01:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CD490408F9
 for <buildroot@lists.busybox.net>; Thu,  1 Sep 2022 16:01:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CD490408F9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id givFf-YRIAHo for <buildroot@lists.busybox.net>;
 Thu,  1 Sep 2022 16:01:38 +0000 (UTC)
X-Greylist: delayed 00:05:04 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F2C26408C7
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.13])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F2C26408C7
 for <buildroot@buildroot.org>; Thu,  1 Sep 2022 16:01:37 +0000 (UTC)
Received: from harderbit.localdomain ([92.154.77.116]) by
 mrelayeu.kundenserver.de (mreue109 [212.227.15.184]) with ESMTPSA (Nemesis)
 id 1MoNyA-1p9T5a2NIG-00onOa; Thu, 01 Sep 2022 17:56:30 +0200
From: Thomas Claveirole <thomas.claveirole@green-communications.fr>
To: buildroot@buildroot.org
Date: Thu,  1 Sep 2022 17:56:05 +0200
Message-Id: <20220901155605.118365-1-thomas.claveirole@green-communications.fr>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <3453234.iIbC2pHGDl@harderbit>
References: <3453234.iIbC2pHGDl@harderbit>
MIME-Version: 1.0
X-Provags-ID: V03:K1:/iqrAXUebycuQiTgL80oISdfMhY4Q77NYQOKNHQBq1xe1OW/+oj
 tHBmH17DiYdULz21LtW7FZIplvN/Swx9R9o7blOAnRXdqsjNTYMHHAMWOruoKPu6ORju+ut
 kfm6pvnkRaJMgCKzSwwdodZn4/WE8II8q+IHZMRW22UHN4CAFtHtpma4/l9jGgCldk66qIv
 TlW9vaelib2qXPFPidMQg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:ryrRrvgb8is=:b8/xjEW/VaoS9jzdg0I3r6
 M5zWGUvbdmhu82vil4C0hy9Pk1b5zG6AQvYrhUaNbFNSze1OrwDkRew4qbDSRdcb24KRg3mq/
 CZElX+kpr/Dzo5CFM6DIWEUj4d8XWnBcKz4Df3q4HJU5kWf3MzxAUWxf36iud6YDBQIpzb0cI
 S8GBY2mUR/R2t3GivmkwIRUTV2BuV5P6tWUGJBd7ve6LfSgshtj9d3E6kqNm/JqBnIJ4Wo8uh
 hZwx/NOgyiNKSsDXYWAq4MDZOh2vbdDINF3FzxPq5dP2NJ3M66Ly03hb08k89pgs3LdPsoegO
 Tu2J7CmmVZcfQ4m+0VGdq64UKmoCFhBRTNWLX38hBtZVNex9bifsNvozxAUYa6xNCnKvY1zti
 tSHdnlKrQztGJPKDj70tXsbArplzKTaEwFG83MEsl4pJi6/o7c8y5GiR1qe1k3iemDcf1jAxQ
 8vO0Z+W7aaDLC/elksGSVpj5SataKKGbc+bVxTaY4jLwJfb9SazT36mz9nlz06WngCftuzoxS
 WEk2EVsYhvsIqcxoO5/FPQuJJ5kbKT4oYxet8X/OzwmvZWkpvznrC3jKT5KpOC3qMkRruEhmG
 p56p3oEItc0yUqZXMDdbxXSmCGC5/B1BcF7fx/fWejfPt/DG/avYhVauMwOO+kZc6uwf/T05B
 bdJ8x/QEI9/XFRxlbgquhEYzN719u28+rHEH8gfqog6YZ/0BGh3AMifgexd6aJQFFV7hfYQ+O
 EN+TzvcLH1MXjxZWphoXyMQ6E2QX5bxUH5Ja4iTWg8BuXiOGFO4+g4kxXxNW7XjyY++poU8oT
 AlAzeHu+CNp6aiH2CJe0ULgBfZHQd5u9iAVzZf6IQ4tq+tj7wo=
Subject: [Buildroot] [PATCH v2 1/1] package/openlayers: bump to version 7.1.0
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

OpenLayers changed its release format again, only two weeks after the
previous change.  The good news is, though, that they now ship a
single release archive that includes the compiled JavaScript code
together with the source code.  Furthermore, they ship both code with
a single license, which file is part of the archive.

Hence, we still do not need to rely on host-nodejs for this package,
at least not for this version.

Signed-off-by: Thomas Claveirole <thomas.claveirole@green-communications.fr>
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
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
