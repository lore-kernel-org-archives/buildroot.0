From: Bernd Kuhls <berndkuhls@hotmail.com>
Date: Sun, 24 Feb 2013 19:27:45 +0100
Subject: [Buildroot] [PATCH 1/2] ncurses: Add wchar support
References: <1295280886-20910-1-git-send-email-serj.kalichev@gmail.com>
Message-ID: <13mdgk.h4t.ln@bernd-kuhls.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Serj Kalichev <serj.kalichev@gmail.com>
wrote in news:1295280886-20910-1-git-send-email-serj.kalichev at gmail.com: 

> When the BR2_USE_WCHAR is "y" the ncurses will be configured with
> wide char support. It will build ncursesw.* instead ncurses.*.
> ---
>  package/ncurses/ncurses.mk |   28 +++++++++++++++++-----------
>  1 files changed, 17 insertions(+), 11 deletions(-)

Hi,

following up Thomas Petazzonis todays post about optimizing the ncurses build 
I would like to bump this patch as well for inclusion with the following 
change:

The line including NCURSES_CONFIG_SCRIPTS needs to be moved after the
"ifeq ($(BR2_USE_WCHAR),y)"-area containing this line of code instead:

NCURSES_CONFIG_SCRIPTS = ncurses$(NCURSES_W)5-config

(Sorry, I do not use git)

Ncursesw seems to be needed[1] for VLC if BR2_PACKAGE_VLC_NCURSES=y is set, 
see http://patchwork.ozlabs.org/patch/171335/ for the VLC patch.

Regards,

Bernd

[1] http://forums.gentoo.org/viewtopic-p-7217872.html
