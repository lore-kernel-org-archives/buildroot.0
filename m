From: Hamish Moffatt <hamish@cloud.net.au>
Date: Wed, 14 Jan 2009 21:04:34 +1100
Subject: [Buildroot] external toolchain --sysroot
In-Reply-To: <20090114094308.GA26312@mx.loc>
References: <20090113043014.GA5238@cloud.net.au>
	<eaeb93bb0901122045p6e653f67of6172a11f28010d8@mail.gmail.com>
	<eaeb93bb0901122046g2ed61992n672221d163c74971@mail.gmail.com>
	<eaeb93bb0901122052o16f639f8nbc8c25d989fdb876@mail.gmail.com>
	<20090113231130.GA24352@cloud.net.au>
	<20090114094308.GA26312@mx.loc>
Message-ID: <20090114100434.GA8469@cloud.net.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Jan 14, 2009 at 10:43:09AM +0100, Bernhard Reutner-Fischer wrote:
> On Wed, Jan 14, 2009 at 10:11:30AM +1100, Hamish Moffatt wrote:
> 
> >Right. I notice that --sysroot is being used even if gcc is compiled
> >without it. And it appears that sysroot is buggy in gcc 4.1.2, which is
> >what I'm using currently.
> 
> The whole gcc-4.1.x series is discontinued and not maintained anymore.
> You would be better off to use a somewhat current toolchain or at least
> avoid versions that are known to be broken (like sysroot and 4.1.x).
> Sysroot support is deliberately marked as unavailable for anything older
> than the 4.2.x series for good reasons -- see toolchain/gcc/Config.in

Yes it is, but package/Makefile.in doesn't use that setting, but uses
--sysroot regardless for the external toolchain.

Anyway, gcc 4.3.2 / armeb / EABI seems to build. When I first started
with buildroot I couldn't get anything better than 4.1.2 / OABI to
build, so I stuck with it. Mind you, I couldn't build anything else
after the toolchain - still need to debug that.


Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
