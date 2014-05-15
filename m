From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 15 May 2014 18:29:45 +0200
Subject: [Buildroot] [PATCH 3/3] packages: make providers declare what
	they provide
In-Reply-To: <20140515094045.148d404e@free-electrons.com>
References: <cover.1400101273.git.yann.morin.1998@free.fr>
 <40eb8c9da48a46856d0acb7576d35d621a9efc9c.1400101273.git.yann.morin.1998@free.fr>
 <20140515094045.148d404e@free-electrons.com>
Message-ID: <20140515162945.GB3463@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-05-15 09:40 +0200, Thomas Petazzoni spake thusly:
> On Wed, 14 May 2014 23:11:35 +0200, Yann E. MORIN wrote:
> >  # DirectFB is not supported (wrong version)
> >  ifeq ($(BR2_PACKAGE_XORG7),y)
> >  GPU_VIV_BIN_MX6Q_DEPENDENCIES = xlib_libXdamage xlib_libXext
> > diff --git a/package/lua/lua.mk b/package/lua/lua.mk
> > index bc8799a..4f940ab 100644
> > --- a/package/lua/lua.mk
> > +++ b/package/lua/lua.mk
> > @@ -14,6 +14,8 @@ LUA_INSTALL_STAGING = YES
> >  LUA_LICENSE = MIT
> >  LUA_LICENSE_FILES = COPYRIGHT
> >  
> > +LUA_PROVIDES = lua
> 
> This should be:
> 
> LUA_PROVIDES = luainterpreter

Obviously, indeed.

> > +LUAJIT_PROVIDES = lua
> 
> Same here.
> 
> I was surprised by "LUA_PROVIDES = lua". How can a real package provide
> itself as a provider for itself as a virtual package ? :-)

Hehe! :-)

I just did test the openGL virtual packages, and forgot to test lua et
al. I'll fix and respin.

Thanks for noticing.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
