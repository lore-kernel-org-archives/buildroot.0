From: Andrey Smirnov <andrew.smirnov@gmail.com>
Date: Fri,  2 Jun 2017 17:00:12 -0700
Subject: [Buildroot] [PATCH 1/2] ncurses: Copy terminfo for 'dumb' terminal
Message-ID: <20170603000013.5402-1-andrew.smirnov@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Definition of 'dumb' terminal is required to be able to call 'top -b'
from 'procps-ng'.

Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
---
 package/ncurses/ncurses.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/ncurses/ncurses.mk b/package/ncurses/ncurses.mk
index 2b99d3f..d8ad9dd 100644
--- a/package/ncurses/ncurses.mk
+++ b/package/ncurses/ncurses.mk
@@ -47,6 +47,7 @@ endif
 
 NCURSES_TERMINFO_FILES = \
 	a/ansi \
+	d/dumb \
 	l/linux \
 	p/putty \
 	p/putty-vt100 \
-- 
2.9.4
