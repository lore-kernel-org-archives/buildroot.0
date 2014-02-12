From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 12 Feb 2014 10:21:55 +0100
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <20140212093245.49e2b6ac@skate> (Thomas Petazzoni's message of
 "Wed, 12 Feb 2014 09:32:45 +0100")
References: <20140212073007.B3242100CEB@stock.ovh.net>
 <20140212093245.49e2b6ac@skate>
Message-ID: <87iosku1n0.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 >> bfin |                   boost-1.55.0 | NOK | http://autobuild.buildroot.net/results/17dd7946631354d59336259d5f31aa899e3599b8/

 > Some part of boost needs fork(). But we probably shouldn't disable
 > boost as a whole, only the specific modules that cannot work on !MMU
 > systems.

 > ./boost/test/impl/debug.ipp: In function 'bool
 > boost::debug::attach_debugger(bool)': ./boost/test/impl/debug.ipp:868:
 > error: 'fork' was not declared in this scope

Fixed.


 >> aarch64 |                   libv4l-0.8.9 | NOK | http://autobuild.buildroot.net/results/6635f7149cd0f5192d49276b2cc3edc5be3b5868/

 > Ah, yes. I have the beginning of a patch that bumps libv4l, which
 > solves this problem. But it is not a straightforward bump since libv4l
 > has changed quite a bit (more tools available, for example).

Nice, care to send a patch? I had a quick look at updating it (and
probably renaming to v4l-utils) last week as I could use some of the new
features, but ran out of time.


 > What should we do in the mean time?

If you say just mark it as !BR2_aarch64 for 2014.02.


 >> bfin |                     orc-0.4.18 | NOK | http://autobuild.buildroot.net/results/dd64c2aed5291b6c083f061709d6179150440a7e/

 > configure: error: no code allocation backend
 > make: *** [/home/test/test/3/output/build/orc-0.4.18/.stamp_configured] Error 1

Looks like it should be !BR2_bfin.


 >> x86_64 |                   thrift-0.9.1 | NOK | http://autobuild.buildroot.net/results/23caf6deef3cbd8fd6b150e133d493d26d16d80b/

 > Same as yesterday:

 > /home/test/test/2/output/host/usr/x86_64-buildroot-linux-uclibc/sysroot/usr/include/boost/cstdint.hpp:314:42: error:                 typedef boost::ulong_long_type boost::uint64_t
 > src/thrift/transport/TSSLSocket.cpp:351:1: error: 'uint64_t' does not name a type

Boost version compatibility issue?


-- 
Bye, Peter Korsgaard
