From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 11 Dec 2010 11:25:08 +0100
Subject: [Buildroot] iproute2 failing for x86_64 with ext. toolchain
In-Reply-To: <AANLkTik=Q-B9a-s-0Q0aVvm4POFEcXohBri0XQyJoSJo@mail.gmail.com>
References: <20101207162124.20071ez7m458t3lw@www.home.zuerker.org>
	<4D00DFEE.7090103@zacarias.com.ar>
	<20101209105559.10305jzi16ub75cs@www.home.zuerker.org>
	<AANLkTi=T0idFP0k6fFXP3ex6dsupLxMGPgJwz+V4DCkM@mail.gmail.com>
	<4D0112E5.301@zacarias.com.ar>
	<AANLkTi=X+CZ9+=yRjcvzfxUecteEGzTgm_6eB+OCGMbG@mail.gmail.com>
	<4D012474.8050902@zacarias.com.ar>
	<AANLkTik=Q-B9a-s-0Q0aVvm4POFEcXohBri0XQyJoSJo@mail.gmail.com>
Message-ID: <20101211112508.0a71feeb@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 11 Dec 2010 12:06:54 +0300
Pkun <serj.kalichev@gmail.com> wrote:

> The author of iproute2 did't accept my patch. Moreover the problem is
> not with a bad patch. The author don't want to make IPv6 support
> optional and don't want to make iproute2 configurable. From netdev
> mailing list: to my question about optional IPv6 he wrote: "Because I
> want iproute to be a complete tool, not a user configurable nightmare.
> Just look at busybox to see what over configuration is." It's strange
> for me. So the upstream problems with iproute2 build system will
> continue.

So, just make iproute2 depends on BR2_INET_IPV6. iproute2 is a fairly
advanced networking utility, so it doesn't sound unreasonable to have
it depend on IPv6 support.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
