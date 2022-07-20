Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D3EAC43334
	for <buildroot@archiver.kernel.org>; Wed, 20 Jul 2022 16:41:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9FABD60F21;
	Wed, 20 Jul 2022 16:41:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9FABD60F21
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EqM43lSPH3kM; Wed, 20 Jul 2022 16:41:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A9D3260B9D;
	Wed, 20 Jul 2022 16:41:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A9D3260B9D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A678B1C1135
 for <buildroot@lists.busybox.net>; Wed, 20 Jul 2022 16:40:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 807ED60AAA
 for <buildroot@lists.busybox.net>; Wed, 20 Jul 2022 16:40:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 807ED60AAA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id I_f8vVgarnTp for <buildroot@lists.busybox.net>;
 Wed, 20 Jul 2022 16:40:42 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id B724B6080A
 for <buildroot@buildroot.org>; Wed, 20 Jul 2022 16:40:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B724B6080A
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 5B7FD84010; Wed, 20 Jul 2022 16:27:12 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 20 Jul 2022 18:40:31 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3d4a5a77e54dba425824a6434a05b3a3b8e88c05
X-Git-Newrev: bfdcad485d818be674baacf22257ad6280904bbf
X-Patchwork-Hint: ignore
Message-Id: <20220720162712.5B7FD84010@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/cjson: add option to build
 cJSON_Utils
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=bfdcad485d818be674baacf22257ad6280904bbf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cJSON_Utils adds support for a few additional JSON RFCs. The size
increase is small (around 12K for ARM32), but it is more than half the
size of cJSON itself. So add a separate config option for cJSON_Utils.

Cc: Danomi Manchego <danomimanchego123@gmail.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/cjson/Config.in | 11 +++++++++++
 package/cjson/cjson.mk  |  6 ++++++
 2 files changed, 17 insertions(+)

diff --git a/package/cjson/Config.in b/package/cjson/Config.in
index ee18fced5c..55262a0990 100644
--- a/package/cjson/Config.in
+++ b/package/cjson/Config.in
@@ -5,3 +5,14 @@ config BR2_PACKAGE_CJSON
 	  ANSI-C compliant JSON parser, under MIT license.
 
 	  https://github.com/DaveGamble/cJSON
+
+if BR2_PACKAGE_CJSON
+
+config BR2_PACKAGE_CJSON_UTILS
+	bool "cJSON utils"
+	help
+	  Supplementary library with support for JSON Pointer
+	  (RFC-6901), JSON Patch (RFC-6902), JSON Merge Patch
+	  (RFC-7386), and more.
+
+endif
diff --git a/package/cjson/cjson.mk b/package/cjson/cjson.mk
index ac8db5701f..ad9d76a4ba 100644
--- a/package/cjson/cjson.mk
+++ b/package/cjson/cjson.mk
@@ -25,4 +25,10 @@ else
 CJSON_CONF_OPTS += -DBUILD_SHARED_AND_STATIC_LIBS=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_CJSON_UTILS),y)
+CJSON_CONF_OPTS += -DENABLE_CJSON_UTILS=ON
+else
+CJSON_CONF_OPTS += -DENABLE_CJSON_UTILS=OFF
+endif
+
 $(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
