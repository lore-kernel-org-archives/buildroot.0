From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 9 Sep 2016 16:43:14 +0200
Subject: [Buildroot] [PATCH] binutils: fix makeinfo related issue
In-Reply-To: <c3c573e4-adf3-90e9-cb7c-df3cf0d0ac08@gmail.com>
References: <1473364162-23847-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <c3c573e4-adf3-90e9-cb7c-df3cf0d0ac08@gmail.com>
Message-ID: <20160909164314.17435856@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 8 Sep 2016 22:45:00 +0200, Romain Naour wrote:

> > -# The .info files in the 2.26 tarball have an incorrect timestamp, so
> > -# binutils tries to re-generate them. In order to avoid the dependency
> > -# on host-texinfo, we simply update the timestamps.
> > -ifeq ($(BR2_BINUTILS_VERSION_2_26_X),y)
> > +# The .info files in the >= 2.26 tarball have an incorrect timestamp,
> > +# so binutils tries to re-generate them. In order to avoid the
> > +# dependency on host-texinfo, we simply update the timestamps.
> > +ifeq ($(BR2_BINUTILS_VERSION_2_26_X)$(BR2_BINUTILS_VERSION_2_27_X),y)  
> 
> Binutils 2.28 will likely have the same issue, why not inverse the condition ?
> ifneq ($(BR2_BINUTILS_VERSION_2_24_X)$(BR2_BINUTILS_VERSION_2_25_X),)

Right, but maybe I could dream that someone will report the bug to the
binutils maintainers, and that the problem will be fixed in binutils
2.28 ? :-)

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
