Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14EE9C636D6
	for <buildroot@archiver.kernel.org>; Wed, 22 Feb 2023 15:57:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B09AF416CD;
	Wed, 22 Feb 2023 15:57:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B09AF416CD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 255bOYzIfpRG; Wed, 22 Feb 2023 15:57:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EFFE1416D3;
	Wed, 22 Feb 2023 15:57:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EFFE1416D3
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C62B11BF3BE
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 15:55:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AD417409DD
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 15:55:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AD417409DD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qqpgzr8NH8Gf for <buildroot@lists.busybox.net>;
 Wed, 22 Feb 2023 15:55:44 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A3B6E41739
 for <buildroot@buildroot.org>; Wed, 22 Feb 2023 15:55:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A3B6E41739
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8FC0686741; Wed, 22 Feb 2023 15:55:44 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 22 Feb 2023 16:50:03 +0100
X-Git-Refname: refs/heads/2022.11.x
X-Git-Oldrev: b15b33fc57949b49f2b347b99e8b5d7d085f0e32
X-Git-Newrev: 5efc9e326d033b52da69bd1670127d894dfd59b1
X-Patchwork-Hint: ignore
Message-Id: <20230222155544.8FC0686741@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.11.x] package/mongoose: fix
 build with gcc 4.8
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

commit: https://git.buildroot.net/buildroot/commit/?id=5efc9e326d033b52da69bd1670127d894dfd59b1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.11.x

Fix the following build failure with gcc 4.8 raised since bump to
version 7.8 in commit f9e51e1150f59962577358b3da5c390ca4749291:

/home/buildroot/autobuild/run/instance-2/output-1/build/mongoose-7.8/mongoose.c: In function 'mg_iotest':
/home/buildroot/autobuild/run/instance-2/output-1/build/mongoose-7.8/mongoose.c:4484:3: error: 'for' loop initial declarations are only allowed in C99 mode
   for (struct mg_connection *c = mgr->conns; c != NULL; c = c->next) {
   ^

Fixes:
 - http://autobuild.buildroot.org/results/c538c6d8e87e4e24097c9878ee15083802276505

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 6139aeacd847487a296f1c7b8a9d302d678cd8ab)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mongoose/mongoose.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/mongoose/mongoose.mk b/package/mongoose/mongoose.mk
index 8d06ed4689..0693f7553a 100644
--- a/package/mongoose/mongoose.mk
+++ b/package/mongoose/mongoose.mk
@@ -13,7 +13,7 @@ MONGOOSE_INSTALL_STAGING = YES
 # static library
 MONGOOSE_INSTALL_TARGET = NO
 
-MONGOOSE_CFLAGS = $(TARGET_CFLAGS)
+MONGOOSE_CFLAGS = $(TARGET_CFLAGS) -std=gnu99
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 MONGOOSE_DEPENDENCIES += openssl
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
