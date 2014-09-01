From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Mon, 1 Sep 2014 06:01:16 +0000
Subject: [Buildroot] [PATCH v2] gcc: explicitly use
 C{XX}FLAGS_FOR_TARGET instead of --enable-target-optspace
In-Reply-To: <20140829190230.36493af3@free-electrons.com>
References: <1409230758-14548-1-git-send-email-abrodkin@synopsys.com>
 <20140829190230.36493af3@free-electrons.com>
Message-ID: <1409551275.16864.2.camel@abrodkin-8560l.internal.synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Fri, 2014-08-29 at 19:02 +0200, Thomas Petazzoni wrote:
> Dear Alexey Brodkin,
> 
> On Thu, 28 Aug 2014 16:59:18 +0400, Alexey Brodkin wrote:
> 
> > @@ -111,12 +111,15 @@ HOST_GCC_COMMON_CONF_ENV = \
> >  # Workaround until it's fixed in 4.5.4 or later
> >  ifeq ($(ARCH),powerpc)
> >  ifeq ($(findstring x4.5.,x$(GCC_VERSION)),x4.5.)
> > -HOST_GCC_COMMON_CONF_OPT += --disable-target-optspace
> > +TARGET_CFLAGS := $(subst -Os,,$(TARGET_CFLAGS))
> > +TARGET_CXXFLAGS := $(subst -Os,,$(TARGET_CXXFLAGS))
> 
> No. Remember that the namespace of variables is global in Buildroot. A
> given package is clearly *not* allowed to change global variables such
> as TARGET_CFLAGS and TARGET_CXXFLAGS. If you want to remove -Os just
> for gcc, you should do:

Hm, I was under impression that variables are visible only within
"package/name" and according to hierarchy.

Now it's clear they are all global - will keep it in mind then.

Already smoke-testing v3 and will send it to the list shortly.

-Alexey
