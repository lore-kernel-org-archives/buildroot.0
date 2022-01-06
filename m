Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91CC9C433F5
	for <buildroot@archiver.kernel.org>; Thu,  6 Jan 2022 08:39:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 50DA58291A;
	Thu,  6 Jan 2022 08:39:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UXJGcQPGlSa6; Thu,  6 Jan 2022 08:39:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B80B282865;
	Thu,  6 Jan 2022 08:39:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D18C21BF422
 for <buildroot@lists.busybox.net>; Thu,  6 Jan 2022 08:38:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CEA60428B4
 for <buildroot@lists.busybox.net>; Thu,  6 Jan 2022 08:38:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3VnAx3I_BCb2 for <buildroot@lists.busybox.net>;
 Thu,  6 Jan 2022 08:38:50 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0B4D3428B5
 for <buildroot@buildroot.org>; Thu,  6 Jan 2022 08:38:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id BA00183455; Thu,  6 Jan 2022 08:32:42 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 6 Jan 2022 09:34:05 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a2f11c0cbf312b339ae9c686a7734494a096ec24
X-Git-Newrev: a5d2400950fc053119bae0ceff047b3c9b4afa45
X-Patchwork-Hint: ignore
Message-Id: <20220106083242.BA00183455@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/docker: Add openssh-server
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

commit: https://git.buildroot.net/buildroot/commit/?id=a5d2400950fc053119bae0ceff047b3c9b4afa45
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Install the openssh-server package into the test container. This
package, as well as its dependency openssh-client, is required to test
SCP and SFTP download methods on the localhost, as if these tools were
already installed on the user's machine.

Signed-off-by: Thomas Preston <thomas.preston@codethink.co.uk>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 support/docker/Dockerfile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/support/docker/Dockerfile b/support/docker/Dockerfile
index ad8704873c..5ca087546e 100644
--- a/support/docker/Dockerfile
+++ b/support/docker/Dockerfile
@@ -36,6 +36,7 @@ RUN apt-get install -y --no-install-recommends \
         libncurses5-dev \
         locales \
         mercurial \
+        openssh-server \
         python3 \
         python3-flake8 \
         python3-nose2 \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
