Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0831C04A95
	for <buildroot@archiver.kernel.org>; Wed, 28 Sep 2022 21:22:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2FA0D60E2E;
	Wed, 28 Sep 2022 21:22:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2FA0D60E2E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vccS0xHeSysq; Wed, 28 Sep 2022 21:22:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5DCBA60E50;
	Wed, 28 Sep 2022 21:22:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5DCBA60E50
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 228391BF3DB
 for <buildroot@lists.busybox.net>; Wed, 28 Sep 2022 21:22:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F2C8140154
 for <buildroot@lists.busybox.net>; Wed, 28 Sep 2022 21:22:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F2C8140154
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MU6xeh7fbijZ for <buildroot@lists.busybox.net>;
 Wed, 28 Sep 2022 21:22:20 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E4078400C4
 for <buildroot@buildroot.org>; Wed, 28 Sep 2022 21:22:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E4078400C4
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D263C86422; Wed, 28 Sep 2022 21:22:19 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 28 Sep 2022 22:54:33 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 6744d56f74f5e459408d6034bab7469adb04fdd8
X-Git-Newrev: abd6690aaa37908ade3284bf544d9e64e78ae256
X-Patchwork-Hint: ignore
Message-Id: <20220928212219.D263C86422@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/libmdbx: drop
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

commit: https://git.buildroot.net/buildroot/commit/?id=abd6690aaa37908ade3284bf544d9e64e78ae256
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

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
