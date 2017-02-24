From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 24 Feb 2017 09:25:49 +0100
Subject: [Buildroot] [RFC PATCH 1/2] package/gobject-introspection: add
 package
In-Reply-To: <20170224040713.GA4446@tungsten.ozlabs.ibm.com>
References: <cover.1487811280.git.sam.bobroff@au1.ibm.com>
 <b5cbc35d4d8e4457563fdf5b8dfd04360c6616a5.1487811280.git.sam.bobroff@au1.ibm.com>
 <20170223101820.127d5700@free-electrons.com>
 <20170224040713.GA4446@tungsten.ozlabs.ibm.com>
Message-ID: <20170224092549.2c560db3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 24 Feb 2017 15:07:13 +1100, Sam Bobroff wrote:

> Yes, absolutely, and I really don't know how we should handle it. I
> searched fairly hard for another solution but the only other one seems
> to be to rewrite gobject-introspection completely and the other
> projects that have attempted this have used the same host-qemu approach
> (that's yocto and cygwin).

Can you summarize what is Qemu used for in the context of building
gobject-introspection ?

If it's to generate some architecture-specific file, can we
pre-generate it, and bundle it with Buildroot ?

> Would a comment in the menuconfig section for gobject-introspection be
> any better? It's more likely to be seen but it's not really the "right"
> place -- you can run into the kernel version issue with QEMU usermode
> without using gobject-introspection (although not during the build!).
> 
> But more generally, should buildroot accept this kind of solution at
> all? It works and is useful but it significantly more complex and
> therefore problem-prone than normal...

I'd really like to avoid a qemu-based solution if possible. But of
course, if there's really no other option and people want
gobject-introspection, we won't have much choice :/

> > Please use <pkg>_AUTORECONF = YES. What you did is not correct because
> > you will use autoconf/automake from the host machine instead of ones
> > built by Buildroot.  
> 
> Ah, good point but AUTORECONF fails, or as least it did. I'll
> re-investigate and see if I can get it working.

OK. Depending on what their autogen script is doing, you might be able
to fix it by using some kind of POST_PATCH_HOOKS. It really depends on
what the actual issue is.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
