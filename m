From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 22 Apr 2019 20:54:05 +0200
Subject: [Buildroot] [PATCH] ltp-testsuite: Fix uClibc build with
 disabled fts.h support
In-Reply-To: <20190422172050.GA18445@dell5510>
References: <20190417135458.15505-1-Nikita.Sobolev@synopsys.com>
 <20190421123611.4016cc04@windsurf>
 <20190422172050.GA18445@dell5510>
Message-ID: <20190422205405.31c7ded0@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 22 Apr 2019 19:20:51 +0200
Petr Vorel <petr.vorel@gmail.com> wrote:

> > And it builds perfectly fine.  
> Thanks for a research (I'll do more testing next time, not just reviewing)!
> Actually testing it, it's really ok, due these lines in
> package/ltp-testsuite/ltp-testsuite.mk:
> 
> # Requires uClibc fts and bessel support, normally not enabled
> ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
> define LTP_TESTSUITE_REMOVE_UNSUPPORTED
> 	rm -rf $(@D)/testcases/kernel/controllers/cpuset/
> 	rm -rf $(@D)/testcases/misc/math/float/bessel/
> 	rm -f $(@D)/testcases/misc/math/float/float_bessel.c
> endef
> LTP_TESTSUITE_POST_PATCH_HOOKS += LTP_TESTSUITE_REMOVE_UNSUPPORTED
> endif
> 
> We can either remove deleting testcases/kernel/controllers/cpuset/ as part of
> this patchset, or simply wait for next update (planning for the start of the
> second week in the May [1]), I'd remove it during the update.

Yes, let's wait for the new version of ltp-testsuite. The current
Buildroot package builds just fine with uClibc, I don't really see the
point of adding another ltp-testsuite patch at this point.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
