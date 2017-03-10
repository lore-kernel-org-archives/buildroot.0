From: Peter Seiderer <ps.report@gmx.net>
Date: Fri, 10 Mar 2017 20:31:59 +0100
Subject: [Buildroot] [PATCH v1] libxkbcommon: add support for
 interactive-wayland test program
In-Reply-To: <20170309221850.3a6ab20c@free-electrons.com>
References: <20170308215310.12819-1-ps.report@gmx.net>
 <20170309221850.3a6ab20c@free-electrons.com>
Message-ID: <20170310203159.2c462296@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

On Thu, 9 Mar 2017 22:18:50 +0100, Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:

> Hello,
> 
> On Wed,  8 Mar 2017 22:53:10 +0100, Peter Seiderer wrote:
> 
> > +if BR2_PACKAGE_LIBXKBCOMMON && BR2_PACKAGE_WAYLAND
> > +
> > +config BR2_PACKAGE_LIBXKBCOMMON_INTERACTIVE_WAYLAND
> > +	bool "interactive-wayland"
> > +	select BR2_PACKAGE_WAYLAND_PROTOCOLS
> > +	help
> > +	  interactive-wayland is a wayland test application
> > +	  for libxkbcommon.
> > +
> > +endif
> 
> This looks like a very very specific option. Shouldn't this be instead
> BR2_PACKAGE_LIBXKBCOMMON_INSTALL_TESTS ?

It is specific, did not find a target to build all tests (see below)...

> 
> > +define LIBXKBCOMMON_BUILD_INTERACTIVE_WAYLAND
> > +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) test/interactive-wayland
> > +endef
> > +LIBXKBCOMMON_POST_BUILD_HOOKS = LIBXKBCOMMON_BUILD_INTERACTIVE_WAYLAND
> 
> There's already some logic in the build system to build tests. Can't we
> use it instead?

'make test' does nothing, 'make check' builds the tests AND tries (and fails)
to run the test programs...

Regards,
Peter

> 
> Thanks,
> 
> Thomas
