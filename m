Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75A47C61DA3
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 01:36:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1D71070085;
	Tue, 21 Feb 2023 01:36:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1D71070085
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xVWrjCH12Wes; Tue, 21 Feb 2023 01:36:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 67E3470082;
	Tue, 21 Feb 2023 01:36:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 67E3470082
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 45A7D1BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 21:04:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6B1046FE58
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6B1046FE58
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id L5TgY6_Nwk-M for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:50 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8C7E96FC19
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8C7E96FC19
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8A728828C8; Mon, 20 Feb 2023 20:52:50 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 6 Feb 2023 18:54:18 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: efccb2a7dd909f8f9b316d809859b9434a2737b0
X-Git-Newrev: bcd15aa08aab1e8292b93995c44dc765a9801632
X-Patchwork-Hint: ignore
Message-Id: <20230220205250.8A728828C8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] support/docker: add
 python3-magic
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
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

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
