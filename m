From: Evgeniy Didin <Evgeniy.Didin@synopsys.com>
Date: Thu, 19 Apr 2018 15:16:51 +0000
Subject: [Buildroot] [arc-buildroot] Re: [PATCH]
 configs/snps_arc*_defconfig: update linux version
In-Reply-To: <20180419161502.6414c2e8@windsurf.numericable.fr>
References: <20180419135524.44727-1-Evgeniy.Didin@synopsys.com>
 <20180419161502.6414c2e8@windsurf.numericable.fr>
Message-ID: <1524151010.7288.3.camel@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

> Hello,
> 
> On Thu, 19 Apr 2018 16:55:24 +0300, Evgeniy Didin wrote:
> > With this commit we update Linux kernel version to 4.16.3
> > and Linux headers version to 4.16.
> > For some configs we switch headers version to be independent from
> > Linux kernel version.
> 
> Why ? The change doesn't make you independent at all from the Linux
> kernel version, and causes two kernel tarballs to be downloaded instead
> of one, which isn't nice.
> 
> Could you justify this change ?

With option BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_1*=y
BR2_KERNEL_HEADERS_AS_KERNEL parameter is set.
Defconfig is meant as a starting point for work with the board.
In these case if user wants to change version of Linux kernel,
such error appears:
---------------------------->8---------------------------------
Incorrect selection of kernel headers: expected 4.16.x, got 4.15.x,
----------------------------8<---------------------------------
Also in case of choosing new kernel rc's, error 404 occurs.
For inexperienced users, these errors may not be obvious.

> (side note: could you use my @bootlin.com address instead of
> @free-electrons.com. The DEVELOPERS file has been updated since quite
> some time about this already. Thanks a lot!)

Sure

Best regards,
Evgeniy Didin
