From: =?ISO-8859-1?Q?Fran=E7ois_Perrad?= <francois.perrad@gadz.org>
Date: Tue, 1 Oct 2013 09:27:48 +0200
Subject: [Buildroot] [v4 1/2] luainterpreter: create virtual package
In-Reply-To: <20130930225408.4ea0f858@skate>
References: <1376469325-3707-1-git-send-email-francois.perrad@gadz.org>
 <CA+-urNQZVaNvLwNUA_X6N7Ft2N0U1Yo6h+L__vNtHJfOZVPUSA@mail.gmail.com>
 <20130930225408.4ea0f858@skate>
Message-ID: <CAB0FRssEyA+HqrMGw4B-sEswJY7YAMqw0Jh+L6gpyE0TVCyB6A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2013/9/30 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>:
> Dear Frank Hunleth,
>
> On Mon, 30 Sep 2013 14:31:46 -0400, Frank Hunleth wrote:
>
>> > +#############################################################
>> > +#
>> > +# Virtual package for luainterpreter
>> > +#
>> > +#############################################################
>> > +
>> > +LUAINTERPRETER_VERSION = 5.1
>>
>> I was curious on your choice of version number for the virtual
>> package. Is this intended to be used for API compatibility checks?
>>

A version for a virtual package is not mandatory.
A virtual package is used to create a OR dependency.
With luainterpreter, a Lua module (LuaSocket for example) depends on
lua OR on luajit.
Both Lua 5.1.5 and LuaJIT 2.0.2 provides a Lua 5.1 ABI/API compatible
interpreter.
The only effect of setting LUAINTERPRETER_VERSION is the name of the
directory 'build/luainterpreter-5.1' instead of
'build/luainterpreter-undefined'.

I don't like name containing 'undefined', but I'll be fine with a BR
convention what says :
  - all virtual packages use 'virtual' as version.

I've already did some experiments with the Lua 5.2 serie in my own
repository, see https://github.com/fperrad/br/tree/lua5.2

Fran?ois

>> The reason that I'm asking is that I'm going to need to upgrade a
>> project to Lua 5.2. There are enough API differences between Lua 5.1
>> and 5.2 that it would be useful to use your patch set and add Lua 5.2
>> as another luainterpreter. Using LUAINTERPRETER_VERSION sounds like
>> one way of checking Lua API compatibility in other projects. Or did
>> you have other thoughts?
>>
>> Also, any word on the status of your patches?
>
> Having a "version" attached to a virtual package does not make sense, I
> believe.
>
> If there are several incompatible versions of Lua that need to be
> supported in Buildroot, then they must be packaged as separate
> packages: lua, lua52 for example, like we're doing for python vs.
> python4 and qt vs. qt5.
>
> A virtual package should remain only have as dependencies packages that
> provide the same API, i.e that interchangeable.
>
> (Note: I have no knowledge about Lua specifically, those statements are
> generic Buildroot rules.)
>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
