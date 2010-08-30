From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 30 Aug 2010 10:14:54 +0200
Subject: [Buildroot] Ncurses and --disable-static
In-Reply-To: <4C7B4E69.7080105@hydrix.com> (Ian's message of "Mon, 30 Aug 2010
	16:23:37 +1000")
References: <4C7B4E69.7080105@hydrix.com>
Message-ID: <87wrr8y0sh.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ian" == Ian  <reg-ian.ridley-buildroot@hydrix.com> writes:

 Ian> A little question for anyone out there:
 Ian> The makefile for ncurses contains the following:


 Ian>     ifneq ($(BR2_PACKAGE_NCURSES_TARGET_HEADERS),y)
 Ian>     NCURSES_CONF_OPT += --disable-static
 Ian>     endif

 Ian> but BR2_PACKAGE_NCURSES_TARGET_HEADERS is no longer defined in the ncurses'
 Ian> Config.in, this was removed in a change to using BR2_HAVE_DEVFILES to decide to
 Ian> install headers in the target (see commit 58508f3 by Peter Korsgaard).

 Ian> Now as a result of this ncurses is now always configured with
 Ian> --disable-static, even when BR2_HAVE_DEVFILES is set to "y".

Thanks for informing us.

 Ian> So my question is should "--disable-stable" be added to NCURSES_CONF_OPT:

 Ian>  1. always,
 Ian>  2. never, or
 Ian>  3. when BR2_HAVE_DEVFILES is "y" (instead of using
 Ian>     BR2_PACKAGE_NCURSES_TARGET_HEADERS).

Either always or never. We have a mix of enable/disable-static in the
tree, so we don't have a clear winner, but as we have been using always
for almost 1 year now, and it cuts down on compilation time I'm going to
go with "always".

Thanks.
-- 
Bye, Peter Korsgaard
