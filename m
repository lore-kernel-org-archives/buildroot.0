From: =?ISO-8859-1?Q?Fran=E7ois_Perrad?= <francois.perrad@gadz.org>
Date: Fri, 17 Jan 2014 18:46:52 +0100
Subject: [Buildroot] [V2 2/3] lua-modules: choice between Lua 5.1.x &
	Lua 5.2.x
In-Reply-To: <52D819FE.3050801@mind.be>
References: <1389815674-14759-1-git-send-email-francois.perrad@gadz.org>
 <1389815674-14759-2-git-send-email-francois.perrad@gadz.org>
 <52D819FE.3050801@mind.be>
Message-ID: <CAB0FRsu7GQGVtp7hg0uvGxqJWD_Kf0ndpPDo51g39cC+ix1KeQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2014/1/16 Arnout Vandecappelle <arnout@mind.be>:
> On 15/01/14 20:54, Francois Perrad wrote:
> [snip]
>
>> diff --git a/package/luaexpat/Config.in b/package/luaexpat/Config.in
>> index f8db318..f1bd15d 100644
>> --- a/package/luaexpat/Config.in
>> +++ b/package/luaexpat/Config.in
>> @@ -2,7 +2,11 @@ config BR2_PACKAGE_LUAEXPAT
>>         bool "luaexpat"
>>         select BR2_PACKAGE_EXPAT
>>         depends on BR2_PACKAGE_HAS_LUA_INTERPRETER
>> +       depends on !BR2_PACKAGE_LUA_5_2
>>         help
>>           LuaExpat is a SAX XML parser based on the Expat library.
>>
>>         http://matthewwild.co.uk/projects/luaexpat/
>> +
>> +comment "LuaExpat needs a Lua 5.1 interpreter"
>
>
>  Capitalization should be the same as in the normal config symbol, i.e.
> luaexpat instead of LuaExpat.

Ok.

Fran?ois

>
>  Personally I would be in favour of changing our coding style to use the
> upstream capitalization for the user-visible text, but that's not how it is
> done now... But it certainly should be consistent between the config symbol
> and the comment.
>
>
>  Regards,
>  Arnout
>
>
>> +       depends on BR2_PACKAGE_LUA_5_2
>
>
>
> --
> Arnout Vandecappelle                          arnout at mind be
> Senior Embedded Software Architect            +32-16-286500
> Essensium/Mind                                http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
