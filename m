From: Peter Seiderer <ps.report@gmx.net>
Date: Fri,  6 Mar 2020 21:10:21 +0100
Subject: [Buildroot] [PATCH v1 2/3] package/liboping: add patch to fix utf8
 ncurses support
In-Reply-To: <20200306201022.22382-1-ps.report@gmx.net>
References: <20200306201022.22382-1-ps.report@gmx.net>
Message-ID: <20200306201022.22382-2-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add patch from upstream merge request [1] to fix fix utf8 ncurses support.

[1] https://github.com/octo/liboping/issues/36

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/liboping/0003-fix-utf8-support.patch | 29 ++++++++++++++++++++
 1 file changed, 29 insertions(+)
 create mode 100644 package/liboping/0003-fix-utf8-support.patch

diff --git a/package/liboping/0003-fix-utf8-support.patch b/package/liboping/0003-fix-utf8-support.patch
new file mode 100644
index 0000000000..8a9792b619
--- /dev/null
+++ b/package/liboping/0003-fix-utf8-support.patch
@@ -0,0 +1,29 @@
+From dfbdd324769f542b6b89499c1b7f0f4322100bc6 Mon Sep 17 00:00:00 2001
+From: wfaulk <wfaulk@users.noreply.github.com>
+Date: Wed, 7 Aug 2019 18:57:43 -0400
+Subject: [PATCH 3/4] fix utf8 support
+
+https://github.com/octo/liboping/issues/36
+
+[Upstream: https://github.com/octo/liboping/pull/49/commits/a313923ec12d11daa8e70497c6b7b5d50965821b]
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ src/oping.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/oping.c b/src/oping.c
+index 87ca81a..62dbb67 100644
+--- a/src/oping.c
++++ b/src/oping.c
+@@ -903,7 +903,7 @@ static void time_calc (struct timespec *ts_dest, /* {{{ */
+ #if USE_NCURSES
+ static _Bool has_utf8() /* {{{ */
+ {
+-# if HAVE_NCURSESW_NCURSES_H
++# if HAVE_NCURSESW_CURSES_H
+ 	if (!opt_utf8)
+ 	{
+ 		/* Automatically determine */
+-- 
+2.25.1
+
-- 
2.25.1
