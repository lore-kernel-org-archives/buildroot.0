Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 923DACD98F0
	for <buildroot@archiver.kernel.org>; Sun, 21 Jun 2026 19:38:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 61543865C1;
	Sun, 21 Jun 2026 19:38:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R_u3nA4dfNJj; Sun, 21 Jun 2026 19:38:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 72ED986626
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782070733;
	bh=7EFdZr2eIKxhl64hjqcO0pU3aaPVJv+hTevxzI3bW6s=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=sKH3f8sMl4GO0GJXMey4RQ5MY0kGxtq7pqNv206eWhIofPGzJ4t/yJs1reXfBsgR9
	 pEOnxQ80F3HCjolak8q/x/u/KJaQlRtZk7S0G04zNVQNkIMZ5KpKvJJ6C469aRGv1q
	 DYzI/+1sous09uxPmB7tVuE6iO3tnIohUcy0UCG8yWasBK41JoF8wZMYIE/xaFmZhS
	 jEo5yvn1iScgChO+nLnWJAlKEeSFyIbDEsBt7WKoux7PibvzsaQpBmORepWChou4I0
	 TrIgQvkC38KcUpGdW8H9IEehQ51DGIFRo6r0L5y/IMo6dNliDba8XTaPE8O9rw6ymS
	 V0mZjadhzZo+w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 72ED986626;
	Sun, 21 Jun 2026 19:38:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8971624D
 for <buildroot@buildroot.org>; Sun, 21 Jun 2026 19:38:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7B09986626
 for <buildroot@buildroot.org>; Sun, 21 Jun 2026 19:38:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WF8Od1Y1o2qJ for <buildroot@buildroot.org>;
 Sun, 21 Jun 2026 19:38:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9517885F77
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9517885F77
 for <buildroot@buildroot.org>; Sun, 21 Jun 2026 19:38:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E20A7838E4; Sun, 21 Jun 2026 19:38:27 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 21 Jun 2026 21:35:52 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 113def36967926e6a401cf4ec3cdcdfbd6423cfd
X-Git-Newrev: d7fefa678beb44338bab6695477946ba97d9b896
X-Patchwork-Hint: ignore
Message-Id: <20260621193827.E20A7838E4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/cmake: bump version to 4.3.4
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d7fefa678beb44338bab6695477946ba97d9b896
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://cmake.org/cmake/help/latest/release/4.3.html#id4

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/cmake/cmake.hash | 4 ++--
 package/cmake/cmake.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/cmake/cmake.hash b/package/cmake/cmake.hash
index af7c7dd72b..8b6572c558 100644
--- a/package/cmake/cmake.hash
+++ b/package/cmake/cmake.hash
@@ -1,5 +1,5 @@
-# From https://cmake.org/files/v4.3/cmake-4.3.3-SHA-256.txt
-sha256  cba4bb7a44edf2877bb6f059932896383babe435b3a8c3b5df48b4aa41c9bb85  cmake-4.3.3.tar.gz
+# From https://cmake.org/files/v4.3/cmake-4.3.4-SHA-256.txt
+sha256  fdeff897b9eb49d764539f2b1edc6eb7e1440df325678a97c1978499e931adda  cmake-4.3.4.tar.gz
 
 # Locally calculated
 sha256  4382e7c1879ac90e3f101a395d23846fa4dbcaa1eed7265b43681e348754825d  LICENSE.rst
diff --git a/package/cmake/cmake.mk b/package/cmake/cmake.mk
index 6971232f76..1422f80a70 100644
--- a/package/cmake/cmake.mk
+++ b/package/cmake/cmake.mk
@@ -6,7 +6,7 @@
 
 # When updating the version, please also update BR2_HOST_CMAKE_AT_LEAST_X_Y
 CMAKE_VERSION_MAJOR = 4.3
-CMAKE_VERSION = $(CMAKE_VERSION_MAJOR).3
+CMAKE_VERSION = $(CMAKE_VERSION_MAJOR).4
 CMAKE_SITE = https://cmake.org/files/v$(CMAKE_VERSION_MAJOR)
 CMAKE_LICENSE = BSD-3-Clause
 CMAKE_LICENSE_FILES = LICENSE.rst
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
