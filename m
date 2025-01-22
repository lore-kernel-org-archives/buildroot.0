Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8569C02181
	for <buildroot@archiver.kernel.org>; Wed, 22 Jan 2025 17:02:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 75E8A402BA;
	Wed, 22 Jan 2025 17:02:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hQX1HRz8Qyim; Wed, 22 Jan 2025 17:02:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 31DA640321
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 31DA640321;
	Wed, 22 Jan 2025 17:02:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id AD22CD7
 for <buildroot@buildroot.org>; Wed, 22 Jan 2025 17:02:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 93D666067B
 for <buildroot@buildroot.org>; Wed, 22 Jan 2025 17:02:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y1IIK4o5TmhY for <buildroot@buildroot.org>;
 Wed, 22 Jan 2025 17:02:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B4094606F4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id B4094606F4
 for <buildroot@buildroot.org>; Wed, 22 Jan 2025 17:02:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AC18186064; Wed, 22 Jan 2025 17:02:46 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 22 Jan 2025 17:56:16 +0100
X-Git-Refname: refs/heads/2024.11.x
X-Git-Oldrev: ffdb6fead27cc81379ce4752c2a095e542182311
X-Git-Newrev: 38bebdea1941e8d2749751a20dc73593ec014f1a
X-Patchwork-Hint: ignore
Message-Id: <20250122170246.AC18186064@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.11.x] package/git: security
 bump to version 2.47.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=38bebdea1941e8d2749751a20dc73593ec014f1a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.11.x

Fixes the following vulnerabilities:

 - CVE-2024-50349:

   Printing unsanitized URLs when asking for credentials made the
   user susceptible to crafted URLs (e.g. in recursive clones) that
   mislead the user into typing in passwords for trusted sites that
   would then be sent to untrusted sites instead.

 - CVE-2024-52006

   Git may pass on Carriage Returns via the credential protocol to
   credential helpers which use line-reading functions that
   interpret said Carriage Returns as line endings, even though Git
   did not intend that.

For more details, see the announcement:
https://lore.kernel.org/git/xmqq5xmh46oc.fsf@gitster.g/

Additionally, 2.47.1 contained a number of fixes:
https://lore.kernel.org/git/xmqq5xob6coo.fsf@gitster.g/

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/git/git.hash | 2 +-
 package/git/git.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/git/git.hash b/package/git/git.hash
index c290ebe6bd..97ba3936db 100644
--- a/package/git/git.hash
+++ b/package/git/git.hash
@@ -1,5 +1,5 @@
 # From: https://www.kernel.org/pub/software/scm/git/sha256sums.asc
-sha256  1ce114da88704271b43e027c51e04d9399f8c88e9ef7542dae7aebae7d87bc4e  git-2.47.0.tar.xz
+sha256  b19268be6b6f1556b47a9dd834272e167d3a75740cdcd283cf3812edffe3930f  git-2.47.2.tar.xz
 # Locally calculated
 sha256  5b2198d1645f767585e8a88ac0499b04472164c0d2da22e75ecf97ef443ab32e  COPYING
 sha256  1922f45d2c49e390032c9c0ba6d7cac904087f7cec51af30c2b2ad022ce0e76a  LGPL-2.1
diff --git a/package/git/git.mk b/package/git/git.mk
index f56807a00f..397a6984ba 100644
--- a/package/git/git.mk
+++ b/package/git/git.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GIT_VERSION = 2.47.0
+GIT_VERSION = 2.47.2
 GIT_SOURCE = git-$(GIT_VERSION).tar.xz
 GIT_SITE = $(BR2_KERNEL_MIRROR)/software/scm/git
 GIT_LICENSE = GPL-2.0, LGPL-2.1+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
