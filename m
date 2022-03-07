Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2705C4332F
	for <buildroot@archiver.kernel.org>; Mon,  7 Mar 2022 21:49:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A13BF60EE3;
	Mon,  7 Mar 2022 21:49:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id orpFk4K7iNn5; Mon,  7 Mar 2022 21:49:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B87C360EF3;
	Mon,  7 Mar 2022 21:49:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B5DA41BF2C3
 for <buildroot@lists.busybox.net>; Mon,  7 Mar 2022 21:49:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A60AA41733
 for <buildroot@lists.busybox.net>; Mon,  7 Mar 2022 21:49:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5VEmJtZXMmqT for <buildroot@lists.busybox.net>;
 Mon,  7 Mar 2022 21:49:23 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3EC2F415BF
 for <buildroot@buildroot.org>; Mon,  7 Mar 2022 21:49:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 6A59982941; Mon,  7 Mar 2022 21:40:59 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 7 Mar 2022 22:48:02 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9fa5d641ac4951087bb007e091a799101d294527
X-Git-Newrev: 1e1976a25d2a967759fddb747a074343678b42ef
X-Patchwork-Hint: ignore
Message-Id: <20220307214059.6A59982941@busybox.osuosl.org>
Subject: [Buildroot] [git commit] manual: board support: add instructions to
 test defconfig in the official docker
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

commit: https://git.buildroot.net/buildroot/commit/?id=1e1976a25d2a967759fddb747a074343678b42ef
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Sometimes new boards have not been tested with official docker so let's add
instructions to do it with utils/docker-run.

Cc: Luca Ceresoli <luca@lucaceresoli.net>
Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Reviewed-by: Luca Ceresoli <luca@lucaceresoli.net>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 docs/manual/adding-board-support.txt | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/docs/manual/adding-board-support.txt b/docs/manual/adding-board-support.txt
index 33ed709535..cd90a5871f 100644
--- a/docs/manual/adding-board-support.txt
+++ b/docs/manual/adding-board-support.txt
@@ -46,3 +46,11 @@ create a directory +board/<manufacturer>+ and a subdirectory
 +board/<manufacturer>/<boardname>+. You can then store your patches
 and configurations in these directories, and reference them from the main
 Buildroot configuration. Refer to xref:customize[] for more details.
+
+Before submitting patches for new boards it is recommended to test it by
+building it using latest gitlab-CI docker container. To do this use
+utils/docker-run script and inside it issue these commands:
+--------------------
+ $ make +<boardname>_defconfig+
+ $ make
+--------------------
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
