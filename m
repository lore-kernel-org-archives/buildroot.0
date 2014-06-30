From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Mon, 30 Jun 2014 16:01:19 +0000
Subject: [Buildroot] [PATCH] uclibc: disable parallel build for uClibc
	0.9.31
In-Reply-To: <20140630164216.601d4429@free-electrons.com>
References: <1404138620-7929-1-git-send-email-abrodkin@synopsys.com>
 <20140630164216.601d4429@free-electrons.com>
Message-ID: <1404144079.3117.9.camel@abrodkin-8560l.internal.synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Mon, 2014-06-30 at 16:42 +0200, Thomas Petazzoni wrote:
> Sorry to nitpick, but I'd prefer to use UCLIBC_MAKE as the variable
> name. We use <PKG>_<SOMETHING> for all variables, so it would make more
> sense to do the same.

Ok I didn't think about this concept - just used whatever first appeared
in my mind. So will use UCLIBC_MAKE - makes sense.

> >  define UCLIBC_BUILD_CMDS
> > -	$(MAKE) -C $(@D) \
> > +	$(MAKE_UCLIBC) -C $(@D) \
> 
> Your original patch changing MAKE1 -> MAKE changed two places, and
> you're changing only one place here. To be sure, we should probably
> change back both places, no?

I do see that host utilities were built perfectly fine in parallel mode
then why do more changes than needed?

-Alexey
