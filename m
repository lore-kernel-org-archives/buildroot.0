Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A20EEC4332F
	for <buildroot@archiver.kernel.org>; Fri,  3 Nov 2023 19:54:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4B2C0403E9;
	Fri,  3 Nov 2023 19:54:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4B2C0403E9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8Z9pDuNaHSbm; Fri,  3 Nov 2023 19:54:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 92CD74042B;
	Fri,  3 Nov 2023 19:54:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 92CD74042B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1A36A1BF990
 for <buildroot@lists.busybox.net>; Fri,  3 Nov 2023 19:54:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E81AE60B2C
 for <buildroot@lists.busybox.net>; Fri,  3 Nov 2023 19:54:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E81AE60B2C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ujfe2VdmwCeD for <buildroot@lists.busybox.net>;
 Fri,  3 Nov 2023 19:54:01 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id F004860B2B
 for <buildroot@buildroot.org>; Fri,  3 Nov 2023 19:54:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F004860B2B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D6AAF865E0; Fri,  3 Nov 2023 19:54:00 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 3 Nov 2023 20:53:10 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: be4347c0889232a70b7b944d6e9e7e48259bfd9d
X-Git-Newrev: 3904d470f7a39daf47ce7e0c29212f3b2492b42b
X-Patchwork-Hint: ignore
Message-Id: <20231103195400.D6AAF865E0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/brltty: bump to version 6.6
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

commit: https://git.buildroot.net/buildroot/commit/?id=3904d470f7a39daf47ce7e0c29212f3b2492b42b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Drop second patch (already in version)
- Update hash of README (DotPadd added with
  https://github.com/brltty/brltty/commit/5a9288c6bc3226201146aaafed4885f2bb277739
  and year updated with
  https://github.com/brltty/brltty/commit/f21f2199162012a74398afb1265d458933a19291
  https://github.com/brltty/brltty/commit/68589179695e129ab2b0972071a93b2233115df6)
- This bump will fix the following build failure raised since bump of
  gettext-gnu to version 0.22 in commit f6a6e3a8363a32e5443c9eadc2ee047853640d1a
  thanks to
  https://github.com/brltty/brltty/commit/31061173fd80c7ed0f83e8d20d62c59dbedcebe0:

/home/thomas/autobuild/instance-2/output-1/host/bin/msgfmt --output-file zh.mo -- ./zh.po
/home/thomas/autobuild/instance-2/output-1/host/bin/msgfmt: input file doesn't contain a header entry with a charset specification
make[3]: *** [Makefile:86: ru.mo] Error 1

https://github.com/brltty/brltty/blob/BRLTTY-6.6/Documents/ChangeLog

Fixes:
 - http://autobuild.buildroot.org/results/29f5ef8a52db4dd717fbaf1ade9d250dfcebe6ff

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .checkpackageignore                                |  1 -
 ...gue-runProgramTerminationCommands-used-a-.patch | 29 ----------------------
 package/brltty/brltty.hash                         |  4 +--
 package/brltty/brltty.mk                           |  2 +-
 4 files changed, 3 insertions(+), 33 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 7740914ff9..52a6aaf797 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -217,7 +217,6 @@ package/botan/0002-src-build-data-arch-superh.txt-add-sh4-eb-aeb.patch Upstream
 package/brickd/S70brickd Indent Shellcheck Variables
 package/bridge-utils/0001-fix-build-on-musl.patch Upstream
 package/brltty/0001-Fix-linking-error-on-mips64el.patch Upstream
-package/brltty/0002-shell-prologue-runProgramTerminationCommands-used-a-.patch Upstream
 package/brltty/S10brltty Indent Shellcheck Variables
 package/bsdiff/0001-Add-missing-header-for-u_char.patch Upstream
 package/bustle/0001-Makefile-fix-pcap-config-call.patch Upstream
diff --git a/package/brltty/0002-shell-prologue-runProgramTerminationCommands-used-a-.patch b/package/brltty/0002-shell-prologue-runProgramTerminationCommands-used-a-.patch
deleted file mode 100644
index 0f81254e08..0000000000
--- a/package/brltty/0002-shell-prologue-runProgramTerminationCommands-used-a-.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 4503c2cbd3981ba1b50ec7ce287ab48c772b3a7f Mon Sep 17 00:00:00 2001
-From: Dave Mielke <Dave@Mielke.cc>
-Date: Sat, 15 Oct 2022 15:20:38 -0400
-Subject: [PATCH] shell prologue: runProgramTerminationCommands used a bash
- command. (dm)
-
-Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
-[james.hilliard1@gmail.com: backport from upstream commit
-4503c2cbd3981ba1b50ec7ce287ab48c772b3a7f]
----
- brltty-prologue.sh | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/brltty-prologue.sh b/brltty-prologue.sh
-index 05b817742..6d1faf983 100644
---- a/brltty-prologue.sh
-+++ b/brltty-prologue.sh
-@@ -102,7 +102,7 @@ runProgramTerminationCommands() {
-    while [ "${programTerminationCommandCount}" -gt 0 ]
-    do
-       set -- $(getVariable "programTerminationCommand${programTerminationCommandCount}")
--      let "programTerminationCommandCount -= 1"
-+      programTerminationCommandCount=$((programTerminationCommandCount - 1))
- 
-       local process="${1}"
-       local directory="${2}"
--- 
-2.34.1
-
diff --git a/package/brltty/brltty.hash b/package/brltty/brltty.hash
index 9fc63714bc..9b707fc1c2 100644
--- a/package/brltty/brltty.hash
+++ b/package/brltty/brltty.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  2f173535291ba39b5a9fc8d80c349234333d92042d95d6dd88796c98a02f316b  brltty-6.5.tar.xz
+sha256  ab11cfc5fbd7ef0ec876ffea7e131e424b2fd004b6158064e1a2e46412825529  brltty-6.6.tar.xz
 sha256  d80c9d084ebfb50ea1ed91bfbc2410d6ce542097a32c43b00781b83adcb8c77f  LICENSE-LGPL
-sha256  c00c876cb4581a6b54fcc176f7e694896e5b52c4b015615566a787e8bc89fe69  README
+sha256  72740317768530c60046c591160d4552afb3ac49657b04c7b8452c1bbe7b834e  README
diff --git a/package/brltty/brltty.mk b/package/brltty/brltty.mk
index dc5a38cddb..f00a18cc6f 100644
--- a/package/brltty/brltty.mk
+++ b/package/brltty/brltty.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BRLTTY_VERSION = 6.5
+BRLTTY_VERSION = 6.6
 BRLTTY_SOURCE = brltty-$(BRLTTY_VERSION).tar.xz
 BRLTTY_SITE = http://brltty.com/archive
 BRLTTY_INSTALL_STAGING_OPTS = INSTALL_ROOT=$(STAGING_DIR) install
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
