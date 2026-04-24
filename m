Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09B70FED3F0
	for <buildroot@archiver.kernel.org>; Fri, 24 Apr 2026 16:25:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CE0534295B;
	Fri, 24 Apr 2026 16:25:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wMjIis0m5mvN; Fri, 24 Apr 2026 16:25:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DE9F74295D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777047954;
	bh=IreiROEvzYh7nqcXttbZJW7uxAJCirdkxCiCH27c4g8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=cPbTofIe844usv61WEP+vd0nhOkkXF0pW4XaR6BWyaVt4zj3pK8isMBlu/xrlUTK5
	 cBK3+jh/zlQ2XhoztRVTiTKU5hN8VeRjTv83tK+WckPw1vAnZ1FWkxwosR/Tt15zSO
	 UgosZrU26gXXevuGHZsu4viwb2h5Hz4EJI+LPGzKh8ChZ6ftP8CTgTue8NkB/QlMY+
	 8WfQaE4M/Xrp523w7Yp/m+Z2kZIlU3ocPF0H6E7lgDw5Q4N0FTNSh0GcAMHeFT2Puu
	 cbamCDJMQr1yZ7aRa9htJnTWoprRR1p9+6p/bDedG6gjSlnJAXPj7MektS7PsWVEdS
	 AcjOPyecEM44A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DE9F74295D;
	Fri, 24 Apr 2026 16:25:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2731F194
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 16:25:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3E55E428FA
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 16:25:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id orx2Q3cSC4_T for <buildroot@buildroot.org>;
 Fri, 24 Apr 2026 16:25:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C00EC4295B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C00EC4295B
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 16:25:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7832982AFA; Fri, 24 Apr 2026 16:25:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 24 Apr 2026 18:20:59 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: a049435db8e89228d4e5c49f62f3257402e81c9f
X-Git-Newrev: b077bab476f8428a10495d548afb76c9b36b901c
X-Patchwork-Hint: ignore
Message-Id: <20260424162539.7832982AFA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/libarchive:
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b077bab476f8428a10495d548afb76c9b36b901c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

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
