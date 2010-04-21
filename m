From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 21 Apr 2010 20:43:59 +0200
Subject: [Buildroot] Still can't build working
	rootfswith	crosstool-NGtoolchain
In-Reply-To: <hqn98s$5sn$1@dough.gmane.org> (Grant Edwards's message of "Wed, 
	21 Apr 2010 16:31:24 +0000 (UTC)")
References: <hqhq8e$uau$1@dough.gmane.org>
	<8D63FCBEC4B04D56B92C74260683A038@development>
	<028801cae0e3$3ebe5720$bc3b0560$@com>
	<5D7DDABC417D46CFACF64003BB0EBC2F@development>
	<hqn0op$14i$1@dough.gmane.org>
	<82069254E03F44CB90EDB741DB18CBF9@development>
	<hqn98s$5sn$1@dough.gmane.org>
Message-ID: <87sk6o7ij4.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Grant" == Grant Edwards <grant.b.edwards@gmail.com> writes:

Hi,

 >> At one stage the whole cycle took ~ 1 hour 15 mins. Common sense had
 >> to prevail I guess - it's just a lot faster than chasing ghosts - it
 >> seems that your experience matches the observations I made.

 Grant> If it's taking that long, I suspect you're also building a
 Grant> toolchain and kernel everytime.  When I realized that partial
 Grant> rebuilds weren't practical, I switched to using an external
 Grant> toolchain.  With an external toolchain and an external download
 Grant> directory, doing a from-scratch basic rootfs build takes about
 Grant> 6-7 minutes on a single CPU, 2GHz AMD Athlon64.

FYI, I do full builds (internal toolchain including C++, a number of
packages including Qt, U-Boot and Linux kernel) in about 25 mins on a
2.8GHz i7 (buildbot server)

 Grant> Once you've got a kernel configuration figured out and set in stone,
 Grant> it could be useful to have the kernel built by buildroot, but it
 Grant> doesn't seem to be a paractical way to do kernel development.

Agreed. Doing these things with BR is mainly interesting as a
structured integration tool when the basics are stable - E.G. to ensure
you have everything under configuration control and can reproduce the
build.

-- 
Bye, Peter Korsgaard
