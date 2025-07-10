Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81C69C83F1D
	for <buildroot@archiver.kernel.org>; Fri, 11 Jul 2025 10:21:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 41BCA83BF6;
	Fri, 11 Jul 2025 10:21:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EttdZIPfw6l7; Fri, 11 Jul 2025 10:21:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 34C4483CC5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 34C4483CC5;
	Fri, 11 Jul 2025 10:21:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 209F9199
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 10:21:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 62E6240C73
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 10:21:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4hbi-7GBlMhp for <buildroot@buildroot.org>;
 Fri, 11 Jul 2025 10:21:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E09F340C8A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E09F340C8A
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 10:21:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DEA2B86353; Fri, 11 Jul 2025 10:21:03 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 10 Jul 2025 11:36:01 +0200
X-Git-Refname: refs/heads/2025.05.x
X-Git-Oldrev: b27c3ef88b08b96bcc411acf7f7442a4e2298070
X-Git-Newrev: 07cde1ad1efe24d826ca99166534b3f0212cb5f7
X-Patchwork-Hint: ignore
Message-Id: <20250711102103.DEA2B86353@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.05.x] package/sudo: security
 bump to version 1.9.17p1
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

commit: https://git.buildroot.net/buildroot/commit/?id=07cde1ad1efe24d826ca99166534b3f0212cb5f7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.05.x

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
(cherry picked from commit ee86844e632d5760355154ea4e928c9228f3dfd1)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/sudo/sudo.hash | 4 ++--
 package/sudo/sudo.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/sudo/sudo.hash b/package/sudo/sudo.hash
index 066d3b9de6..3bbce74cbc 100644
--- a/package/sudo/sudo.hash
+++ b/package/sudo/sudo.hash
@@ -1,4 +1,4 @@
 # From: https://www.sudo.ws/getting/download/
-sha256  558d10b9a1991fb3b9fa7fa7b07ec4405b7aefb5b3cb0b0871dbc81e3a88e558  sudo-1.9.15p5.tar.gz
+sha256  ff607ea717072197738a78f778692cd6df9a7e3e404565f51de063ca27455d32  sudo-1.9.17p1.tar.gz
 # Locally calculated
-sha256  ea33b3971e8e4d9657cd6794a952aaa71b22bd16745f1645455b6ead010e0a28  LICENSE.md
+sha256  41eb34d6b184c2638d6d32c6e7f70b8dd6423e68b91da959e0cf773aa01f62d7  LICENSE.md
diff --git a/package/sudo/sudo.mk b/package/sudo/sudo.mk
index 7961a99002..4e1405eaf1 100644
--- a/package/sudo/sudo.mk
+++ b/package/sudo/sudo.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-SUDO_VERSION_MAJOR = 1.9.15
-SUDO_VERSION_MINOR = p5
+SUDO_VERSION_MAJOR = 1.9.17
+SUDO_VERSION_MINOR = p1
 SUDO_VERSION = $(SUDO_VERSION_MAJOR)$(SUDO_VERSION_MINOR)
 SUDO_SITE = https://www.sudo.ws/sudo/dist
 SUDO_LICENSE = ISC, BSD-3-Clause
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
