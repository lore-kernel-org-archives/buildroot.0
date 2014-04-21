From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 21 Apr 2014 22:13:00 +0200
Subject: [Buildroot] Analysis of build results for 2014-04-20
In-Reply-To: <1398088076.25515.10.camel@abrodkin-8560l.internal.synopsys.com>
References: <20140421063009.036D5100FF4@stock.ovh.net>
 <20140421114949.59c65c31@skate>
 <39A54937CC95F24AA2F794E2D2B66B1356CB9EA2@de02wembxa.internal.synopsys.com>
 <20140421135807.3002c46f@skate>
 <1398088076.25515.10.camel@abrodkin-8560l.internal.synopsys.com>
Message-ID: <20140421221300.7229097f@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Alexey Brodkin,

On Mon, 21 Apr 2014 13:47:57 +0000, Alexey Brodkin wrote:

> As Anton has just answered -fPIE/-pie is enabled in top-level
> Makefile.inc. But as I may see at least in master branch here
> https://github.com/xelerance/Openswan/blob/master/Makefile.inc it's
> very easy to override these settings with simple definitoin of
> USERCOMPILE and USERLINK variables.
> 
> So definitely it is doable. But another good question would be if this
> was done on purpose (which I cannot undersnad clearly from commit
> message because too many items were dropped in at once here -
> https://github.com/xelerance/Openswan/commit/6181d2b2999e112d47884dda48d1ca2916e2403e#diff-084b77e3e200296f6230945d5f0ea0ec)
> or not.
> 
> Another comment on PIE usage.
> I know for sure that many architectures (and more to come) use PIE for
> U-Boot (and here it is used on purpose for entire relocation of both
> code and data), so definitely PIE is required feature of toolchains
> and IMHO we don't want to escape it if it is used by packages
> developers.

Ok. However in the mean time, I think we could disable it for openswan,
no?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
