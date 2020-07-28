From: Romain Naour <romain.naour@gmail.com>
Date: Tue, 28 Jul 2020 23:47:50 +0200
Subject: [Buildroot] [PATCH 1/1] package/minetest: don't depend on luajit
In-Reply-To: <CADvTj4pBFitVFsWD1xkVTjFJ7=a2yDEycRX5J06KOi2YYE_EmQ@mail.gmail.com>
References: <20200727205621.2556101-1-james.hilliard1@gmail.com>
 <20200728090907.4f093194@windsurf.home>
 <CADvTj4q1DeWEpAcpkOsg9GA_dhzogRFV00sMd6YrdzpVMqU0pA@mail.gmail.com>
 <20200728134847.5f7e7401@windsurf.home>
 <CADvTj4pBFitVFsWD1xkVTjFJ7=a2yDEycRX5J06KOi2YYE_EmQ@mail.gmail.com>
Message-ID: <6008628e-cb56-abee-86d2-1bb4ed95adfc@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi James, all,

Le 28/07/2020 ? 22:44, James Hilliard a ?crit?:
> On Tue, Jul 28, 2020 at 5:48 AM Thomas Petazzoni
> <thomas.petazzoni@bootlin.com> wrote:
>>
>> On Tue, 28 Jul 2020 04:17:26 -0600
>> James Hilliard <james.hilliard1@gmail.com> wrote:
>>
>>> On Tue, Jul 28, 2020 at 1:09 AM Thomas Petazzoni
>>> <thomas.petazzoni@bootlin.com> wrote:
>>>>
>>>> On Mon, 27 Jul 2020 14:56:21 -0600
>>>> James Hilliard <james.hilliard1@gmail.com> wrote:
>>>>
>>>>> Since minetest has a fallback to a bundled lua when luajit is not
>>>>> available we don't need to depend on luajit or any lua version at all.
>>>>
>>>> In general, I think we try to not use bundled libraries even when they
>>>> exist. If minetest needs a Lua interpreter, it should always use an
>>>> external Lua interpreter, I believe.
>>> From my understanding luajit is the only supported external lua
>>> interpreter for minetest. So I think it makes sense to not require
>>> a specific lua interpreter for flexibility.
>>
>> I don't understand your reply, as I was not talking about using other
>> Lua interpreters.
>>
>> What I'm saying is that if minetest has a mandatory dependency on
>> LuaJIT, then it should *always* use the external LuaJIT and never use
>> the bundled one. We prefer external libraries over bundled libraries in
>> general in the context of Buildroot.
> Oh, it doesn't have a mandatory LuaJIT dependency, the internal version
> is not LuaJIT but some bundled regular Lua 5.1 variant AFAIK.

When I packaged minetest, I looked at distribution packaging:

https://www.archlinux.org/packages/community/x86_64/minetest/
https://src.fedoraproject.org/rpms/minetest/blob/master/f/minetest.spec#_38
https://salsa.debian.org/games-team/minetest/-/blob/master/debian/control#L22

minetest use luajit when available.
Only Debian support liblua5.1 when luajit is not supported.

I'm not sure it worth the effort since minetest require x11 and libgl.

Best regards,
Romain


>>
>> Thomas
>> --
>> Thomas Petazzoni, CTO, Bootlin
>> Embedded Linux and Kernel engineering
>> https://bootlin.com
