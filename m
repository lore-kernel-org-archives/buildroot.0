From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 24 May 2009 22:33:19 +0200
Subject: [Buildroot] Kernel headers 2.36.8.10 not matching patch level
In-Reply-To: <4A33C433D49245E0AF2FB390E7B24639@apexjs> (Sagaert Johan's
	message of "Wed\, 20 May 2009 16\:18\:42 +0200")
References: <4A33C433D49245E0AF2FB390E7B24639@apexjs>
Message-ID: <8763fqfdgw.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Sagaert" == Sagaert Johan <sagaert.johan@skynet.be> writes:

 Sagaert> Hi
 Sagaert> (2009.5 rc2)
 
 Sagaert> I noticed while running make and having selected patch level
 Sagaert> 9 ( 2.6.28.9) that buildroot downloads the kernel source
 Sagaert> 2.6.28.10 ?  It seems to use the 2.6.28.10 in the
 Sagaert> toolchain_build_arm, the one in project_build_arm was the
 Sagaert> right one.  I have o idea if this could cause problems.

There's up to two kernels involved here. The first (in toolchain_*) is
used for the kernel headers needed by uClibc / various packages, and
the second is the kernel for the target. These may or may not be same
version, depending on config (E.G. from the above I gather you are
using the "advanced" kernel config).

Normally it isn't a big deal if these versions don't match as the
syscall interface is very stable, but it could be an issue if your
kernel headers are very old compared to your kernel as you then don't
have the new features described in the headers.

It seems like the advanced kernel config should get the 2.6.28.x
version bumped.
 
 Sagaert> Running make linux26menuconfig fails if a full build was
 Sagaert> never done before.

So with a config selecting the advanced kernel config? I'll take a
look at it.

-- 
Bye, Peter Korsgaard
