From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 18 Jun 2009 07:35:15 +0000 (UTC)
Subject: [Buildroot] [Bug 355] Please update WebKit - it doesn't compile!
In-Reply-To: <bug-355-163@https.bugs.busybox.net/>
References: <bug-355-163@https.bugs.busybox.net/>
Message-ID: <20090618073515.F0ECE77534@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=355





--- Comment #4 from laurent laffont <laurent.laffont@gmail.com>  2009-06-18 07:35:14 UTC ---
I managed to build webkit + midori, thanks to John Voltz work.

Here's the steps:

- I checked out trunk of  public buildroot at 
http://code.google.com/p/buildroot/source/browse/trunk. (It seems to be sync
with buildroot 2009.02 stable)

- Put the uClibc-0.9.30-linuxthreads.patch in toolchain/uClibc directory (
http://code.google.com/p/buildroot/source/browse/branches/john-avr32-buildroot/toolchain/uClibc/uClibc-0.9.30-linuxthreads.patch)

- Switched to xlib_libX11 1.1.5 as xlib_libX11 1.1.3 does not compile.

- Replaced package webkit with john's one:
http://code.google.com/p/buildroot/source/browse/branches/john-avr32-buildroot/package/webkit
(webkit revision 40813)

- Rollback to midori 0.17 (git commit 1d2af67 Mon Jul 7 12:04:19 2008). I found
the tarball here:
http://mirrors.isc.org/pub/MidnightBSD/distfiles/midori-0.0.17.tar.gz


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
