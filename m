From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 1 Oct 2013 09:31:22 +0200
Subject: [Buildroot] [v4 1/2] luainterpreter: create virtual package
In-Reply-To: <CAB0FRssEyA+HqrMGw4B-sEswJY7YAMqw0Jh+L6gpyE0TVCyB6A@mail.gmail.com>
References: <1376469325-3707-1-git-send-email-francois.perrad@gadz.org>
 <CA+-urNQZVaNvLwNUA_X6N7Ft2N0U1Yo6h+L__vNtHJfOZVPUSA@mail.gmail.com>
 <20130930225408.4ea0f858@skate>
 <CAB0FRssEyA+HqrMGw4B-sEswJY7YAMqw0Jh+L6gpyE0TVCyB6A@mail.gmail.com>
Message-ID: <20131001093122.48b1c5f4@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Fran?ois Perrad,

On Tue, 1 Oct 2013 09:27:48 +0200, Fran?ois Perrad wrote:

> A version for a virtual package is not mandatory.
> A virtual package is used to create a OR dependency.
> With luainterpreter, a Lua module (LuaSocket for example) depends on
> lua OR on luajit.
> Both Lua 5.1.5 and LuaJIT 2.0.2 provides a Lua 5.1 ABI/API compatible
> interpreter.
> The only effect of setting LUAINTERPRETER_VERSION is the name of the
> directory 'build/luainterpreter-5.1' instead of
> 'build/luainterpreter-undefined'.

Ok, makes sense.

> I don't like name containing 'undefined', but I'll be fine with a BR
> convention what says :
>   - all virtual packages use 'virtual' as version.

I probably haven't thought about all the implications, but it indeed
looks like an interesting suggestion. Virtual packages are anyway
something that we should progressively formalize through a new section
in the documentation.

> I've already did some experiments with the Lua 5.2 serie in my own
> repository, see https://github.com/fperrad/br/tree/lua5.2

So should we package Lua 5.1 and 5.2 separately, because Lua modules
are only compatible with 5.1 or 5.2, or can we keep the same package
for both Lua versions?

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
