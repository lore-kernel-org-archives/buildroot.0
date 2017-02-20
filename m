From: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <francois.perrad@gadz.org>
Date: Mon, 20 Feb 2017 17:18:42 +0100
Subject: [Buildroot] luaposix not working with luajit/lua5.1
In-Reply-To: <97696395-f4b0-a39a-7b6d-ba5aa68105c2@mind.be>
References: <257db515-cfda-4122-55e9-b7783b28dfcf@mind.be>
 <CAB0FRsvL0pR974ur0v9b5R=wphQSJStxfJ6YkiECVX4DLoAkdg@mail.gmail.com>
 <270d2a5f-178d-9937-988c-01791cb15dba@mind.be>
 <CAB0FRsvqj=1EQrHKH2Zzn8DLtCbF3q+8_WvcUJxrwLuN-QBE1w@mail.gmail.com>
 <97696395-f4b0-a39a-7b6d-ba5aa68105c2@mind.be>
Message-ID: <CAB0FRsuWEZm4BETMoCWjO5SUEDVjPyGWL_Rt5gfzhjMw0+SNPA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2017-02-20 16:33 GMT+01:00 Arnout Vandecappelle <arnout@mind.be>:
>
>
> On 20-02-17 12:01, Fran?ois Perrad wrote:
>> 2017-02-20 11:47 GMT+01:00 Arnout Vandecappelle <arnout@mind.be>:
> [snip]
>>>  Integrating this package is not trivial, because our luarocks infra assumes
>>> that the upstream name is the same as the Buildroot name. That's not the case
>>> for bit32, however: in Buildroot, we really want to call it "lua-bit32". So it
>>> requires a bit of infra change to clean it up. Therefore, it'll take me a couple
>>> of days before I can submit.
>>>
>>
>> We have already luarock packages which name is not prefixed by 'lua-'
>> : copas, cosmo, dado, orbit, rings, ...
>
>  These are really separate projects that happen to be using Lua, while bit32 is
> really a Lua support module like luaposix.
>
>  Although, now you mention it, copas and coxpcall are Lua support modules as
> well. For Python and Perl, we always add a prefix for them. Is there a good
> reason why we don't do this for Lua?
>

History in BR:
- lua was added in 2007
- xavante and its dependencies (cgilua, copas, coxpcall,
luafilesystem, luasocket, wsapi) were added in 2010 as first Lua
modules
- luarocks infrastructure was added in 2014
- currently, we have 34 Lua modules (see
https://git.busybox.net/buildroot/tree/package/Config.in#n524)

The Lua ecosystem has no strict naming convention, you could use:
  - foo
  - luafoo
  - lua-foo
  - lfoo
  - ljfoo (LuaJIT only)
See the whole at https://luarocks.org/modules

Fran?ois

>  Peter (and others), any opinion: should a module like coxpcall rather be called
> lua-coxpcall? We actually have a lot of those. Things like "argparse"...
>
>  Regards,
>  Arnout
>
> --
> Arnout Vandecappelle                          arnout at mind be
> Senior Embedded Software Architect            +32-16-286500
> Essensium/Mind                                http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
