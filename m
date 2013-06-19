From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 19 Jun 2013 08:25:57 +0200
Subject: [Buildroot] binutils doesn't like -elf2flt option
In-Reply-To: <kpqg93$v74$1@ger.gmane.org>
References: <kphffs$v5g$1@ger.gmane.org> <51BEAB3A.8010408@mind.be>
 <kpmcpb$lbo$1@ger.gmane.org> <51C08403.4050900@mind.be>
 <kpqg93$v74$1@ger.gmane.org>
Message-ID: <20130619082557.447efce8@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Adam Nielsen,

On Wed, 19 Jun 2013 06:34:48 +1000, Adam Nielsen wrote:

> Sorry, to clarify - I get the error running just "make", but if I want to 
> experiment by changing build flags, I can run "make binutils" to skip 
> recompiling gcc, uclibc, etc. and just attempt the bit that recently failed.

I believe you're still confusing the target binutils (which gets built
when you run "make binutils") with the cross binutils (which gets built
together with gcc, uclibc as part of the cross-compilation toolchain,
this one can be rebuilt explicitly by doing "make host-binutils").

> This is just a timesaver when testing though, the real problem is that I still 
> get these errors from the target binutils when running "make".

Do you need the target binutils? If you need BFLT support, your target
system has no MMU, so is probably a bit memory limited, so what would
you need to have binutils on your target on a small system?

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
