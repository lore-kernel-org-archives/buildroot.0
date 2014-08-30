From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 31 Aug 2014 00:42:30 +0200
Subject: [Buildroot] [PATCH v3 1/1] package/xscreensaver: fix linking
	with intl
In-Reply-To: <1409176401-13970-1-git-send-email-romain.naour@openwide.fr>
 (Romain Naour's message of "Wed, 27 Aug 2014 23:53:21 +0200")
References: <1409176401-13970-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <874mwtoazt.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Romain" == Romain Naour <romain.naour@openwide.fr> writes:

 > xscreensaver doesn't build with (e)glibc toolchain when gettext package is
 > selected.

 > With (e)glibc libintl is provided by the libc whereas with uClibc it's provided
 > by gettext.

 > If "LIBS=-lintl" is removed from XSCREENSAVER_CONF_ENV, then the -lintl is
 > missing during xscreensaver build if the toolchain needs gettext.

 > xscreensaver.o: In function `main':
 > undefined reference to `libintl_bindtextdomain'
 > undefined reference to `libintl_textdomain'

 > Backport a patch applied in 5.28 that fix linking issue with intl and remove
 > "LIBS=-lintl" from XSCREENSAVER_CONF_ENV.

 > Note:
 > gettext package is always selected with xscreensaver when BR2_NEEDS_GETTEXT is
 > set due to dependencies on libgtk2 and libglib2.

 > Fixes:
 > http://autobuild.buildroot.net/results/39b/39b6ad07ad59d87afeca6e427c69f580bed35700/build-end.log

 > Signed-off-by: Romain Naour <romain.naour@openwide.fr>
 > ---
 > v3:
 >     Check if xscreensaver needs gettext if BR2_NEEDS_GETTEXT or
 >     BR2_NEEDS_GETTEXT_IF_LOCALE (Thomas Petazzoni)
 >     Select gettext only if BR2_NEEDS_GETTEXT_IF_LOCALE is set
 >     Add a backported patch to fix the linking issue with intl
 >     Remove "LIBS=-lintl" from XSCREENSAVER_CONF_ENV

Committed, thanks.

-- 
Bye, Peter Korsgaard
