From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 15 Jul 2019 21:57:31 +0200
Subject: [Buildroot] [PATCH 2/2] package/gcc: drop negative conditions
 on C-SKY for older versions
In-Reply-To: <CAJF2gTR7EBMiTsBVbkt1ZC86MXKs_40zZF2wbFUq80fhYHJkdQ@mail.gmail.com>
References: <cover.1563098054.git.yann.morin.1998@free.fr>
 <52aa7c5a90e87a0e8a0e794487b61d3d4759d301.1563098054.git.yann.morin.1998@free.fr>
 <CAJF2gTR7EBMiTsBVbkt1ZC86MXKs_40zZF2wbFUq80fhYHJkdQ@mail.gmail.com>
Message-ID: <20190715195731.GN29941@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Guo, All,

On 2019-07-15 23:52 +0800, Guo Ren spake thusly:
> Acked, Thx.

Thanks for the review. :-)

Next time, can you please send a proper "Acked-by:" tag, so that
patchwwork can pick it up, and thus it ends up in the commit when
the patch is eventually applied? Thanks!

Regards,
Yann E. MORIN.

> On Sun, Jul 14, 2019 at 5:54 PM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> >
> > Now that the C-SKY architecture requires gcc-9, we can drop the special
> > conditions on the individual older versions.
> >
> > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> > Cc: Guo Ren <guoren@kernel.org>
> > Cc: Arnout Vandecappelle <arnout@mind.be>
> > Cc: Romain Naour <romain.naour@gmail.com>
> > ---
> >  package/gcc/Config.in.host | 5 -----
> >  1 file changed, 5 deletions(-)
> >
> > diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
> > index adc12e95ea..a3ba7cf90d 100644
> > --- a/package/gcc/Config.in.host
> > +++ b/package/gcc/Config.in.host
> > @@ -32,7 +32,6 @@ config BR2_GCC_VERSION_4_9_X
> >         depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_5
> >         # Broken or unsupported architectures
> >         depends on !BR2_arc
> > -       depends on !BR2_csky
> >         depends on !BR2_or1k
> >         # musl on microblaze, ppc64 and mips64 unsupported
> >         depends on !(BR2_TOOLCHAIN_USES_MUSL && (BR2_microblazeel || BR2_microblazebe))
> > @@ -47,7 +46,6 @@ config BR2_GCC_VERSION_5_X
> >         depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_6
> >         # Broken or unsupported architectures
> >         depends on !BR2_arc
> > -       depends on !BR2_csky
> >         depends on !BR2_or1k
> >         # musl on ppc64 and mips64 unsupported
> >         depends on !(BR2_TOOLCHAIN_USES_MUSL && (BR2_powerpc64 || BR2_powerpc64le))
> > @@ -61,7 +59,6 @@ config BR2_GCC_VERSION_6_X
> >         depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_7
> >         # Broken or unsupported architectures
> >         depends on !BR2_arc
> > -       depends on !BR2_csky
> >         depends on !BR2_or1k
> >         select BR2_TOOLCHAIN_GCC_AT_LEAST_6
> >
> > @@ -69,7 +66,6 @@ config BR2_GCC_VERSION_7_X
> >         bool "gcc 7.x"
> >         depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_8
> >         # Broken or unsupported architectures
> > -       depends on !BR2_csky
> >         depends on !BR2_or1k
> >         select BR2_TOOLCHAIN_GCC_AT_LEAST_7
> >
> > @@ -77,7 +73,6 @@ config BR2_GCC_VERSION_8_X
> >         bool "gcc 8.x"
> >         depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_9
> >         # Broken or unsupported architectures
> > -       depends on !BR2_csky
> >         depends on !BR2_or1k
> >         # powerpc spe support has been deprecated since gcc 8.x.
> >         # https://gcc.gnu.org/ml/gcc/2018-04/msg00102.html
> > --
> > 2.20.1
> >
> 
> 
> -- 
> Best Regards
>  Guo Ren
> 
> ML: https://lore.kernel.org/linux-csky/

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
