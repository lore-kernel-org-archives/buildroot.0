From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat, 11 Dec 2010 07:30:00 -0300
Subject: [Buildroot] iproute2 failing for x86_64 with ext. toolchain
In-Reply-To: <AANLkTik=Q-B9a-s-0Q0aVvm4POFEcXohBri0XQyJoSJo@mail.gmail.com>
References: <20101207162124.20071ez7m458t3lw@www.home.zuerker.org>	<4D00DFEE.7090103@zacarias.com.ar>	<20101209105559.10305jzi16ub75cs@www.home.zuerker.org>	<AANLkTi=T0idFP0k6fFXP3ex6dsupLxMGPgJwz+V4DCkM@mail.gmail.com>	<4D0112E5.301@zacarias.com.ar>	<AANLkTi=X+CZ9+=yRjcvzfxUecteEGzTgm_6eB+OCGMbG@mail.gmail.com>	<4D012474.8050902@zacarias.com.ar>
	<AANLkTik=Q-B9a-s-0Q0aVvm4POFEcXohBri0XQyJoSJo@mail.gmail.com>
Message-ID: <4D0352A8.20105@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 12/11/2010 06:06 AM, Pkun wrote:

> The author of iproute2 did't accept my patch. Moreover the problem is
> not with a bad patch. The author don't want to make IPv6 support
> optional and don't want to make iproute2 configurable. From netdev
> mailing list: to my question about optional IPv6 he wrote: "Because I
> want iproute to be a complete tool, not a user configurable nightmare.
> Just look at busybox to see what over configuration is." It's strange
> for me. So the upstream problems with iproute2 build system will
> continue.

That's bad, sometimes people have different priorities than we do. It
doesn't mean that we can't include your no-ipv6 patch (my opinion
regarding that is merely personal). If it becomes cumbersome in the
future to keep supporting it for whatever reason we can just drop it.
Just don't try to fix things that don't want fixing, like the configure
script as Mike said, better to just do all the configuring in the
package makefile. If the patch to fix it is bigger and doesn't do
anything different and upstream probably won't take it then we shouldn't
bother with it.
Regards.
