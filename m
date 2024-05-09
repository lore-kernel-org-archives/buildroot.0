Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E44BEC10F1A
	for <buildroot@archiver.kernel.org>; Thu,  9 May 2024 20:46:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9077D61315;
	Thu,  9 May 2024 20:46:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZxHM7KSjgIpF; Thu,  9 May 2024 20:46:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DA3BF61341
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DA3BF61341;
	Thu,  9 May 2024 20:46:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3AEA01BF31C
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 20:46:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5691483FF0
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 20:46:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZItrcQwzP_tQ for <buildroot@lists.busybox.net>;
 Thu,  9 May 2024 20:46:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5841A83FEF
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5841A83FEF
 for <buildroot@buildroot.org>; Thu,  9 May 2024 20:46:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4536886C8F; Thu,  9 May 2024 20:46:28 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 9 May 2024 22:44:54 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a6182475b0f8abc04212fedf3da1f3e88f81d8f4
X-Git-Newrev: 0bd17778b21899ce62d193ad3b3a0a4cd90ff31c
X-Patchwork-Hint: ignore
Message-Id: <20240509204628.4536886C8F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/*: update hashes for packages with
 export-subst git attibute
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=0bd17778b21899ce62d193ad3b3a0a4cd90ff31c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Those packages use the export-subst git attribute, so the content of
the generated archives change.

Update the hashes accordingly.

For pcm-tools, we no longer need the post-extract hook, as the git
attribute is properly handled in the git download backend.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/pcm-tools/pcm-tools.hash         | 2 +-
 package/pcm-tools/pcm-tools.mk           | 8 --------
 package/qt5/qt5knx/qt5knx.hash           | 2 +-
 package/qt5/qt5location/qt5location.hash | 2 +-
 package/qt5/qt5mqtt/qt5mqtt.hash         | 2 +-
 package/qt5/qt5opcua/qt5opcua.hash       | 2 +-
 6 files changed, 5 insertions(+), 13 deletions(-)

diff --git a/package/pcm-tools/pcm-tools.hash b/package/pcm-tools/pcm-tools.hash
index cfa3faeff7..5be5885d41 100644
--- a/package/pcm-tools/pcm-tools.hash
+++ b/package/pcm-tools/pcm-tools.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  29416f83d1de95594d225f63af34f8f074ee4822010ce2e05b1fabc66933472a  pcm-tools-93fc9193a70e2f1f054be554c48f4a4791be5032-br1.tar.gz
+sha256  f3eae080e1bdc1f6264709534dff4881fb94d0d78c17ba4c8d0dbd816f6b17b9  pcm-tools-93fc9193a70e2f1f054be554c48f4a4791be5032-br2.tar.gz
 sha256  0f476c77009f982dcc4bdff41e692ddd456a9862908e99f2ae3d57296decc649  LICENSE
diff --git a/package/pcm-tools/pcm-tools.mk b/package/pcm-tools/pcm-tools.mk
index c530492696..30a8fbf0b6 100644
--- a/package/pcm-tools/pcm-tools.mk
+++ b/package/pcm-tools/pcm-tools.mk
@@ -17,14 +17,6 @@ PCM_TOOLS_EXE_FILES = \
 	pcm-core pcm-iio pcm-lspci pcm-memory pcm-msr pcm-numa \
 	pcm-pcicfg pcm-pcie pcm-power pcm-sensor pcm-tsx pcm
 
-# version.h contains git attributes; replace them with the previously-known
-# value.
-define PCM_TOOLS_FIXUP_VERSION_H
-	$(SED) 's/\$$Format:%ci ID=%h\$$/2021-10-25 16:07:54 +0200 ID=93fc9193/' \
-		$(@D)/version.h
-endef
-PCM_TOOLS_POST_EXTRACT_HOOKS += PCM_TOOLS_FIXUP_VERSION_H
-
 define PCM_TOOLS_BUILD_CMDS
 	touch $(@D)/daemon-binaries
 	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) \
diff --git a/package/qt5/qt5knx/qt5knx.hash b/package/qt5/qt5knx/qt5knx.hash
index 031fad5e92..7c78b50615 100644
--- a/package/qt5/qt5knx/qt5knx.hash
+++ b/package/qt5/qt5knx/qt5knx.hash
@@ -1,5 +1,5 @@
 # Hash locally calculated
-sha256  932ea512aa8ceb514ac40ce1fcbebe86c306caff1a0b11320d9a36fd84bae10c  qt5knx-5.15.2-br1.tar.gz
+sha256  df517ec632aca8d95150c73f4c43d1d396452b40d434b5f1969f266f127e1d70  qt5knx-5.15.2-br2.tar.gz
 
 # Hashes for license files:
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSE.GPL3
diff --git a/package/qt5/qt5location/qt5location.hash b/package/qt5/qt5location/qt5location.hash
index 0188f51c83..3f80f19586 100644
--- a/package/qt5/qt5location/qt5location.hash
+++ b/package/qt5/qt5location/qt5location.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  133d28fc0071e419682b7ed736c17b39240545c8e9d6ff7e9905f365bb1eb693  qt5location-0ec8f5e82da7369a92824167c4d7331f6c502325-br1.tar.gz
+sha256  e94800d108e0f7a05df5586456fa812a0b6dd348623332b5cc8f837ccd206ebb  qt5location-0ec8f5e82da7369a92824167c4d7331f6c502325-br2.tar.gz
 
 # Hashes for license files:
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.GPL2
diff --git a/package/qt5/qt5mqtt/qt5mqtt.hash b/package/qt5/qt5mqtt/qt5mqtt.hash
index f4ea6b7015..cd4272fb17 100644
--- a/package/qt5/qt5mqtt/qt5mqtt.hash
+++ b/package/qt5/qt5mqtt/qt5mqtt.hash
@@ -1,5 +1,5 @@
 # Hash locally calculated
-sha256  38f2bc1bcbdf76d30d78c86426c85f62a6c2091c997cad4b087039f795b2b406  qt5mqtt-5.15.2-br1.tar.gz
+sha256  eb7b75ab3f8fa6f512c3e2ba05e1356d15bc850977197ebbd3d360528b05281c  qt5mqtt-5.15.2-br2.tar.gz
 
 # Hashes for license files:
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSE.GPL3
diff --git a/package/qt5/qt5opcua/qt5opcua.hash b/package/qt5/qt5opcua/qt5opcua.hash
index e55fb17743..dbc749eaf6 100644
--- a/package/qt5/qt5opcua/qt5opcua.hash
+++ b/package/qt5/qt5opcua/qt5opcua.hash
@@ -1,5 +1,5 @@
 # Hash locally calculated
-sha256  562171c6dfd6f4f072316ddb6d7c5bcc8907a68ba31005cb8c20ed75beff34fb  qt5opcua-5.15.2-br1.tar.gz
+sha256  61a39fe7336709a9b2068e250713c2eb66fd3460b2c6e5f7bfc569b15b9cacb9  qt5opcua-5.15.2-br2.tar.gz
 
 # Hashes for license files:
 sha256  d93cc415382f0013088fa276d9cf82373badf244c78220a926f15ee46f0fe3c4  LICENSE-CC0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
