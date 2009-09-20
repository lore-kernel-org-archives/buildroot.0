From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 20 Sep 2009 19:25:13 +0000 (UTC)
Subject: [Buildroot] [Bug 621] BR2_USE_WCHAR does not seem to enable WCHAR
 support in uClibc
In-Reply-To: <bug-621-163@https.bugs.busybox.net/>
References: <bug-621-163@https.bugs.busybox.net/>
Message-ID: <20090920192513.80D067772E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=621


Seth LaForge <sethml@ofb.net> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|ASSIGNED                    |RESOLVED
         Resolution|                            |FIXED




--- Comment #2 from Seth LaForge <sethml@ofb.net>  2009-09-20 19:25:12 UTC ---
I had done a "make menuconfig", turned on WCHAR support, done "make clean",
then "make", and ended up with a no-wchar build, confirmed by doing "make
uclibc-menuconfig" and noting that the WCHAR option was not enabled.

Apparently "make clean" wasn't enough to clean things out properly.  I don't
have a directory "output", but I re-extracted buildroot from the tarball and
rebuild with BR2_USE_WCHAR on, and it seems to have worked.  Thanks!

It would be really nice to have a section in the buildroot documentation
describing what you need to do when rebuilding after changing various settings,
for example:
  - After changing a toolchain option.
  - After changing a uclibc or busybox option.  (And when do the uclibc or
busybox .configs get clobbered?)
  - After enabling or disabling a package.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
