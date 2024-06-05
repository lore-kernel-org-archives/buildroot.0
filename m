Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65F49C25B76
	for <buildroot@archiver.kernel.org>; Wed,  5 Jun 2024 21:04:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0BB0681A39;
	Wed,  5 Jun 2024 21:04:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4RItma90TxF6; Wed,  5 Jun 2024 21:04:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D63BB81A3B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D63BB81A3B;
	Wed,  5 Jun 2024 21:04:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 13CEA1BF5A9
 for <buildroot@lists.busybox.net>; Wed,  5 Jun 2024 21:04:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0C9E0606DA
 for <buildroot@lists.busybox.net>; Wed,  5 Jun 2024 21:04:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tnVXNkB-gkKT for <buildroot@lists.busybox.net>;
 Wed,  5 Jun 2024 21:04:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 24FD260651
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 24FD260651
 for <buildroot@buildroot.org>; Wed,  5 Jun 2024 21:04:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D0A2187A67; Wed,  5 Jun 2024 21:04:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 5 Jun 2024 23:00:15 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7db4dc07c464727e3eda9994510db55c3f16f925
X-Git-Newrev: ba19e5162e14941ccc1c0092d3dbc7160c7da683
X-Patchwork-Hint: ignore
Message-Id: <20240605210411.D0A2187A67@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/systemd: bump to version 254.13
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2237934883156679681=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2237934883156679681==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=ba19e5162e14941ccc1c0092d3dbc7160c7da683
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop patch which is now upstream.

Among other things, this fixes building with Linux 6.9.

https://github.com/systemd/systemd-stable/commit/a4ce4095ce77ca5df6827e24b47cbaa675517d39

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
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
index 483b2d24a5..6b3553723c 100644
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

--===============2237934883156679681==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2237934883156679681==--
