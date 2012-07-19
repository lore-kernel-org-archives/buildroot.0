From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 19 Jul 2012 15:03:10 +0200
Subject: [Buildroot] [PATCH 1/4] add host arch detection and Kconfig
 BR2_HOSTARCH
In-Reply-To: <CAB0FRsuN7f=0PehFg9XvythsfJh9oCwPcikz8Dtmig=LnDWQEQ@mail.gmail.com>
References: <1342619953-15512-1-git-send-email-francois.perrad@gadz.org>
 <20120718193750.2020db34@skate>
 <CAB0FRsuN7f=0PehFg9XvythsfJh9oCwPcikz8Dtmig=LnDWQEQ@mail.gmail.com>
Message-ID: <20120719150310.294327e5@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Thu, 19 Jul 2012 14:48:52 +0200,
Fran?ois Perrad <francois.perrad@gadz.org> a ?crit :

> > Could you however work on something that ensures that the
> > BR2_PACKAGE_LUA option, when enabled, actually installs something?
> > Maybe the BR2_PACKAGE_LUA_SHARED_LIBRARY option needs to be removed,
> > and just enabling BR2_PACKAGE_LUA should unconditionally install the
> > shared library. Sub-options could be used to selectively install the
> > interpreter and/or the compiler. Do you think it makes sense?
> 
> have you reconsidered this outdated patch
> http://article.gmane.org/gmane.comp.lib.uclibc.buildroot/43210 ?

I maintain the comment I'm making above: I think the
BR2_PACKAGE_LUA_SHARED_LIBRARY option should completely be removed. So
with this in mind, the patch you're pointing to doesn't make sense.

> > Another thing that would be great is probably to rename all Lua modules
> > to lua<something>, like luaexpat and luacjson. Do you think it is
> > possible? The only drawback is probably that the package name would no
> > longer match the upstream project name, but it would make Lua modules
> > much easier to identify in the list of packages in package/.
> >
> 
> Lua modules use one of following schemes :
>     foo, Foo, lfoo, LFoo, luafoo, LuaFoo, lua-foo, lua-Foo, Lua-Foo,
> foo-lua, foo-lua, foolua, FooLua
> See real world examples in these 2 Lua package managers :
>  - LuaRocks : http://luarocks.org/repositories/rocks/
>  - LuaDist : https://github.com/LuaDist/Repository
> 
> Native binding are compatible Lua/LuaJIT, but the recent LuaJIT FFI
> allows to write libraries binding in pure Lua.
> So, there are too http://wiki.luajit.org/FFI-Bindings, with more schemes.
> 
> my first choice is to move all Lua modules in a directory
> 'lua-modules' (and for future use, a directory 'luajit-ffi').
> you already tell me that it is not the BR policy.
> I agree that the directory 'multimedia' is a bad thing.
> I think that it is a good way for framework like 'efl', 'x11r7'.
> So, I think that it is the good way for interpreted languages like lua
> when there are a lot of modules.
> (see in attachment a Perl script which does the move,
> I write it for this old ticket https://bugs.busybox.net/show_bug.cgi?id=2419)

Yes, I know Peter wanted to have all the packages at the top-level. I
was skeptical with this choice at the beginning, but now I find it more
and more useful. Try to find a package in OpenEmbedded for example:
they are organized in sub-directories, and it's really a pain to find
where your package is. Even in the menuconfig these days, I often have
to use the search engine to find certain packages for which the
category isn't obvious (example: 'gettext' in 'Development tools').

As I'm only an interim maintainer, I don't want to bypass Peter on this
decision. Also, what is the opinion of the other members of the
community?

> my second choice is to use the upstream name, like now.
> a Lua user could see the list of modules with [menu|g|k]config
> or in a well identified section of package/Config.in.

Yes. It is also not so bad.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
