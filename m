From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 28 Aug 2014 08:52:50 +0200
Subject: [Buildroot] [PATCH] package/xbmc: Fix broken variable name
In-Reply-To: <20140827213842.GB21009@free.fr> (Yann E. MORIN's message of
 "Wed, 27 Aug 2014 23:38:42 +0200")
References: <1409172090-20497-1-git-send-email-bernd.kuhls@t-online.de>
 <20140827204942.GA21009@free.fr> <87wq9tsjoc.fsf@dell.be.48ers.dk>
 <20140827213842.GB21009@free.fr>
Message-ID: <87k35trtq5.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

Hi,

 >> Then we should imho get rid of the XBMC_DBUS option if that option
 >> doesn't do anything.

 > That option does select BR2_PACKAGE_DBUS.

 > All (most of) the XBMC kconfig options were meant so the user could
 > directly enable XBMC features without hunting down all needed packages.

 > I know this is unlike most other packages, since our policy is to enable
 > a package's option if the providing package is enabled.

 > But for XBMC, the reasoning was that we would not want such a behaviour,
 > since some dependencies are not trivial (e.g. shairplay, CEC...), so the
 > kconfig options to XBMC are here to facilitate the user's life.

Yes, but it is still not really logical that you get dbus support if you
have dbus (for some other reason?) and _deselect_ BR2_PACKAGE_XBMC_DBUS.

I'm not sure what the best solution is.

-- 
Bye, Peter Korsgaard
