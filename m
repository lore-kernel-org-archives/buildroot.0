From: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <francois.perrad@gadz.org>
Date: Mon, 21 Aug 2017 18:42:37 +0200
Subject: [Buildroot] [PATCH] lua: refactor with a common template
	lua.pc.in
In-Reply-To: <20170820141553.0d626cd1@windsurf>
References: <20170820083856.13579-1-francois.perrad@gadz.org>
 <20170820141553.0d626cd1@windsurf>
Message-ID: <CAB0FRsv2PZrHTtcV7ekSfE-RQrfVpKuv4j0XVB5jDQqh55f10A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2017-08-20 14:15 GMT+02:00 Thomas Petazzoni <
thomas.petazzoni@free-electrons.com>:

> Hello,
>
> On Sun, 20 Aug 2017 10:38:56 +0200, Francois Perrad wrote:
>
> > +define LUA_CONFIGURE_CMDS
> > +     sed -e "s/@VERSION@/$(LUA_VERSION)/;s/@ABI@/$(LUAINTERPRETER_
> ABIVER)/;s/@MYLIBS@/$(LUA_MYLIBS)/" \
> > +             package/lua/lua.pc.in > $(@D)/lua.pc
> > +endef
> > +
> > +define HOST_LUA_CONFIGURE_CMDS
> > +     sed -e "s/@VERSION@/$(LUA_VERSION)/;s/@ABI@/$(LUAINTERPRETER_
> ABIVER)/;s/@MYLIBS@/$(HOST_LUA_MYLIBS)/" \
> > +             package/lua/lua.pc.in > $(@D)/lua.pc
> > +endef
>
> I still disagree, and still believe that it should be done as part of
> the <pkg>_BUILD_CMDS step.
>
> Also, could you clarify if you intend this patch to be merged in the
> master branch or in the next branch.
>

It is not a fix, just an improvement of the recent  Jorg Krause's work
which was never released.
That saids master branch could be prefered.

Fran?ois.


>
> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170821/3aa68926/attachment.html>
