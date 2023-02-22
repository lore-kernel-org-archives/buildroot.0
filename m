Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E369C636D6
	for <buildroot@archiver.kernel.org>; Wed, 22 Feb 2023 17:15:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 16F5B40C4C;
	Wed, 22 Feb 2023 17:15:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 16F5B40C4C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3h-Em3C40gi5; Wed, 22 Feb 2023 17:15:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 50660417B1;
	Wed, 22 Feb 2023 17:15:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 50660417B1
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8B4F81BF364
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 17:08:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5A69F8142F
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 17:08:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5A69F8142F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UhPMm_Ajy_i2 for <buildroot@lists.busybox.net>;
 Wed, 22 Feb 2023 17:08:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id BC63E81FFF
 for <buildroot@buildroot.org>; Wed, 22 Feb 2023 17:08:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BC63E81FFF
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AC2FF867D2; Wed, 22 Feb 2023 17:08:18 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 22 Feb 2023 17:43:46 +0100
X-Git-Refname: refs/heads/2022.11.x
X-Git-Oldrev: 01f08ce374237ecb7f021194370ddbca04de08e7
X-Git-Newrev: f188f8aa499ab5a8feddf3bc98ced0eecaf9f215
X-Patchwork-Hint: ignore
Message-Id: <20230222170818.AC2FF867D2@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.11.x] package/busybox: add
 comment about variable override
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

commit: https://git.buildroot.net/buildroot/commit/?id=f188f8aa499ab5a8feddf3bc98ced0eecaf9f215
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.11.x

The same comment already exists for UCLIBC_CONFIG_FILE.
Both variables can be override from command-line, as described in the
manual, at section 'Environment variables'.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 01c0fb3862bce6605881d9e32c29b5f7373bb2f9)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/busybox/busybox.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index ef628e90e9..0f14bf999d 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -108,6 +108,8 @@ BUSYBOX_MAKE_OPTS = \
 	CONFIG_PREFIX="$(TARGET_DIR)" \
 	SKIP_STRIP=y
 
+# specifying BUSYBOX_CONFIG_FILE on the command-line overrides the .config
+# setting.
 ifndef BUSYBOX_CONFIG_FILE
 BUSYBOX_CONFIG_FILE = $(call qstrip,$(BR2_PACKAGE_BUSYBOX_CONFIG))
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
