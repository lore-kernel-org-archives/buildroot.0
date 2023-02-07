Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31171C636CC
	for <buildroot@archiver.kernel.org>; Tue,  7 Feb 2023 17:21:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9820B61033;
	Tue,  7 Feb 2023 17:21:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9820B61033
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IP1R7F8PSKok; Tue,  7 Feb 2023 17:21:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C098C60BC8;
	Tue,  7 Feb 2023 17:21:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C098C60BC8
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B228D1BF95C
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 17:19:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8C1016100C
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 17:19:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8C1016100C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4UoM_p5AE5gN for <buildroot@lists.busybox.net>;
 Tue,  7 Feb 2023 17:19:38 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id CB65360BB1
 for <buildroot@buildroot.org>; Tue,  7 Feb 2023 17:19:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CB65360BB1
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7E5E48430A; Tue,  7 Feb 2023 17:19:38 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 7 Feb 2023 18:14:59 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f9867a725c12975af52dda9dffbdc33c3b0312db
X-Git-Newrev: d24c6f4b15f4794046e8e1ee220298c90ddecd19
X-Patchwork-Hint: ignore
Message-Id: <20230207171938.7E5E48430A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/docker: update Debian distro to a
 newer tag/date
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

commit: https://git.buildroot.net/buildroot/commit/?id=d24c6f4b15f4794046e8e1ee220298c90ddecd19
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 support/docker/Dockerfile       | 2 +-
 support/docker/apt-sources.list | 8 ++++----
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/support/docker/Dockerfile b/support/docker/Dockerfile
index d775ae23e1..de1534e77a 100644
--- a/support/docker/Dockerfile
+++ b/support/docker/Dockerfile
@@ -6,7 +6,7 @@
 # We use a specific tag for the base image *and* the corresponding date
 # for the repository., so do not forget to update the apt-sources.list
 # file that is shipped next to this Dockerfile.
-FROM debian:bullseye-20210902
+FROM debian:bullseye-20230202
 
 LABEL maintainer="Buildroot mailing list <buildroot@buildroot.org>" \
       vendor="Buildroot" \
diff --git a/support/docker/apt-sources.list b/support/docker/apt-sources.list
index 0f872fd398..849996d9f7 100644
--- a/support/docker/apt-sources.list
+++ b/support/docker/apt-sources.list
@@ -1,4 +1,4 @@
-# Latest just before 20210817T000000Z:
-deb [check-valid-until=no] http://snapshot.debian.org/archive/debian/20210902T205533Z/ bullseye main
-deb [check-valid-until=no] http://snapshot.debian.org/archive/debian-security/20210902T193650Z/ bullseye-security main
-deb [check-valid-until=no] http://snapshot.debian.org/archive/debian/20210902T205533Z/ bullseye-updates main
+# Latest just before 20230207T102800Z:
+deb [check-valid-until=no] http://snapshot.debian.org/archive/debian/20230206T092119Z/ bullseye main
+deb [check-valid-until=no] http://snapshot.debian.org/archive/debian-security/20230206T092119Z/ bullseye-security main
+deb [check-valid-until=no] http://snapshot.debian.org/archive/debian/20230206T092119Z/ bullseye-updates main
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
