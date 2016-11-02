From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 2 Nov 2016 10:48:17 +0100
Subject: [Buildroot] [PATCH v2 05/23]
 toolchain-external-blackfin-uclinux: new package
In-Reply-To: <20161101181455.GA30593@free.fr>
References: <1477742948-11490-1-git-send-email-romain.naour@gmail.com>
 <1477742948-11490-6-git-send-email-romain.naour@gmail.com>
 <20161030164752.GA18077@free.fr>
 <20161030183734.26f568d4@free-electrons.com>
 <20161030181700.GC18077@free.fr>
 <20161101141944.01daf548@free-electrons.com>
 <464e77de-831e-beeb-4d83-be59aa659f88@gmail.com>
 <20161101181455.GA30593@free.fr>
Message-ID: <20161102104817.50c360ab@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 1 Nov 2016 19:14:55 +0100, Yann E. MORIN wrote:

> As we discussed on IRC just a few minutes ago, I am not in favour of you
> rewriting this series, whether it is material for -rc1 or -next.

IMO, we're too close to -rc1 for this series to go in. I'll probably
merge the first five preparation patches, but I'd prefer to merge the
rest in the next branch.

> As for the ordering of the toolchains, I think we should have them
> ordered by alpahbetiacal order.

Right.

> After all, we never really advertised that defconfigs would be
> "reansposable" as-is during an upgrade.

Well, this is what we are trying to achieve to some extent with the
Config.in.legacy.

> The real process for an upgrade should be:
> 
>     make foo_defconfig
>     git pull
>     make oldconfig
>     (check)
>     make savedefconfig

Regardless of whether it's for backward compat reasons or not, I still
think the Sourcery toolchain should be used by default on ARM EABI, and
not the older Arago toolchain, even if Arago is sorted alphabetically
before Sourcery. Which is why I suggest to have a "default" statement
in the Config.in choice for external toolchains.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
