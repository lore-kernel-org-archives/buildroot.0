Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82E0BCA101E
	for <buildroot@archiver.kernel.org>; Sun,  1 Sep 2024 09:06:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 504ED6074F;
	Sun,  1 Sep 2024 09:06:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2ivvo4ytowQT; Sun,  1 Sep 2024 09:06:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3242C6079D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3242C6079D;
	Sun,  1 Sep 2024 09:06:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 54C641BF86B
 for <buildroot@lists.busybox.net>; Sun,  1 Sep 2024 09:06:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3DB4B409E8
 for <buildroot@lists.busybox.net>; Sun,  1 Sep 2024 09:06:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5Rp_UBS1TzJ4 for <buildroot@lists.busybox.net>;
 Sun,  1 Sep 2024 09:06:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 253F0409F6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 253F0409F6
 for <buildroot@buildroot.org>; Sun,  1 Sep 2024 09:06:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1366D868CF; Sun,  1 Sep 2024 09:06:00 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 1 Sep 2024 10:57:26 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: f09130cb49847dfbebd9f029db80e4f050733583
X-Git-Newrev: 3cd0c938b5643a73f17849880cddfc3755ae0284
X-Patchwork-Hint: ignore
Message-Id: <20240901090600.1366D868CF@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/busybox: fix
 menuconfig with GCC 14
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

commit: https://git.buildroot.net/buildroot/commit/?id=3cd0c938b5643a73f17849880cddfc3755ae0284
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

GCC 14 errors out on the implicit return type of "main() {}". The
patch also removes the /dev/null redirection of GCC stderr that hid
the actual problem.

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
Reviewed-by: Brandon Maier <brandon.maier@collins.com>
Tested-by: Brandon Maier <brandon.maier@collins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 6caf350c1a9f5c6907d109e1c55fe420ec1aebd6)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...g-gcc-failing-saying-ncurses-is-not-found.patch | 38 ++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/package/busybox/0009-menuconfig-gcc-failing-saying-ncurses-is-not-found.patch b/package/busybox/0009-menuconfig-gcc-failing-saying-ncurses-is-not-found.patch
new file mode 100644
index 0000000000..4651d8c2c9
--- /dev/null
+++ b/package/busybox/0009-menuconfig-gcc-failing-saying-ncurses-is-not-found.patch
@@ -0,0 +1,38 @@
+From ctxnop@gmail.com  Sun Jul 21 12:10:52 2024
+From: ctxnop@gmail.com (Nop)
+Date: Sun, 21 Jul 2024 14:10:52 +0200
+Subject: [PATCH] menuconfig: GCC failing saying ncurses is not found
+
+Newer GCC increased diagnostics levels resulting in considering the
+test code to be invalid. The resulting message was misleading, saying
+that ncurses was not found, while the check failed for an unrelated
+reason which was hidden because GCC stderr was redirected to
+/dev/null.
+
+Signed-off-by: ctxnop <ctxnop@gmail.com>
+Upstream: http://lists.busybox.net/pipermail/busybox/2024-July/090840.html
+[Fiona: rephrased commit message for clarity]
+Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
+---
+ scripts/kconfig/lxdialog/check-lxdialog.sh | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/scripts/kconfig/lxdialog/check-lxdialog.sh
+b/scripts/kconfig/lxdialog/check-lxdialog.sh
+index 5075ebf2d..c644d1d48 100755
+--- a/scripts/kconfig/lxdialog/check-lxdialog.sh
++++ b/scripts/kconfig/lxdialog/check-lxdialog.sh
+@@ -45,9 +45,9 @@ trap "rm -f $tmp" 0 1 2 3 15
+
+ # Check if we can link to ncurses
+ check() {
+-        $cc -x c - -o $tmp 2>/dev/null <<'EOF'
++	$cc -x c - -o $tmp <<'EOF'
+ #include CURSES_LOC
+-main() {}
++int main() { return 0; }
+ EOF
+ 	if [ $? != 0 ]; then
+ 	    echo " *** Unable to find the ncurses libraries or the"       1>&2
+--
+2.45.2
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
