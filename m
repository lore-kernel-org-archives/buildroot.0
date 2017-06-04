From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 4 Jun 2017 09:54:52 +0200
Subject: [Buildroot] [git commit] ncurses: Copy terminfo for 'dumb' terminal
Message-ID: <20170604075754.8EB7982948@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f6d80896a795307270a0d9b0cca234134e93a845
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Definition of 'dumb' terminal is required to be able to call 'top -b'
from 'procps-ng'.

Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
