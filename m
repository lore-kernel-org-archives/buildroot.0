From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 08 Apr 2016 14:28:59 +0200
Subject: [Buildroot] [PATCH v3 06/10] package/Makefile.in: adjust
	LDFLAGS for elf2flt
In-Reply-To: <1459450815-6494-7-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Thu, 31 Mar 2016 21:00:11 +0200")
References: <1459450815-6494-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1459450815-6494-7-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87egagp9mc.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > So far, our LDFLAGS for the BR2_BINFMT_FLAT case were only used on
 > Blackfin. However, passing -elf2flt in LDFLAGS is wrong. Indeed,
 > LDFLAGS are not linker flags, but flags passed to the compiler when
 > linking.

 > If you pass -elf2flt to the compiler when linking, it is understood as
 > "-e lf2flt", i.e "the entry point is named lf2flt", which isn't
 > exactly the intention. We in fact need to pass -Wl,-elf2flt in LDFLAGS
 > as well, so that the compiler passes -elf2flt down to the linker.

 > For some reason, this option does not cause an issue with the Blackfin
 > toolchain, but it does with either a Buildroot toolchain for Cortex-M
 > or an OSELAS toolchain for Cortex-M. We have verified that passing
 > -Wl,-elf2flt continues to work with the Blackfin toolchain.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
