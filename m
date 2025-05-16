Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39317C2D0CD
	for <buildroot@archiver.kernel.org>; Mon, 19 May 2025 11:00:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A957270D56;
	Mon, 19 May 2025 11:00:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VQc0KUrOXu_A; Mon, 19 May 2025 11:00:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A1E7970D72
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A1E7970D72;
	Mon, 19 May 2025 11:00:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 14C93D4
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:46:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 31B6940D7B
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:40:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CwN1HKQWDlrD for <buildroot@buildroot.org>;
 Mon, 19 May 2025 10:40:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5709C410CA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5709C410CA
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:40:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 557FB8348A; Mon, 19 May 2025 10:40:03 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Fri, 16 May 2025 12:08:05 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 00b2d74dbb73790578b271cac91cb3bd9082487b
X-Git-Newrev: a127b7e999586a83bd59655635caa621ce8d256f
X-Patchwork-Hint: ignore
Message-Id: <20250519104003.557FB8348A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/openssh: bump to
 version 10.0p1
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

commit: https://git.buildroot.net/buildroot/commit/?id=a127b7e999586a83bd59655635caa621ce8d256f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Release notes:
https://www.openssh.com/txt/release-10.0

Install sshd-auth.
https://github.com/openssh/openssh-portable/commit/6072e4c9385713e9c166f32cfca6a7e603d4f0b8

Also, the release note of 10.0p1 states it is a security update for
CVE-2025-32728. This commit is not marked as security bump, because the
security fix is already present in Buildroot since commit [1]. For this
reason, this commit also removes the package patches and the
_IGNORE_CVES variable.

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/211e822d433806893c1395b55c1d891343a07aa0

Signed-off-by: Kadambini Nema <kadambini.nema@gmail.com>
[Julien:
 - remove the "security" mention commit title
 - remove local patches and _IGNORE_CVES
 - add info in commit log
]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...x-logic-error-in-disableforwarding-option.patch | 49 ----------------------
 package/openssh/openssh.hash                       |  4 +-
 package/openssh/openssh.mk                         |  8 ++--
 3 files changed, 5 insertions(+), 56 deletions(-)

diff --git a/package/openssh/0001-fix-logic-error-in-disableforwarding-option.patch b/package/openssh/0001-fix-logic-error-in-disableforwarding-option.patch
deleted file mode 100644
index 2c64ec1910..0000000000
--- a/package/openssh/0001-fix-logic-error-in-disableforwarding-option.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From fc86875e6acb36401dfc1dfb6b628a9d1460f367 Mon Sep 17 00:00:00 2001
-From: "djm@openbsd.org" <djm@openbsd.org>
-Date: Wed, 9 Apr 2025 07:00:03 +0000
-Subject: [PATCH] upstream: Fix logic error in DisableForwarding option.
-
-This option was documented as disabling X11 and agent forwarding but it failed to do so.
-Spotted by Tim Rice.
-
-OpenBSD-Commit-ID: fffc89195968f7eedd2fc57f0b1f1ef3193f5ed1
-
-Upstream: https://github.com/openssh/openssh-portable/commit/fc86875e6acb36401dfc1dfb6b628a9d1460f367
-
-Fixes the following CVE:
-  - CVE-2025-32728: In sshd in OpenSSH before 10.0, the DisableForwarding
-                    directive does not adhere to the documentation stating
-                    that it disables X11 and agent forwarding.
-
-[Titouan: 
- - Remove diff on OpenBSD comment at the top of the file that does not apply
-   cleanly on openssh 9.9
-]
-Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
----
- session.c | 7 ++++---
- 1 file changed, 4 insertions(+), 3 deletions(-)
-
-diff --git a/session.c b/session.c
-index 52a4a3446e6..6444c77f31c 100644
---- a/session.c
-+++ b/session.c
-@@ -2171,7 +2171,8 @@ session_auth_agent_req(struct ssh *ssh, Session *s)
- 	if ((r = sshpkt_get_end(ssh)) != 0)
- 		sshpkt_fatal(ssh, r, "%s: parse packet", __func__);
- 	if (!auth_opts->permit_agent_forwarding_flag ||
--	    !options.allow_agent_forwarding) {
-+	    !options.allow_agent_forwarding ||
-+	    options.disable_forwarding) {
- 		debug_f("agent forwarding disabled");
- 		return 0;
- 	}
-@@ -2566,7 +2567,7 @@ session_setup_x11fwd(struct ssh *ssh, Session *s)
- 		ssh_packet_send_debug(ssh, "X11 forwarding disabled by key options.");
- 		return 0;
- 	}
--	if (!options.x11_forwarding) {
-+	if (!options.x11_forwarding || options.disable_forwarding) {
- 		debug("X11 forwarding disabled in server configuration file.");
- 		return 0;
- 	}
diff --git a/package/openssh/openssh.hash b/package/openssh/openssh.hash
index 0bbc4874df..62c3bcad99 100644
--- a/package/openssh/openssh.hash
+++ b/package/openssh/openssh.hash
@@ -1,4 +1,4 @@
-# From https://www.openssh.com/txt/release-9.9p2
-sha256  91aadb603e08cc285eddf965e1199d02585fa94d994d6cae5b41e1721e215673  openssh-9.9p2.tar.gz
+# From https://www.openssh.com/txt/release-10.0
+sha256  021a2e709a0edf4250b1256bd5a9e500411a90dddabea830ed59cef90eb9d85c  openssh-10.0p1.tar.gz
 # Locally calculated
 sha256  5bb5b160726ef5756e4f32fe95b35249c294962419650f48d05134b486d27ccb  LICENCE
diff --git a/package/openssh/openssh.mk b/package/openssh/openssh.mk
index b5e4645b50..f1b8c0920b 100644
--- a/package/openssh/openssh.mk
+++ b/package/openssh/openssh.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-OPENSSH_VERSION_MAJOR = 9.9
-OPENSSH_VERSION_MINOR = p2
+OPENSSH_VERSION_MAJOR = 10.0
+OPENSSH_VERSION_MINOR = p1
 OPENSSH_VERSION = $(OPENSSH_VERSION_MAJOR)$(OPENSSH_VERSION_MINOR)
 OPENSSH_CPE_ID_VERSION = $(OPENSSH_VERSION_MAJOR)
 OPENSSH_CPE_ID_UPDATE = $(OPENSSH_VERSION_MINOR)
@@ -13,9 +13,6 @@ OPENSSH_SITE = http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable
 OPENSSH_LICENSE = BSD-3-Clause, BSD-2-Clause, Public Domain
 OPENSSH_LICENSE_FILES = LICENCE
 
-# 0001-fix-logic-error-in-disableforwarding-option.patch
-OPENSSH_IGNORE_CVES += CVE-2025-32728
-
 OPENSSH_CONF_ENV = \
 	LD="$(TARGET_CC)" \
 	LDFLAGS="$(TARGET_CFLAGS)" \
@@ -122,6 +119,7 @@ define OPENSSH_INSTALL_SERVER_PROGRAMS
 	$(INSTALL) -D -m 0755 $(@D)/sshd $(TARGET_DIR)/usr/sbin/sshd
 	$(INSTALL) -D -m 0755 $(@D)/sshd-session $(TARGET_DIR)/usr/libexec/sshd-session
 	$(INSTALL) -D -m 0755 $(@D)/sftp-server $(TARGET_DIR)/usr/libexec/sftp-server
+	$(INSTALL) -D -m 0755 $(@D)/sshd-auth $(TARGET_DIR)/usr/libexec/sshd-auth
 endef
 OPENSSH_POST_INSTALL_TARGET_HOOKS += OPENSSH_INSTALL_SERVER_PROGRAMS
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
