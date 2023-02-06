Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 274FFC05027
	for <buildroot@archiver.kernel.org>; Mon,  6 Feb 2023 21:09:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B03E460BFB;
	Mon,  6 Feb 2023 21:09:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B03E460BFB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nsNVKSvpxGqe; Mon,  6 Feb 2023 21:09:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DC12D60BFE;
	Mon,  6 Feb 2023 21:09:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DC12D60BFE
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B437D1BF955
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 21:08:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8E4BC4173E
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 21:08:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8E4BC4173E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rblUdIvNHHjw for <buildroot@lists.busybox.net>;
 Mon,  6 Feb 2023 21:08:54 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A8D814173B
 for <buildroot@buildroot.org>; Mon,  6 Feb 2023 21:08:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A8D814173B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 962E583CFE; Mon,  6 Feb 2023 21:08:54 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 6 Feb 2023 18:54:18 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: efccb2a7dd909f8f9b316d809859b9434a2737b0
X-Git-Newrev: bcd15aa08aab1e8292b93995c44dc765a9801632
X-Patchwork-Hint: ignore
Message-Id: <20230206210854.962E583CFE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/docker: add python3-magic
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=bcd15aa08aab1e8292b93995c44dc765a9801632
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It will be needed by check-package to run checks according to the file
type (the same determined by the command 'file').

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/docker/Dockerfile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/support/docker/Dockerfile b/support/docker/Dockerfile
index f54c31b54a..d775ae23e1 100644
--- a/support/docker/Dockerfile
+++ b/support/docker/Dockerfile
@@ -39,6 +39,7 @@ RUN apt-get install -y --no-install-recommends \
         openssh-server \
         python3 \
         python3-flake8 \
+        python3-magic \
         python3-nose2 \
         python3-pexpect \
         python3-pytest \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
