From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 12 Apr 2010 09:35:31 +0000 (UTC)
Subject: [Buildroot] [Bug 1399] xfont_font-adobe-100dpi does not build
In-Reply-To: <bug-1399-163@https.bugs.busybox.net/>
References: <bug-1399-163@https.bugs.busybox.net/>
Message-ID: <20100412093531.9FA3B8DCAE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=1399





--- Comment #6 from Paul Jones <paul.jones@iwtech.com.au>  2010-04-12 09:35:31 UTC ---
I just tried to manually build the package without any cross compiling
make distclean
./configure

and this is the output I get:
checking for fc-cache... /usr/bin/fc-cache
checking for mkfontdir... /usr/bin/mkfontdir
checking for bdftopcf... /usr/bin/bdftopcf
checking font compression method... gzip
checking for gzip... /bin/gzip
checking for ucs2any... no
checking for MAPS... configure: error: Package requirements (fontutil) were not
met:

No package 'fontutil' found

Consider adjusting the PKG_CONFIG_PATH environment variable if you
installed software in a non-standard prefix.

Alternatively, you may set the environment variables MAPS_CFLAGS
and MAPS_LIBS to avoid the need to call pkg-config.
See the pkg-config man page for more details.


I am sure I tried installing font-utils on the host which I remember didn't
work so I uninstalled it.
I just reinstalled fontutils and now this builds ok so I assume this package
isn't finding the buildroot fontutils.

I checked for bdftopcf on the host and it is there even without fontutils
installed.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
