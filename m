Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC7EDC54EED
	for <buildroot@archiver.kernel.org>; Sun, 29 Jan 2023 21:30:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6E52D60D4B;
	Sun, 29 Jan 2023 21:30:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6E52D60D4B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8VsxDR9K73QB; Sun, 29 Jan 2023 21:30:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7FEB360BAA;
	Sun, 29 Jan 2023 21:30:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7FEB360BAA
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 321311BF576
 for <buildroot@lists.busybox.net>; Sun, 29 Jan 2023 21:30:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6104F81815
 for <buildroot@lists.busybox.net>; Sun, 29 Jan 2023 21:30:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6104F81815
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KFY-lrPY7_yc for <buildroot@lists.busybox.net>;
 Sun, 29 Jan 2023 21:30:07 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4F9A1817C3
 for <buildroot@buildroot.org>; Sun, 29 Jan 2023 21:30:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4F9A1817C3
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 252787FEE1; Sun, 29 Jan 2023 21:30:07 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 29 Jan 2023 22:29:26 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 677fbb43b747cd9ec156dc231c6417420873b53e
X-Git-Newrev: e2914938c94ea80f3edabf55d37e824b7e5f8e5a
X-Patchwork-Hint: ignore
Message-Id: <20230129213007.252787FEE1@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/sudo: bump to
 version 1.9.12p1
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

commit: https://git.buildroot.net/buildroot/commit/?id=e2914938c94ea80f3edabf55d37e824b7e5f8e5a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

remove merged patch

diff LICENSE.md
-    Copyright (C) 1995-2017 Jean-loup Gailly and Mark Adler
+    Copyright (C) 1995-2022 Jean-loup Gailly and Mark Adler
-    Copyright (c) 2008-2018, Dave Benson and the protobuf-c authors.
+    Copyright (c) 2008-2022, Dave Benson and the protobuf-c authors.

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit f095f5a8bec8352ffa182f606c5c7349ec2d6dca)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/sudo/0001-Fix-CVE-2022-43995.patch | 53 ------------------------------
 package/sudo/Config.in                     |  2 +-
 package/sudo/sudo.hash                     |  6 ++--
 package/sudo/sudo.mk                       |  7 ++--
 4 files changed, 6 insertions(+), 62 deletions(-)

diff --git a/package/sudo/0001-Fix-CVE-2022-43995.patch b/package/sudo/0001-Fix-CVE-2022-43995.patch
deleted file mode 100644
index 3f544dcf81..0000000000
--- a/package/sudo/0001-Fix-CVE-2022-43995.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-From bd209b9f16fcd1270c13db27ae3329c677d48050 Mon Sep 17 00:00:00 2001
-From: "Todd C. Miller" <Todd.Miller@sudo.ws>
-Date: Fri, 28 Oct 2022 07:29:55 -0600
-Subject: [PATCH] Fix CVE-2022-43995, potential heap overflow for passwords < 8
- characters. Starting with sudo 1.8.0 the plaintext password buffer is
- dynamically sized so it is not safe to assume that it is at least 9 bytes in
- size. Found by Hugo Lefeuvre (University of Manchester) with ConfFuzz.
-
-[Retrieved from:
-https://github.com/sudo-project/sudo/commit/bd209b9f16fcd1270c13db27ae3329c677d48050]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- plugins/sudoers/auth/passwd.c | 11 +++++------
- 1 file changed, 5 insertions(+), 6 deletions(-)
-
-diff --git a/plugins/sudoers/auth/passwd.c b/plugins/sudoers/auth/passwd.c
-index b2046eca2..0416861e9 100644
---- a/plugins/sudoers/auth/passwd.c
-+++ b/plugins/sudoers/auth/passwd.c
-@@ -63,7 +63,7 @@ sudo_passwd_init(struct passwd *pw, sudo_auth *auth)
- int
- sudo_passwd_verify(struct passwd *pw, char *pass, sudo_auth *auth, struct sudo_conv_callback *callback)
- {
--    char sav, *epass;
-+    char des_pass[9], *epass;
-     char *pw_epasswd = auth->data;
-     size_t pw_len;
-     int matched = 0;
-@@ -75,12 +75,12 @@ sudo_passwd_verify(struct passwd *pw, char *pass, sudo_auth *auth, struct sudo_c
- 
-     /*
-      * Truncate to 8 chars if standard DES since not all crypt()'s do this.
--     * If this turns out not to be safe we will have to use OS #ifdef's (sigh).
-      */
--    sav = pass[8];
-     pw_len = strlen(pw_epasswd);
--    if (pw_len == DESLEN || HAS_AGEINFO(pw_epasswd, pw_len))
--	pass[8] = '\0';
-+    if (pw_len == DESLEN || HAS_AGEINFO(pw_epasswd, pw_len)) {
-+	strlcpy(des_pass, pass, sizeof(des_pass));
-+	pass = des_pass;
-+    }
- 
-     /*
-      * Normal UN*X password check.
-@@ -88,7 +88,6 @@ sudo_passwd_verify(struct passwd *pw, char *pass, sudo_auth *auth, struct sudo_c
-      * only compare the first DESLEN characters in that case.
-      */
-     epass = (char *) crypt(pass, pw_epasswd);
--    pass[8] = sav;
-     if (epass != NULL) {
- 	if (HAS_AGEINFO(pw_epasswd, pw_len) && strlen(epass) == DESLEN)
- 	    matched = !strncmp(pw_epasswd, epass, DESLEN);
diff --git a/package/sudo/Config.in b/package/sudo/Config.in
index cbef15d67b..ee5ea542ab 100644
--- a/package/sudo/Config.in
+++ b/package/sudo/Config.in
@@ -8,4 +8,4 @@ config BR2_PACKAGE_SUDO
 	  basic philosophy is to give as few privileges as possible
 	  but still allow people to get their work done.
 
-	  http://www.sudo.ws/sudo/
+	  https://www.sudo.ws/sudo/
diff --git a/package/sudo/sudo.hash b/package/sudo/sudo.hash
index 63c98e2c4e..a3476df96b 100644
--- a/package/sudo/sudo.hash
+++ b/package/sudo/sudo.hash
@@ -1,4 +1,4 @@
-# From: http://www.sudo.ws/download.html
-sha256  a21918eb9fc0063794f6887464fa2d924ab6d192e19063191a429605c22791d2  sudo-1.9.11p2.tar.gz
+# From: https://www.sudo.ws/getting/download/
+sha256  475a18a8eb3da8b2917ceab063a6baf51ea09128c3c47e3e0e33ab7497bab7d8  sudo-1.9.12p1.tar.gz
 # Locally calculated
-sha256  cf3a83366f9aabfd76d693ce03843106fcaaf6c76dfa97610f7c0b719a06e6bb  LICENSE.md
+sha256  d2f93a3b17ed5586fddd07be33ad767146c1a81a22682baa68bb4360a31d020a  LICENSE.md
diff --git a/package/sudo/sudo.mk b/package/sudo/sudo.mk
index cff23fe9e7..0a8c873925 100644
--- a/package/sudo/sudo.mk
+++ b/package/sudo/sudo.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-SUDO_VERSION_MAJOR = 1.9.11
-SUDO_VERSION_MINOR = p2
+SUDO_VERSION_MAJOR = 1.9.12
+SUDO_VERSION_MINOR = p1
 SUDO_VERSION = $(SUDO_VERSION_MAJOR)$(SUDO_VERSION_MINOR)
 SUDO_SITE = https://www.sudo.ws/sudo/dist
 SUDO_LICENSE = ISC, BSD-3-Clause
@@ -25,9 +25,6 @@ SUDO_CONF_OPTS = \
 	--without-interfaces \
 	--with-env-editor
 
-# 0001-Fix-CVE-2022-43995.patch
-SUDO_IGNORE_CVES += CVE-2022-43995
-
 ifeq ($(BR2_PACKAGE_LINUX_PAM),y)
 define SUDO_INSTALL_PAM_CONF
 	$(INSTALL) -D -m 0644 package/sudo/sudo.pam $(TARGET_DIR)/etc/pam.d/sudo
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
