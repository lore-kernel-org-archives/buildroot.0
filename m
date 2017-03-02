From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 2 Mar 2017 23:25:19 +0100
Subject: [Buildroot] [PATCH 15/25] luaposix: fix runtime by selecting
 "bit32" instead of "bitop"
In-Reply-To: <20170302225829.6c1d1660@free-electrons.com>
References: <20170223170047.24417-1-arnout@mind.be>
 <20170223170047.24417-16-arnout@mind.be>
 <20170302225829.6c1d1660@free-electrons.com>
Message-ID: <a08c8929-d41e-9b83-ae14-43f999992c48@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 02-03-17 22:58, Thomas Petazzoni wrote:
> Hello,
> 
> On Thu, 23 Feb 2017 18:00:37 +0100, Arnout Vandecappelle
> (Essensium/Mind) wrote:
>> Since the bump of luaposix to 33.4.0, it doesn't work anymore at
>> runtime with LuaJIT or Lua 5.1. This can be tested with the following
>> defconfig:
>>
>> BR2_x86_64=y
>> BR2_TOOLCHAIN_EXTERNAL=y
>> BR2_PACKAGE_LUA=y
>> BR2_PACKAGE_LUA_5_1=y
>> BR2_PACKAGE_LUAPOSIX=y
>>
>> /usr/bin/lua: /usr/share/lua/5.1/posix/init.lua:17: module 'bit32' not found:
>> ...
> 
> This smells like an excellent candidate for a runtime test in the test
> infrastructure, no? :-)

 Since the runtime test infra hasn't been committed yet, I didn't do that :-)

 Regards,
 Arnout

> 
>> In older luaposix versions, it would try to load the 'bit' instead of
>> 'bit32' module if LUAVER == 5.1. However, this feature was removed in
>> 33.4.0.
>>
>> So instead of adding a runtime dependency on luabitop, depend on
>> lua-bit32.
>>
>> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> 
> Applied, thanks!
> 
> Thomas
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
