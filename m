Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43AB4C433F5
	for <buildroot@archiver.kernel.org>; Sat, 20 Nov 2021 21:09:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 83FC04047B;
	Sat, 20 Nov 2021 21:09:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 94Q8xawAC4gU; Sat, 20 Nov 2021 21:09:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8C71040490;
	Sat, 20 Nov 2021 21:09:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B6BD31BF362
 for <buildroot@lists.busybox.net>; Sat, 20 Nov 2021 21:09:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B371840490
 for <buildroot@lists.busybox.net>; Sat, 20 Nov 2021 21:09:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 96gQjPhd0idd for <buildroot@lists.busybox.net>;
 Sat, 20 Nov 2021 21:09:12 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0D1A94047B
 for <buildroot@buildroot.org>; Sat, 20 Nov 2021 21:09:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 1A7F288430; Sat, 20 Nov 2021 21:04:51 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 20 Nov 2021 22:07:47 +0100
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 29632cdd2450a1b25bfb43986fe5362a8f29781a
X-Git-Newrev: b39c10e2846bddbf63b7bb62ab8f81679b9c06ca
X-Patchwork-Hint: ignore
Message-Id: <20211120210451.1A7F288430@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] support/docker: update
 the stretch image
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

commit: https://git.buildroot.net/buildroot/commit/?id=b39c10e2846bddbf63b7bb62ab8f81679b9c06ca
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

The current stretch image we are using on the maintenance branches still
has the old Let's Encrypt certificate that expired a few weeks ago,
causign a lot of download errors:

Suggested-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/docker/Dockerfile       | 4 ++--
 support/docker/apt-sources.list | 8 ++++----
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/support/docker/Dockerfile b/support/docker/Dockerfile
index a9bacca3a0..9bd62a04fe 100644
--- a/support/docker/Dockerfile
+++ b/support/docker/Dockerfile
@@ -4,9 +4,9 @@
 #   sudo docker push buildroot/base:YYYYMMDD.HHMM
 
 # We use a specific tag for the base image *and* the corresponding date
-# for the repository., so do not forget to update the apt-sources.list
+# for the repository, so do not forget to update the apt-sources.list
 # file that is shipped next to this Dockerfile.
-FROM debian:stretch-20171210
+FROM debian:stretch-20211115
 
 LABEL maintainer="Buildroot mailing list <buildroot@buildroot.org>" \
       vendor="Buildroot" \
diff --git a/support/docker/apt-sources.list b/support/docker/apt-sources.list
index 789fb8fc17..785b6a0d4e 100644
--- a/support/docker/apt-sources.list
+++ b/support/docker/apt-sources.list
@@ -1,4 +1,4 @@
-# Latest just before 20171210T000000Z:
-deb [check-valid-until=no] http://snapshot.debian.org/archive/debian/20171209T220346Z/ stretch main
-deb [check-valid-until=no] http://snapshot.debian.org/archive/debian/20171209T220346Z/ stretch-updates main
-deb [check-valid-until=no] http://snapshot.debian.org/archive/debian-security/20171209T224618Z/ stretch/updates main
+# Latest just before 20211115T000000Z:
+deb [check-valid-until=no] http://snapshot.debian.org/archive/debian/20211114T204852Z/ stretch main
+deb [check-valid-until=no] http://snapshot.debian.org/archive/debian/20211115T000000Z/ stretch-updates main
+deb [check-valid-until=no] http://snapshot.debian.org/archive/debian-security/20211114T121535Z/ stretch/updates main
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
