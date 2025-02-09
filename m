Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05527C0219B
	for <buildroot@archiver.kernel.org>; Sun,  9 Feb 2025 21:22:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AE93A400CB;
	Sun,  9 Feb 2025 21:22:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nnB1wLHTqeDB; Sun,  9 Feb 2025 21:22:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A2B7F4074F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A2B7F4074F;
	Sun,  9 Feb 2025 21:22:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id AAA4EC2
 for <buildroot@buildroot.org>; Sun,  9 Feb 2025 21:22:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A57E881E63
 for <buildroot@buildroot.org>; Sun,  9 Feb 2025 21:22:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cUVGN01bi4dJ for <buildroot@buildroot.org>;
 Sun,  9 Feb 2025 21:22:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D43B281E61
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D43B281E61
 for <buildroot@buildroot.org>; Sun,  9 Feb 2025 21:22:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BF8B187491; Sun,  9 Feb 2025 21:22:42 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 9 Feb 2025 22:18:28 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e85cd58fc5af453335645b85b73e387284fc10e2
X-Git-Newrev: c95d5b8e1eb9ee04e3e9218c63e9e7bc489e0846
X-Patchwork-Hint: ignore
Message-Id: <20250209212242.BF8B187491@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/docker: move to current bookworm
 (Debian 12) snapshot
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

commit: https://git.buildroot.net/buildroot/commit/?id=c95d5b8e1eb9ee04e3e9218c63e9e7bc489e0846
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Debian 11 is out of security support since 15 August 2024, so move to
current Debian 12 instead.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/docker/Dockerfile       | 2 +-
 support/docker/apt-sources.list | 8 ++++----
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/support/docker/Dockerfile b/support/docker/Dockerfile
index 6f76cd5114..baab3cadbc 100644
--- a/support/docker/Dockerfile
+++ b/support/docker/Dockerfile
@@ -6,7 +6,7 @@
 # We use a specific tag for the base image *and* the corresponding date
 # for the repository., so do not forget to update the apt-sources.list
 # file that is shipped next to this Dockerfile.
-FROM debian:bullseye-20230202
+FROM debian:bookworm-20250203
 
 LABEL maintainer="Buildroot mailing list <buildroot@buildroot.org>" \
       vendor="Buildroot" \
diff --git a/support/docker/apt-sources.list b/support/docker/apt-sources.list
index 849996d9f7..ddbe15eed8 100644
--- a/support/docker/apt-sources.list
+++ b/support/docker/apt-sources.list
@@ -1,4 +1,4 @@
-# Latest just before 20230207T102800Z:
-deb [check-valid-until=no] http://snapshot.debian.org/archive/debian/20230206T092119Z/ bullseye main
-deb [check-valid-until=no] http://snapshot.debian.org/archive/debian-security/20230206T092119Z/ bullseye-security main
-deb [check-valid-until=no] http://snapshot.debian.org/archive/debian/20230206T092119Z/ bullseye-updates main
+# Latest just before 20250205151400Z:
+deb [check-valid-until=no] http://snapshot.debian.org/archive/debian/20250205T145632Z/ bookworm main
+deb [check-valid-until=no] http://snapshot.debian.org/archive/debian-security/20250205T145632Z/ bookworm-security main
+deb [check-valid-until=no] http://snapshot.debian.org/archive/debian/20250205T145632Z/ bookworm-updates main
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
