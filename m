Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68B83CE7B11
	for <buildroot@archiver.kernel.org>; Fri,  6 Sep 2024 20:08:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8812D846F9;
	Fri,  6 Sep 2024 20:08:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 735cGm2s3usy; Fri,  6 Sep 2024 20:08:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E821D84CA9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E821D84CA9;
	Fri,  6 Sep 2024 20:08:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 469AD1BF37F
 for <buildroot@lists.busybox.net>; Fri,  6 Sep 2024 20:00:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3DEA240B40
 for <buildroot@lists.busybox.net>; Fri,  6 Sep 2024 19:59:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SmDuMjiXCwV7 for <buildroot@lists.busybox.net>;
 Fri,  6 Sep 2024 19:59:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DCE0340908
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id DCE0340908
 for <buildroot@buildroot.org>; Fri,  6 Sep 2024 19:59:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D92EF85FEB; Fri,  6 Sep 2024 19:59:00 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 4 Sep 2024 00:42:48 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c000e858e62ded26d33838cf35159ee4130ea745
X-Git-Newrev: ec9a66d1bc8e6225d2a88a9d06081d3f1e95abf9
X-Patchwork-Hint: ignore
Message-Id: <20240906195900.D92EF85FEB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ejabberd: fix warnings reported by
 check-package
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

commit: https://git.buildroot.net/buildroot/commit/?id=ec9a66d1bc8e6225d2a88a9d06081d3f1e95abf9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .checkpackageignore               |  2 --
 package/ejabberd/S50ejabberd      | 72 ++++++++++++++++++++-------------------
 package/ejabberd/check-erlang-lib | 39 ++++++++++-----------
 3 files changed, 57 insertions(+), 56 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 1b0b0c885a..6b5e45ceff 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -464,8 +464,6 @@ package/efl/0001-ecore_evas-engines-drm-meson.build-use-gl_deps-as-en.patch lib_
 package/efl/0002-ecore_evas-engines-drm-meson.build-fix-gl_drm-includ.patch lib_patch.Upstream
 package/efl/0003-ecore_fb-fix-build-with-tslib.patch lib_patch.Upstream
 package/eigen/0001-Adds-new-CMake-Options-for-controlling-build-compone.patch lib_patch.Upstream
-package/ejabberd/S50ejabberd Shellcheck lib_sysv.Indent lib_sysv.Variables
-package/ejabberd/check-erlang-lib Shellcheck
 package/elftosb/0001-fixes-includes.patch lib_patch.Upstream
 package/elftosb/0002-force-cxx-compiler.patch lib_patch.Upstream
 package/elfutils/0001-Add-a-enable-disable-progs-configure-option.patch lib_patch.Upstream
diff --git a/package/ejabberd/S50ejabberd b/package/ejabberd/S50ejabberd
index 83513bdc83..5d01034fb2 100644
--- a/package/ejabberd/S50ejabberd
+++ b/package/ejabberd/S50ejabberd
@@ -3,52 +3,54 @@
 # Start/stop ejabberd
 #
 
+DAEMON=ejabberd
 CTL=/usr/sbin/ejabberdctl
 DEFAULT=/etc/ejabberd/ejabberdctl.cfg
 INSTALLUSER=ejabberd
 RUNDIR=/var/run/ejabberd
 
 # Read default configuration file if present.
+# shellcheck source=/dev/null
 [ -r "$DEFAULT" ] && . "$DEFAULT"
 
 # Create RUNDIR.
 mkrundir() {
-    install -d -o "$INSTALLUSER" -g "$INSTALLUSER" "$RUNDIR"
+	install -d -o "$INSTALLUSER" -g "$INSTALLUSER" "$RUNDIR"
 }
 
 case "$1" in
-    start)
-        mkrundir || exit 1
-        printf "Starting ejabberd... "
-        "$CTL" start
-        # Wait until ejabberd is up and running.
-        if "$CTL" started; then
-            echo "done"
-        else
-            echo "failed"
-        fi
-        ;;
-    stop)
-        printf "Stopping ejabberd... "
-        "$CTL" stop > /dev/null
-        if [ $? -eq 3 ] || "$CTL" stopped; then
-            echo "OK"
-        else
-            echo "failed"
-        fi
-        ;;
-    status)
-        "$CTL" status
-        ;;
-    restart|force-reload)
-        "$0" stop || true
-        "$0" start
-        ;;
-    live)
-        mkrundir || exit 1
-        "$CTL" live
-        ;;
-    *)
-        echo "Usage: $0 {start|stop|status|restart|force-reload|live}"
-        exit 1
+	start)
+		mkrundir || exit 1
+		printf 'Starting %s: ' "$DAEMON"
+		"$CTL" start
+		# Wait until ejabberd is up and running.
+		if "$CTL" started; then
+			echo "done"
+		else
+			echo "failed"
+		fi
+		;;
+	stop)
+		printf 'Stopping %s: ' "$DAEMON"
+		"$CTL" stop > /dev/null
+		if [ $? -eq 3 ] || "$CTL" stopped; then
+			echo "OK"
+		else
+			echo "failed"
+		fi
+		;;
+	status)
+		"$CTL" status
+		;;
+	restart|force-reload)
+		"$0" stop || true
+		"$0" start
+		;;
+	live)
+		mkrundir || exit 1
+		"$CTL" live
+		;;
+	*)
+		echo "Usage: $0 {start|stop|status|restart|force-reload|live}"
+		exit 1
 esac
diff --git a/package/ejabberd/check-erlang-lib b/package/ejabberd/check-erlang-lib
index 63f8bf1926..4e51b54294 100755
--- a/package/ejabberd/check-erlang-lib
+++ b/package/ejabberd/check-erlang-lib
@@ -9,9 +9,9 @@
 # without calling erlang.
 
 usage() {
-    cat <<EOF
+	cat <<EOF
 Usage:
-        $0 library
+		$0 library
 Look for Erlang's library in TARGET_DIR/usr/lib/erlang/lib.
 
 If the library is found, it returns the path to the latest version,
@@ -24,15 +24,15 @@ EOF
 }
 
 die () {
-    echo "$@" >&2
-    exit 1
+	echo "$@" >&2
+	exit 1
 }
 
 if [ $# -ne 1 ]; then
-    usage
-    exit 0
+	usage
+	exit 0
 else
-    library="$1"
+	library="$1"
 fi
 
 target_dir="${TARGET_DIR:-output/target}"
@@ -40,16 +40,17 @@ target_dir="${TARGET_DIR:-output/target}"
 [ -d "$target_dir" ] || die "TARGET_DIR is not a directory. Please \
 specify the TARGET_DIR environment variable."
 
-case "$(ls -1d -- "$target_dir/usr/lib/erlang/lib/$library-"* | wc -l)" in
-    0)
-        echo "not found"
-        ;;
-    1)
-        echo "$target_dir/usr/lib/erlang/lib/$library-"* \
-            | sed -e "s,^$target_dir,,"
-        ;;
-    *)
-        die "Several versions of $library have been found. Please \
-        remove the unused ones."
-        ;;
+case "$(find "$target_dir/usr/lib/erlang/lib" -maxdepth 1 \
+		-name "$library-*" -type d | wc -l)" in
+	0)
+		echo "not found"
+		;;
+	1)
+		echo "$target_dir/usr/lib/erlang/lib/$library-"* \
+			| sed -e "s,^$target_dir,,"
+		;;
+	*)
+		die "Several versions of $library have been found. Please \
+		remove the unused ones."
+		;;
 esac
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
