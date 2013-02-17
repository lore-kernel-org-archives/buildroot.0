From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 17 Feb 2013 23:08:54 +0100
Subject: [Buildroot] sdkdir in xorg-server.pc
In-Reply-To: <511D7A62.1040004@mind.be> (Arnout Vandecappelle's message of
 "Fri, 15 Feb 2013 00:59:30 +0100")
References: <511D7A62.1040004@mind.be>
Message-ID: <87ehgemw3t.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

 Arnout>  Hi all,
 Arnout>  xorg-server.pc has the variables sdkdir=${prefix}/include/xorg and
 Arnout> moduledir=${exec_prefix}/lib/xorg/modules. These are used by some Xorg
 Arnout> packages to add to the include and library search path.

 Arnout>  We patch pkgconf to add the sysroot to the variables includedir,
 Arnout> mapdir and libdir. Should we do something similar for sdkdir and
 Arnout> moduledir? But of course, there's no end to that...

Indeed :/ I guess we have to..


 Arnout>  By the way, Peter, Thomas, do the autobuilders ever compile
 Arnout> the full Xorg server? I don't see how
 Arnout> xdriver_xf86-input-synaptics can ever build with this issue...

They should as long as the needed toolchain dependencies are
available (wchar/largefile/c++).

gcc10.fsffrance.org uses:

BR2_TOOLCHAIN_BUILDROOT_LARGEFILE=y
BR2_TOOLCHAIN_BUILDROOT_INET_IPV6=y
BR2_TOOLCHAIN_BUILDROOT_INET_RPC=y
BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y

So that should be sufficient. Gcc14/114 don't have C++. Thomas' glibc
toolchains should also catch it.

-- 
Bye, Peter Korsgaard
