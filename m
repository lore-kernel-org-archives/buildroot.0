From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 20 Apr 2018 08:56:44 +0200
Subject: [Buildroot] [arc-buildroot] Re: [PATCH]
 configs/snps_arc*_defconfig: update linux version
In-Reply-To: <1524151010.7288.3.camel@synopsys.com>
References: <20180419135524.44727-1-Evgeniy.Didin@synopsys.com>
 <20180419161502.6414c2e8@windsurf.numericable.fr>
 <1524151010.7288.3.camel@synopsys.com>
Message-ID: <20180420085644.0adf07e3@windsurf.numericable.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Evgeniy,

On Thu, 19 Apr 2018 15:16:51 +0000, Evgeniy Didin wrote:
> Hello,
> 
> > Hello,
> > 
> > On Thu, 19 Apr 2018 16:55:24 +0300, Evgeniy Didin wrote:  
> > > With this commit we update Linux kernel version to 4.16.3
> > > and Linux headers version to 4.16.
> > > For some configs we switch headers version to be independent from
> > > Linux kernel version.  
> > 
> > Why ? The change doesn't make you independent at all from the Linux
> > kernel version, and causes two kernel tarballs to be downloaded instead
> > of one, which isn't nice.
> > 
> > Could you justify this change ?  
> 
> With option BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_1*=y
> BR2_KERNEL_HEADERS_AS_KERNEL parameter is set.

Yes, and this is what we want.

> Defconfig is meant as a starting point for work with the board.
> In these case if user wants to change version of Linux kernel,
> such error appears:
> ---------------------------->8---------------------------------  
> Incorrect selection of kernel headers: expected 4.16.x, got 4.15.x,
> ----------------------------8<---------------------------------
> Also in case of choosing new kernel rc's, error 404 occurs.
> For inexperienced users, these errors may not be obvious.

I do understand your concern. However, it is actually even worse if
your defconfig selects 4.16 kernel headers: if the user changes
the kernel version itself from 4.16 to 4.10, the user will
run a 4.10 kernel, with a toolchain compiled against 4.16 kernel
headers, which isn't good.

Also, specifying a fixed kernel headers version like you're doing means
that the kernel source code gets downloaded twice.

In addition all our defconfigs use this principle, and we are not going
to change this principle for just a few defconfigs. Either we change
this for all defconfigs, or we keep it as is for all defconfigs.
Therefore, I would recommend you to bump the Linux kernel version in
the snps_arc_* defconfigs without changing this, and if you really
think the current situation is not convenient, open up the discussion
inn a broader way.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
