From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 6 Jun 2017 13:18:36 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] ncurses: Copy terminfo
	for 'dumb' terminal
Message-ID: <20170606111918.DEC797F8B2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4571754b5ea722cedf9950433327acde75061954
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

Definition of 'dumb' terminal is required to be able to call 'top -b'
from 'procps-ng'.

Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit f6d80896a795307270a0d9b0cca234134e93a845)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ncurses/ncurses.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/ncurses/ncurses.mk b/package/ncurses/ncurses.mk
index bc0ea29..f8ed4fc 100644
--- a/package/ncurses/ncurses.mk
+++ b/package/ncurses/ncurses.mk
@@ -46,6 +46,7 @@ endif
 
 NCURSES_TERMINFO_FILES = \
 	a/ansi \
+	d/dumb \
 	l/linux \
 	p/putty \
 	p/putty-vt100 \
