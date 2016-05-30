From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 30 May 2016 15:20:42 +0200
Subject: [Buildroot] [PATCH] [PATCH v2] p7zip: New package
In-Reply-To: <574B256A.4010502@dawncrow.de>
References: <1464539299-3853-1-git-send-email-nerv@dawncrow.de>
 <20160529171412.GA3367@free.fr> <574B256A.4010502@dawncrow.de>
Message-ID: <20160530152042.5acb6bb0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 29 May 2016 19:22:50 +0200, Andr? Hentschel wrote:

> >> +config BR2_PACKAGE_P7ZIP
> >> +	bool "p7zip"
> >> +	depends on BR2_INSTALL_LIBSTDCPP
> >> +	depends on BR2_i386 || BR2_x86_64 || \
> >> +		BR2_aarch64 || BR2_arm || BR2_armeb  
> > 
> > Please explain why this is limited to those architectures.
> > 
> > You can put it in the commit log, or you may add a terse comment just
> > above the depends-on line. If the explanations is not straightforward,
> > prefer the commit log.
> > 
> > (Yes, I read the previous reply that it was broken on NIOSII. Limiting
> > to a small set of architectures wihtout an explanation is not enough.)
> > 
> > Thanks! :-)  
> 
> Can I start with a small set of archs until it is tested on more?
> (with a comment then anyway of course)

I will disagree with Yann here. We typically do not limit the
architectures based simply on what has been tested or not.

A dependency on specific architectures should only be added if the
package is either 1/ contains some architecture-specific code or 2/ is
known to not build/work properly on some architectures.

In any case,  the fact that you could only test on i386/AArch64/ARM is
not a proper reason to restrict the package to those architectures only.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
