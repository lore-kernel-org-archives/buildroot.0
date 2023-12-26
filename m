Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AD15C46CD3
	for <buildroot@archiver.kernel.org>; Tue, 26 Dec 2023 13:13:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 439B7408E5;
	Tue, 26 Dec 2023 13:13:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 439B7408E5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6jMxfL-feiUI; Tue, 26 Dec 2023 13:13:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 470B8408FB;
	Tue, 26 Dec 2023 13:13:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 470B8408FB
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 02A1C1BF489
 for <buildroot@lists.busybox.net>; Tue, 26 Dec 2023 13:13:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CFF69408F1
 for <buildroot@lists.busybox.net>; Tue, 26 Dec 2023 13:13:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CFF69408F1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RFaluQdjwkg7 for <buildroot@lists.busybox.net>;
 Tue, 26 Dec 2023 13:13:30 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B7910408E5
 for <buildroot@buildroot.org>; Tue, 26 Dec 2023 13:13:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B7910408E5
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A687182847; Tue, 26 Dec 2023 13:13:30 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 26 Dec 2023 14:13:09 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3cc18e40856868f24e933a24dfa2ce0708d0f793
X-Git-Newrev: 449538348ebc941bd7a2ebde3e4e691daca45a91
X-Patchwork-Hint: ignore
Message-Id: <20231226131330.A687182847@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/cjson: security bump to version
 1.7.17
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

commit: https://git.buildroot.net/buildroot/commit/?id=449538348ebc941bd7a2ebde3e4e691daca45a91
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Fix null reference in cJSON_SetValuestring (CVE-2023-50472)
- Fix null reference in cJSON_InsertItemInArray (CVE-2023-50471)

https://github.com/DaveGamble/cJSON/releases/tag/v1.7.17

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
