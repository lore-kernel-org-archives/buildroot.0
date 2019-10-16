From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 16 Oct 2019 09:31:55 +0200
Subject: [Buildroot] [RFC PATCH 4/4] package/qt5/qt5base: support
 ti-sgx-libgbm
In-Reply-To: <f174a50b-69c9-4171-994a-32be7ec74c7e@mind.be>
References: <20191015213101.27460-1-lothar.felten@gmail.com>
 <20191015213101.27460-4-lothar.felten@gmail.com>
 <f174a50b-69c9-4171-994a-32be7ec74c7e@mind.be>
Message-ID: <20191016093155.06dcd8b3@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 16 Oct 2019 01:00:37 +0200
Arnout Vandecappelle <arnout@mind.be> wrote:

>  Note that there was also talk about making gbm a virtual package (with
> currently mesa3d and ti-sgx-libgbm as providers). IIRC, though, the TI gbm
> package was not 100% compatible. But apparently it's good enough to build qt5 then?

I tried to make libgbm a virtual package, but unfortunately my
conclusion was that the libgbm API is not really standardized. When I
tried to build kmscube against the TI gbm, it would fail
miserably, and it was also failing with another non-mesa GBM
implementation.

I pushed what I had back then at
https://github.com/tpetazzoni/buildroot/commits/gbm.

>  Note that we don't require you to figure all of this out before we can apply
> these patches. But maybe you know a little bit more about it.

Yes, let's not make this depend on having a virtual package for libgbm.
We can figure that out later.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
