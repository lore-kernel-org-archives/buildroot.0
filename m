Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 179EEC433F5
	for <buildroot@archiver.kernel.org>; Thu, 29 Sep 2022 13:54:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 947BA40872;
	Thu, 29 Sep 2022 13:54:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 947BA40872
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nb9h1HFd-iXo; Thu, 29 Sep 2022 13:54:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4C0B04018A;
	Thu, 29 Sep 2022 13:54:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4C0B04018A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8BDE41BF2B4
 for <buildroot@lists.busybox.net>; Thu, 29 Sep 2022 13:53:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 58B1040275
 for <buildroot@lists.busybox.net>; Thu, 29 Sep 2022 13:53:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 58B1040275
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4tMQW6g2H-Z9 for <buildroot@lists.busybox.net>;
 Thu, 29 Sep 2022 13:53:56 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E037340028
 for <buildroot@buildroot.org>; Thu, 29 Sep 2022 13:53:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E037340028
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CF2E7864CE; Thu, 29 Sep 2022 13:53:55 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 29 Sep 2022 15:48:42 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: 0d88416993aac655cd2577f5cc358eb0b7f31624
X-Git-Newrev: 44fedb9249d8c0a4ba812c5d5ad0418592f24244
X-Patchwork-Hint: ignore
Message-Id: <20220929135355.CF2E7864CE@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x] package/git: security
 bump to version 2.31.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=44fedb9249d8c0a4ba812c5d5ad0418592f24244
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

Fix CVE-2022-29187: Git is a distributed revision control system. Git
prior to versions 2.37.1, 2.36.2, 2.35.4, 2.34.4, 2.33.4, 2.32.3,
2.31.4, and 2.30.5, is vulnerable to privilege escalation in all
platforms. An unsuspecting user could still be affected by the issue
reported in CVE-2022-24765, for example when navigating as root into a
shared tmp directory that is owned by them, but where an attacker could
create a git repository. Versions 2.37.1, 2.36.2, 2.35.4, 2.34.4,
2.33.4, 2.32.3, 2.31.4, and 2.30.5 contain a patch for this issue. The
simplest way to avoid being affected by the exploit described in the
example is to avoid running git as root (or an Administrator in
Windows), and if needed to reduce its use to a minimum. While a generic
workaround is not possible, a system could be hardened from the exploit
described in the example by removing any such repository if it exists
already and creating one as root to block any future attacks.

https://github.com/git/git/blob/v2.31.4/Documentation/RelNotes/2.31.4.txt

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 15293e0360cffc8a5e33f57ef1b01a45f17b08d3)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/git/git.hash | 2 +-
 package/git/git.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/git/git.hash b/package/git/git.hash
index 5868fbffda..41afa83f86 100644
--- a/package/git/git.hash
+++ b/package/git/git.hash
@@ -1,5 +1,5 @@
 # From: https://www.kernel.org/pub/software/scm/git/sha256sums.asc
-sha256  d9167d801cf4aa2abca6e8f43d5d1b383e02e4d257ac1dc071802bb773ed0e2a  git-2.31.2.tar.xz
+sha256  84fc20acf8fbea5cad7d5d7be0dfeb32494f1dac8e6c61675c904d1fd3d8c016  git-2.31.4.tar.xz
 # Locally calculated
 sha256  5b2198d1645f767585e8a88ac0499b04472164c0d2da22e75ecf97ef443ab32e  COPYING
 sha256  1922f45d2c49e390032c9c0ba6d7cac904087f7cec51af30c2b2ad022ce0e76a  LGPL-2.1
diff --git a/package/git/git.mk b/package/git/git.mk
index 981a238acb..dc587170e8 100644
--- a/package/git/git.mk
+++ b/package/git/git.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GIT_VERSION = 2.31.2
+GIT_VERSION = 2.31.4
 GIT_SOURCE = git-$(GIT_VERSION).tar.xz
 GIT_SITE = $(BR2_KERNEL_MIRROR)/software/scm/git
 GIT_LICENSE = GPL-2.0, LGPL-2.1+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
