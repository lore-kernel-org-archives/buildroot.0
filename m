From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 22 Dec 2013 21:45:10 +0100
Subject: [Buildroot] [pkg-luarocks infra V4 05/10] luarocks: new package
In-Reply-To: <20131222182858.1709cbc3@skate>
References: <1384520859-3189-1-git-send-email-francois.perrad@gadz.org>
 <1384520859-3189-5-git-send-email-francois.perrad@gadz.org>
 <20131222182858.1709cbc3@skate>
Message-ID: <20131222204510.GC27858@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Francois, All,

On 2013-12-22 18:28 +0100, Thomas Petazzoni spake thusly:
> On Fri, 15 Nov 2013 14:07:34 +0100, Francois Perrad wrote:
> > 
> > Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> > ---
> >  package/luarocks/luarocks-build-minimal.patch |   17 ++++++++++
> >  package/luarocks/luarocks-unpack.patch        |   24 ++++++++++++++
> 
> We want patches to be numbered:
> 
>  luarocks-001-<foo>.patch
>  luarocks-002-<bar>.patch

Done.

[--SNIP--]
> > diff --git a/package/luarocks/luarocks.mk b/package/luarocks/luarocks.mk
> > new file mode 100644
> > index 0000000..d996ccc
> > --- /dev/null
> > +++ b/package/luarocks/luarocks.mk
> > @@ -0,0 +1,42 @@
> > +################################################################################
> > +#
> > +# luarocks
> > +#
> > +################################################################################
> > +
> > +LUAROCKS_VERSION = 2.1.1
> > +LUAROCKS_SITE = http://luarocks.org/releases/
> > +LUAROCKS_LICENSE = MIT
> > +LUAROCKS_LICENSE_FILES = COPYING
> > +
> > +HOST_LUAROCKS_DEPENDENCIES = host-lua luainterpreter
> > +
> > +LUAROCKS_CONFIG_DIR  = $(HOST_DIR)/usr/etc/luarocks
> > +LUAROCKS_CONFIG_FILE = $(LUAROCKS_CONFIG_DIR)/config-5.1.lua
> > +
> > +define HOST_LUAROCKS_CONFIGURE_CMDS
> > +	cd $(@D) && ./configure \
> > +		--prefix=$(TARGET_DIR)/usr \
> > +		--sysconfdir=$(LUAROCKS_CONFIG_DIR) \
> > +		--with-lua=$(HOST_DIR)/usr \
> > +		--with-lua-include=$(STAGING_DIR)/usr/include \
> > +		--with-lua-lib=$(STAGING_DIR)/usr/lib
> > +	@echo "$(@D)/config.unix generated"
> 
> This echo is probably not needed.

Done.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
