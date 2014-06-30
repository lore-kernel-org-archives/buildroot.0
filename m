From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 30 Jun 2014 18:10:40 +0200
Subject: [Buildroot] [PATCH] uclibc: disable parallel build for uClibc
	0.9.31
In-Reply-To: <1404144079.3117.9.camel@abrodkin-8560l.internal.synopsys.com>
References: <1404138620-7929-1-git-send-email-abrodkin@synopsys.com>
 <20140630164216.601d4429@free-electrons.com>
 <1404144079.3117.9.camel@abrodkin-8560l.internal.synopsys.com>
Message-ID: <20140630181040.64ad21b6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Alexey Brodkin,

On Mon, 30 Jun 2014 16:01:19 +0000, Alexey Brodkin wrote:

> On Mon, 2014-06-30 at 16:42 +0200, Thomas Petazzoni wrote:
> > Sorry to nitpick, but I'd prefer to use UCLIBC_MAKE as the variable
> > name. We use <PKG>_<SOMETHING> for all variables, so it would make more
> > sense to do the same.
> 
> Ok I didn't think about this concept - just used whatever first appeared
> in my mind. So will use UCLIBC_MAKE - makes sense.
> 
> > >  define UCLIBC_BUILD_CMDS
> > > -	$(MAKE) -C $(@D) \
> > > +	$(MAKE_UCLIBC) -C $(@D) \
> > 
> > Your original patch changing MAKE1 -> MAKE changed two places, and
> > you're changing only one place here. To be sure, we should probably
> > change back both places, no?
> 
> I do see that host utilities were built perfectly fine in parallel mode
> then why do more changes than needed?

Ok, fine with me.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
