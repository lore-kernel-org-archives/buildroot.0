From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 27 Jul 2020 15:12:12 -0600
Subject: [Buildroot] [PATCH v3 9/9] package/luajit: depend on
 !BR2_PACKAGE_LUA
In-Reply-To: <20200727203747.GN19818@scaer>
References: <20200525004845.3019642-1-james.hilliard1@gmail.com>
 <20200525004845.3019642-9-james.hilliard1@gmail.com>
 <20200727203747.GN19818@scaer>
Message-ID: <CADvTj4q-Ex4nsAj4TNOH5bihOwZ+3Lc8Ry_KabuH7+iueNu_+g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Jul 27, 2020 at 2:38 PM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>
> James, All,
>
> On 2020-05-24 18:48 -0600, James Hilliard spake thusly:
> > The luajit package is incomaptible with lua so luajit should depend on
> > !BR2_PACKAGE_LUA
>
> This is not needed. lua and luajit are two provider for the
> luainterpreter package, so the infra already checks for the conditions
> where two or more providers are enabled.
Without this I am able to select lua and luajit at the same time which shouldn't
be a valid config from my understanding.
>
> So, I've dropped this patch in my respin:
>
>     http://lists.busybox.net/pipermail/buildroot/2020-July/288204.html
>
> Regards,
> Yann E. MORIN.
>
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > ---
> > Changes v2 -> v3:
> >   - always depend on lua/luaposix from packages instead of selecting
> > Changes v1 -> v2:
> >   - depend on !BR2_PACKAGE_LUA_5_3 instead of !BR2_PACKAGE_LUA for solarus
> > ---
> >  package/luajit/Config.in | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/package/luajit/Config.in b/package/luajit/Config.in
> > index 8cfa85684e..33a460772f 100644
> > --- a/package/luajit/Config.in
> > +++ b/package/luajit/Config.in
> > @@ -11,6 +11,7 @@ config BR2_PACKAGE_LUAJIT_ARCH_SUPPORTS
> >
> >  config BR2_PACKAGE_LUAJIT
> >       bool "luajit"
> > +     depends on !BR2_PACKAGE_LUA
> >       depends on !BR2_STATIC_LIBS # dlopen
> >       # Luajit is only available for some target architectures, and
> >       # has some complexity wrt 32/64. See luajit.mk for details.
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
