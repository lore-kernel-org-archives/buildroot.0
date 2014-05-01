From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 1 May 2014 02:26:28 +0200
Subject: [Buildroot] uboot.pbl - make 'include' issue
In-Reply-To: <20140430230240.GH3336@free.fr>
References: <OFB2294D5B.F4E5AC38-ON86257CCA.00752EA9-86257CCA.00753202@rockwellcollins.com>
 <20140430223910.GF3336@free.fr> <20140501004716.5a27705a@skate>
 <20140430230240.GH3336@free.fr>
Message-ID: <20140501022628.5da50090@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Thu, 1 May 2014 01:02:40 +0200, Yann E. MORIN wrote:

> > I haven't looked at the details, but linux/linux.mk seems to be doing
> > the exact same thing with the "Linux extensions" for real-time, and
> > doesn't appear to have any problem. It does:
> > 
> > include $(sort $(wildcard linux/linux-ext-*.mk))
> > 
> > $(eval $(generic-package))
> > 
> > So by the time generic-package is expanded, the last included makefile
> > is not linux.mk. And still the thing works.
> 
> Indeed, but the includes are all in the same directory, so pkgdir still
> return "linux" and thus the pkgname is correct.
> 
> In Ryan's case, the included Makefiles are in sub-dirs of uboot, so
> pkgdir returns that last sub-dir, hence the wrong pkgname.

Aah, good point. So I'll have to think more about this U-Boot extension
thing to find a more appropriate solution to suggest to Ryan.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
