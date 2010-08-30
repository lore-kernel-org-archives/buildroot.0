From: Ian <reg-ian.ridley-buildroot@hydrix.com>
Date: Mon, 30 Aug 2010 16:23:37 +1000
Subject: [Buildroot] Ncurses and --disable-static
Message-ID: <4C7B4E69.7080105@hydrix.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

  A little question for anyone out there:

The makefile for ncurses contains the following:

    ifneq ($(BR2_PACKAGE_NCURSES_TARGET_HEADERS),y)
    NCURSES_CONF_OPT += --disable-static
    endif

but BR2_PACKAGE_NCURSES_TARGET_HEADERS is no longer defined in the 
ncurses' Config.in, this was removed in a change to using 
BR2_HAVE_DEVFILES to decide to install headers in the target (see commit 
58508f3 by Peter Korsgaard).

Now as a result of this ncurses is now always configured with 
--disable-static, even when BR2_HAVE_DEVFILES is set to "y".

So my question is should "--disable-stable" be added to NCURSES_CONF_OPT:

   1. always,
   2. never, or
   3. when BR2_HAVE_DEVFILES is "y" (instead of using
      BR2_PACKAGE_NCURSES_TARGET_HEADERS).


Regards,

Ian.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100830/a6627f69/attachment.html>
