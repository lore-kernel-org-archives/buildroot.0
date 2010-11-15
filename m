From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 15 Nov 2010 05:38:20 +0000 (UTC)
Subject: [Buildroot] [Bug 2809] failed to compile libglib2
In-Reply-To: <bug-2809-163@https.bugs.busybox.net/>
References: <bug-2809-163@https.bugs.busybox.net/>
Message-ID: <20101115053820.8D9048DEC0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=2809

--- Comment #3 from oilehus at yahoo.com  ---
is it a typo for the patch file's name ?
Should 
"libglib-2.26.0-fix-compilation-with-no-builtin-atomic.patch"
be 
"libglib2-2.26.0-fix-compilation-with-no-builtin-atomic.patch"?

After I made that change, I don't see that error any more but I saw another
one:

./.libs/libgio-2.0.so: undefined reference to `in6addr_loopback'
./.libs/libgio-2.0.so: undefined reference to `in6addr_any'
collect2: ld returned 1 exit status
make[5]: *** [gsettings] Error 1
make[5]: *** Waiting for unfinished jobs....
../glib/.libs/libglib-2.0.so: warning: the use of OBSOLESCENT `utime' is
discouraged, use `utimes'
./.libs/libgio-2.0.so: undefined reference to `in6addr_loopback'
./.libs/libgio-2.0.so: undefined reference to `in6addr_any'
collect2: ld returned 1 exit status
make[5]: *** [gio-querymodules] Error 1

if I enable "IPv6" in toolchain, it's ok. It seems like libglib2 2.26.0 is not
compatible with IPv4 any more.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
