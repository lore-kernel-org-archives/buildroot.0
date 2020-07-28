From: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <francois.perrad@gadz.org>
Date: Tue, 28 Jul 2020 11:21:43 +0200
Subject: [Buildroot] [PATCH] package/prosody: fix dependency
In-Reply-To: <20200728092104.5f811f75@windsurf.home>
References: <20200728062141.2969363-1-francois.perrad@gadz.org>
 <20200728092104.5f811f75@windsurf.home>
Message-ID: <CAB0FRsvnTHG4=NhXFHYtO_vkC=B_Fvo-YhmhWqFVg4o97ONStQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le mar. 28 juil. 2020 ? 09:21, Thomas Petazzoni <
thomas.petazzoni@bootlin.com> a ?crit :

> On Tue, 28 Jul 2020 08:21:40 +0200
> Francois Perrad <fperrad@gmail.com> wrote:
>
> > LuaBitOp is not available with Lua 5.3
> >
> > Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> > ---
> >  package/prosody/Config.in | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/package/prosody/Config.in b/package/prosody/Config.in
> > index 4b7ea9425..bb3a5025f 100644
> > --- a/package/prosody/Config.in
> > +++ b/package/prosody/Config.in
> > @@ -3,7 +3,7 @@ config BR2_PACKAGE_PROSODY
> >       depends on BR2_USE_MMU # fork
> >       depends on BR2_PACKAGE_HAS_LUAINTERPRETER
> >       depends on !BR2_STATIC_LIBS # luaexpat, luasec, luasocket,
> luafilesystem
> > -     select BR2_PACKAGE_LUABITOP if !BR2_PACKAGE_LUAJIT # runtime
> > +     select BR2_PACKAGE_LUABITOP if BR2_PACKAGE_LUA_5_1 # runtime
>
> The commit log is probably not very clear. Indeed, if LuaBitOp is not
> available with Lua 5.3, one would think you would need the external
> BR2_PACKAGE_LUABITOP when using something else than 5.1, i.e the
> opposite of what your change is doing.
>
> Shouldn't the commit log rather be:
>
>   The luabitop functionality is available built-in in Lua 5.3 and
>   LuaJIT, so only Lua 5.1 needs the additional external luabitop
>   package.
>
> Could you confirm ?
>

bitwise operators are built-in in Lua 5.3,
LuaBitOp is a built-in library in LuaJIT,
so only Lua 5.1 needs the additional external LuaBitOp package.

Fran?ois


>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200728/968fc8c0/attachment.html>
