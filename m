Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0CDFC32771
	for <buildroot@archiver.kernel.org>; Wed, 28 Sep 2022 21:24:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 52A17813DF;
	Wed, 28 Sep 2022 21:24:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 52A17813DF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sIShJ8iJtlAh; Wed, 28 Sep 2022 21:24:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 83EB180BE8;
	Wed, 28 Sep 2022 21:24:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 83EB180BE8
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 106231BF3DB
 for <buildroot@lists.busybox.net>; Wed, 28 Sep 2022 21:23:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DEA0A60E50
 for <buildroot@lists.busybox.net>; Wed, 28 Sep 2022 21:23:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DEA0A60E50
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sX5bA9CJ4TMX for <buildroot@lists.busybox.net>;
 Wed, 28 Sep 2022 21:23:29 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 20B7260E84
 for <buildroot@buildroot.org>; Wed, 28 Sep 2022 21:23:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 20B7260E84
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 110128643C; Wed, 28 Sep 2022 21:23:29 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 28 Sep 2022 22:54:49 +0200
X-Git-Refname: refs/heads/2022.08.x
X-Git-Oldrev: 7d4ee97a6299499f9810b22042ee91251e7ba5b9
X-Git-Newrev: 8087785fd480b898bf51c2c70ac134254df9381d
X-Patchwork-Hint: ignore
Message-Id: <20220928212329.110128643C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.08.x] package/libmdbx: drop
 explicit _REDISTRIBUTE = YES
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

commit: https://git.buildroot.net/buildroot/commit/?id=8087785fd480b898bf51c2c70ac134254df9381d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.08.x

<pkg>_REDISTRIBUTE defaults to YES, so no need to explicitly set it.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit fbb3dcfc9dadecfba023ef3004a77470bfff61a3)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libmdbx/libmdbx.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/libmdbx/libmdbx.mk b/package/libmdbx/libmdbx.mk
index 018c0db840..357b1bac9e 100644
--- a/package/libmdbx/libmdbx.mk
+++ b/package/libmdbx/libmdbx.mk
@@ -10,7 +10,6 @@ LIBMDBX_SITE = https://libmdbx.dqdkfa.ru/release
 LIBMDBX_SUPPORTS_IN_SOURCE_BUILD = NO
 LIBMDBX_LICENSE = OLDAP-2.8
 LIBMDBX_LICENSE_FILES = LICENSE
-LIBMDBX_REDISTRIBUTE = YES
 LIBMDBX_STRIP_COMPONENTS = 0
 LIBMDBX_INSTALL_STAGING = YES
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
