From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 28 Jul 2020 13:48:47 +0200
Subject: [Buildroot] [PATCH 1/1] package/minetest: don't depend on luajit
In-Reply-To: <CADvTj4q1DeWEpAcpkOsg9GA_dhzogRFV00sMd6YrdzpVMqU0pA@mail.gmail.com>
References: <20200727205621.2556101-1-james.hilliard1@gmail.com>
 <20200728090907.4f093194@windsurf.home>
 <CADvTj4q1DeWEpAcpkOsg9GA_dhzogRFV00sMd6YrdzpVMqU0pA@mail.gmail.com>
Message-ID: <20200728134847.5f7e7401@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 28 Jul 2020 04:17:26 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> On Tue, Jul 28, 2020 at 1:09 AM Thomas Petazzoni
> <thomas.petazzoni@bootlin.com> wrote:
> >
> > On Mon, 27 Jul 2020 14:56:21 -0600
> > James Hilliard <james.hilliard1@gmail.com> wrote:
> >  
> > > Since minetest has a fallback to a bundled lua when luajit is not
> > > available we don't need to depend on luajit or any lua version at all.  
> >
> > In general, I think we try to not use bundled libraries even when they
> > exist. If minetest needs a Lua interpreter, it should always use an
> > external Lua interpreter, I believe.  
> From my understanding luajit is the only supported external lua
> interpreter for minetest. So I think it makes sense to not require
> a specific lua interpreter for flexibility.

I don't understand your reply, as I was not talking about using other
Lua interpreters.

What I'm saying is that if minetest has a mandatory dependency on
LuaJIT, then it should *always* use the external LuaJIT and never use
the bundled one. We prefer external libraries over bundled libraries in
general in the context of Buildroot.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
