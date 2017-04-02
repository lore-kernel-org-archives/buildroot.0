From: Stefan Nickl <stefan.nickl@gmail.com>
Date: Sun, 2 Apr 2017 21:07:27 +0200
Subject: [Buildroot] [PATCH] lpppd: new package
In-Reply-To: <20170401210505.GA3663@scaer>
References: <20170102223824.28266-1-Stefan.Nickl@gmail.com>
 <20170401184051.7f6c1252@free-electrons.com> <20170401210505.GA3663@scaer>
Message-ID: <CAFOMc=Qz_2CCgiMrsYSBMRUfzeMUNZ3J1mWMVP0N6C8bPFORcw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, Yann,

On Sat, Apr 1, 2017 at 11:05 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> Stefan, All,
>
> On 2017-04-01 18:40 +0200, Thomas Petazzoni spake thusly:
>> On Mon,  2 Jan 2017 23:38:24 +0100, stefan.nickl at gmail.com wrote:
>> > From: Stefan Nickl <Stefan.Nickl@gmail.com>
>> >
>> > After the official github repository for PPP has not seen
>> > any activity for a long time, I've created a fork that
>> > tries to do some modernization and shed some legacy.
>> > For more info, please see https://github.com/snickl/lpppd
>> >
>> > It is inteded as a drop-in replacement for the original PPP,
>> > therefore I've marked it as conflicting with the existing pppd
>> > package.
>> >
>> > Signed-off-by: Stefan Nickl <Stefan.Nickl@gmail.com>
>>
>> I do appreciate your interest in making the pppd development active
>> again. However, at this point, I don't see what is the benefit of using
>> lpppd over pppd, and having two separate packages is a bit annoying.
>> Therefore, I would prefer to wait for lpppd to gain some traction
>> before packaging it in Buildroot.
>
> I kind of agree with Thomas here.
>
> lpppd is a new fork of a well-established project, so it will have to
> offer enough of an edge before it can displace pppd.
>
> However, I agree with you that there is no activity in upstream pppd.
> Maybe you could talk with upstream to adopt the package instead of
> forking?

The trouble with ppp (as in "Paul's PPP package") is that it carries a
lot of baggage through its wide range of support for different systems
and legacy protocols.

Now I'm one guy interested only in the embedded Linux use case, and
the approach with lpppd is to focus on that, shedding stuff like
Solaris and IPX support in the hope that what remains will be
maintainable and testable.

Interestingly enough, Paul Mackerras showed up on the github project
half a month ago and accepted some pull requests, but has not followed
up on any of the comments I made there since, so I guess the upstream
project will continue to remain in this sort of limbo state.

I'm also pretty sure there are other people out there that still
depend on much of this legacy support, so a fork with much narrower
goals seems like the only way for moving forward the embedded Linux
case, and getting e.g. support for musl-libc in.

I can fully understand that you'd rather see the fork getting traction
outside of Buildroot first, but I'm submitting lpppd in an attempt to
overcome that chicken-and-egg dilemma from the other side, by getting
the fork some visibility towards a like-minded audience and see if it
sticks.

So the decision is up to you guys; I'd rather you not accept it for
now than setting expectations towards myself that I might not be able
to keep.

-- 
Stefan
