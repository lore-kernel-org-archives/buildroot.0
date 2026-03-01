Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC77AFD005D
	for <buildroot@archiver.kernel.org>; Sun,  1 Mar 2026 10:50:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7C5AB4196C;
	Sun,  1 Mar 2026 10:50:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r0YkLyiLrvFu; Sun,  1 Mar 2026 10:50:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 58BE641965
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772362224;
	bh=o7sjcRgFGFoOHxoMJm3Q5esFOMt8MaRzFRxRBNaiyk8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=S81O1w0/uvVhoSy7b5/URSn5jhEPcRCvnhDds8luToGaTBtt1Ar3aD0Ik1K/38ein
	 Cu7emVnCsojg8FFX5t41xB0wME5+e3iiNQ4VZmE6KOycteP5Lp+rV9JpoepTzstXhW
	 zaXwdAP7o7JUpoSWP+qbwHjq7s13P/SA7b+bJjqn66Pb7TgvFFaenSdkoYKonRNkf5
	 vuboVN4ERyM4+jMa19Y+KfHiyBsxXrccTy42Cs0zbhTIV1q3qsGI9x+d/6iOjxt+vG
	 DKzihZJ3vgjpFy9sJqz6hOy/tEMjmzQzVRKcViu6Nu2yX6HNHg0yEg1LXNXmiwNo4g
	 BlAkWxLgH7k3g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 58BE641965;
	Sun,  1 Mar 2026 10:50:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 752861EB
 for <buildroot@buildroot.org>; Sun,  1 Mar 2026 10:50:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5B24F83AA3
 for <buildroot@buildroot.org>; Sun,  1 Mar 2026 10:50:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R7TmHKuMFcx4 for <buildroot@buildroot.org>;
 Sun,  1 Mar 2026 10:50:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5175683A9A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5175683A9A
 for <buildroot@buildroot.org>; Sun,  1 Mar 2026 10:50:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 507B984522; Sun,  1 Mar 2026 10:50:22 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 1 Mar 2026 11:44:36 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: ac0dff075f5c635198b2155426806dcb5be6c00e
X-Git-Newrev: a773d00904f9ae543c54b44ba02a2e8b0190adb8
X-Patchwork-Hint: ignore
Message-Id: <20260301105022.507B984522@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/mstpd: bump to version
 0.1.1
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/a773d00904f9ae543c54b44ba02a2e8b0190adb8
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/next

remove upstream patch and .checkpackageignore entry.

release notes:
https://github.com/mstpd/mstpd/releases/tag/0.1.1

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
[Julien: remove .checkpackageignore entry to fix check-package error]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .checkpackageignore                                |  1 -
 ...in-support-different-versions-of-pidof-13.patch | 48 ----------------------
 package/mstpd/mstpd.hash                           |  5 +--
 package/mstpd/mstpd.mk                             |  2 +-
 4 files changed, 3 insertions(+), 53 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 8bee044234..23d622a810 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -650,7 +650,6 @@ package/mpir/0001-mpn-arm-udiv.asm-workaround-binutils-bug-14887.patch lib_patch
 package/mraa/0001-include-Declare-gVERSION-global-as-extern.patch lib_patch.Upstream
 package/mrouted/S41mrouted NotExecutable
 package/mrp/S65mrp lib_sysv.Indent lib_sysv.Variables
-package/mstpd/0001-bridge-stp.in-support-different-versions-of-pidof-13.patch lib_patch.Upstream
 package/multipath-tools/S60multipathd Shellcheck
 package/musl/0001-avoid-kernel-if_ether.h.patch lib_patch.Upstream
 package/musl/0002-package-musl-Make-scheduler-functions-Linux-compatib.patch lib_patch.Upstream
diff --git a/package/mstpd/0001-bridge-stp.in-support-different-versions-of-pidof-13.patch b/package/mstpd/0001-bridge-stp.in-support-different-versions-of-pidof-13.patch
deleted file mode 100644
index daa591131b..0000000000
--- a/package/mstpd/0001-bridge-stp.in-support-different-versions-of-pidof-13.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From 181c453fc1a00573e19f14960dcc54ad84beea7c Mon Sep 17 00:00:00 2001
-From: colin-foster-in-advantage <colin.foster@in-advantage.com>
-Date: Tue, 12 Jul 2022 23:01:09 -0700
-Subject: [PATCH] bridge-stp.in: support different versions of pidof (#137)
-
-* bridge-stp.in: support different versions of pidof
-
-Busybox uses a version of pdiof that doesn't support the -c option. As
-such, this renders mstpd non-functional on any Busybox system.
-
-Just use the standard form of pidof to detect any running instances of mstpd.
-
-Signed-off-by: Colin Foster <colin.foster@in-advantage.com>
----
- bridge-stp.in | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/bridge-stp.in b/bridge-stp.in
-index 47cbe79..3807873 100755
---- a/bridge-stp.in
-+++ b/bridge-stp.in
-@@ -139,7 +139,7 @@ case "$action" in
-         fi
- 
-         # Start mstpd if necessary.
--        if ! pidof -c -s mstpd >/dev/null; then
-+        if ! pidof -s mstpd >/dev/null; then
-             if [ "$MANAGE_MSTPD" != 'y' ]; then
-                 errmsg 'mstpd is not running'
-                 exit 3
-@@ -212,12 +212,12 @@ case "$action" in
-         done
- 
-         # Kill mstpd, since no bridges are currently using it.
--        kill $(pidof -c mstpd)
-+        kill $(pidof mstpd)
-         ;;
-     restart|restart_config)
-         if [ "$action" = 'restart' ]; then
-             # Kill mstpd.
--            pids="$(pidof -c mstpd)" ; Err=$?
-+            pids="$(pidof mstpd)" ; Err=$?
-             if [ $Err -eq 0 ]; then
-                 echo 'Stopping mstpd ...'
-                 kill $pids
--- 
-2.25.1
-
diff --git a/package/mstpd/mstpd.hash b/package/mstpd/mstpd.hash
index 64e946d6d1..7c6c482ef3 100644
--- a/package/mstpd/mstpd.hash
+++ b/package/mstpd/mstpd.hash
@@ -1,5 +1,4 @@
 # locally computed
-sha256  91a1862548b5b509caa2e96e5fb9912bc98d4d58cc98e99a577824735756c14d  mstpd-0.0.9.tar.gz
-sha256  03d1ff4ca189d54322562cb2891888768af719d2c73ceafa5f1ca96133dffeb2  mstpd-0.1.0.tar.gz
+sha256  6b4a0a721147373f0b22e8f47c0f13942b78afc55348299fe7b056b75adc98f4  mstpd-0.1.1.tar.gz
 sha256  c38aee9e3c8c4d5d594ff548a1be05453023016d6286931f6512db215ec1fd42  LICENSE
-sha256  c5cfd44652276184374adf454150d436ce958ce50acc4ef9ccb3605a5ca7a9d3  hmac_md5.c
+sha256  69e0a7ba32b016703dea402deae57348f14d028ff4dd9188b2acad607e484588  hmac_md5.c
diff --git a/package/mstpd/mstpd.mk b/package/mstpd/mstpd.mk
index 07c41af8df..79f361ee6c 100644
--- a/package/mstpd/mstpd.mk
+++ b/package/mstpd/mstpd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MSTPD_VERSION = 0.1.0
+MSTPD_VERSION = 0.1.1
 MSTPD_SITE = $(call github,mstpd,mstpd,$(MSTPD_VERSION))
 MSTPD_AUTORECONF = YES
 MSTPD_LICENSE = GPL-2.0, RSA Data Security (md5)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
