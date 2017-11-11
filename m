From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 11 Nov 2017 09:18:48 +0000
Subject: [Buildroot] [Bug 10491] Cannot output security warning when
 compiled with buildroot cross compilers
In-Reply-To: <bug-10491-163@https.bugs.busybox.net/>
References: <bug-10491-163@https.bugs.busybox.net/>
Message-ID: <bug-10491-163-czLFJ6DYiC@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10491

Arnout Vandecappelle <arnout@mind.be> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |INVALID

--- Comment #1 from Arnout Vandecappelle <arnout@mind.be> ---
The warning you are looking for is supposed to be triggered by
-D_FORTIFY_SOURCE=2.

Fortify is a bit special: it requires support both in the compiler and in libc.
GCC has this support since 4.0, but uClibc and musl don't have support for
Fortify at all. Thus, there is no way that -D_FORTIFY_SOURCE=2 is going to work
with uClibc.

When support for Fortify will land in core Buildroot, it will depend on a glibc
toolchain.

See also the discussion in http://patchwork.ozlabs.org/patch/830253/

-- 
You are receiving this mail because:
You are on the CC list for the bug.
