Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68792CD4F47
	for <buildroot@archiver.kernel.org>; Fri, 15 May 2026 13:28:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3DE3541A65;
	Fri, 15 May 2026 13:28:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GC6WcbuEimil; Fri, 15 May 2026 13:28:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3819E41A5D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778851715;
	bh=bXQgBegzrZ+M91jWicvKC93eJebU2xRddq+uFIYbjlg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=BMTsI829JLzc8PJcATYgjsvo4ex5Gk4a4nUXWhn9pCAhybj6TS6dXNiNg658PgQNY
	 0TnDaZPIgYADE/cXWS0IDV6UZDP5DY3JSNSnYzQ7B4LLG1sjR9N1UKVUICLytsTWbg
	 V+nJqYFsn4y2EapBzfkucsxUL6kn/p/rdes6Qm/YT+b1W7EDxU+ugHIiG/3FaLj034
	 ei4fZ9itwjMGZ+txNOgIkoKq4+IIJ3yN5usb/xsJLqQY5mfNOYLqC9cYYSUcekY5MO
	 ICxwiSifnuB/lCyLiPpsJkaPIwMWabMfJENLbSCsImtTmj/guovPISjfXQyhMMYNsv
	 qgzjWeC7NhS8g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3819E41A5D;
	Fri, 15 May 2026 13:28:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 35A3D36E
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:28:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A40ED61549
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:28:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id reLlbGhL8b2w for <buildroot@buildroot.org>;
 Fri, 15 May 2026 13:28:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8C0E56154A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8C0E56154A
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:28:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DEABF86356; Fri, 15 May 2026 13:28:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 12 May 2026 15:27:59 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 22c7591505802fa9469ab27e6fe9d2dbf8f60ab9
X-Git-Newrev: 80d875769e851af9828c6b4503073c1249736bc0
X-Patchwork-Hint: ignore
Message-Id: <20260515132815.DEABF86356@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/initscripts: fix
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/80d875769e851af9828c6b4503073c1249736bc0
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

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
index 6dbced55f0..cde66729d2 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -509,8 +509,6 @@ package/ifupdown/0001-dont-use-dpkg-architecture.patch lib_patch.Upstream
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
