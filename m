From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 9 Oct 2008 11:43:43 +0200
Subject: [Buildroot] The issue is link_all_deplibs libtool config
 variable
In-Reply-To: <20081007165610.4de3f377@surf>
References: <20081007165610.4de3f377@surf>
Message-ID: <20081009114343.2eabb7e6@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Tue, 7 Oct 2008 16:56:10 +0200,
Thomas Petazzoni <thomas.petazzoni@free-electrons.com> a ?crit :

> The ../src/.libs/libfontconfig.so properly references the .la files of
> libexpat and libfreetype. If I had these path to the .la files to the
> big libtool command line, then it links properly.
> 
> Any clue about this problem ?

It seems that the problem is caused by libtool configuration variable
"link_all_deplibs" being set to "no".

This problem has been reported here:
http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=297726. It seems that
setting link_all_deplibs to yes works for native compilation, but not
from cross-compilation. The patch seems be to be Debian-specific, and
I'm an Ubuntu user, so I inherited this patch.

As a quick and gory hack, I modified the configure to replace all
instances of link_all_deplibs=no by link_all_deplibs=yes. And the
compilation now works properly.

What's the proper way of fixing this ?

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
