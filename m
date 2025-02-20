Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FD1FC282C1
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 17:21:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8A7664086D;
	Fri, 28 Feb 2025 17:21:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xvEFks_YAGeW; Fri, 28 Feb 2025 17:21:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 146C74075C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 146C74075C;
	Fri, 28 Feb 2025 17:21:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 16D7968
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:47:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D2FA342569
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:32:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sDOIZEAvx2Nf for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:32:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BA0714710A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id BA0714710A
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B4F707FCAF; Fri, 28 Feb 2025 16:30:44 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 20 Feb 2025 20:10:27 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 4d6e3ea7a5693e11727ed8bd39446b4f35275f8e
X-Git-Newrev: 002931cc3a4cec7528c918311a869198b547ef24
X-Patchwork-Hint: ignore
Message-Id: <20250228163044.B4F707FCAF@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/openssh: security bump
 version to 9.9p2
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

commit: https://git.buildroot.net/buildroot/commit/?id=002931cc3a4cec7528c918311a869198b547ef24
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Release note: https://www.openssh.com/txt/release-9.9p2

Fixes: CVE-2025-26465 (ssh) , CVE-2025-26466 (sshd)

Drop upstream patch: 0001-build-construct_utmp-when-USE_BTMP-is-set.patch

Signed-off-by: Michael Fischer <mf@go-sys.de>
Tested-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...build-construct_utmp-when-USE_BTMP-is-set.patch | 35 ----------------------
 package/openssh/openssh.hash                       |  4 +--
 package/openssh/openssh.mk                         |  2 +-
 3 files changed, 3 insertions(+), 38 deletions(-)

diff --git a/package/openssh/0001-build-construct_utmp-when-USE_BTMP-is-set.patch b/package/openssh/0001-build-construct_utmp-when-USE_BTMP-is-set.patch
deleted file mode 100644
index 85ad5a538c..0000000000
--- a/package/openssh/0001-build-construct_utmp-when-USE_BTMP-is-set.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 76a618d2842c34c16cd21a4efc7230e2f459008d Mon Sep 17 00:00:00 2001
-From: Damien Miller <djm@mindrot.org>
-Date: Wed, 25 Sep 2024 11:13:05 +1000
-Subject: [PATCH] build construct_utmp() when USE_BTMP is set
-
-Fixes compile error on Void Linux/Musl
-
-Upstream: https://anongit.mindrot.org/openssh.git/commit/?id=76a618d2842c34c16cd21a4efc7230e2f459008d
-Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
----
- loginrec.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/loginrec.c b/loginrec.c
-index 45f13dee8b1f..7b1818b86753 100644
---- a/loginrec.c
-+++ b/loginrec.c
-@@ -614,7 +614,7 @@ line_abbrevname(char *dst, const char *src, int dstsize)
-  ** into account.
-  **/
-
--#if defined(USE_UTMP) || defined (USE_WTMP) || defined (USE_LOGIN)
-+#if defined(USE_BTMP) || defined(USE_UTMP) || defined (USE_WTMP) || defined (USE_LOGIN)
-
- /* build the utmp structure */
- void
-@@ -698,7 +698,7 @@ construct_utmp(struct logininfo *li,
- 	}
- # endif
- }
--#endif /* USE_UTMP || USE_WTMP || USE_LOGIN */
-+#endif /* USE_BTMP || USE_UTMP || USE_WTMP || USE_LOGIN */
-
- /**
-  ** utmpx utility functions
diff --git a/package/openssh/openssh.hash b/package/openssh/openssh.hash
index 5758ce4f36..0bbc4874df 100644
--- a/package/openssh/openssh.hash
+++ b/package/openssh/openssh.hash
@@ -1,4 +1,4 @@
-# From https://www.openssh.com/txt/release-9.9
-sha256  b343fbcdbff87f15b1986e6e15d6d4fc9a7d36066be6b7fb507087ba8f966c02  openssh-9.9p1.tar.gz
+# From https://www.openssh.com/txt/release-9.9p2
+sha256  91aadb603e08cc285eddf965e1199d02585fa94d994d6cae5b41e1721e215673  openssh-9.9p2.tar.gz
 # Locally calculated
 sha256  5bb5b160726ef5756e4f32fe95b35249c294962419650f48d05134b486d27ccb  LICENCE
diff --git a/package/openssh/openssh.mk b/package/openssh/openssh.mk
index 95c059e03d..115290ce13 100644
--- a/package/openssh/openssh.mk
+++ b/package/openssh/openssh.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 OPENSSH_VERSION_MAJOR = 9.9
-OPENSSH_VERSION_MINOR = p1
+OPENSSH_VERSION_MINOR = p2
 OPENSSH_VERSION = $(OPENSSH_VERSION_MAJOR)$(OPENSSH_VERSION_MINOR)
 OPENSSH_CPE_ID_VERSION = $(OPENSSH_VERSION_MAJOR)
 OPENSSH_CPE_ID_UPDATE = $(OPENSSH_VERSION_MINOR)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
