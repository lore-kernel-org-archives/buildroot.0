Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29DA6CFD2F6
	for <buildroot@archiver.kernel.org>; Thu, 27 Nov 2025 20:36:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 98C7C6177D;
	Thu, 27 Nov 2025 20:36:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SsxpV7Q3-3sD; Thu, 27 Nov 2025 20:36:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E066161B38
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E066161B38;
	Thu, 27 Nov 2025 20:36:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 925A22A9
 for <buildroot@buildroot.org>; Thu, 27 Nov 2025 20:36:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2E97E806DC
 for <buildroot@buildroot.org>; Thu, 27 Nov 2025 20:36:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dAgRnzhIgS3U for <buildroot@buildroot.org>;
 Thu, 27 Nov 2025 20:36:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 43619843C0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 43619843C0
 for <buildroot@buildroot.org>; Thu, 27 Nov 2025 20:36:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 341DE8600D; Thu, 27 Nov 2025 20:36:02 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 26 Nov 2025 09:02:51 +0100
X-Git-Refname: refs/heads/2025.08.x
X-Git-Oldrev: 5d6acb9c75f126228893922172fa108b7d549e1c
X-Git-Newrev: c6f3caa55ac450ae48f60383a60bff9b09d5ab07
X-Patchwork-Hint: ignore
Message-Id: <20251127203602.341DE8600D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.08.x] package/asterisk:
 security bump version to 22.5.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=c6f3caa55ac450ae48f60383a60bff9b09d5ab07
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.08.x

Fixes the following security issues:

- CVE-2025-1131: Uncontrolled Search-Path Element in safe_asterisk script
  may allow local privilege escalation
  https://github.com/asterisk/asterisk/security/advisories/GHSA-v9q8-9j8m-5xwp

- CVE-2025-57767: A specifically malformed Authorization header in an
  incoming SIP request can cause Asterisk to crash
  https://github.com/asterisk/asterisk/security/advisories/GHSA-64qc-9x89-rx5j

- CVE-2025-49832: Remote DoS and possible RCE in
  asterisk/res/res_stir_shaken/verification.c
  https://github.com/asterisk/asterisk/security/advisories/GHSA-mrq5-74j5-f5cr

- CVE-2025-47780: cli_permissions.conf: deny option does not work for
  disallowing shell commands
  https://github.com/asterisk/asterisk/security/advisories/GHSA-c7p6-7mvq-8jq2

- CVE-2025-47779: Using malformed From header can forge identity with ";" or
  NULL in name portion
  https://github.com/asterisk/asterisk/security/advisories/GHSA-2grh-7mhv-fcfw

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Acked-by: Titouan Christophe <titouan.christophe@mind.be>
[Peter: add additional CVEs]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 02fd1d2b9347131ee2ceaae80d1cd5f6e962f09a)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/asterisk/asterisk.hash | 2 +-
 package/asterisk/asterisk.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/asterisk/asterisk.hash b/package/asterisk/asterisk.hash
index 7b28624921..c09a5bc183 100644
--- a/package/asterisk/asterisk.hash
+++ b/package/asterisk/asterisk.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  4cc403c8885d4aed3956dfb75d315d3e5bcc129eb9cd47c156d3b12ecceed1ba  asterisk-22.3.0.tar.gz
+sha256  8a94650b6f348af1f1c9cce7ed3585d280f3a31b0d3820084a42b03712df95d5  asterisk-22.5.2.tar.gz
 
 # Locally computed
 sha256  58bb83cec4d431f48d006e455d821668450f8cf6b6c95f090def47062fa3a60c  pjproject-2.15.1.tar.bz2
diff --git a/package/asterisk/asterisk.mk b/package/asterisk/asterisk.mk
index 18af217129..0d40ebf2b4 100644
--- a/package/asterisk/asterisk.mk
+++ b/package/asterisk/asterisk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ASTERISK_VERSION = 22.3.0
+ASTERISK_VERSION = 22.5.2
 # Use the github mirror: it's an official mirror maintained by Digium, and
 # provides tarballs, which the main Asterisk git tree (behind Gerrit) does not.
 ASTERISK_SITE = $(call github,asterisk,asterisk,$(ASTERISK_VERSION))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
