Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E993C77B7C
	for <buildroot@archiver.kernel.org>; Wed,  2 Jul 2025 19:08:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 14EB141A3E;
	Wed,  2 Jul 2025 19:08:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lJF_GrQM35oP; Wed,  2 Jul 2025 19:08:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 11E7541AAB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 11E7541AAB;
	Wed,  2 Jul 2025 19:08:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 647D9179
 for <buildroot@buildroot.org>; Wed,  2 Jul 2025 19:08:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5683D80CF5
 for <buildroot@buildroot.org>; Wed,  2 Jul 2025 19:08:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2OBBrIN-3p6C for <buildroot@buildroot.org>;
 Wed,  2 Jul 2025 19:08:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 84B6780CF2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 84B6780CF2
 for <buildroot@buildroot.org>; Wed,  2 Jul 2025 19:08:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7CF1B85784; Wed,  2 Jul 2025 19:08:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 2 Jul 2025 21:03:32 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8e48dd8f216cbc1fbcc35de8dc969ee55a50d8cf
X-Git-Newrev: ee86844e632d5760355154ea4e928c9228f3dfd1
X-Patchwork-Hint: ignore
Message-Id: <20250702190815.7CF1B85784@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sudo: security bump to version
 1.9.17p1
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=ee86844e632d5760355154ea4e928c9228f3dfd1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For release note, see:
https://www.sudo.ws/releases/stable/#1.9.17p1

Fixes the following security issues:

- CVE-2025-32462: Sudo before 1.9.17p1, when used with a sudoers file that
  specifies a host that is neither the current host nor ALL, allows listed
  users to execute commands on unintended machines (since sudo 1.8.8)

  https://www.sudo.ws/security/advisories/host_any/

- CVE-2025-32463: Sudo before 1.9.17p1 allows local users to obtain root
  access because /etc/nsswitch.conf from a user-controlled directory is used
  with the --chroot option (since sudo 1.9.4)

  https://www.sudo.ws/security/advisories/chroot_bug/

Update the LICENSE.md hash for a change in copyright years:
https://github.com/sudo-project/sudo/commit/30729312c2091f3891daa39b571efa40cb261785

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
[Julien: add link to release note in commit log]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/sudo/sudo.hash | 4 ++--
 package/sudo/sudo.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/sudo/sudo.hash b/package/sudo/sudo.hash
index ed4e527f36..3bbce74cbc 100644
--- a/package/sudo/sudo.hash
+++ b/package/sudo/sudo.hash
@@ -1,4 +1,4 @@
 # From: https://www.sudo.ws/getting/download/
-sha256  976aa56d3e3b2a75593307864288addb748c9c136e25d95a9cc699aafa77239c  sudo-1.9.16p2.tar.gz
+sha256  ff607ea717072197738a78f778692cd6df9a7e3e404565f51de063ca27455d32  sudo-1.9.17p1.tar.gz
 # Locally calculated
-sha256  a6e4ec823f2ba58f840b0ff5fc5459e4893f46a91bbcd6b2a2d91315de5a2d2b  LICENSE.md
+sha256  41eb34d6b184c2638d6d32c6e7f70b8dd6423e68b91da959e0cf773aa01f62d7  LICENSE.md
diff --git a/package/sudo/sudo.mk b/package/sudo/sudo.mk
index 1fe713ab2d..4e1405eaf1 100644
--- a/package/sudo/sudo.mk
+++ b/package/sudo/sudo.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-SUDO_VERSION_MAJOR = 1.9.16
-SUDO_VERSION_MINOR = p2
+SUDO_VERSION_MAJOR = 1.9.17
+SUDO_VERSION_MINOR = p1
 SUDO_VERSION = $(SUDO_VERSION_MAJOR)$(SUDO_VERSION_MINOR)
 SUDO_SITE = https://www.sudo.ws/sudo/dist
 SUDO_LICENSE = ISC, BSD-3-Clause
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
