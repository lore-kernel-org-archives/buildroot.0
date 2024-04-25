Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88083C4345F
	for <buildroot@archiver.kernel.org>; Thu, 25 Apr 2024 17:30:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 56E0481C6E;
	Thu, 25 Apr 2024 17:30:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1FWGdK3wcSss; Thu, 25 Apr 2024 17:30:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4412F81EC6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4412F81EC6;
	Thu, 25 Apr 2024 17:30:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 220921BF39A
 for <buildroot@lists.busybox.net>; Thu, 25 Apr 2024 17:30:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0C5FD81EC6
 for <buildroot@lists.busybox.net>; Thu, 25 Apr 2024 17:30:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x6o63D7ZoZ6C for <buildroot@lists.busybox.net>;
 Thu, 25 Apr 2024 17:30:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4415981C6E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4415981C6E
 for <buildroot@buildroot.org>; Thu, 25 Apr 2024 17:30:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2CE8986162; Thu, 25 Apr 2024 17:30:30 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 25 Apr 2024 19:27:21 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1126be70ffb5c2b3255ceb9219362a8a45dd68d7
X-Git-Newrev: ff36bc68cdba30f2a76da2b9f2047aa9a514e07e
X-Patchwork-Hint: ignore
Message-Id: <20240425173030.2CE8986162@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/openjpeg: security bump to version
 2.5.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=ff36bc68cdba30f2a76da2b9f2047aa9a514e07e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes the following security issues:

CVE-2021-3575: A heap-based buffer overflow was found in openjpeg in
color.c:379:42 in sycc420_to_rgb when decompressing a crafted .j2k file.  An
attacker could use this to execute arbitrary code with the permissions of
the application compiled against openjpeg.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/openjpeg/openjpeg.hash | 2 +-
 package/openjpeg/openjpeg.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/openjpeg/openjpeg.hash b/package/openjpeg/openjpeg.hash
index cfa0e01b7d..1e72054724 100644
--- a/package/openjpeg/openjpeg.hash
+++ b/package/openjpeg/openjpeg.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  0333806d6adecc6f7a91243b2b839ff4d2053823634d4f6ed7a59bc87409122a  openjpeg-2.5.0.tar.gz
+sha256  90e3896fed910c376aaf79cdd98bdfdaf98c6472efd8e1debf0a854938cbda6a  openjpeg-2.5.2.tar.gz
 sha256  a6af136f3e15038a666b61f376612a07d9a4e48cb7c01adbf3e33b3f14ab49b6  LICENSE
diff --git a/package/openjpeg/openjpeg.mk b/package/openjpeg/openjpeg.mk
index 5b03a6cf58..e7cb7505e9 100644
--- a/package/openjpeg/openjpeg.mk
+++ b/package/openjpeg/openjpeg.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENJPEG_VERSION = 2.5.0
+OPENJPEG_VERSION = 2.5.2
 OPENJPEG_SITE = $(call github,uclouvain,openjpeg,v$(OPENJPEG_VERSION))
 OPENJPEG_LICENSE = BSD-2-Clause
 OPENJPEG_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
