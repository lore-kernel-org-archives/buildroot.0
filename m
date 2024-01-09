Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96AB2C4707B
	for <buildroot@archiver.kernel.org>; Tue,  9 Jan 2024 20:29:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4715641723;
	Tue,  9 Jan 2024 20:29:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4715641723
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9vaDZ3Qrfepg; Tue,  9 Jan 2024 20:29:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7AFC54173B;
	Tue,  9 Jan 2024 20:29:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7AFC54173B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 627BF1BF94D
 for <buildroot@lists.busybox.net>; Tue,  9 Jan 2024 20:28:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3C0F360EE2
 for <buildroot@lists.busybox.net>; Tue,  9 Jan 2024 20:28:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3C0F360EE2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aOzfxr4CtcoH for <buildroot@lists.busybox.net>;
 Tue,  9 Jan 2024 20:28:55 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7678460E8D
 for <buildroot@buildroot.org>; Tue,  9 Jan 2024 20:28:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7678460E8D
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5FA2985092; Tue,  9 Jan 2024 20:28:55 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 9 Jan 2024 21:28:27 +0100
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 574eafa5c018a43a2df3c5be9b6ac3fcf0ab269e
X-Git-Newrev: 2ed65a2f4495e2ffe1eb6adb86e165b0c8e34e7c
X-Patchwork-Hint: ignore
Message-Id: <20240109202855.5FA2985092@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/cjson: security
 bump to version 1.7.17
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

commit: https://git.buildroot.net/buildroot/commit/?id=2ed65a2f4495e2ffe1eb6adb86e165b0c8e34e7c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

- Fix null reference in cJSON_SetValuestring (CVE-2023-50472)
- Fix null reference in cJSON_InsertItemInArray (CVE-2023-50471)

https://github.com/DaveGamble/cJSON/releases/tag/v1.7.17

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 449538348ebc941bd7a2ebde3e4e691daca45a91)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/cjson/cjson.hash | 2 +-
 package/cjson/cjson.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/cjson/cjson.hash b/package/cjson/cjson.hash
index 74844d6aa6..305dc0d7b8 100644
--- a/package/cjson/cjson.hash
+++ b/package/cjson/cjson.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  451131a92c55efc5457276807fc0c4c2c2707c9ee96ef90c47d68852d5384c6c  cjson-1.7.16.tar.gz
+sha256  c91d1eeb7175c50d49f6ba2a25e69b46bd05cffb798382c19bfb202e467ec51c  cjson-1.7.17.tar.gz
 sha256  a36dda207c36db5818729c54e7ad4e8b0c6fba847491ba64f372c1a2037b6d5c  LICENSE
diff --git a/package/cjson/cjson.mk b/package/cjson/cjson.mk
index 7ed732ac90..f699c160ef 100644
--- a/package/cjson/cjson.mk
+++ b/package/cjson/cjson.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CJSON_VERSION = 1.7.16
+CJSON_VERSION = 1.7.17
 CJSON_SITE = $(call github,DaveGamble,cjson,v$(CJSON_VERSION))
 CJSON_INSTALL_STAGING = YES
 CJSON_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
