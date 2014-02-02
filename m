From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 02 Feb 2014 22:58:09 +0100
Subject: [Buildroot] [PATCH] package/joe: Add package for the JOE editor
In-Reply-To: <52EEBC73.9030709@signal11.us> (Alan Ott's message of "Sun, 02
 Feb 2014 16:45:23 -0500")
References: <1391301769-28263-1-git-send-email-alan@signal11.us>
 <878uttr303.fsf@dell.be.48ers.dk> <52EEBC73.9030709@signal11.us>
Message-ID: <874n4hp47i.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Alan" == Alan Ott <alan@signal11.us> writes:

Hi,

 >> We do have ncurses in buildroot, so it should enable support for it if
 >> ncurses is enabled.

 > What you have is fine, but it's worth mentioning that curses support
 > doesn't actually help joe anymore. If you grep through the joe source,
 > it only includes ncurses in one file, and doesn't actually use
 > anything out of it. The resulting binary even from a "use curses"
 > build doesn't actually even link to the ncurses library (it's
 > optimized out by the linker).

Ok, it would have been good to mention that in a comment. I only did a
test build to ensure that configure detected it and the final executable
ended up getting linked with it, which was the case:

./output/host/usr/bin/arm-linux-readelf -a output/target/usr/bin/joe | \
    grep NEEDED
 0x00000001 (NEEDED)                     Shared library: [libm.so.0]
 0x00000001 (NEEDED)                     Shared library: [libncurses.so.5]
 0x00000001 (NEEDED)                     Shared library: [libutil.so.0]
 0x00000001 (NEEDED)                     Shared library: [libc.so.0]



 >> I did a test build for uClibc and I see it uses the XSI math bessel
 >> functions which are not enabled for default, so I added a patch to
 >> disable those if needed.

 > Awesome!

 >> Committed with these issues fixed, thanks.

 > Thanks for the fixup and commit, and for all your work on Buildroot.

You're welcome and thanks!

-- 
Bye, Peter Korsgaard
