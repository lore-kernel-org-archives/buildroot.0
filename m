From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 31 Mar 2015 22:07:34 +0200
Subject: [Buildroot] [PATCH 02/18] package/mplayer: add optional giflib
	support
References: <1427649094-1240-1-git-send-email-bernd.kuhls@t-online.de>
 <1427649094-1240-3-git-send-email-bernd.kuhls@t-online.de>
 <20150330225658.091b8e72@free-electrons.com>
 <20150330230606.2702a000@free-electrons.com> <551AE9C1.70701@mind.be>
Message-ID: <XnsA46EE11448266berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout Vandecappelle <arnout@mind.be> wrote in 
news:551AE9C1.70701 at mind.be:

>  For the positive case (--enable-termcap), autodetection should be fine. 

Hi,

no, it is broken:

osdep/`termcap_addgetch2.o:': In
getch2.c function:( .text`termcap_add+0x15':):
getch2.c undefined:(.text+ reference0x15) to:  `undefined tgetstr'
osdep/getch2.o: In function reference to `tgetstr'
osdep`load_termcap/getch2.o'::
getch2.c:In (.function text+`load_termcap0x9f)'::
getch2.cundefined :(reference .textto +0x9f`tgetent): undefined reference' to
getch2.c `:(tgetent'.text
getch2.c+0xdb:():.text undefined+0xdb reference): to undefined ` 
referencetgetnum' to
getch2.c:( .text`tgetnum+0xec'
):getch2.c: undefined (.reference textto +0xec`tgetnum):'
 undefinedgetch2.c: reference(.text+ to0x132) : `tgetnumundefined '
reference getch2.cto:( `.texttgetstr'+0x132)
: undefined reference to `tgetstr'

using this defconfig:

BR2_TOOLCHAIN_BUILDROOT_LARGEFILE=y
BR2_PACKAGE_MPLAYER=y
BR2_PACKAGE_MPLAYER_MENCODER=y
BR2_PACKAGE_NCURSES=y

Regards, Bernd
