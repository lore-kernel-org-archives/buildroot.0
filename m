From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 25 May 2020 02:05:01 -0600
Subject: [Buildroot] [PATCH v3 3/9] package/collectd: depend on
 luainterpreter for lua support
In-Reply-To: <20200525091050.26175643@windsurf.home>
References: <20200525004845.3019642-1-james.hilliard1@gmail.com>
 <20200525004845.3019642-3-james.hilliard1@gmail.com>
 <20200525091050.26175643@windsurf.home>
Message-ID: <CADvTj4q7L+9ztSdLDJKmDDEN=FpvmCJpWAsr1iLVDt11Aqeusg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, May 25, 2020 at 1:10 AM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> On Sun, 24 May 2020 18:48:39 -0600
> James Hilliard <james.hilliard1@gmail.com> wrote:
>
> >  config BR2_PACKAGE_COLLECTD_LUA
> >       bool "lua"
> > -     select BR2_PACKAGE_LUA
> > +     depends on BR2_PACKAGE_HAS_LUAINTERPRETER
> >       help
> >         Embeds a Lua interpreter into collectd and provides an
> >         interface to collectd's plugin system.
> >
> > +comment "lua needs a Lua interpreter"
> > +     depends on !BR2_PACKAGE_HAS_LUAINTERPRETER
>
> I believe this comment is not needed, it is obvious a Lua interpreter
> is needed for Lua support.
I had that there so that it was clear that collectd has a lua option
when there is not
lua interpreter selected.
>
> > -     $(if $(BR2_PACKAGE_COLLECTD_LUA),lua) \
> > +     $(if $(BR2_PACKAGE_COLLECTD_LUA),$(if $(BR2_PACKAGE_LUA),lua,luajit)) \
>
> Use the luainterpreter virtual package as a dependency here.
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
