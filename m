From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 09 Jul 2014 15:26:10 +0200
Subject: [Buildroot] [PATCH 1/1] xserver_xorg-server: Fix race condition
	when installing man pages, 2nd try
In-Reply-To: <1404569546-12346-1-git-send-email-bernd.kuhls@t-online.de>
 (Bernd Kuhls's message of "Sat, 5 Jul 2014 16:12:26 +0200")
References: <1404569546-12346-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <87k37mu0i5.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > Should fix the still present bug:
 > http://autobuild.buildroot.net/results/045/04514bc9a8d1aad8ddd7af4f0fd8c16edd2e89a9/
 > http://autobuild.buildroot.net/results/1f2/1f25f744771fbb5124dca4563d79ea92cbfd72a3/

 > This patch reverts my previous attempt to fix this hard-to-catch race condition
 > http://git.buildroot.net/buildroot/commit/package/x11r7/xserver_xorg-server?id=e244eb12dfc50bb56167d5fdaef3aac52b0ff6a3

 > and removes make target install-data from _INSTALL_STAGING_OPT, which was
 > introduced in 2008:
 > http://git.buildroot.net/buildroot/commit/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk?id=d4e56ff4dc8a0528550eb8503956bdcddb2fe516

 > Comparing the content of STAGING_DIR with and without "make install-data" showed
 > no difference so I assume that is it no longer necessary to explicitly call this
 > make target as the normal install target takes care of everything.

 > The race condition occurs because "make install" and "make install-data" both
 > install usr/share/man/man1/Xserver.1

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

...

 > @@ -54,7 +52,6 @@ XSERVER_XORG_SERVER_DEPENDENCIES = 	\
 >  	xkeyboard-config		\
 >  	pixman 				\
 >  	mcookie 			\
 > -	host-xfont_font-util		\
 >  	host-pkgconf


What does this have to do with $SUBJECT? If it isn't needed, then it
should be removed in a seperate commit (with a proper description why).

Committed without that hunk, thanks.

-- 
Bye, Peter Korsgaard
