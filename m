From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 21 Jun 2012 17:01:20 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2012-06-20
In-Reply-To: <20120621113207.616a649e@skate> (Thomas Petazzoni's message of
 "Thu, 21 Jun 2012 11:32:07 +0200")
References: <20120621063115.B05E852CEBE@lolut.humanoidz.org>
 <87ipelqccc.fsf@macbook.be.48ers.dk> <20120621113207.616a649e@skate>
Message-ID: <87zk7whfpb.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 >> Too old / misconfigured uClibc. Resolver support was only added in
 >> 0.9.33, but not easy to handle this on kconfig level for external
 >> toolchains.

 Thomas> Well, our uClibc Config.in says that 0.9.32 and 0.9.33 do not
 Thomas> work on AVR32. So the latest uClibc version available is
 Thomas> 0.9.31, which does not have resolver support.

 Thomas> Should I just blacklist it? Mark avr32 as deprecated, and get
 Thomas> rid of the avr32 toolchain from my automated builds?

Yes, avr32 is in pretty bad shape (and doesn't seem very active upstream
- E.G. I don't see a single commit from any avr32 people in Linux since
3.4) - But completely dropping it is probably a bit extreme so far, so I
suggest you just blacklist it in your script.

-- 
Bye, Peter Korsgaard
