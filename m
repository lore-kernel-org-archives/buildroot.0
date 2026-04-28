Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CACC0FF885A
	for <buildroot@archiver.kernel.org>; Tue, 28 Apr 2026 19:45:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7F85040737;
	Tue, 28 Apr 2026 19:45:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J2xLOG47usrW; Tue, 28 Apr 2026 19:45:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9773D4073B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777405515;
	bh=Wg0/+WxN5qCf90T+EFzRjK9g81Bwoq0u+9ZoMW/J9MA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Z90zx2Y/BqJk7sJ4vpkPbHvbML79s0HyXGKKCx7diELyybX3Z90w5N0bMuv0lsD4C
	 X93pwUFLWTsM4bWZ+zRGhrtOW+HmZXRKIuip2ucWdLRji1sqv58FQbH4baMnS35wYo
	 LxRNmmJxpoalqmgDTc1Kkpap8v0WIkp+JtDHDXuqAGzN+GiUy4kc0tPDn3mS1DdLTV
	 025oT5/XAw02MTnVkcgWT0osmNhOgjfAU/ktTw2acJtK3drj4KIjrNf6Csheqx1dmo
	 Ram8/lCUzw6+bhzAD/wY9bds0e6g7LWg3gbmyD2xF6CkWapjHdiXONluuTfiIyyPZb
	 fO0vp2XBKCgFA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9773D4073B;
	Tue, 28 Apr 2026 19:45:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1B4FA231
 for <buildroot@buildroot.org>; Tue, 28 Apr 2026 19:45:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0CF3140737
 for <buildroot@buildroot.org>; Tue, 28 Apr 2026 19:45:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nFsIpBa0VAQc for <buildroot@buildroot.org>;
 Tue, 28 Apr 2026 19:45:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 32C434072F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 32C434072F
 for <buildroot@buildroot.org>; Tue, 28 Apr 2026 19:45:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E959D839A0; Tue, 28 Apr 2026 19:45:13 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 28 Apr 2026 21:43:27 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c03745d7de627e70b1142a6f212fe7e5f060cdd7
X-Git-Newrev: 3a488674b52f2515b3cc54526253682749553d11
X-Patchwork-Hint: ignore
Message-Id: <20260428194513.E959D839A0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/initscripts: fix check-package
 warnings & indent
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/3a488674b52f2515b3cc54526253682749553d11
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

No functional change. Add package-level .editorconfig so indentation
matches what other init scripts use.

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .checkpackageignore               |  2 --
 package/initscripts/.editorconfig |  3 +++
 package/initscripts/init.d/rcK    | 41 ++++++++++++++++++++-------------------
 package/initscripts/init.d/rcS    | 39 ++++++++++++++++++-------------------
 4 files changed, 43 insertions(+), 42 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 494de2a880..fb459bf269 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -441,8 +441,6 @@ package/ifupdown/0001-dont-use-dpkg-architecture.patch lib_patch.Upstream
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
