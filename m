Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D4BCCD4F47
	for <buildroot@archiver.kernel.org>; Fri, 15 May 2026 13:30:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4290F84237;
	Fri, 15 May 2026 13:30:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Sn60vhowLJyS; Fri, 15 May 2026 13:30:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6A65A84229
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778851807;
	bh=jCo5rxQtsT6JtS7pyQemcnE5+lweJGdRmRyw9mECSI0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=c2ByCaGEOiL/oaMxELSLj4E1LedRs1LZtJkbtuhpR5y2pUpBdWdsb0EDCZWk4Li0S
	 U4Fc83LpPQqu4Q2QX06ugJwPZAkli2carj/s5n1BI8RpQgpQEzWwGnXZaDxR0GyoKn
	 Iy7JQyibCWjmOGVhaAVKN2dkgwBphmmJrMF3yM71BI8L3F9euDkCIe7TRbGcJGPKLK
	 cpHyIqJ6F+y3rxtOkfk10L6Zx3jfS9gp3vFR2x8nxMf+SXvzsuumJDvg2bfSP6XEjw
	 XODCXdCujrvzgZMBxVZpI9S5n1chgyhSOn4O0zlC3my3GJe9tqAPHhDq1/nHKaRcJn
	 0AGNzSQtZu7Uw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6A65A84229;
	Fri, 15 May 2026 13:30:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1A54536E
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:29:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 21CB441A6F
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:29:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Dqb0IwoW7itg for <buildroot@buildroot.org>;
 Fri, 15 May 2026 13:29:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2662241A69
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2662241A69
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:29:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6DD6486352; Fri, 15 May 2026 13:29:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 12 May 2026 15:28:02 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: 593c050f4d5f7641ec8b5455c808012e0bab0d30
X-Git-Newrev: c5a0a71d7c05feda417b146e8679d7e3a77d7e59
X-Patchwork-Hint: ignore
Message-Id: <20260515132948.6DD6486352@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] package/initscripts: fix
 check-package warnings & indent
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/c5a0a71d7c05feda417b146e8679d7e3a77d7e59
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

No functional change. Add package-level .editorconfig so indentation
matches what other init scripts use.

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 3a488674b52f2515b3cc54526253682749553d11)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 .checkpackageignore               |  2 --
 package/initscripts/.editorconfig |  3 +++
 package/initscripts/init.d/rcK    | 41 ++++++++++++++++++++-------------------
 package/initscripts/init.d/rcS    | 39 ++++++++++++++++++-------------------
 4 files changed, 43 insertions(+), 42 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 0e2e975eff..29474d9366 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -448,8 +448,6 @@ package/ifupdown/0001-dont-use-dpkg-architecture.patch lib_patch.Upstream
 package/igd2-for-linux/S99upnpd Shellcheck lib_sysv.Indent lib_sysv.Variables
 package/imx-mkimage/0001-Add-unused-fake-version.patch lib_patch.Upstream
 package/inadyn/S70inadyn NotExecutable lib_sysv.Indent
-package/initscripts/init.d/rcK Shellcheck lib_shellscript.ConsecutiveEmptyLines lib_shellscript.EmptyLastLine
-package/initscripts/init.d/rcS Shellcheck lib_shellscript.ConsecutiveEmptyLines lib_shellscript.EmptyLastLine
 package/input-event-daemon/S99input-event-daemon lib_sysv.ConsecutiveEmptyLines lib_sysv.Indent lib_sysv.Variables
 package/intel-gmmlib/0001-Drop-hardening-related-flags.patch lib_patch.Upstream
 package/intel-mediasdk/0001-Don-t-force-fstack-protector.patch lib_patch.Upstream
diff --git a/package/initscripts/.editorconfig b/package/initscripts/.editorconfig
new file mode 100644
index 0000000000..e616e5ae3f
--- /dev/null
+++ b/package/initscripts/.editorconfig
@@ -0,0 +1,3 @@
+[rc?]
+indent_style = tab
+indent_size = tab
diff --git a/package/initscripts/init.d/rcK b/package/initscripts/init.d/rcK
index 59e9c54ff9..521e9eb645 100755
--- a/package/initscripts/init.d/rcK
+++ b/package/initscripts/init.d/rcK
@@ -1,27 +1,28 @@
 #!/bin/sh
-
-
+#
 # Stop all init scripts in /etc/init.d
 # executing them in reversed numerical order.
 #
-for i in $(ls -r /etc/init.d/S??*) ;do
+# we need to reverse the order here, sort -r would be no less fragile
+# shellcheck disable=SC2045
+for i in $(ls -r /etc/init.d/S??*); do
 
-     # Ignore dangling symlinks (if any).
-     [ ! -f "$i" ] && continue
+	# Ignore dangling symlinks (if any).
+	[ ! -f "$i" ] && continue
 
-     case "$i" in
-	*.sh)
-	    # Source shell script for speed.
-	    (
-		trap - INT QUIT TSTP
-		set stop
-		. $i
-	    )
-	    ;;
-	*)
-	    # No sh extension, so fork subprocess.
-	    $i stop
-	    ;;
-    esac
+	case "$i" in
+		*.sh)
+			# Source shell script for speed.
+			(
+				trap - INT QUIT TSTP
+				set stop
+				# shellcheck source=/dev/null
+				. "$i"
+			)
+			;;
+		*)
+			# No sh extension, so fork subprocess.
+			"$i" stop
+			;;
+	esac
 done
-
diff --git a/package/initscripts/init.d/rcS b/package/initscripts/init.d/rcS
index de411534da..67efe3cf7f 100755
--- a/package/initscripts/init.d/rcS
+++ b/package/initscripts/init.d/rcS
@@ -1,27 +1,26 @@
 #!/bin/sh
-
-
+#
 # Start all init scripts in /etc/init.d
 # executing them in numerical order.
 #
-for i in /etc/init.d/S??* ;do
+for i in /etc/init.d/S??*; do
 
-     # Ignore dangling symlinks (if any).
-     [ ! -f "$i" ] && continue
+	# Ignore dangling symlinks (if any).
+	[ ! -f "$i" ] && continue
 
-     case "$i" in
-	*.sh)
-	    # Source shell script for speed.
-	    (
-		trap - INT QUIT TSTP
-		set start
-		. $i
-	    )
-	    ;;
-	*)
-	    # No sh extension, so fork subprocess.
-	    $i start
-	    ;;
-    esac
+	case "$i" in
+		*.sh)
+			# Source shell script for speed.
+			(
+				trap - INT QUIT TSTP
+				set start
+				# shellcheck source=/dev/null
+				. "$i"
+			)
+			;;
+		*)
+			# No sh extension, so fork subprocess.
+			"$i" start
+			;;
+	esac
 done
-
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
