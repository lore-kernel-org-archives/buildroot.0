Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2930ECD6E77
	for <buildroot@archiver.kernel.org>; Fri,  5 Jun 2026 12:37:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ED54960A72;
	Fri,  5 Jun 2026 12:37:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g8RFHk8JAv4s; Fri,  5 Jun 2026 12:37:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2719360A81
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780663059;
	bh=YzMGGqFh8yrpEoLMBI1EPHCVfuoWvkvQlZzwI1D4V0M=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=pZdcQVUMyL9QrUDTeKUrzKmUSkBmoic+A9sEdlcVn/3oDv65C29Zk3tVD/Ok3B4V4
	 XecPjQMZG/5Z3u4lxsIEcS6O7462PJAuz1E2wwSQm60f9t+Za6H1Uy6ulKl/urYUYd
	 OIKt1QpCrc5Q9gzr1ISmfQBqSXkiWNjmsrn5Lg74pgH44olD2ZaPAAOQS5gtUfvRTu
	 Wy+CqnawQF2dZFa521DUz4cqEEu2OWNrzCP1djNcBLAoYDAyBSpL91OUtD9dLSzpRF
	 ZtD73K2BiPQt9sVfRDupWBXAc9UBrnhhy9KbC2YNU+XAUKvJ/BKCX+2t9OFmFCjZgh
	 XhxIk022Ao7DA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2719360A81;
	Fri,  5 Jun 2026 12:37:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id A514B388
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:37:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9209640334
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:37:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ecS12MtKILzL for <buildroot@buildroot.org>;
 Fri,  5 Jun 2026 12:37:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3A8704038B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3A8704038B
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:37:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 57B2687B42; Fri,  5 Jun 2026 12:37:10 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 4 Jun 2026 10:21:42 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 2c8bcb90fe22d2d00a4cccd9bc0c74f5ee0eb99b
X-Git-Newrev: 5539ab24909e9a27437184122fcbab6a6bcb3944
X-Patchwork-Hint: ignore
Message-Id: <20260605123710.57B2687B42@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/nginx: security
 bump version to 1.30.2
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/5539ab24909e9a27437184122fcbab6a6bcb3944
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

https://nginx.org/en/CHANGES-1.30

https://nginx.org/en/security_advisories.html

1.30.2: Fixes CVE-2026-9256
1.30.1: Fixes CVE-2026-42926 (only from 1.29.4), CVE-2026-42945,
CVE-2026-42946, CVE-2026-42934, CVE-2026-40460 & CVE-2026-40701.

Updated license hash due to copyright year bump:
https://github.com/nginx/nginx/commit/7fa941a55e211ebd57f512fbfb24d59dbb97940d

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
[Peter: clarify CVE-2026-42926]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 0455e2571d35b642115e9122159ace0ce803fceb)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/nginx/nginx.hash | 4 ++--
 package/nginx/nginx.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/nginx/nginx.hash b/package/nginx/nginx.hash
index 1d11937987..5055b4bd57 100644
--- a/package/nginx/nginx.hash
+++ b/package/nginx/nginx.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-sha256  2c96a946bfb0882a21744ed429770a2123ae1828c7c48665092993ddee91a918  nginx-1.28.3.tar.gz
+sha256  7df3090907fca3cc0e456d6dc00ceb230da74ea88026ceff0affc29dbbd9ac4c  nginx-1.30.2.tar.gz
 # License files, locally calculated
-sha256  77c01620abf36ed747b7eca4bd271e49023fe3a8e2b3525bcf4b09c8e3aa28e4  LICENSE
+sha256  08845fe39e06b51dad7685c28140ab49577a86e947523e16b536a46caf89ad5c  LICENSE
diff --git a/package/nginx/nginx.mk b/package/nginx/nginx.mk
index a8b7ee7319..3f6aecebef 100644
--- a/package/nginx/nginx.mk
+++ b/package/nginx/nginx.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NGINX_VERSION = 1.28.3
+NGINX_VERSION = 1.30.2
 NGINX_SITE = https://nginx.org/download
 NGINX_LICENSE = BSD-2-Clause
 NGINX_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
