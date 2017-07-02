From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 2 Jul 2017 23:51:27 +0200
Subject: [Buildroot] [PATCH 3/4] toolchain-external: copy ld*.so* for
 all C libraries
In-Reply-To: <CAAXf6LW0KBCQnS-oVUzPLtY9S1CpNou9e+0JmZudu+vy0DjrNg@mail.gmail.com>
References: <20170702134107.11488-1-thomas.petazzoni@free-electrons.com>
 <20170702134107.11488-4-thomas.petazzoni@free-electrons.com>
 <CAAXf6LW0KBCQnS-oVUzPLtY9S1CpNou9e+0JmZudu+vy0DjrNg@mail.gmail.com>
Message-ID: <20170702235127.14b7ca48@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 2 Jul 2017 21:21:46 +0200, Thomas De Schampheleire wrote:

> > diff --git a/toolchain/toolchain-external/pkg-toolchain-external.mk b/toolchain/toolchain-external/pkg-toolchain-external.mk
> > index 8460e37..c1c3900 100644
> > --- a/toolchain/toolchain-external/pkg-toolchain-external.mk
> > +++ b/toolchain/toolchain-external/pkg-toolchain-external.mk
> > @@ -107,13 +107,11 @@ endif
> >  #
> >  # Definitions of the list of libraries that should be copied to the target.
> >  #
> > +
> > +TOOLCHAIN_EXTERNAL_LIBS += ld*.so*  
> 
> In copy_toolchain_sysroot, the patterns ld*.so and ld*.so.* are
> treated separately. I think the only reason must be to avoid matching
> ld*.something (I can't think of another reason at this moment).
> Perhaps that is too far-fetched, and copy_toolchain_sysroot should be
> updated, but in any case it makes sense to line up.

I think it's a separate issue, because we're already using ld*.so*
today in pkg-toolchain-external.mk for TOOLCHAIN_EXTERNAL_LIBS, I'm
just moving it around.

However, I agree we should probably line up things. In which direction
do you think we should line up? I guess using ld*.so* in
copy_toolchain_sysroot should be fine.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
