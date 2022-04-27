Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEF80C433FE
	for <buildroot@archiver.kernel.org>; Wed, 27 Apr 2022 17:19:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AF72741A58;
	Wed, 27 Apr 2022 17:19:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1NDSfL9GpKIy; Wed, 27 Apr 2022 17:19:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BDEF541A6E;
	Wed, 27 Apr 2022 17:19:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 481891BF9B6
 for <buildroot@lists.busybox.net>; Wed, 27 Apr 2022 17:18:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E36B460701
 for <buildroot@lists.busybox.net>; Wed, 27 Apr 2022 17:18:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gHfA78bhsKc6 for <buildroot@lists.busybox.net>;
 Wed, 27 Apr 2022 17:18:25 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5424F60E4B
 for <buildroot@buildroot.org>; Wed, 27 Apr 2022 17:18:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id D69F6845FA; Wed, 27 Apr 2022 17:08:06 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Wed, 27 Apr 2022 19:16:48 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e10fefaeab89a3183f4fd7a8bc6c64e6ab6b5d49
X-Git-Newrev: 78fd43c5924e4c24804027e4bb6722e97fd5d942
X-Patchwork-Hint: ignore
Message-Id: <20220427170806.D69F6845FA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/openjdk: enable for host
 architecture aarch64
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

commit: https://git.buildroot.net/buildroot/commit/?id=78fd43c5924e4c24804027e4bb6722e97fd5d942
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Christian Ambach <ambi@samba.org>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/openjdk/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/openjdk/Config.in b/package/openjdk/Config.in
index 8b7fd4653e..8fbe51a27f 100644
--- a/package/openjdk/Config.in
+++ b/package/openjdk/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_HOST_OPENJDK_BIN_ARCH_SUPPORTS
 	bool
 	default y if BR2_HOSTARCH = "x86_64"
+	default y if BR2_HOSTARCH = "aarch64"
 
 # Taken from make/autoconf/platform.m4
 config BR2_PACKAGE_OPENJDK_ARCH_SUPPORTS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
