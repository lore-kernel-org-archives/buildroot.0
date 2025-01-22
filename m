Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA29FC02181
	for <buildroot@archiver.kernel.org>; Wed, 22 Jan 2025 17:03:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 89AA141419;
	Wed, 22 Jan 2025 17:03:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k6MhP--lfkoT; Wed, 22 Jan 2025 17:03:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3BBD4413C7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3BBD4413C7;
	Wed, 22 Jan 2025 17:03:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 92A0ED7
 for <buildroot@buildroot.org>; Wed, 22 Jan 2025 17:03:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7396E83BA4
 for <buildroot@buildroot.org>; Wed, 22 Jan 2025 17:03:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6fNCal3M6qBC for <buildroot@buildroot.org>;
 Wed, 22 Jan 2025 17:03:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9B4EE83C2F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9B4EE83C2F
 for <buildroot@buildroot.org>; Wed, 22 Jan 2025 17:03:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 89A7A86088; Wed, 22 Jan 2025 17:03:54 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 22 Jan 2025 17:32:11 +0100
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: ff13942c67ef8cdac8209a8e2baf50fa9916940b
X-Git-Newrev: 954711047fc45dc61f1a05a67c282a228ebb296f
X-Patchwork-Hint: ignore
Message-Id: <20250122170354.89A7A86088@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/git: security
 bump to version 2.43.6
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

commit: https://git.buildroot.net/buildroot/commit/?id=954711047fc45dc61f1a05a67c282a228ebb296f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

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

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/git/git.hash | 2 +-
 package/git/git.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/git/git.hash b/package/git/git.hash
index 9b8c8eeceb..1560b599d9 100644
--- a/package/git/git.hash
+++ b/package/git/git.hash
@@ -1,5 +1,5 @@
 # From: https://www.kernel.org/pub/software/scm/git/sha256sums.asc
-sha256  8b7cc3db84c5c6a2eeb39c63686ff5cde26278e32bb0d2226a8b424488420b98  git-2.43.5.tar.xz
+sha256  25f329439ebcc8a6fe160a5600499f6a179c784d8efa4d50d54e5d77a4d13a62  git-2.43.6.tar.xz
 # Locally calculated
 sha256  5b2198d1645f767585e8a88ac0499b04472164c0d2da22e75ecf97ef443ab32e  COPYING
 sha256  1922f45d2c49e390032c9c0ba6d7cac904087f7cec51af30c2b2ad022ce0e76a  LGPL-2.1
diff --git a/package/git/git.mk b/package/git/git.mk
index 01933a96b2..56c994e3a8 100644
--- a/package/git/git.mk
+++ b/package/git/git.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GIT_VERSION = 2.43.5
+GIT_VERSION = 2.43.6
 GIT_SOURCE = git-$(GIT_VERSION).tar.xz
 GIT_SITE = $(BR2_KERNEL_MIRROR)/software/scm/git
 GIT_LICENSE = GPL-2.0, LGPL-2.1+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
