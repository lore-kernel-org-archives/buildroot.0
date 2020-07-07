From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 7 Jul 2020 15:38:50 -0600
Subject: [Buildroot] [PATCH v2 1/1] package/python-greenlet: fix build
 for i386 and x86_64 archs
In-Reply-To: <20200707205229.GW2273@scaer>
References: <20200707200431.181733-1-james.hilliard1@gmail.com>
 <20200707205229.GW2273@scaer>
Message-ID: <CADvTj4q_8yXtYUay7f26TxEhGDB_hEQ-b2gQJer-1uHhhMVVog@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Jul 7, 2020 at 2:52 PM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>
> On 2020-07-07 14:04 -0600, James Hilliard spake thusly:
> > BR2_x86 doesn't exist in buildroot which should be BR2_i386.
> >
> > BR2_x86_64 was missed in 30f1decec2ca190deea072f4d490a8de830ac9a3.
>
> So, these are twi different changes:
>
>   - the first is a fix, and should be its own patch, so it can be
>     backported to the latest stable branch, 2020.05.x
We should backport both.
>
>   - the second is a new feature, enabling a new arch, so should be a
>     second, separate patch.
It's kinda a bugfix since it should have always been enabled, I think
the intention
might have been for the BR2_x86 option to have enabled both.
>
> As a consequence, the commit log is misleading: we're not "fixing" build
> for x86_64; instead, we're enabling it. And in all theory, wer're not
> "fixing" the build for i386 either, because the build is not really
> broken as there actually is no build going on...
>
> I've split them, fixed commit logs, and applied to master, thanks
>
> Regards,
> Yann E. MORIN.
>
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > ---
> > Changes v1 -> v2:
> >   - also fix BR2_i386
> > ---
> >  package/python-greenlet/Config.in | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/package/python-greenlet/Config.in b/package/python-greenlet/Config.in
> > index 44ab96b488..c73eeb7b15 100644
> > --- a/package/python-greenlet/Config.in
> > +++ b/package/python-greenlet/Config.in
> > @@ -8,7 +8,7 @@ config BR2_PACKAGE_PYTHON_GREENLET_ARCH_SUPPORTS
> >       default y if BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le
> >       default y if BR2_riscv
> >       default y if BR2_sparc || BR2_sparc64
> > -     default y if BR2_x86
> > +     default y if BR2_i386 || BR2_x86_64
> >
> >  config BR2_PACKAGE_PYTHON_GREENLET
> >       bool "python-greenlet"
> > --
> > 2.25.1
> >
> > _______________________________________________
> > buildroot mailing list
> > buildroot at busybox.net
> > http://lists.busybox.net/mailman/listinfo/buildroot
>
> --
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'
