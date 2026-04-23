Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53D9CFED3F1
	for <buildroot@archiver.kernel.org>; Fri, 24 Apr 2026 16:38:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2BCBA4299B;
	Fri, 24 Apr 2026 16:38:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OsOKPsZOLYrn; Fri, 24 Apr 2026 16:38:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4DD6B42991
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777048730;
	bh=HQCAX3Jap6ynxOvvn7/1RUtZdxAL57oTZZUJNy3OGO8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=FGHCP5D4ZEZIcqWFyJaaj/tAhWJe6CJoIzSXVJh09PlVueTtMw29QwU26t/jIMOim
	 mmItK9v4cA1eXPI7SwfR1B5TTNyAqFhx9ghppFVjY9tig9MrkwVSiqx78pr3cMTkXu
	 Oz9/qYTYeGuy5x2VHE1b9zub1jWg5n+wb7KToLgeFAzc2vTZ4ZnyBFPoPflrZmR9Tc
	 WdnyI382ppUU3mrKG7QGu3omA27URw+bHoQPO/c2pyn/JC8jBj4rKtHGHpLHJml6bc
	 nS3nTjl/O8kz9uDoOTV/As5J6mjv/UK/NDRUNT1zsfB6EPklLwbAsHOn5drlZMAfDx
	 gyqsJzIyWRPdA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4DD6B42991;
	Fri, 24 Apr 2026 16:38:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id BCF6F231
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 16:38:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9CBFC423F0
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 16:38:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DvZKBdK0jSsC for <buildroot@buildroot.org>;
 Fri, 24 Apr 2026 16:38:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C006A423EE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C006A423EE
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 16:38:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7765082AFA; Fri, 24 Apr 2026 16:38:25 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 23 Apr 2026 14:24:12 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: 2513ab9603a8a4ee98ee13df3cb6ec6160c4d4ca
X-Git-Newrev: 3082413b9be086e3cd9d5bfe204f88dfcb0d83e4
X-Patchwork-Hint: ignore
Message-Id: <20260424163825.7765082AFA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] package/libarchive:
 security bump version to 3.8.7
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/3082413b9be086e3cd9d5bfe204f88dfcb0d83e4
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

https://github.com/libarchive/libarchive/releases/tag/v3.8.7
"Libarchive 3.8.7 is a security and bugfix release."

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 5fc186771e18bd2a39d8a643e85ddb662eaeae36)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/libarchive/libarchive.hash | 6 +++---
 package/libarchive/libarchive.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libarchive/libarchive.hash b/package/libarchive/libarchive.hash
index be357183e2..665259f2b6 100644
--- a/package/libarchive/libarchive.hash
+++ b/package/libarchive/libarchive.hash
@@ -1,6 +1,6 @@
-# From https://github.com/libarchive/libarchive/releases/tag/v3.8.6
+# From https://github.com/libarchive/libarchive/releases/tag/v3.8.7
 # After verifying the pgp signature from:
-# https://www.libarchive.de/downloads/libarchive-3.8.6.tar.xz.asc
-sha256  8ac57c1f5e99550948d1fe755c806d26026e71827da228f36bef24527e372e6f  libarchive-3.8.6.tar.xz
+# https://www.libarchive.de/downloads/libarchive-3.8.7.tar.xz.asc
+sha256  d3a8ba457ae25c27c84fd2830a2efdcc5b1d40bf585d4eb0d35f47e99e5d4774  libarchive-3.8.7.tar.xz
 # Locally computed:
 sha256  30e556b3959e3985d66efefec5eaac51d4995053caa1d3cffe6eb916f146f229  COPYING
diff --git a/package/libarchive/libarchive.mk b/package/libarchive/libarchive.mk
index 3b8fdbae1e..f11f5d8f6f 100644
--- a/package/libarchive/libarchive.mk
+++ b/package/libarchive/libarchive.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBARCHIVE_VERSION = 3.8.6
+LIBARCHIVE_VERSION = 3.8.7
 LIBARCHIVE_SOURCE = libarchive-$(LIBARCHIVE_VERSION).tar.xz
 LIBARCHIVE_SITE = https://www.libarchive.de/downloads
 LIBARCHIVE_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
