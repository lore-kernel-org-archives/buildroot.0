From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 27 Nov 2010 22:25:03 +0100
Subject: [Buildroot] xorg-server not using target cflags
In-Reply-To: <BAY145-w13F5F6FEBA012526351555C2220@phx.gbl> (Matt Johnson's
	message of "Fri, 26 Nov 2010 17:42:12 -0700")
References: <BAY145-w13F5F6FEBA012526351555C2220@phx.gbl>
Message-ID: <87pqtq1mts.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Matt" == Matt Johnson <mj1856@hotmail.com> writes:

 Matt> Hello,
 
 Matt> I'm relatively new to buildroot, but I've had some recent success
 Matt> with most of the system.  However, I have been having problems
 Matt> getting X to run on my target platform, which is a custom s3c2410
 Matt> board. Trying to run Xfbdev always caused an Illegal Instruction
 Matt> error.
 
 Matt> I'm using a CodeSourcery external toolchain, and it requires
 Matt> -march=armv4t to be supplied, or it builds with armv5t
 Matt> instructions by default.  This hasn't been a problem for most
 Matt> packages, but I found that for the xserver_xorg-server package,
 Matt> none of the CFLAGS were being set properly.
 
 Matt> I found that the
 Matt> /package/x11r7/xserver_xorg-server/xserver_xorg-server.mk file
 Matt> has overridden the CFLAGS to include the pixman-1 library.  In
 Matt> doing so, it appear that the regular CFLAGS are no longer passed
 Matt> along.  I was able to fix this by including $(TARGET_CFLAGS) as
 Matt> well.  This seems like the best way to resolve the problem
 Matt> properly.
 
 
 Matt> I no longer get the Illegal Instruction error, and it appears to launch X properly now.
 
 
 Matt> Assuming this fix is ok, please apply the following patch to buildroot to close this bug.

Thanks, committed. Could you in the future use unified diffs (diff -u),
please? - Or even better use git and 'git format-patch'.

-- 
Bye, Peter Korsgaard
