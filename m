Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E300C4451C
	for <buildroot@archiver.kernel.org>; Fri, 17 Jul 2026 15:44:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 59E6A40A51;
	Fri, 17 Jul 2026 15:44:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qo8rUAiR5-UI; Fri, 17 Jul 2026 15:44:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 54E0E409D9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784303066;
	bh=Qz0t6OLk+J/iWSEzB1oP6EIFk/+XygMhPU/hmgIsXRY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=YPQXw7iK1GXsQZJ0Kie/GURGPv/K/vKlGx+Fc7Onj3lrmGO7JmkDGPWQerGk/nAMv
	 lsLjRa4t1fasI7gyeXA210uK9nmJRR38Hx8uvYkJzY+rBT1qfsI+J/lZwLNafv1TyI
	 HEuk+sCon5qM0rrqSEqJuVC47KvcwlaHYHQhipRbKzYPRVWy5eKyGeIO5kpWN2NC3c
	 MFQ4ZK7qpufL0oK2zlz0laCNRtGIkRL4t4Fn2iSj6GdgpIt8uGOGxBuHBN2zilaXel
	 PYSTEcPy6m6CTpD1Zfoy2PSp3u6/zO+EfENKwB/HkpyQK3LOZZP4q8T+j3DdtwXP9Z
	 yQpzxOh+Ohzlg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 54E0E409D9;
	Fri, 17 Jul 2026 15:44:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id E0944435
 for <buildroot@buildroot.org>; Fri, 17 Jul 2026 15:44:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D2FBD60732
 for <buildroot@buildroot.org>; Fri, 17 Jul 2026 15:44:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7UvT644TRpFG for <buildroot@buildroot.org>;
 Fri, 17 Jul 2026 15:44:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B4CD66065E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id B4CD66065E
 for <buildroot@buildroot.org>; Fri, 17 Jul 2026 15:44:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 710FB88E51; Fri, 17 Jul 2026 15:43:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 17 Jul 2026 10:51:21 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 135af563b945b8c3d18f8fd370370075b9edb140
X-Git-Newrev: b115701c06ca7123d9bd37616bbeec5efc7174bf
X-Patchwork-Hint: ignore
Message-Id: <20260717154343.710FB88E51@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] support/docker: make the
 image reproducible again
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b115701c06ca7123d9bd37616bbeec5efc7174bf
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

The Debian 12 Bookworm snapshot we use, 20250203, uses the new deb822
format [0] for source list files; it carries a source list file that
points to the current repository, not to the snapshot.

Even though we do inject an old-style source list that points to the
snapshot repository, the packages in the current repository are more
recent than the one in the snapshot, so when we install our packages,
they get retrieved mostly from the current repository rather than from
the snapshot. The image is not reproducible.

Switch to using the new deb822-style source list file.

Note: we do not need to carry the "Latest just before" trick: the
snapshot repository will use the most recent actual snapshot before the
requested dated, so we can just use the date of the image we use (stuck
at midnight because we don't have better).

Since the snapshot repository can be really slow, while at the same time
the remote http server not dropping connections, it can take a very long
while to build the image; add a timeout so that stale connections are
detected and re-attemped early-ish (the timeout applies to both the
connect and the actual download, so it should be large enough to
accomodate slowish network connections).

Fixes: c95d5b8e1eb9 (support/docker: move to current bookworm (Debian
12) snapshot)

[0] https://manpages.debian.org/trixie/apt/sources.list.5.en.html#DEB822-STYLE_FORMAT

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
Cc: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
(cherry picked from commit 3460675872a8c5a60ee45946794686ec544af042)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 support/docker/Dockerfile       | 11 +++++++----
 support/docker/apt-sources.list |  4 ----
 support/docker/debian.sources   | 13 +++++++++++++
 3 files changed, 20 insertions(+), 8 deletions(-)

diff --git a/support/docker/Dockerfile b/support/docker/Dockerfile
index e7677ac6a9..687eee8110 100644
--- a/support/docker/Dockerfile
+++ b/support/docker/Dockerfile
@@ -24,7 +24,7 @@ ARG TAR_VERSION="1.35"
 ENV DEBIAN_FRONTEND=noninteractive
 
 # This repository can be a bit slow at times. Don't panic...
-COPY apt-sources.list /etc/apt/sources.list
+COPY debian.sources /etc/apt/sources.list.d/debian.sources
 
 # Install 32bit variant on x86_64 image.
 RUN if [ "$TARGETPLATFORM" = "linux/amd64" ]; then \
@@ -32,15 +32,18 @@ RUN if [ "$TARGETPLATFORM" = "linux/amd64" ]; then \
 fi
 
 # The container has no package lists, so need to update first
-RUN apt-get -o APT::Retries=3 update -y
+RUN apt-get -o APT::Retries=3 -o APT::Acquire::http::Timeout=60 \
+        update -y
 
 RUN if [ "$TARGETPLATFORM" = "linux/amd64" ]; then \
-    apt-get -o APT::Retries=3 install -y --no-install-recommends \
+    apt-get -o APT::Retries=3 -o APT::Acquire::http::Timeout=60 \
+        install -y --no-install-recommends \
         g++-multilib \
         libc6:i386; \
 fi
 
-RUN apt-get -o APT::Retries=3 install -y --no-install-recommends \
+RUN apt-get -o APT::Retries=3 -o APT::Acquire::http::Timeout=60 \
+        install -y --no-install-recommends \
         bc \
         build-essential \
         bzr \
diff --git a/support/docker/apt-sources.list b/support/docker/apt-sources.list
deleted file mode 100644
index d6fbf85270..0000000000
--- a/support/docker/apt-sources.list
+++ /dev/null
@@ -1,4 +0,0 @@
-# Latest just before 20250218211000Z:
-deb [check-valid-until=no] http://snapshot.debian.org/archive/debian/20250218T144938Z/ bookworm main
-deb [check-valid-until=no] http://snapshot.debian.org/archive/debian-security/20250218T144938Z/ bookworm-security main
-deb [check-valid-until=no] http://snapshot.debian.org/archive/debian/20250218T144938Z/ bookworm-updates main
diff --git a/support/docker/debian.sources b/support/docker/debian.sources
new file mode 100644
index 0000000000..36e1eeb3e7
--- /dev/null
+++ b/support/docker/debian.sources
@@ -0,0 +1,13 @@
+Types: deb
+URIs: http://snapshot.debian.org/archive/debian/20250203T000000Z
+Suites: bookworm bookworm-updates
+Components: main
+Signed-By: /usr/share/keyrings/debian-archive-keyring.gpg
+Check-Valid-Until: no
+
+Types: deb
+URIs: http://snapshot.debian.org/archive/debian-security/20250203T000000Z
+Suites: bookworm-security
+Components: main
+Signed-By: /usr/share/keyrings/debian-archive-keyring.gpg
+Check-Valid-Until: no
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
