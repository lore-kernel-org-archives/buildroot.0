From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 29 Aug 2015 00:34:41 +0200
Subject: [Buildroot] [PATCH] docs/website: remove broken symlink for
	top-level manual
Message-ID: <1440801281-7585-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Recently, we've tried to have the manual lie at the top-level of the
site, to get a shorter URL.

However, that is broken: we do not need only a link the the HTML, but
also to the CSS and to any resource linked from the html (images...).

The server configuration has now been updated to add a redirect, so we
no longer need that symlink anyway. Remove it.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Peter Korsgaard <jacmet@uclibc.org>
---
 docs/website/manual.html | 1 -
 1 file changed, 1 deletion(-)
 delete mode 120000 docs/website/manual.html

diff --git a/docs/website/manual.html b/docs/website/manual.html
deleted file mode 120000
index 0c2c818..0000000
--- a/docs/website/manual.html
+++ /dev/null
@@ -1 +0,0 @@
-/var/www/downloads/buildroot/manual/manual.html
\ No newline at end of file
-- 
1.9.1
