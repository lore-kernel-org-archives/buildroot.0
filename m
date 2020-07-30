From: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <francois.perrad@gadz.org>
Date: Thu, 30 Jul 2020 19:27:49 +0200
Subject: [Buildroot] [PATCH v3 07/10] package/lua-flu: temporarily
 disabled with Lua 5.4
In-Reply-To: <CADvTj4p7apz6+Fua8QQnBDFBPDenj3Y_qNrJFcJ4wZSnsAR1aw@mail.gmail.com>
References: <20200728132147.3155274-1-francois.perrad@gadz.org>
 <20200728132147.3155274-8-francois.perrad@gadz.org>
 <CADvTj4p7apz6+Fua8QQnBDFBPDenj3Y_qNrJFcJ4wZSnsAR1aw@mail.gmail.com>
Message-ID: <CAB0FRsvuC5P83KNF1DNRQOgPqhi+QmfUobyv6CyjZkS4MawhBg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le mer. 29 juil. 2020 ? 21:37, James Hilliard <james.hilliard1@gmail.com> a
?crit :

> On Wed, Jul 29, 2020 at 12:35 PM Francois Perrad <fperrad@gmail.com>
> wrote:
> >
> > Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> > ---
> >  package/lua-flu/Config.in | 5 +++--
> >  1 file changed, 3 insertions(+), 2 deletions(-)
> >
> > diff --git a/package/lua-flu/Config.in b/package/lua-flu/Config.in
> > index 526dc9008..9b55ce5ab 100644
> > --- a/package/lua-flu/Config.in
> > +++ b/package/lua-flu/Config.in
> > @@ -3,6 +3,7 @@ config BR2_PACKAGE_LUA_FLU
> >         depends on !BR2_STATIC_LIBS # libfuse
> >         depends on BR2_TOOLCHAIN_HAS_THREADS # libfuse
> >         depends on BR2_USE_MMU # libfuse
> > +       depends on !BR2_PACKAGE_LUA_5_4
> I think these should probably be for consistency:
> depends on !BR2_PACKAGE_LUAINTERPRETER_ABI_VERSION_5_4
>

for me, only BR2_PACKAGE_LUAINTERPRETER_ABI_VERSION_5_1 makes sense,
because it is a shortcut for BR2_PACKAGE_LUA_5_1 || BR2_PACKAGE_LUAJIT.

Fran?ois


> >         select BR2_PACKAGE_ATTR
> >         select BR2_PACKAGE_LIBFUSE
> >         help
> > @@ -13,6 +14,6 @@ config BR2_PACKAGE_LUA_FLU
> >
> >           http://piratery.net/flu/
> >
> > -comment "lua-flu needs a toolchain w/ threads, dynamic library"
> > +comment "lua-flu needs a toolchain w/ threads, dynamic library, Lua <=
> 5.3"
> >         depends on BR2_USE_MMU
> > -       depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
> > +       depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS ||
> BR2_PACKAGE_LUA_5_4
> > --
> > 2.25.1
> >
> > _______________________________________________
> > buildroot mailing list
> > buildroot at busybox.net
> > http://lists.busybox.net/mailman/listinfo/buildroot
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200730/85157557/attachment.html>
