From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 30 Jan 2017 13:34:13 +0100
Subject: [Buildroot] [PATCH] lua: bump to version 5.3.4
In-Reply-To: <20170130110327.5103-1-francois.perrad@gadz.org> (Francois
 Perrad's message of "Mon, 30 Jan 2017 12:03:27 +0100")
References: <20170130110327.5103-1-francois.perrad@gadz.org>
Message-ID: <87bmuoafqy.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Francois" == Francois Perrad <fperrad@gmail.com> writes:

 > Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

>  ifeq ($(BR2_PACKAGE_LUA_5_3),y)
 > -LUA_VERSION = 5.3.3
 > +LUA_VERSION = 5.3.4
 >  else
 >  ifeq ($(BR2_PACKAGE_LUA_5_2),y)
 >  LUA_VERSION = 5.2.4
 > @@ -56,6 +56,7 @@ endif
 
 >  ifeq ($(BR2_PACKAGE_LUA_32BITS),y)
 >  define LUA_32BITS_LUACONF
 > +	@$(call MESSAGE,"Patching src/luaconf.h")
 >  	$(SED) 's/\/\* #define LUA_32BITS \*\//#define LUA_32BITS/' $(@D)/src/luaconf.h
 >  endef

So far no other packages add custom MESSAGE calls, so unless there's a
strong reason to display this I would prefer not to.

Committed with the MESSAGE line dropped, thanks.

-- 
Bye, Peter Korsgaard
