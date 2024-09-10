Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ED7AEDE9BF
	for <buildroot@archiver.kernel.org>; Tue, 10 Sep 2024 20:52:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1AADE608FC;
	Tue, 10 Sep 2024 20:52:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gaPVXxvsnlbk; Tue, 10 Sep 2024 20:52:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E922560A67
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E922560A67;
	Tue, 10 Sep 2024 20:52:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1296B1BF4D8
 for <buildroot@lists.busybox.net>; Tue, 10 Sep 2024 20:51:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 09F0040B93
 for <buildroot@lists.busybox.net>; Tue, 10 Sep 2024 20:51:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iyraZO9QV9QA for <buildroot@lists.busybox.net>;
 Tue, 10 Sep 2024 20:51:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C377F4024D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C377F4024D
 for <buildroot@buildroot.org>; Tue, 10 Sep 2024 20:51:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C005086F5D; Tue, 10 Sep 2024 20:51:30 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 10 Sep 2024 22:49:22 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cd6584715ea4cec33d587ccb965fc599081c6233
X-Git-Newrev: 43357baf4b7bc370f216c38a9df4b17fa6710e80
X-Patchwork-Hint: ignore
Message-Id: <20240910205130.C005086F5D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/alure: fix grammar and
 dependencies typo in comment
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

commit: https://git.buildroot.net/buildroot/commit/?id=43357baf4b7bc370f216c38a9df4b17fa6710e80
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
[yann.morin.1998@free.fr: fix grammar]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
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
