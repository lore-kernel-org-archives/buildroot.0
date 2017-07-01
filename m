From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 2 Jul 2017 00:40:47 +0200
Subject: [Buildroot] [PATCH 1/2] toolchain-external: skip ld-musl
 symlink on static build
In-Reply-To: <da672995-8d97-3657-627d-65b30e71a828@mind.be>
References: <3d0e4832c2a187a5bd63ac094c11e2b237661cd5.1498586236.git.baruch@tkos.co.il>
 <da672995-8d97-3657-627d-65b30e71a828@mind.be>
Message-ID: <20170702004047.41f2d626@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 27 Jun 2017 23:41:44 +0200, Arnout Vandecappelle wrote:

> > diff --git a/toolchain/toolchain-external/pkg-toolchain-external.mk b/toolchain/toolchain-external/pkg-toolchain-external.mk
> > index 826934505e20..8460e37d095f 100644
> > --- a/toolchain/toolchain-external/pkg-toolchain-external.mk
> > +++ b/toolchain/toolchain-external/pkg-toolchain-external.mk
> > @@ -475,7 +475,7 @@ endef
> >  # With the musl C library, the libc.so library directly plays the role
> >  # of the dynamic library loader. We just need to create a symbolic
> >  # link to libc.so with the appropriate name.
> > -ifeq ($(BR2_TOOLCHAIN_EXTERNAL_MUSL),y)
> > +ifeq ($(BR2_TOOLCHAIN_EXTERNAL_MUSL):$(BR2_STATIC_LIBS),y:)  
> 
>  This patch conflicts with [1]. Could you combine them in a single series?
> Otherwise looks good to me, but it really should be viewed combined with [1].

I've applied Baruch patch, and I'll rebased mine on top.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
