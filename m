Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65909C77B61
	for <buildroot@archiver.kernel.org>; Sun, 16 Apr 2023 12:34:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EFDB6820DC;
	Sun, 16 Apr 2023 12:34:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EFDB6820DC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6HQjkfqzE6JI; Sun, 16 Apr 2023 12:34:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3286182102;
	Sun, 16 Apr 2023 12:34:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3286182102
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B62641C3862
 for <buildroot@lists.busybox.net>; Sun, 16 Apr 2023 12:34:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9D03760E49
 for <buildroot@lists.busybox.net>; Sun, 16 Apr 2023 12:34:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9D03760E49
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bfp76k22Sdqe for <buildroot@lists.busybox.net>;
 Sun, 16 Apr 2023 12:34:30 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 902F260E30
 for <buildroot@buildroot.org>; Sun, 16 Apr 2023 12:34:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 902F260E30
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7AC7C841FF; Sun, 16 Apr 2023 12:34:30 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 16 Apr 2023 14:33:42 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d9228faa4dbda084168e3c83273e651c05b6b08b
X-Git-Newrev: 4468f828859de1f4be82655d63e96d59e760db7d
X-Patchwork-Hint: ignore
Message-Id: <20230416123430.7AC7C841FF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] doc/manual: fix formatting slightly
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

commit: https://git.buildroot.net/buildroot/commit/?id=4468f828859de1f4be82655d63e96d59e760db7d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thierry GUIBERT <thierry.guibert@croix-rouge.fr>
[yann.morin.1998@free.fr: split off the previous patch by Thierry]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 docs/manual/adding-board-support.txt | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/docs/manual/adding-board-support.txt b/docs/manual/adding-board-support.txt
index b3a8802452..ef6dbd3c2b 100644
--- a/docs/manual/adding-board-support.txt
+++ b/docs/manual/adding-board-support.txt
@@ -49,9 +49,10 @@ Buildroot configuration. Refer to xref:customize[] for more details.
 
 Before submitting patches for new boards it is recommended to test it by
 building it using latest gitlab-CI docker container. To do this use
-utils/docker-run script and inside it issue these commands:
++utils/docker-run+ script and inside it issue these commands:
+
 --------------------
- $ make +<boardname>_defconfig+
+ $ make <boardname>_defconfig
  $ make
 --------------------
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
