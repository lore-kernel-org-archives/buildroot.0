From: =?ISO-8859-1?Q?Fran=E7ois_Perrad?= <francois.perrad@gadz.org>
Date: Sat, 1 Mar 2014 16:34:35 +0100
Subject: [Buildroot] [PATCH 00/24] lua
In-Reply-To: <20140301160904.29570bf8@skate>
References: <1393227301-14874-1-git-send-email-francois.perrad@gadz.org>
 <20140301160904.29570bf8@skate>
Message-ID: <CAB0FRsvjjar89GLR85i=3xZg5-ULaa5OJHmj__xLgRToAkAktA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2014-03-01 16:09 GMT+01:00 Thomas Petazzoni
<thomas.petazzoni@free-electrons.com>:
> Dear Francois Perrad,
>
> On Mon, 24 Feb 2014 08:34:36 +0100, Francois Perrad wrote:
>
>> Francois Perrad (24):
>>   lua: remove LUA_INSTALLED_FILES
>>   lua: refactor install steps
>>   luarocks: never wraps script
>>   luajit: refactor without dont-strip.patch
>>   luajit: refactor without shared-lib.patch
>>   luajit: add host-luajit
>>   luarocks: allow to work with host-luajit
>>   ljlinenoise: new package
>>   lpeg: new package
>>   cosmo: new package
>>   lua-iconv: new package
>>   luajson: new package
>>   lualogging: new package
>>   dado: new package
>>   lrandom: new package
>>   lua-testmore: new package
>>   lua-coat: new package
>>   lua-coatpersistent: new package
>>   lua-messagepack: new package
>>   lua-csnappy: new package
>>   lzlib: new package
>>   lunit: new package
>>   lpty: new package
>>   lsqlite3: new package
>
> I've started applying a certain number of those patches, but when
> building some of these Lua packages, I have warning about missing
> dependencies. For example, when building luajson:
>
>   Missing dependency for luajson 1.3.2-1: lunit >= 0.4
>
> Or when building lualogging:
>
>   Missing dependency for lualogging 1.3.0-1: luasocket
>
> Are these normal?
>

Yes.
Our dependencies are handled by Buildroot,
Luarocks can handle its own by fetching/building/installing,
but we don't want that, so Luarocks is called like this :
    $$(LUAROCKS_RUN) make --deps-mode=none

And Luarocks does nothing with dependency except emitting this warning.

Fran?ois

> Thanks,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
