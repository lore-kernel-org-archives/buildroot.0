From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 8 Mar 2013 09:50:41 +0100
Subject: [Buildroot] [RFD] IPv6 ....
In-Reply-To: <51394B12.8090608@wp.pl>
References: <51394B12.8090608@wp.pl>
Message-ID: <20130308095041.7504bd0d@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear W.P.,

On Fri, 08 Mar 2013 03:21:06 +0100, W.P. wrote:

> I am a bit ... with options in buildroot "require IPv6".
> And what if USER does NOT want to enable / build IPv6?

Some packages do require the C library to support IPv6, regardless of
whether your network is using IPv6 or not. IPv6 support in the C
library has added a number of specific data structures and defines, so
if a given software package uses those IPv6-specific data structures
and definitions unconditionally, then this package requires IPv6.

For some packages, we have patches to make this code conditional on the
presence of IPv6. But for some other packages, we believe it's not
worth the effort because the package is huge and therefore adding IPv6
support in the C library is not a big deal in terms of binary size.

> If he/she relies only on IPv4?

No problem, you can have IPv6 support in your C library, and still use
IPv4 only. It's just that your C library will be a little bit larger
than necessary, but we're talking about a few dozens of KB, not more.

> In "regular" Linux distributions (like mine, Fedora 16), there is NO 
> easy way to get rid of IPv6. Except deleting all ipv6 related stuff from 
> /lib/modules....
> 
> Why?
> What for?

Because they want to support IPv6, and supporting IPv6 is not as simple
as installing an additional package: it requires support in the kernel,
in the C library, and in all networking libraries and applications.
Since they are binary distributions, they can generally only ship one
configuration for each package, so they decide to ship it with IPv6.

But really, what's the problem? What do you believe you will achieve by
removing IPv6 support?

> I know advantages of IPv6, but what "regular ISP" provides this?

At least in France, there are several regular ISPs providing IPv6
support. There are also some private networks that use IPv6 internally.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
