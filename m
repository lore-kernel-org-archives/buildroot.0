From: Barry A Rich <barich@trisectrix.com>
Date: Fri, 30 May 2008 15:12:43 -0400
Subject: [Buildroot] make menuconfig fails
Message-ID: <000901c8c289$236922e0$6a3b68a0$@com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The latest snapshot (buildroot-20080429.tar.bz2) was un-tar'ed into in /tmp.
The "make menuconfig" then fails. Log follows. It's probably something
simple (I'm a newbie). Help is appreciated.

 

/tmp/buildroot$ make menuconfig

make CC="/usr/bin/gcc" -C package/config conf mconf

make[1]: Entering directory `/tmp/buildroot/package/config'

/usr/bin/gcc -DCURSES_LOC="<curses.h>" -DLOCALE -g -O2  -c
lxdialog/checklist.c -o lxdialog/checklist.o

In file included from lxdialog/checklist.c:24:

lxdialog/dialog.h:32:20: error: curses.h: No such file or directory

In file included from lxdialog/checklist.c:24:

lxdialog/dialog.h:97: error: expected specifier-qualifier-list before
'chtype'

lxdialog/dialog.h:187: error: expected ')' before '*' token

lxdialog/dialog.h:194: error: expected ')' before '*' token

lxdialog/dialog.h:196: error: expected ')' before '*' token

lxdialog/dialog.h:197: error: expected ')' before '*' token

lxdialog/dialog.h:198: error: expected ')' before '*' token

lxdialog/dialog.h:199: error: expected ')' before '*' token

lxdialog/dialog.h:201: error: expected ')' before '*' token

lxdialog/checklist.c:31: error: expected ')' before '*' token

lxdialog/checklist.c:59: error: expected ')' before '*' token

lxdialog/checklist.c:95: error: expected ')' before '*' token

lxdialog/checklist.c: In function 'dialog_checklist':

lxdialog/checklist.c:116: error: 'WINDOW' undeclared (first use in this
function)

lxdialog/checklist.c:116: error: (Each undeclared identifier is reported
only once

lxdialog/checklist.c:116: error: for each function it appears in.)

lxdialog/checklist.c:116: error: 'dialog' undeclared (first use in this
function)

lxdialog/checklist.c:116: error: 'list' undeclared (first use in this
function)

lxdialog/checklist.c:129: error: 'stdscr' undeclared (first use in this
function)

lxdialog/checklist.c:130: error: 'KEY_MAX' undeclared (first use in this
function)

lxdialog/checklist.c:137: error: 'COLS' undeclared (first use in this
function)

lxdialog/checklist.c:138: error: 'LINES' undeclared (first use in this
function)

lxdialog/checklist.c:143: error: 'TRUE' undeclared (first use in this
function)

lxdialog/checklist.c:146: error: 'struct dialog_color' has no member named
'atr'

lxdialog/checklist.c:146: error: 'struct dialog_color' has no member named
'atr'

lxdialog/checklist.c:147: error: 'struct dialog_color' has no member named
'atr'

lxdialog/checklist.c:151: error: 'struct dialog_color' has no member named
'atr'

lxdialog/checklist.c:156: error: 'struct dialog_color' has no member named
'atr'

lxdialog/checklist.c:171: error: 'struct dialog_color' has no member named
'atr'

lxdialog/checklist.c:171: error: 'struct dialog_color' has no member named
'atr'

lxdialog/checklist.c:210: error: 'KEY_UP' undeclared (first use in this
function)

lxdialog/checklist.c:210: error: 'KEY_DOWN' undeclared (first use in this
function)

lxdialog/checklist.c:220: error: 'FALSE' undeclared (first use in this
function)

lxdialog/checklist.c:297: error: 'KEY_LEFT' undeclared (first use in this
function)

lxdialog/checklist.c:298: error: 'KEY_RIGHT' undeclared (first use in this
function)

lxdialog/checklist.c:312: error: 'KEY_RESIZE' undeclared (first use in this
function)

make[1]: *** [lxdialog/checklist.o] Error 1

make[1]: Leaving directory `/tmp/buildroot/package/config'

make: *** [package/config/mconf] Error 2

/tmp/buildroot$   

 

-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20080530/778278b3/attachment.htm 
