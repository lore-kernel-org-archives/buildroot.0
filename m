From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 21 Sep 2013 07:19:37 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2013-09-19
In-Reply-To: <20130921054145.52b70d5e@skate> (Thomas Petazzoni's message of
 "Sat, 21 Sep 2013 05:41:45 +0200")
References: <20130920063008.7C55952C101@lolut.humanoidz.org>
 <20130921054145.52b70d5e@skate>
Message-ID: <87hadebvkm.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Hello,
 Thomas> On Fri, 20 Sep 2013 08:30:08 +0200 (CEST), Thomas Petazzoni wrote:

 >> arc |       host-gcc-initial-4.8-arc | NOK | http://autobuild.buildroot.net/results/ff903ce970ea652cc1aa57a5eb57e923dc4c5405/
 >> arc |       host-gcc-initial-4.8-arc | NOK | http://autobuild.buildroot.net/results/d3b2e4e32d531c08c19d39b248898fe462b81d8f/
 >> arc |       host-gcc-initial-4.8-arc | NOK | http://autobuild.buildroot.net/results/76a2ab46ef7183f14eec944db4a598325e00b503/

 Thomas> Hum, apparently on ARC, building libgcc requires having the C library
 Thomas> headers. So, due to the change to build gcc in two passes instead of
 Thomas> three, we're building libgcc in the first pass, before the C library is
 Thomas> built, causing (I believe) the above failure. Mischa, if you have any
 Thomas> insights about this, I'm interested :)

 Thomas> Considering this problem, and the other SSP problems, I'm starting to
 Thomas> wonder if my patch that changes the toolchain build mechanism to use
 Thomas> two passes instead of three shouldn't be reverted for now, until I find
 Thomas> the time to investigate all the problems that it is causing.

I'm thinking the same. Will you have time to work on it in the next week
or so? Otherwise I think we should revert for now.

-- 
Bye, Peter Korsgaard
