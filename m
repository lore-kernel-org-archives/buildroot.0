Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD001C43458
	for <buildroot@archiver.kernel.org>; Fri,  3 Jul 2026 14:26:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A869180BD4;
	Fri,  3 Jul 2026 14:26:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vs4VUCtYv2Rh; Fri,  3 Jul 2026 14:26:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B1EA780A9F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783088812;
	bh=PFewvqFZFpWcKxlSUR3qXvM8jVmnlYdipUHzb4ye8Fg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=lqdsdrCdqDciPSWVf9f49VsSJzPvaQjGcNzNTPP/tn1eQEtuDw8vpdMwvJ+aP3xQq
	 woKbY7NFH7Cpvwvnng1dNsB+5ckdVAMXTogi1njS2PwS1NLBeUm5LEPmIERn52+Y56
	 Y4FopXfMx9uRbkMWuXRWQ2NNULFYLbeh4qWR0WthUGCoklWIs+u94lAr1mKaMXJLSb
	 3Mb4q6SoTrxv/vJ/lQjXlXWT/L2vfVnaAidldO7PkBVX7PGCVrXpvY75Fpwwr42C8X
	 3Tp84tzVgi39P5wXQKHqPdLa1vVtCa4kKSq9NiPbgaeEpHjmEftO/A227qPjxJGXe9
	 0Hdg9ncUGqDow==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B1EA780A9F;
	Fri,  3 Jul 2026 14:26:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id A1C1E79E4
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 14:26:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9FAE860648
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 14:26:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dwkcX9aygcMQ for <buildroot@buildroot.org>;
 Fri,  3 Jul 2026 14:26:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8F1E160A5C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8F1E160A5C
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 14:26:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 23CEC883A1; Fri,  3 Jul 2026 14:26:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 2 Jul 2026 21:31:50 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 5df5aff9caa43c896551b7c54e08114a32a3f669
X-Git-Newrev: d50310a64a0f6c8f4c2a70b4b7c0659e5e7c3b7f
X-Patchwork-Hint: ignore
Message-Id: <20260703142615.23CEC883A1@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/ghostscript:
 security bump to version 10.07.1
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d50310a64a0f6c8f4c2a70b4b7c0659e5e7c3b7f
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

https://ghostscript.readthedocs.io/en/gs10.07.1/News.html
"This release addresses a number of potential security issues."

Renumbered patch which was forgotten during the last version bump.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit dd929c3d253dfaf9392d327c16c5e0d0f2b1353f)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/ghostscript/{0002-brotli.patch => 0001-brotli.patch} | 0
 package/ghostscript/ghostscript.hash                         | 4 ++--
 package/ghostscript/ghostscript.mk                           | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/ghostscript/0002-brotli.patch b/package/ghostscript/0001-brotli.patch
similarity index 100%
rename from package/ghostscript/0002-brotli.patch
rename to package/ghostscript/0001-brotli.patch
diff --git a/package/ghostscript/ghostscript.hash b/package/ghostscript/ghostscript.hash
index c2e48b01e6..94017262df 100644
--- a/package/ghostscript/ghostscript.hash
+++ b/package/ghostscript/ghostscript.hash
@@ -1,5 +1,5 @@
-# From https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs10070/SHA512SUMS
-sha512  1c2a14951223c975a53bd9767c28bd3a6e420c385a5e0d7a60a5ff5b091bc027929c815bf57cddf97611e8d265ece1c219321737f2cabb5646685c6e8cdb85c9  ghostscript-10.07.0.tar.xz
+# From https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs10071/SHA512SUMS
+sha512  7b38ca10fa7ab648924f7db3e2e4933c3d18e04c8db1346fca4d4f7b85dfbd7888d5fc46f413613b46429fb47b675a593994c25e50e9de4dcdbee3bdd8a5e449  ghostscript-10.07.1.tar.xz
 
 # Hash for license file:
 sha256  8ce064f423b7c24a011b6ebf9431b8bf9861a5255e47c84bfb23fc526d030a8b  LICENSE
diff --git a/package/ghostscript/ghostscript.mk b/package/ghostscript/ghostscript.mk
index 159e06db91..250c851b28 100644
--- a/package/ghostscript/ghostscript.mk
+++ b/package/ghostscript/ghostscript.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GHOSTSCRIPT_VERSION = 10.07.0
+GHOSTSCRIPT_VERSION = 10.07.1
 GHOSTSCRIPT_SOURCE = ghostscript-$(GHOSTSCRIPT_VERSION).tar.xz
 GHOSTSCRIPT_SITE = https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs$(subst .,,$(GHOSTSCRIPT_VERSION))
 GHOSTSCRIPT_LICENSE = AGPL-3.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
