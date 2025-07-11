Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D29F4C83F34
	for <buildroot@archiver.kernel.org>; Thu, 17 Jul 2025 20:22:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AC33560813;
	Thu, 17 Jul 2025 20:22:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ga0xiDzgs9jp; Thu, 17 Jul 2025 20:22:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AD6346082E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AD6346082E;
	Thu, 17 Jul 2025 20:22:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1D94DA59
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 20:22:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 43E6C405A1
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 20:22:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hyngJ38zvaDi for <buildroot@buildroot.org>;
 Thu, 17 Jul 2025 20:22:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EB5E740CE8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id EB5E740CE8
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 20:22:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DBDB181182; Thu, 17 Jul 2025 20:22:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 11 Jul 2025 14:21:45 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: ad6de69d62673aa482c1ccbbcc91ab5111433c79
X-Git-Newrev: 3e46e455e39b6572d07aa44edb3c9c9a024a8dd1
X-Patchwork-Hint: ignore
Message-Id: <20250717202235.DBDB181182@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/git: security
 bump to v2.48.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=3e46e455e39b6572d07aa44edb3c9c9a024a8dd1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Read the announcement: https://lwn.net/ml/all/xmqq5xg2wrd1.fsf@gitster.g/

This fixes the following vulnerabilities:

- CVE-2025-27613 (Gitk):
   When a user clones an untrusted repository and runs Gitk without
   additional command arguments, any writable file can be created and
   truncated. The option "Support per-file encoding" must have been
   enabled. The operation "Show origin of this line" is affected as
   well, regardless of the option being enabled or not.
   https://www.cve.org/CVERecord?id=CVE-2025-27613

- CVE-2025-27614 (Gitk):
   A Git repository can be crafted in such a way that a user who has
   cloned the repository can be tricked into running any script
   supplied by the attacker by invoking `gitk filename`, where
   `filename` has a particular structure.
   https://www.cve.org/CVERecord?id=CVE-2025-27614

- CVE-2025-46835 (Git GUI):
   When a user clones an untrusted repository and is tricked into
   editing a file located in a maliciously named directory in the
   repository, then Git GUI can create and overwrite any writable
   file.
   https://www.cve.org/CVERecord?id=CVE-2025-46835

- CVE-2025-48384:
   When reading a config value, Git strips any trailing carriage
   return and line feed (CRLF). When writing a config entry, values
   with a trailing CR are not quoted, causing the CR to be lost when
   the config is later read.  When initializing a submodule, if the
   submodule path contains a trailing CR, the altered path is read
   resulting in the submodule being checked out to an incorrect
   location. If a symlink exists that points the altered path to the
   submodule hooks directory, and the submodule contains an executable
   post-checkout hook, the script may be unintentionally executed
   after checkout.
   https://www.cve.org/CVERecord?id=CVE-2025-48384

- CVE-2025-48385:
   When cloning a repository Git knows to optionally fetch a bundle
   advertised by the remote server, which allows the server-side to
   offload parts of the clone to a CDN. The Git client does not
   perform sufficient validation of the advertised bundles, which
   allows the remote side to perform protocol injection.
   This protocol injection can cause the client to write the fetched
   bundle to a location controlled by the adversary. The fetched
   content is fully controlled by the server, which can in the worst
   case lead to arbitrary code execution.
   https://www.cve.org/CVERecord?id=CVE-2025-48385

- CVE-2025-48386:
   The wincred credential helper uses a static buffer (`target`) as a
   unique key for storing and comparing against internal storage. This
   credential helper does not properly bounds check the available
   space remaining in the buffer before appending to it with
   `wcsncat()`, leading to potential buffer overflows.
   https://www.cve.org/CVERecord?id=CVE-2025-48386

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
(cherry picked from commit 62788e0e497ab8e8b6f2819a72c3b391ed3807eb)
[thomas: bumped to v2.48.2 instead]
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/git/git.hash | 2 +-
 package/git/git.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/git/git.hash b/package/git/git.hash
index 7608cbe176..24286a8705 100644
--- a/package/git/git.hash
+++ b/package/git/git.hash
@@ -1,5 +1,5 @@
 # From: https://www.kernel.org/pub/software/scm/git/sha256sums.asc
-sha256  1c5d545f5dc1eb51e95d2c50d98fdf88b1a36ba1fa30e9ae5d5385c6024f82ad  git-2.48.1.tar.xz
+sha256  30ce5660fc6be0453ab0e15ba3f2b69f2325cde0bb447ad2ee1b559f2999e494  git-2.48.2.tar.xz
 # Locally calculated
 sha256  5b2198d1645f767585e8a88ac0499b04472164c0d2da22e75ecf97ef443ab32e  COPYING
 sha256  1922f45d2c49e390032c9c0ba6d7cac904087f7cec51af30c2b2ad022ce0e76a  LGPL-2.1
diff --git a/package/git/git.mk b/package/git/git.mk
index de3103f4ff..18d768e900 100644
--- a/package/git/git.mk
+++ b/package/git/git.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GIT_VERSION = 2.48.1
+GIT_VERSION = 2.48.2
 GIT_SOURCE = git-$(GIT_VERSION).tar.xz
 GIT_SITE = $(BR2_KERNEL_MIRROR)/software/scm/git
 GIT_LICENSE = GPL-2.0, LGPL-2.1+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
