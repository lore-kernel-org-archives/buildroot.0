From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 21 Sep 2013 05:41:45 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2013-09-19
In-Reply-To: <20130920063008.7C55952C101@lolut.humanoidz.org>
References: <20130920063008.7C55952C101@lolut.humanoidz.org>
Message-ID: <20130921054145.52b70d5e@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 20 Sep 2013 08:30:08 +0200 (CEST), Thomas Petazzoni wrote:

>        arc |       host-gcc-initial-4.8-arc | NOK | http://autobuild.buildroot.net/results/ff903ce970ea652cc1aa57a5eb57e923dc4c5405/
>        arc |       host-gcc-initial-4.8-arc | NOK | http://autobuild.buildroot.net/results/d3b2e4e32d531c08c19d39b248898fe462b81d8f/
>        arc |       host-gcc-initial-4.8-arc | NOK | http://autobuild.buildroot.net/results/76a2ab46ef7183f14eec944db4a598325e00b503/

Hum, apparently on ARC, building libgcc requires having the C library
headers. So, due to the change to build gcc in two passes instead of
three, we're building libgcc in the first pass, before the C library is
built, causing (I believe) the above failure. Mischa, if you have any
insights about this, I'm interested :)

Considering this problem, and the other SSP problems, I'm starting to
wonder if my patch that changes the toolchain build mechanism to use
two passes instead of three shouldn't be reverted for now, until I find
the time to investigate all the problems that it is causing.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
