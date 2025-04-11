Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DFF0C36010
	for <buildroot@archiver.kernel.org>; Fri, 11 Apr 2025 10:42:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 347EE6F75E;
	Fri, 11 Apr 2025 10:42:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 77aR6doTgnxF; Fri, 11 Apr 2025 10:42:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A6FEA6F7B8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A6FEA6F7B8;
	Fri, 11 Apr 2025 10:42:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3E5521BA
 for <buildroot@buildroot.org>; Fri, 11 Apr 2025 10:41:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A651E40AE2
 for <buildroot@buildroot.org>; Fri, 11 Apr 2025 10:41:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dcWZrHzOUNXR for <buildroot@buildroot.org>;
 Fri, 11 Apr 2025 10:41:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D369E40275
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D369E40275
 for <buildroot@buildroot.org>; Fri, 11 Apr 2025 10:41:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C11248429D; Fri, 11 Apr 2025 10:41:47 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 11 Apr 2025 12:40:20 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: f118602855f046a193f6b45df0fdb872c9beaf5d
X-Git-Newrev: a062ce0878f67a746c25c66120eceaa21a6f01bc
X-Patchwork-Hint: ignore
Message-Id: <20250411104147.C11248429D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] support/kconfig: handle
 backspace (^H) key
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6083727368893695371=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6083727368893695371==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=a062ce0878f67a746c25c66120eceaa21a6f01bc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

This is in the mainline kernel since v5.1-rc3:
9c38f1f04408 ("kconfig/[mn]conf: handle backspace (^H) key")

Quoting the commit's log:

"
Backspace is not working on some terminal emulators which do not send the
key code defined by terminfo. Terminals either send '^H' (8) or '^?' (127).
But currently only '^?' is handled. Let's also handle '^H' for those
terminals.
"

Signed-off-by: Sébastien Szymanski <sebastien.szymanski@armadeus.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit d65c10c20add58f17cf1d7b6de8e7903b0aa9ddc)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 support/kconfig/lxdialog/inputbox.c                |  3 +-
 support/kconfig/nconf.c                            |  2 +-
 support/kconfig/nconf.gui.c                        |  3 +-
 ...23-kconfig-mn-conf-handle-backspace-H-key.patch | 62 ++++++++++++++++++++++
 support/kconfig/patches/series                     |  1 +
 5 files changed, 68 insertions(+), 3 deletions(-)

diff --git a/support/kconfig/lxdialog/inputbox.c b/support/kconfig/lxdialog/inputbox.c
index d58de1dc53..510049a7bd 100644
--- a/support/kconfig/lxdialog/inputbox.c
+++ b/support/kconfig/lxdialog/inputbox.c
@@ -126,7 +126,8 @@ do_resize:
 			case KEY_DOWN:
 				break;
 			case KEY_BACKSPACE:
-			case 127:
+			case 8:   /* ^H */
+			case 127: /* ^? */
 				if (pos) {
 					wattrset(dialog, dlg.inputbox.atr);
 					if (input_x == 0) {
diff --git a/support/kconfig/nconf.c b/support/kconfig/nconf.c
index 0031147798..e8e1944fa0 100644
--- a/support/kconfig/nconf.c
+++ b/support/kconfig/nconf.c
@@ -1048,7 +1048,7 @@ static int do_match(int key, struct match_state *state, int *ans)
 		state->match_direction = FIND_NEXT_MATCH_UP;
 		*ans = get_mext_match(state->pattern,
 				state->match_direction);
-	} else if (key == KEY_BACKSPACE || key == 127) {
+	} else if (key == KEY_BACKSPACE || key == 8 || key == 127) {
 		state->pattern[strlen(state->pattern)-1] = '\0';
 		adj_match_dir(&state->match_direction);
 	} else
diff --git a/support/kconfig/nconf.gui.c b/support/kconfig/nconf.gui.c
index 88874acfda..820fc92565 100644
--- a/support/kconfig/nconf.gui.c
+++ b/support/kconfig/nconf.gui.c
@@ -440,7 +440,8 @@ int dialog_inputbox(WINDOW *main_window,
 		case KEY_F(F_EXIT):
 		case KEY_F(F_BACK):
 			break;
-		case 127:
+		case 8:   /* ^H */
+		case 127: /* ^? */
 		case KEY_BACKSPACE:
 			if (cursor_position > 0) {
 				memmove(&result[cursor_position-1],
diff --git a/support/kconfig/patches/23-kconfig-mn-conf-handle-backspace-H-key.patch b/support/kconfig/patches/23-kconfig-mn-conf-handle-backspace-H-key.patch
new file mode 100644
index 0000000000..6e32115f70
--- /dev/null
+++ b/support/kconfig/patches/23-kconfig-mn-conf-handle-backspace-H-key.patch
@@ -0,0 +1,62 @@
+From 9c38f1f044080392603c497ecca4d7d09876ff99 Mon Sep 17 00:00:00 2001
+From: Changbin Du <changbin.du@gmail.com>
+Date: Mon, 25 Mar 2019 15:16:47 +0000
+Subject: [PATCH 23/23] kconfig/[mn]conf: handle backspace (^H) key
+
+Backspace is not working on some terminal emulators which do not send the
+key code defined by terminfo. Terminals either send '^H' (8) or '^?' (127).
+But currently only '^?' is handled. Let's also handle '^H' for those
+terminals.
+
+Signed-off-by: Changbin Du <changbin.du@gmail.com>
+Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
+---
+ kconfig/lxdialog/inputbox.c | 3 ++-
+ kconfig/nconf.c             | 2 +-
+ kconfig/nconf.gui.c         | 3 ++-
+ 3 files changed, 5 insertions(+), 3 deletions(-)
+
+diff --git a/kconfig/lxdialog/inputbox.c b/kconfig/lxdialog/inputbox.c
+index 611945611bf8..1dcfb288ee63 100644
+--- a/kconfig/lxdialog/inputbox.c
++++ b/kconfig/lxdialog/inputbox.c
+@@ -113,7 +113,8 @@ int dialog_inputbox(const char *title, const char *prompt, int height, int width
+ 			case KEY_DOWN:
+ 				break;
+ 			case KEY_BACKSPACE:
+-			case 127:
++			case 8:   /* ^H */
++			case 127: /* ^? */
+ 				if (pos) {
+ 					wattrset(dialog, dlg.inputbox.atr);
+ 					if (input_x == 0) {
+diff --git a/kconfig/nconf.c b/kconfig/nconf.c
+index a4670f4e825a..ac92c0ded6c5 100644
+--- a/kconfig/nconf.c
++++ b/kconfig/nconf.c
+@@ -1048,7 +1048,7 @@ static int do_match(int key, struct match_state *state, int *ans)
+ 		state->match_direction = FIND_NEXT_MATCH_UP;
+ 		*ans = get_mext_match(state->pattern,
+ 				state->match_direction);
+-	} else if (key == KEY_BACKSPACE || key == 127) {
++	} else if (key == KEY_BACKSPACE || key == 8 || key == 127) {
+ 		state->pattern[strlen(state->pattern)-1] = '\0';
+ 		adj_match_dir(&state->match_direction);
+ 	} else
+diff --git a/kconfig/nconf.gui.c b/kconfig/nconf.gui.c
+index 7be620a1fcdb..77f525a8617c 100644
+--- a/kconfig/nconf.gui.c
++++ b/kconfig/nconf.gui.c
+@@ -439,7 +439,8 @@ int dialog_inputbox(WINDOW *main_window,
+ 		case KEY_F(F_EXIT):
+ 		case KEY_F(F_BACK):
+ 			break;
+-		case 127:
++		case 8:   /* ^H */
++		case 127: /* ^? */
+ 		case KEY_BACKSPACE:
+ 			if (cursor_position > 0) {
+ 				memmove(&result[cursor_position-1],
+-- 
+2.48.1
+
diff --git a/support/kconfig/patches/series b/support/kconfig/patches/series
index f120e323b7..cc176035be 100644
--- a/support/kconfig/patches/series
+++ b/support/kconfig/patches/series
@@ -11,3 +11,4 @@
 20-merge_config.sh-Allow-to-define-config-prefix.patch
 21-Avoid-false-positive-matches-from-comment-lines.patch
 22-kconfig-lxdialog-fix-check-with-GCC14.patch
+23-kconfig-mn-conf-handle-backspace-H-key.patch

--===============6083727368893695371==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6083727368893695371==--
