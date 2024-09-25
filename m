Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4EF7CCF9EC
	for <buildroot@archiver.kernel.org>; Wed, 25 Sep 2024 18:55:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A518561216;
	Wed, 25 Sep 2024 18:55:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OT4kalCuZTZv; Wed, 25 Sep 2024 18:55:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A0588613CA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A0588613CA;
	Wed, 25 Sep 2024 18:55:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 686CE1BF97E
 for <buildroot@lists.busybox.net>; Wed, 25 Sep 2024 18:55:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F0D3A611CA
 for <buildroot@lists.busybox.net>; Wed, 25 Sep 2024 18:54:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IMP2vliTFwrr for <buildroot@lists.busybox.net>;
 Wed, 25 Sep 2024 18:54:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3AAB6611CB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3AAB6611CB
 for <buildroot@buildroot.org>; Wed, 25 Sep 2024 18:54:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 37795844BB; Wed, 25 Sep 2024 18:54:57 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 25 Sep 2024 20:44:03 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4c5d82ea058edd74a5423f621543f9cffb162179
X-Git-Newrev: 5af5c0ac0b6057d1c4fe1dc6c6ec208c4fea8a10
X-Patchwork-Hint: ignore
Message-Id: <20240925185457.37795844BB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/softether: fix typos in patch
 description
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

commit: https://git.buildroot.net/buildroot/commit/?id=5af5c0ac0b6057d1c4fe1dc6c6ec208c4fea8a10
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/softether/0003-use-fhs-install-directories.patch | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/softether/0003-use-fhs-install-directories.patch b/package/softether/0003-use-fhs-install-directories.patch
index ba00d9b676..f3da52c44f 100644
--- a/package/softether/0003-use-fhs-install-directories.patch
+++ b/package/softether/0003-use-fhs-install-directories.patch
@@ -7,8 +7,8 @@ Install to `/usr/sbin`, `/usr/lib`, and `/var/lib` according to the Linux
 filesystem hierarchy standard if SoftEther is built through autotools.
 
 In a managed installation, the FHS stipulates that the application must
-accomodate a read-only installation path.  This requires a new `GetStateDir`
-function that substitues `GetExeDir` in some parts of the code.
+accommodate a read-only installation path.  This requires a new `GetStateDir`
+function that substitutes `GetExeDir` in some parts of the code.
 
 Taken from Github at
 https://github.com/dajhorn/SoftEtherVPN/commit/b9420c3bfc2a8b9d35d0c8e5f6849007c2bc21fa.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
