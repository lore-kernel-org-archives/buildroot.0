Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 096CEC27C4F
	for <buildroot@archiver.kernel.org>; Thu, 13 Jun 2024 12:39:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 947A06100A;
	Thu, 13 Jun 2024 12:39:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NmTdWv5Y3tJh; Thu, 13 Jun 2024 12:39:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 215BB61010
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 215BB61010;
	Thu, 13 Jun 2024 12:39:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 126681BF34E
 for <buildroot@lists.busybox.net>; Thu, 13 Jun 2024 12:39:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 598C160B60
 for <buildroot@lists.busybox.net>; Thu, 13 Jun 2024 12:39:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NIK150x39ENp for <buildroot@lists.busybox.net>;
 Thu, 13 Jun 2024 12:39:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7C8986061D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7C8986061D
 for <buildroot@buildroot.org>; Thu, 13 Jun 2024 12:39:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7623587EAB; Thu, 13 Jun 2024 12:39:20 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 13 Jun 2024 14:36:13 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 45c7276a974a309a8757e229ec24fc055ce5af58
X-Git-Newrev: 02575ff4d678dc90cb808ca1585dea10412e5d29
X-Patchwork-Hint: ignore
Message-Id: <20240613123920.7623587EAB@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/systemd: bump to
 version 254.13
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
Content-Type: multipart/mixed; boundary="===============1832197082225422598=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1832197082225422598==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=02575ff4d678dc90cb808ca1585dea10412e5d29
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Drop patch which is now upstream.

Among other things, this fixes building with Linux 6.9.

https://github.com/systemd/systemd-stable/commit/a4ce4095ce77ca5df6827e24b47cbaa675517d39

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
(cherry picked from commit ba19e5162e14941ccc1c0092d3dbc7160c7da683)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...er-warning-about-empty-directive-argument.patch | 45 ----------------------
 package/systemd/systemd.hash                       |  2 +-
 package/systemd/systemd.mk                         |  2 +-
 3 files changed, 2 insertions(+), 47 deletions(-)

diff --git a/package/systemd/0001-install-fix-compiler-warning-about-empty-directive-argument.patch b/package/systemd/0001-install-fix-compiler-warning-about-empty-directive-argument.patch
deleted file mode 100644
index 9408a6da0e..0000000000
--- a/package/systemd/0001-install-fix-compiler-warning-about-empty-directive-argument.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From 8040fa55a1cbc34dede3205a902095ecd26c21e3 Mon Sep 17 00:00:00 2001
-From: Luca Boccassi <bluca@debian.org>
-Date: Sat, 24 Feb 2024 12:05:44 +0000
-Subject: [PATCH] install: fix compiler warning about empty directive argument
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-On ppc64el with gcc 13.2 on Ubuntu 24.04:
-
-3s In file included from ../src/basic/macro.h:386,
-483s                  from ../src/basic/alloc-util.h:10,
-483s                  from ../src/shared/install.c:12:
-483s ../src/shared/install.c: In function ‘install_changes_dump’:
-483s ../src/shared/install.c:432:64: error: ‘%s’ directive argument is null [-Werror=format-overflow=]
-483s   432 |                         err = log_error_errno(changes[i].type, "Failed to %s unit, unit %s does not exist.",
-483s       |                                                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-483s ../src/shared/install.c:432:75: note: format string is defined here
-483s   432 |                         err = log_error_errno(changes[i].type, "Failed to %s unit, unit %s does not exist.",
-
-Upstream: https://github.com/systemd/systemd/commit/8040fa55a1cbc34dede3205a902095ecd26c21e3
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- src/shared/install.c | 7 +++++--
- 1 file changed, 5 insertions(+), 2 deletions(-)
-
-diff --git a/src/shared/install.c b/src/shared/install.c
-index fabf5db7ed2e1..c3a94d1912165 100644
---- a/src/shared/install.c
-+++ b/src/shared/install.c
-@@ -340,9 +340,12 @@ void install_changes_dump(int r, const char *verb, const InstallChange *changes,
-         assert(verb || r >= 0);
- 
-         for (size_t i = 0; i < n_changes; i++) {
--                if (changes[i].type < 0)
--                        assert(verb);
-                 assert(changes[i].path);
-+                /* This tries to tell the compiler that it's safe to use 'verb' in a string format if there
-+                 * was an error, but the compiler doesn't care and fails anyway, so strna(verb) is used
-+                 * too. */
-+                assert(verb || changes[i].type >= 0);
-+                verb = strna(verb);
- 
-                 /* When making changes here, make sure to also change install_error() in dbus-manager.c. */
- 
diff --git a/package/systemd/systemd.hash b/package/systemd/systemd.hash
index e5588f06a2..f999d0d34e 100644
--- a/package/systemd/systemd.hash
+++ b/package/systemd/systemd.hash
@@ -1,5 +1,5 @@
 # sha256 locally computed
-sha256  3d23003ea886dbffa5bc84ad72c6edcbde62d32dbdec506e308624e1da509cb0  systemd-254.9.tar.gz
+sha256  26ac73c2108132b1d11ff939e8b1bece42f1c1da03fdf4a242af5a7cf3ac34f1  systemd-254.13.tar.gz
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  LICENSE.GPL2
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  LICENSE.LGPL2.1
 sha256  e5a8645ad94aab24e312dd0c6be2aa54236eb9374480b1b14ea5c61598874fd5  LICENSES/BSD-2-Clause.txt
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index dd4f3e778d..05ce380917 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -19,7 +19,7 @@
 # - Diff sysusers.d with the previous version
 # - Diff factory/etc/nsswitch.conf with the previous version
 #   (details are often sprinkled around in README and manpages)
-SYSTEMD_VERSION = 254.9
+SYSTEMD_VERSION = 254.13
 SYSTEMD_SITE = $(call github,systemd,systemd-stable,v$(SYSTEMD_VERSION))
 SYSTEMD_LICENSE = \
 	LGPL-2.1+, \

--===============1832197082225422598==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1832197082225422598==--
