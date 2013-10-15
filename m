From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Oct 2013 09:30:03 +0200
Subject: [Buildroot] [PATCH 1/1] trace-cmd: use pkg-config instead of
 python-config
In-Reply-To: <525C72A3.9050008@openwide.fr>
References: <525B1E2E.2040209@openwide.fr> <20131014085803.4c139478@skate>
 <525C72A3.9050008@openwide.fr>
Message-ID: <20131015093003.1e213819@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Romain Naour,

On Tue, 15 Oct 2013 00:39:31 +0200, Romain Naour wrote:

> > No, Python support is optional in trace-cmd. We should keep optional,
> > by doing:
> > 
> > ifeq ($(BR2_PACKAGE_PYTHON),)
> > TRACE_CMD_MAKE_FLAGS += -NO_PYTHON=1
> > else
> > TRACE_CMD_DEPENDENCIES += python
> > endif
> 
> What about python3 ?
> But python 2.7 seems to be good enough.

Enabling it against Python3 would be good indeed.

> > Python dependency should be optional. The pkg-config dependency should
> > be on host-pkg-config.
> 
> host-pkgconf ?

Correct, my bad. It used to be host-pkg-config a while ago, and since
the binary name is still pkg-config, I've never managed to remember the
package name is now pkgconf.

> >   http://patchwork.ozlabs.org/patch/279267/
> >   http://patchwork.ozlabs.org/patch/279265/
> >   http://patchwork.ozlabs.org/patch/279269/
> > 
> 
> I see that, my patch is a workaround and don't fix the real problem.
> But we can decide to not use python-config for cross-compilation.
> 
> May I reuse your patch comments for v2 ?

Of course, please do.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
