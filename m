From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 19 Feb 2014 00:26:43 +0100
Subject: [Buildroot] Switching from uClibc to glibc as the default in
	Buildroot?
In-Reply-To: <20140218231759.GS184@brightrain.aerifal.cx>
References: <20140218231447.524a1a20@skate>
 <20140218231759.GS184@brightrain.aerifal.cx>
Message-ID: <20140219002643.50795999@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Rich Felker,

On Tue, 18 Feb 2014 18:17:59 -0500, Rich Felker wrote:

> As maintainer of musl libc (http://www.musl-libc.org), I'd like to
> suggest it as an alternative to switching to glibc. Obviously sticking
> with uClibc as the default would probably be the least invasive for
> your user base, but if that turns out not to be feasible, I think musl
> might be a better fit for most Buildroot users. Both musl's small size
> and strong robustness aims are attractive from an embedded
> perspective. We are about to make a 1.0 release and have active
> development plans following 1.0 as well.
> 
> musl's arch coverage is still considerably less than uClibc's or
> glibc's, but the amount of work needed to add a port is also much
> lower (less than 20 small mandatory port-specific files aside from
> bits headers to match kernel/ABI-specific types) and we have an active
> development community willing to help getting additional ports
> integrated upstream. Right now we have i386, x86_64, arm(32),
> mips(32), microblaze, and powerpc(32); I expect to also merge the
> in-progress superh port before the next release.

Thanks a lot Rich for this proposal.

In fact, I am myself interested in musl: I have already added the
possibility of using external musl toolchains with Buildroot, and I
have started to work on integrating musl support in the internal
toolchain backend of Buildroot. So you can clearly expect musl to be
fully supported by Buildroot in the coming months.

Since we don't yet have this support in Buildroot, I believe it is too
early to consider making musl the default C library. But I definitely
want to see musl supported in Buildroot, in order to help make its
usage more widespread.

Do you intend to have support for non-MMU architectures in musl?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
