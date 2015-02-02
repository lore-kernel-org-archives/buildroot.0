From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 02 Feb 2015 16:25:06 +0100
Subject: [Buildroot] [PATCH 3/6] lua: add option 32bits
In-Reply-To: <1421442595-27575-3-git-send-email-francois.perrad@gadz.org>
 (Francois Perrad's message of "Fri, 16 Jan 2015 22:09:52 +0100")
References: <1421442595-27575-1-git-send-email-francois.perrad@gadz.org>
 <1421442595-27575-3-git-send-email-francois.perrad@gadz.org>
Message-ID: <87d25sibe5.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Francois" == Francois Perrad <fperrad@gmail.com> writes:

 > Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
 > ---
 >  package/lua/Config.in      | 9 +++++++++
 >  package/lua/lua.mk         | 8 ++++++++
 >  package/luabitop/Config.in | 4 ++++
 >  3 files changed, 21 insertions(+)

 > diff --git a/package/lua/Config.in b/package/lua/Config.in
 > index dde999f..0f7b136 100644
 > --- a/package/lua/Config.in
 > +++ b/package/lua/Config.in
 > @@ -33,6 +33,15 @@ config BR2_PACKAGE_LUAINTERPRETER_ABI_VERSION
 >  	default "5.2"	if BR2_PACKAGE_LUA_5_2
 >  	default "5.3"	if BR2_PACKAGE_LUA_5_3
 
 > +if BR2_PACKAGE_LUA_5_3
 > +config BR2_PACKAGE_LUA_32BITS
 > +	bool "Lua 32bits"
 > +	default y if !BR2_ARCH_IS_64
 > +	help
 > +	  The option with 32 bits for both integers and floats is particularly
 > +	  attractive for small machines and embedded systems.

I have extended this help text a bit to make it (imho) a bit more clear
what this does and committed the series, thanks!

-- 
Bye, Peter Korsgaard
