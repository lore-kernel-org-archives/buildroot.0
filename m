From: Peter =?iso-8859-1?q?H=FCwe?= <PeterHuewe@gmx.de>
Date: Wed, 28 Jul 2010 19:02:42 +0200
Subject: [Buildroot] configure looks in /usr for ncurses headers?
Message-ID: <201007281902.43312.PeterHuewe@gmx.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

today I tried to bump the pidgin/finch multimessenger to version 2.7.2 which 
was released several days ago.

But before I tried to bump the version, I tried to build the 2.7.1 version 
I've submitted about a month ago - but (as almost expected) the build failed 
with the following message:

checking for initscr in -lncursesw... (cached) yes
checking for update_panels in -lpanelw... (cached) yes
checking /usr/include/ncursesw/ncurses.h usability... no
checking /usr/include/ncursesw/ncurses.h presence... no
checking for /usr/include/ncursesw/ncurses.h... no
checking /usr/include/ncurses.h usability... yes
checking /usr/include/ncurses.h presence... yes
checking for /usr/include/ncurses.h... yes
checking if /usr/include/ncurses.h supports wide characters... no
configure: error:

Finch will not be built. You need to install ncursesw (or ncurses) and its 
development headers.


Why does configure (now) look in /usr/include and not 
.../buildroot/output/staging/usr/include ?

Or is /usr/include correct? - if yes why could I build the package back then 
and not now? (same source version of pidgin, no changes in config)

Thanks,
Peter
