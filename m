Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F720CE8D62
	for <buildroot@archiver.kernel.org>; Thu, 19 Sep 2024 09:17:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DD9DD4329A;
	Thu, 19 Sep 2024 09:17:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0zxDH5bfLCxK; Thu, 19 Sep 2024 09:17:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7DA1B4326E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7DA1B4326E;
	Thu, 19 Sep 2024 09:17:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 19E741BF97E
 for <buildroot@lists.busybox.net>; Thu, 19 Sep 2024 09:16:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EF62884963
 for <buildroot@lists.busybox.net>; Thu, 19 Sep 2024 09:16:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LfCL5pp7Fg0e for <buildroot@lists.busybox.net>;
 Thu, 19 Sep 2024 09:16:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9B871849CB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9B871849CB
 for <buildroot@buildroot.org>; Thu, 19 Sep 2024 09:16:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 983B883C66; Thu, 19 Sep 2024 09:16:06 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 19 Sep 2024 11:04:26 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 3afbac1c861c3a9999a0455f9779bff1c55ee626
X-Git-Newrev: 460a6c3d2630ae9de5efe9220e5e51a317a5286a
X-Patchwork-Hint: ignore
Message-Id: <20240919091606.983B883C66@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/alure: fix
 grammar and dependencies typo in comment
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

commit: https://git.buildroot.net/buildroot/commit/?id=460a6c3d2630ae9de5efe9220e5e51a317a5286a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
[yann.morin.1998@free.fr: fix grammar]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 43357baf4b7bc370f216c38a9df4b17fa6710e80)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/alure/alure.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/alure/alure.mk b/package/alure/alure.mk
index f0eca8a2ee..fe27bfd12b 100644
--- a/package/alure/alure.mk
+++ b/package/alure/alure.mk
@@ -12,8 +12,8 @@ ALURE_INSTALL_STAGING = YES
 
 ALURE_DEPENDENCIES = openal
 
-# Disabling alure examples remove the dependecies on physfs and dump libraries.
-# Enable at least one built-in decoder (wave).
+# Disabling alure examples removes the dependencies on physfs and dump
+# libraries. Enable at least one built-in decoder (wave).
 ALURE_CONF_OPTS = -DALURE_INSTALL=ON \
 	-DALURE_BUILD_EXAMPLES=OFF \
 	-DALURE_ENABLE_WAVE=ON
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
