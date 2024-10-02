Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14E03CEACF3
	for <buildroot@archiver.kernel.org>; Wed,  2 Oct 2024 19:43:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B736161185;
	Wed,  2 Oct 2024 19:43:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TXgl2mcdj7xG; Wed,  2 Oct 2024 19:43:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D21B6605E4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D21B6605E4;
	Wed,  2 Oct 2024 19:43:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7543A1BF2EF
 for <buildroot@lists.busybox.net>; Wed,  2 Oct 2024 19:43:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D203B60619
 for <buildroot@lists.busybox.net>; Wed,  2 Oct 2024 19:43:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0JXzNnzUwjOj for <buildroot@lists.busybox.net>;
 Wed,  2 Oct 2024 19:43:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CAE65605E4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id CAE65605E4
 for <buildroot@buildroot.org>; Wed,  2 Oct 2024 19:43:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B5A1184649; Wed,  2 Oct 2024 19:43:06 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 2 Oct 2024 20:28:30 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b2fdc16c479b7d430cda57df10371c80dddb56ca
X-Git-Newrev: 17bdd10cb350e9c45926c2a5a05f278d104ee4c9
X-Patchwork-Hint: ignore
Message-Id: <20241002194306.B5A1184649@busybox.osuosl.org>
Subject: [Buildroot] [git commit] docs/manual: do not instruct doctoring the
 saved defconfig
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

commit: https://git.buildroot.net/buildroot/commit/?id=17bdd10cb350e9c45926c2a5a05f278d104ee4c9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Doctoring a defconfig is tedious, and it is not easy to update a
defconfig, as it requires manual copy-pasting, adding comments and so
on...

Instead, just require defconfigs to be generated with 'savedefconfig'.
Any details can/must be provided in the commit log.

Reported-by: Edgar Bonet <bonet@grenoble.cnrs.fr>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 docs/manual/adding-board-support.adoc | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/docs/manual/adding-board-support.adoc b/docs/manual/adding-board-support.adoc
index be7699668d..0f7d534603 100644
--- a/docs/manual/adding-board-support.adoc
+++ b/docs/manual/adding-board-support.adoc
@@ -22,11 +22,7 @@ selections are highly application-specific.
 Once you have a known working configuration, run +make
 savedefconfig+. This will generate a minimal +defconfig+ file at the
 root of the Buildroot source tree. Move this file into the +configs/+
-directory, and rename it +<boardname>_defconfig+. If the configuration
-is a bit more complicated, it is nice to manually reformat it and
-separate it into sections, with a comment before each section. Typical
-sections are _Architecture_, _Toolchain options_ (typically just linux
-headers version), _Firmware_, _Bootloader_, _Kernel_, and _Filesystem_.
+directory, and rename it +<boardname>_defconfig+.
 
 Always use fixed versions or commit hashes for the different
 components, not the "latest" version. For example, set
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
