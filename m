Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F735CF256E
	for <buildroot@archiver.kernel.org>; Sat, 12 Oct 2024 16:12:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 02ACA4072F;
	Sat, 12 Oct 2024 16:12:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lA8SOyHIe5cP; Sat, 12 Oct 2024 16:12:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 63EEB40637
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 63EEB40637;
	Sat, 12 Oct 2024 16:12:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 789FA1BF3C9
 for <buildroot@lists.busybox.net>; Sat, 12 Oct 2024 16:12:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 74518400B8
 for <buildroot@lists.busybox.net>; Sat, 12 Oct 2024 16:12:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DrZXvRDjL3Cx for <buildroot@lists.busybox.net>;
 Sat, 12 Oct 2024 16:12:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 038A040015
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 038A040015
 for <buildroot@buildroot.org>; Sat, 12 Oct 2024 16:12:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DCD0985EFD; Sat, 12 Oct 2024 16:11:59 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 12 Oct 2024 18:07:52 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 846af98bd13ca72542adc7795de0c100455b6bcf
X-Git-Newrev: 2cd205743bb1d39137756cc804e22c039db10c9c
X-Patchwork-Hint: ignore
Message-Id: <20241012161159.DCD0985EFD@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/python3: security
 bump to version 3.11.10
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

commit: https://git.buildroot.net/buildroot/commit/?id=2cd205743bb1d39137756cc804e22c039db10c9c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Release notes: https://www.python.org/downloads/release/python-31110/

Fixes CVE-2024-4032, CVE-2024-6232, CVE-2024-6923, CVE-2024-7592,
CVE-2024-8088 and CVE-2023-27043.

The fixes for bundled libexpat are irrelevant for us because external expat
is used.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python3/python3.hash | 6 +++---
 package/python3/python3.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python3/python3.hash b/package/python3/python3.hash
index c536c80e52..c11e79ca83 100644
--- a/package/python3/python3.hash
+++ b/package/python3/python3.hash
@@ -1,5 +1,5 @@
-# From https://www.python.org/downloads/release/python-3119/
-md5  22ea467e7d915477152e99d5da856ddc  Python-3.11.9.tar.xz
+# From https://www.python.org/downloads/release/python-31110/
+md5  af59e243df4c7019f941ae51891c10bc  Python-3.11.10.tar.xz
 # Locally computed
-sha256  9b1e896523fc510691126c864406d9360a3d1e986acbda59cda57b5abda45b87  Python-3.11.9.tar.xz
+sha256  07a4356e912900e61a15cb0949a06c4a05012e213ecd6b4e84d0f67aabbee372  Python-3.11.10.tar.xz
 sha256  3b2f81fe21d181c499c59a256c8e1968455d6689d269aa85373bfb6af41da3bf  LICENSE
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index 5f61456a74..6a6fcaeb2e 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 PYTHON3_VERSION_MAJOR = 3.11
-PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).9
+PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).10
 PYTHON3_SOURCE = Python-$(PYTHON3_VERSION).tar.xz
 PYTHON3_SITE = https://python.org/ftp/python/$(PYTHON3_VERSION)
 PYTHON3_LICENSE = Python-2.0, others
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
