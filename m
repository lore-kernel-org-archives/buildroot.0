Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 322B4C433F5
	for <buildroot@archiver.kernel.org>; Sat, 20 Nov 2021 21:09:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AEF9740167;
	Sat, 20 Nov 2021 21:09:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RgNQZpuOt02p; Sat, 20 Nov 2021 21:08:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A7FD74014B;
	Sat, 20 Nov 2021 21:08:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3BF061BF362
 for <buildroot@lists.busybox.net>; Sat, 20 Nov 2021 21:08:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2B61640459
 for <buildroot@lists.busybox.net>; Sat, 20 Nov 2021 21:08:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WL1JPxP-2ULo for <buildroot@lists.busybox.net>;
 Sat, 20 Nov 2021 21:08:51 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 70BBF40448
 for <buildroot@buildroot.org>; Sat, 20 Nov 2021 21:08:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 83F68883F0; Sat, 20 Nov 2021 21:04:30 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 20 Nov 2021 22:08:27 +0100
X-Git-Refname: refs/heads/2021.08.x
X-Git-Oldrev: 7adae74a3883c657d6b559bab5ebbd8bc29c219e
X-Git-Newrev: 39f6f91b9b485869f7e99ddf68d0b259c56be556
X-Patchwork-Hint: ignore
Message-Id: <20211120210430.83F68883F0@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.08.x] support/docker: update
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

commit: https://git.buildroot.net/buildroot/commit/?id=39f6f91b9b485869f7e99ddf68d0b259c56be556
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.08.x

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
