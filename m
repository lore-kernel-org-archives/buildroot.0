Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE363C3271E
	for <buildroot@archiver.kernel.org>; Mon,  8 Jul 2024 20:20:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 91C1C608FD;
	Mon,  8 Jul 2024 20:20:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MBB0S_EfMIru; Mon,  8 Jul 2024 20:20:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AD1AB60A6B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AD1AB60A6B;
	Mon,  8 Jul 2024 20:20:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2AEDA1BF275
 for <buildroot@lists.busybox.net>; Mon,  8 Jul 2024 20:20:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D277B608D8
 for <buildroot@lists.busybox.net>; Mon,  8 Jul 2024 20:20:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KBi1hWvW9nnQ for <buildroot@lists.busybox.net>;
 Mon,  8 Jul 2024 20:20:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B7F8A60804
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id B7F8A60804
 for <buildroot@buildroot.org>; Mon,  8 Jul 2024 20:20:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B124483FEE; Mon,  8 Jul 2024 20:20:12 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 8 Jul 2024 22:13:58 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9d8883971da90339d3b9825a9df02139ae0ae268
X-Git-Newrev: 1dc5fe6050f4b49a2b2b7b0593246bfc5f1eb408
X-Patchwork-Hint: ignore
Message-Id: <20240708202012.B124483FEE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/freeradius-server: update the
 patches to be applied with fuzz 0
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

commit: https://git.buildroot.net/buildroot/commit/?id=1dc5fe6050f4b49a2b2b7b0593246bfc5f1eb408
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 8f88a644ed7d6 ("support/scripts/apply-patches.sh: set the maximum
fuzz factor to 0") reduced the fuzz factor.

Due to this change, freeradius-server fails to build with output:

    Applying 0001-jlibtool-cross-with-host-CC.patch using patch:
    patching file scripts/libtool.mk
    Hunk #1 FAILED at 43.
    1 out of 1 hunk FAILED -- saving rejects to file scripts/libtool.mk.rej

    Applying 0009-src-modules-rlm_python-fix-build-with-Ofast.patch using patch:
    patching file src/modules/rlm_python3/configure.ac
    Hunk #1 succeeded at 44 (offset -15 lines).
    Hunk #2 FAILED at 73.
    1 out of 2 hunks FAILED -- saving rejects to file src/modules/rlm_python3/configure.ac.rej

This commit refreshes the package patches on the current package version.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../freeradius-server/0001-jlibtool-cross-with-host-CC.patch   |  5 +++--
 .../0009-src-modules-rlm_python-fix-build-with-Ofast.patch     | 10 ++++++----
 2 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/package/freeradius-server/0001-jlibtool-cross-with-host-CC.patch b/package/freeradius-server/0001-jlibtool-cross-with-host-CC.patch
index 0cd55071c4..94205754c2 100644
--- a/package/freeradius-server/0001-jlibtool-cross-with-host-CC.patch
+++ b/package/freeradius-server/0001-jlibtool-cross-with-host-CC.patch
@@ -11,6 +11,8 @@ Signed-off-by: David Gouarin <david.gouarin@thalesgroup.com>
 Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
 [Fabrice: update for 3.2.3]
 SIgned-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Dario: make the patch to be applied with fuzz factor 0]
+Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
 ---
  scripts/libtool.mk | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
@@ -19,8 +21,7 @@ diff --git a/scripts/libtool.mk b/scripts/libtool.mk
 index 57915e1053..c28260dd7e 100644
 --- a/scripts/libtool.mk
 +++ b/scripts/libtool.mk
-@@ -43,8 +43,8 @@ ifeq "${LIBTOOL}" "JLIBTOOL"
-
+@@ -48,8 +48,8 @@ ifeq "${LIBTOOL}" "JLIBTOOL"
      # binary!
      ${JLIBTOOL}: ${top_makedir}/jlibtool.c
  	$(Q)mkdir -p $(dir $@)
diff --git a/package/freeradius-server/0009-src-modules-rlm_python-fix-build-with-Ofast.patch b/package/freeradius-server/0009-src-modules-rlm_python-fix-build-with-Ofast.patch
index c92b4171d2..2c1f07cb66 100644
--- a/package/freeradius-server/0009-src-modules-rlm_python-fix-build-with-Ofast.patch
+++ b/package/freeradius-server/0009-src-modules-rlm_python-fix-build-with-Ofast.patch
@@ -18,15 +18,17 @@ Fixes:
 
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 Upstream: https://github.com/FreeRADIUS/freeradius-server/pull/5263
+[Dario: make the patch to be applied with fuzz factor 0]
+Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
 ---
- src/modules/rlm_python/configure.ac | 4 ++--
+ src/modules/rlm_python3/configure.ac | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/src/modules/rlm_python3/configure.ac b/src/modules/rlm_python3/configure.ac
 index e2f74574fb..ee30b324d9 100644
 --- a/src/modules/rlm_python3/configure.ac
 +++ b/src/modules/rlm_python3/configure.ac
-@@ -59,7 +59,7 @@ else
+@@ -44,7 +44,7 @@ else
  
  	dnl # Convert -I to -isystem to get rid of warnings about issues in Python headers
  	dnl # Strip -systemroot
@@ -35,8 +37,8 @@ index e2f74574fb..ee30b324d9 100644
  	dnl # -D_FORTIFY_SOURCE needs -O.
  	dnl # Strip debug symbol flags (-g[0-9]?). We decide on debugging symbols, not python
  	dnl # Strip -W*, we decide what warnings are important
-@@ -73,7 +73,7 @@ else
- 	mod_cflags=`echo " $python_cflags" | sed -e '\
+@@ -56,7 +56,7 @@ else
+ 	mod_cflags=`echo " $python3_cflags" | sed -e '\
  		s/ -I/ -isystem/g;\
  		s/ -isysroot[[ =]]\{0,1\}[[^-]]*/ /g;\
 -		s/ -O[[^[[:blank:]]]]*/ /g;\
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
