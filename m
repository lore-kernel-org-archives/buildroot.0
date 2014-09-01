From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Mon, 1 Sep 2014 07:53:08 +0000
Subject: [Buildroot] [PATCH v3] gcc: explicitly use
 C{XX}FLAGS_FOR_TARGET instead of --enable-target-optspace
In-Reply-To: <20140901092521.163d726f@free-electrons.com>
References: <1409553165-10253-1-git-send-email-abrodkin@synopsys.com>
 <20140901092521.163d726f@free-electrons.com>
Message-ID: <1409557987.16864.11.camel@abrodkin-8560l.internal.synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Mon, 2014-09-01 at 09:25 +0200, Thomas Petazzoni wrote:
> Dear Alexey Brodkin,
> 
> On Mon,  1 Sep 2014 10:32:45 +0400, Alexey Brodkin wrote:
> 
> >  # http://gcc.gnu.org/bugzilla/show_bug.cgi?id=43810
> >  # Workaround until it's fixed in 4.5.4 or later
> >  ifeq ($(ARCH),powerpc)
> >  ifeq ($(findstring x4.5.,x$(GCC_VERSION)),x4.5.)
> > -HOST_GCC_COMMON_CONF_OPT += --disable-target-optspace
> > +GCC_COMMON_TARGET_CFLAGS := $(filter-out -Os,$(GCC_COMMON_TARGET_CFLAGS))
> > +GCC_COMMON_TARGET_CXXFLAGS := $(filter-out -Os,$(GCC_COMMON_TARGET_CXXFLAGS))
> 
> Is there any reason to use := instead of = here? We normally use =
> except when it's really necessary to use :=.

Nope I think I just copy-pasted it here - which is not the best thing I
could have done. Looks like in this particular case there's no need to
use ":=" and "=" will work well.

So will fix this tiny "misspelling" shortly in v4.

-Alexey
