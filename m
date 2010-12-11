From: Pkun <serj.kalichev@gmail.com>
Date: Sat, 11 Dec 2010 12:06:54 +0300
Subject: [Buildroot] iproute2 failing for x86_64 with ext. toolchain
In-Reply-To: <4D012474.8050902@zacarias.com.ar>
References: <20101207162124.20071ez7m458t3lw@www.home.zuerker.org>
	<4D00DFEE.7090103@zacarias.com.ar>
	<20101209105559.10305jzi16ub75cs@www.home.zuerker.org>
	<AANLkTi=T0idFP0k6fFXP3ex6dsupLxMGPgJwz+V4DCkM@mail.gmail.com>
	<4D0112E5.301@zacarias.com.ar>
	<AANLkTi=X+CZ9+=yRjcvzfxUecteEGzTgm_6eB+OCGMbG@mail.gmail.com>
	<4D012474.8050902@zacarias.com.ar>
Message-ID: <AANLkTik=Q-B9a-s-0Q0aVvm4POFEcXohBri0XQyJoSJo@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2010/12/9 Gustavo Zacarias <gustavo@zacarias.com.ar>:
> On 12/09/10 15:36, Pkun wrote:
>
>> There is a good variable TARGET_CONFIGURE_OPTS within buildroot. It
>> contain all possible AR="$(TARGET_AR) CC="$(TARGET_CC) etc. But it's
>> long and complex. Probably it will be right to use it for similar cases.
>>
>> Now I'm making a big patch for iproute2. It has terrible build system
>> that don't support cross build. And iproute2's configure script is
>> hand-made and use 'gcc' instead $(CC) for example. It can't be build
>> without IPv6. I wrote about TARGET_CONFIGURE_OPTS but it can't be used
>> for the current iproute2 because it will break the internal CFLAGS
>> definitions.
>>
>> The xtables.h belong to iptables package. But buildroot's iptables don't
>> install anything to the staging. The iproute2 uses libxtables.so also.
>
> Keep in mind that doing huge patches that modify upstream source should
> be submitted for upstream inclusion, otherwise when there is a new
> version for inclusion it might break everything up again.
> With regards to IPv6 support i think (and it's a completely personal
> opinion) that it's no big deal with the iproute2 case, adding IPv6
> support won't make things much bigger than say using real iproute2
> versus small busybox iproute2-compatible utils.
> Granted, you loose some functionality, but if you want the advanced
> stuff you might as well throw IPv6 in.
> Regards.
>

The author of iproute2 did't accept my patch. Moreover the problem is
not with a bad patch. The author don't want to make IPv6 support
optional and don't want to make iproute2 configurable. From netdev
mailing list: to my question about optional IPv6 he wrote: "Because I
want iproute to be a complete tool, not a user configurable nightmare.
Just look at busybox to see what over configuration is." It's strange
for me. So the upstream problems with iproute2 build system will
continue.
