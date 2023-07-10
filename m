Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CB57EB64DC
	for <buildroot@archiver.kernel.org>; Mon, 10 Jul 2023 17:22:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A462181F7C;
	Mon, 10 Jul 2023 17:22:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A462181F7C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wOMFGZJ2hWti; Mon, 10 Jul 2023 17:22:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9E71181F5A;
	Mon, 10 Jul 2023 17:22:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9E71181F5A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9D4F81BF3D4
 for <buildroot@lists.busybox.net>; Mon, 10 Jul 2023 17:22:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 756CD4176A
 for <buildroot@lists.busybox.net>; Mon, 10 Jul 2023 17:22:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 756CD4176A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UuFGQ34vz1CM for <buildroot@lists.busybox.net>;
 Mon, 10 Jul 2023 17:22:01 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6288041754
 for <buildroot@buildroot.org>; Mon, 10 Jul 2023 17:22:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6288041754
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4D94D86B6A; Mon, 10 Jul 2023 17:22:01 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 10 Jul 2023 18:47:56 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 025ce96406309d1dd4411ae253e5cc6a8cdb9aec
X-Git-Newrev: 9206caf13ec38841d93c7b8434fcc3668dffbc36
X-Patchwork-Hint: ignore
Message-Id: <20230710172201.4D94D86B6A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/linuxptp: bump version to 4.0
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=9206caf13ec38841d93c7b8434fcc3668dffbc36
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The current linuxptp is missing multiple options added lately as described at
https://www.mail-archive.com/linuxptp-devel@lists.sourceforge.net/msg04908.html
and the upgrade to 4.0 removes the need for applying patches already included in
the current release. Tested functional on a Raspberry Pi Compute Module 4
(raspberrypicm4io_64_defconfig).

Signed-off-by: Jean-Michel Friedt <friedtj@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...issing.h-drop-clock_nanosleep-replacement.patch | 49 ----------------------
 ...-conditional-assignment-for-KBUILD_OUTPUT.patch | 43 -------------------
 package/linuxptp/linuxptp.hash                     |  6 +--
 package/linuxptp/linuxptp.mk                       |  2 +-
 4 files changed, 2 insertions(+), 98 deletions(-)

diff --git a/package/linuxptp/0001-missing.h-drop-clock_nanosleep-replacement.patch b/package/linuxptp/0001-missing.h-drop-clock_nanosleep-replacement.patch
deleted file mode 100644
index 54ef963ae4..0000000000
--- a/package/linuxptp/0001-missing.h-drop-clock_nanosleep-replacement.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From 947bf03ec3d9eaa0bfc0269eed86b9364e94bc1a Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
-Date: Sun, 5 Aug 2018 15:25:53 +0200
-Subject: [PATCH] missing.h: drop clock_nanosleep() replacement
-
-Since uClibc-ng commits 68628fe7d463541bf3c33da6b214e63c0cc9feed
-("librt: declare clock_nanosleep not only for NPTL") and
-ddbb03e77ac1a48740688814b82f45c97ee81f37 ("librt: clock_nanosleep
-could be even used without threads"), clock_nanosleep() is always
-provided by uClibc, regardless of the thread implementation (none,
-linuxthreads, nptl). These commits will be part of the upcoming 1.0.31
-release of uClibc-ng.
-
-Thanks to this, we can drop the replacement clock_nanosleep()
-implementation added by linuxptp. Without this, linuxptp fails to
-build with:
-
-missing.h:117:19: error: static declaration of 'clock_nanosleep' follows non-static declaration
- static inline int clock_nanosleep(clockid_t clock_id, int flags,
-                   ^~~~~~~~~~~~~~~
-In file included from clockadj.h:24:0,
-                 from clockadj.c:24:
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
----
- missing.h | 7 -------
- 1 file changed, 7 deletions(-)
-
-diff --git a/missing.h b/missing.h
-index 2f7adb9..60f89a3 100644
---- a/missing.h
-+++ b/missing.h
-@@ -129,13 +129,6 @@ enum {
- 
- #define TFD_TIMER_ABSTIME (1 << 0)
- 
--static inline int clock_nanosleep(clockid_t clock_id, int flags,
--				  const struct timespec *request,
--				  struct timespec *remain)
--{
--	return syscall(__NR_clock_nanosleep, clock_id, flags, request, remain);
--}
--
- static inline int timerfd_create(int clockid, int flags)
- {
- 	return syscall(__NR_timerfd_create, clockid, flags);
--- 
-2.14.4
-
diff --git a/package/linuxptp/0002-makefile-use-conditional-assignment-for-KBUILD_OUTPUT.patch b/package/linuxptp/0002-makefile-use-conditional-assignment-for-KBUILD_OUTPUT.patch
deleted file mode 100644
index 73cd34f744..0000000000
--- a/package/linuxptp/0002-makefile-use-conditional-assignment-for-KBUILD_OUTPUT.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From: Changqing Li <changqing.li@windriver.com>
-Date: Wed, 23 Nov 2022 08:23:46 +0800
-Subject: [Linuxptp-devel] [PATCH] makefile: use conditional assignment for KBUILD_OUTPUT
-
-Refer [1],from make 4.4, all variables that are marked as export will
-also be passed to the shell started by the shell function. use "=" will
-make KBUILD_OUTPUT always empty for shell function, use "?=" to make
-"export KBUILD_OUTPUT" in enrironment can work.
-
-[snip of 4.4 NEWS]
-* WARNING: Backward-incompatibility!
-   Previously makefile variables marked as export were not exported to commands
-   started by the $(shell ...) function.  Now, all exported variables are
-   exported to $(shell ...).
-[snip]
-
-[1] https://git.savannah.gnu.org/cgit/make.git/tree/NEWS?h=4.4&id=ed493f6c9116cc217b99c2cfa6a95f15803235a2#n74
-
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
-
-[Retrieved from mailing list. The patch was not yet accepted and applied:
-https://www.mail-archive.com/linuxptp-devel@lists.sourceforge.net/msg06151.html]
-Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
-
----
- makefile | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/makefile b/makefile
-index 9aed383..ba3fb38 100644
---- a/makefile
-+++ b/makefile
-@@ -15,7 +15,7 @@
- # with this program; if not, write to the Free Software Foundation, Inc.,
- # 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
- 
--KBUILD_OUTPUT =
-+KBUILD_OUTPUT ?=
- 
- DEBUG	=
- CC	= $(CROSS_COMPILE)gcc
--- 
-2.25.1
diff --git a/package/linuxptp/linuxptp.hash b/package/linuxptp/linuxptp.hash
index a5479b0ebc..edbfb44553 100644
--- a/package/linuxptp/linuxptp.hash
+++ b/package/linuxptp/linuxptp.hash
@@ -1,9 +1,5 @@
-# From https://sourceforge.net/projects/linuxptp/files/v3.1.1/
-sha1  f905eabc6fd0f03c6a353f9c4ba188a3bd1b774c  linuxptp-3.1.1.tgz
-md5  3b79ab5e77c5b5cf06bc1c8350d405bb  linuxptp-3.1.1.tgz
-
 # Locally computed:
-sha256  94d6855f9b7f2d8e9b0ca6d384e3fae6226ce6fc012dbad02608bdef3be1c0d9  linuxptp-3.1.1.tgz
+sha256  d27d5ef296bb3d285e22e69f75ae023b4b42a2f4655130d6d390d8afcbc3d933  linuxptp-4.0.tgz
 
 # Hash for license file:
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/linuxptp/linuxptp.mk b/package/linuxptp/linuxptp.mk
index 048dd0b896..054442d569 100644
--- a/package/linuxptp/linuxptp.mk
+++ b/package/linuxptp/linuxptp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LINUXPTP_VERSION = 3.1.1
+LINUXPTP_VERSION = 4.0
 LINUXPTP_SOURCE = linuxptp-$(LINUXPTP_VERSION).tgz
 LINUXPTP_SITE = http://downloads.sourceforge.net/linuxptp
 LINUXPTP_LICENSE = GPL-2.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
