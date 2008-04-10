From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 10 Apr 2008 09:06:29 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/package/ncurses
In-Reply-To: <1207804466.6817.395.camel@nigel-x60> (Nigel Kukard's message of
	"Thu\, 10 Apr 2008 05\:14\:26 +0000")
References: <20080409113849.004993C4BA@busybox.net>
	<20080409223551.GC4582@cloud.net.au>
	<1207804466.6817.395.camel@nigel-x60>
Message-ID: <871w5echoq.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Nigel" == Nigel Kukard <nkukard@lbsd.net> writes:

Hi,

 >> Should be /usr/lib rather than /lib?

 Nigel> The rest of the libs are being installed to /lib ... I don't like
 Nigel> changing install paths, but I agree with you it should be /usr/lib ...
 Nigel> anyone got any very good reason why ncurses should be installed in /lib?

The basic libncurses.co* is normally installed in /lib, but the extra
libs are in /usr/lib, E.G. on my Debian machine:

% dpkg -L libncurses5|grep .so|sort
/lib/libncurses.so.5
/lib/libncurses.so.5.6
/lib/libtic.so.5
/lib/libtic.so.5.6
/usr/lib/libform.so.5
/usr/lib/libform.so.5.6
/usr/lib/libmenu.so.5
/usr/lib/libmenu.so.5.6
/usr/lib/libpanel.so.5
/usr/lib/libpanel.so.5.6

-- 
Bye, Peter Korsgaard
