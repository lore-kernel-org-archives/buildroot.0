From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Feb 2016 00:06:39 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2016-02-19
In-Reply-To: <1455997702.5444.6.camel@embedded.rocks>
References: <20160220073017.2A200101DA7@stock.ovh.net>
 <1455997702.5444.6.camel@embedded.rocks>
Message-ID: <20160221000639.512d7658@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 20 Feb 2016 20:48:22 +0100, J?rg Krause wrote:

> Looks like the gcc bug 58952 [1] to me. How do we handle this?
> 
> [1]?https://gcc.gnu.org/bugzilla/show_bug.cgi?id=58952

The easiest solution by far is to work-around the problem. Just add a
Boost patch that changes:

	std::getchar();

to:

	(std::getchar)();

Yes, it is really a work-around, but it is so much simpler than adding
a BR2_TOOLCHAIN_HAS_GCC_BUG_58952, selecting it for all broken
toolchain + adding the autobuilder exceptions that are needed to also
exclude the custom external toolchains that are affected.

(Not sure Peter will agree, since my proposal is not the cleanest
solution, but it's by far the one with the least impact.)

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
