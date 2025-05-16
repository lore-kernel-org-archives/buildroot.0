Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45C93C3ABD8
	for <buildroot@archiver.kernel.org>; Fri, 16 May 2025 11:41:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5A37C40905;
	Fri, 16 May 2025 11:41:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uDNNrkB2Zobg; Fri, 16 May 2025 11:41:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 07F2E40784
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 07F2E40784;
	Fri, 16 May 2025 11:41:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6EBDF1AB
 for <buildroot@buildroot.org>; Fri, 16 May 2025 11:41:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5EF114061A
 for <buildroot@buildroot.org>; Fri, 16 May 2025 11:41:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m9X5IM6ZntG6 for <buildroot@buildroot.org>;
 Fri, 16 May 2025 11:41:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A0E34405D3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A0E34405D3
 for <buildroot@buildroot.org>; Fri, 16 May 2025 11:41:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9D28E86A39; Fri, 16 May 2025 11:41:49 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Fri, 16 May 2025 13:40:17 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3615b2cd04727c38733c48d0d611736c3b24f8ed
X-Git-Newrev: 9a1aaec3f3db99bd8fda26cbaf476f4c20dd6740
X-Patchwork-Hint: ignore
Message-Id: <20250516114149.9D28E86A39@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/screen: security bump to version
 5.0.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=9a1aaec3f3db99bd8fda26cbaf476f4c20dd6740
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes the following security issues:

CVE-2025-46805: do NOT send signals with root privileges
CVE-2025-46804: avoid file existence test information leaks
CVE-2025-46803: apply safe PTY default mode of 0620
CVE-2025-46802: prevent temporary 0666 mode on PTYs in attacher
CVE-2025-23395: reintroduce lf_secreopen() for logfile

https://lists.gnu.org/archive/html/info-gnu/2025-05/msg00002.html

For more details, see:
https://security.opensuse.org/2025/05/12/screen-security-issues.html

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/screen/screen.hash | 4 ++--
 package/screen/screen.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/screen/screen.hash b/package/screen/screen.hash
index 208a9cb36d..61bacd88ff 100644
--- a/package/screen/screen.hash
+++ b/package/screen/screen.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-# https://ftp.gnu.org/gnu/screen/screen-5.0.0.tar.gz.sig
-sha256  f04a39d00a0e5c7c86a55338808903082ad5df4d73df1a2fd3425976aed94971  screen-5.0.0.tar.gz
+# https://ftp.gnu.org/gnu/screen/screen-5.0.1.tar.gz.sig
+sha256  2dae36f4db379ffcd14b691596ba6ec18ac3a9e22bc47ac239789ab58409869d  screen-5.0.1.tar.gz
 # Locally calculated
 sha256  e79e9c8a0c85d735ff98185918ec94ed7d175efc377012787aebcf3b80f0d90b  COPYING
diff --git a/package/screen/screen.mk b/package/screen/screen.mk
index 9a64780a9a..74453faff8 100644
--- a/package/screen/screen.mk
+++ b/package/screen/screen.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SCREEN_VERSION = 5.0.0
+SCREEN_VERSION = 5.0.1
 SCREEN_SITE = $(BR2_GNU_MIRROR)/screen
 SCREEN_LICENSE = GPL-3.0+
 SCREEN_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
