From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 12 Jan 2014 11:04:41 +0100
Subject: [Buildroot] [PATCH] coreutils: fix build with uClibc
In-Reply-To: <20140112093913.GD4659@sapphire.tkos.co.il> (Baruch Siach's
 message of "Sun, 12 Jan 2014 11:39:13 +0200")
References: <fb99be0f4d3d7d7e92f0e3948d923c624730f1a4.1388492301.git.baruch@tkos.co.il>
 <8761pr77v2.fsf@dell.be.48ers.dk>
 <20140112093913.GD4659@sapphire.tkos.co.il>
Message-ID: <87ob3h4iti.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Hi Peter,
 > On Sat, Jan 11, 2014 at 12:08:33AM +0100, Peter Korsgaard wrote:
 >> >>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:
 >> > +ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
 >> > +COREUTILS_LDFLAGS += -lrt
 >> > +COREUTILS_CONF_ENV += ac_cv_func_posix_spawn=yes \
 >> > +		ac_cv_search_timer_settime=-lrt
 >> 
 >> Hmm, this is only for uClibc snapshot, right? My 0.9.33 doesn't seem to
 >> have posix_spawn, so this breaks the build.

 > Correct. posix_spawn support was added in uClibc after 0.9.33. I posted 
 > recently a patch series with a better fix in uClibc 
 > (http://thread.gmane.org/gmane.comp.lib.uclibc.buildroot/73863, first patch).  
 > Since then, however, patches 2 and 3 (but not 1) were applied to uClibc 
 > master.  I'll send an update series that bumps the xtnesa uClibc snapshot 
 > version instead.

Ok, great. Could you please also mark obsolete patches as such in
patchwork?

-- 
Bye, Peter Korsgaard
