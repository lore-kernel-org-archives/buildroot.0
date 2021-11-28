Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C050C433F5
	for <buildroot@archiver.kernel.org>; Sun, 28 Nov 2021 13:40:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 10DDA82F80;
	Sun, 28 Nov 2021 13:40:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JRcsfcAmnU2Q; Sun, 28 Nov 2021 13:40:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7116682F6F;
	Sun, 28 Nov 2021 13:40:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4E62C1BF2CF
 for <buildroot@lists.busybox.net>; Sun, 28 Nov 2021 13:40:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4A45F82F80
 for <buildroot@lists.busybox.net>; Sun, 28 Nov 2021 13:40:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QluCkJravzaY for <buildroot@lists.busybox.net>;
 Sun, 28 Nov 2021 13:40:42 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9586882F6F
 for <buildroot@buildroot.org>; Sun, 28 Nov 2021 13:40:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 1A9D990898; Sun, 28 Nov 2021 13:36:04 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 28 Nov 2021 14:39:40 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7603576826fe56b6c9cdb5d6cf6e64af8007825b
X-Git-Newrev: 9f6a2dbe030b10eda2797430a87fffc34f8c4685
X-Patchwork-Hint: ignore
Message-Id: <20211128133604.1A9D990898@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/docker: don't use sudo to build
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

commit: https://git.buildroot.net/buildroot/commit/?id=9f6a2dbe030b10eda2797430a87fffc34f8c4685
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

On a properly setup machine, it is totally useless to use sudo to run
docker; it is very bad practice. Instead, users really should add
themselves to the docker group.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Romain Naour <romain.naour@gmail.com>
Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Reviewed-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/docker/Dockerfile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/support/docker/Dockerfile b/support/docker/Dockerfile
index 2aee129668..57445d5cd1 100644
--- a/support/docker/Dockerfile
+++ b/support/docker/Dockerfile
@@ -1,7 +1,7 @@
 # This Dockerfile generates the docker image that gets used by Gitlab CI
 # To build it (YYYYMMDD.HHMM is the current date and time in UTC):
-#   sudo docker build -t buildroot/base:YYYYMMDD.HHMM support/docker
-#   sudo docker push buildroot/base:YYYYMMDD.HHMM
+#   docker build -t buildroot/base:YYYYMMDD.HHMM support/docker
+#   docker push buildroot/base:YYYYMMDD.HHMM
 
 # We use a specific tag for the base image *and* the corresponding date
 # for the repository., so do not forget to update the apt-sources.list
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
