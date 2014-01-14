From: =?ISO-8859-1?Q?Fran=E7ois_Perrad?= <francois.perrad@gadz.org>
Date: Tue, 14 Jan 2014 09:30:29 +0100
Subject: [Buildroot] luarocks compilation during install to target?
In-Reply-To: <CANxTyt6iEL+2pz3+_=A8NcD7aTYLGY2cYTDAU_2iYbtX7Sq-SA@mail.gmail.com>
References: <CANxTyt6iEL+2pz3+_=A8NcD7aTYLGY2cYTDAU_2iYbtX7Sq-SA@mail.gmail.com>
Message-ID: <CAB0FRsszkaLCE6VraV5t0-kqbRp6Ad=bXugh93r4ZkXDaS=2TQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2014/1/14 Danomi Manchego <danomimanchego123@gmail.com>:
> Francois,
>
> While trying the new luarocks mods with a couple packages (lua-cjson,
> luasocket) with Q set to nothing ("Q="), I noticed that the actual
> compilation occurs during the "Installing to target" phase rather than
> in the "Building" phase.  Expected?

Yes, LuaRocks doesn't allow to split build & install step.
So, I choice to do both in "Installing to target" phase,
which is the best place for a pure Lua module.

(see http://git.buildroot.net/buildroot/tree/package/pkg-luarocks.mk#n61)

Fran?ois.

>
> I imagine that the results work okay, but thought I'd ask just in case ...
>
> Danomi -
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
