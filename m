From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 2 Mar 2017 23:24:31 +0100
Subject: [Buildroot] [PATCH 14/25] lua-bit32: new package
In-Reply-To: <20170302225441.5adee9f6@free-electrons.com>
References: <20170223170047.24417-1-arnout@mind.be>
 <20170223170047.24417-15-arnout@mind.be>
 <20170302225441.5adee9f6@free-electrons.com>
Message-ID: <55bf7d15-ebeb-6bbd-1eaf-c8657c5821fb@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 02-03-17 22:54, Thomas Petazzoni wrote:
> Hello,
> 
> On Thu, 23 Feb 2017 18:00:36 +0100, Arnout Vandecappelle
> (Essensium/Mind) wrote:
>> This package is needed to make luaposix work.
>>
>> The upstream name is just "bit32", but the luarocks infra doesn't
>> support an upstream name different from the Buildroot name. We therefore
>> have to explicitly set all variables and we need custom extract
>> commands.
>>
>> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
>> ---
>>  package/Config.in                |  1 +
>>  package/lua-bit32/Config.in      |  9 +++++++++
>>  package/lua-bit32/lua-bit32.hash |  2 ++
>>  package/lua-bit32/lua-bit32.mk   | 20 ++++++++++++++++++++
> 
> You forgot to add yourself to the DEVELOPERS file, so I did this
> addition.

 Well, like most of my packages it's a one-shot rather than something I actively
use, so I tend not to add myself to the DEVELOPERS file. If you do that, you
could instead just add me for all orphaned packages. Hm, would that be a useful
feature? A last-resort developer?


>> +config BR2_PACKAGE_LUA_BIT32
>> +	bool "lua-bit32"
>> +	depends on BR2_PACKAGE_HAS_LUAINTERPRETER
> 
> This "depends on" is not needed, since lua-bit32/Config.in is anyway
> only included if BR2_PACKAGE_HAS_LUAINTERPRETER=y.

 Oops, I just copied it from a BR2_EXTERNAL :-)


 Regards,
 Arnout


> I've fixed up those two issues and applied to master. Thanks!
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
