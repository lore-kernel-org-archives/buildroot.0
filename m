From: Ed Blake <ed.blake@sondrel.com>
Date: Wed, 27 Mar 2019 18:51:40 +0000
Subject: [Buildroot] [PATCH v2 0/4] toolchain-external: add OpenMP
 support
In-Reply-To: <20190326202222.0dbc0711@windsurf>
References: <20190326123032.9905-1-ed.blake@sondrel.com>
 <20190326202222.0dbc0711@windsurf>
Message-ID: <20190327185129.10dee1f5@blake-linux>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 26 Mar 2019 20:22:22 +0100
Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> Hello Ed,
> 
> On Tue, 26 Mar 2019 12:30:44 +0000
> Ed Blake <ed.blake@sondrel.com> wrote:
> 
> > Ed Blake (4):
> >   toolchain-external: introduce BR2_TOOLCHAIN_HAS_OPENMP
> >   package/gcc: select BR2_TOOLCHAIN_HAS_OPENMP if BR2_GCC_ENABLE_OPENMP
> >   toolchain-external: enable OpenMP for supporting toolchains
> >   package: use BR2_TOOLCHAIN_HAS_OPENMP  
> 
> Thanks, I've applied all four patches.
> 
> However, it would be good if you could send additional patches that:
> 
>  (1) Allows a custom external toolchain to specify that it supports
>      OpenMP. This needs to be done in
>      toolchain/toolchain-external/toolchain-external-custom/Config.in.options
> 
>  (2) Adds a check to the external toolchain logic to ensure that if
>      BR2_TOOLCHAIN_HAS_OPENMP is enabled, the toolchain really supports
>      it. This should be done in the $(2)_CONFIGURE_CMDS variable in
>      pkg-toolchain-external.mk. You can for example write a check
>      similar to check_fortran (see helpers.mk) that tries to compile a
>      simple OpenMP program.
> 
> Do you think you could work on this ?

Sure, will do.

Ed.

> 
> Thanks!
> 
> Thomas
