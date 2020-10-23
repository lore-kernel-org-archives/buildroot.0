From: Sven Oliver Moll <buildroot@svol.li>
Date: Fri, 23 Oct 2020 19:35:35 +0200 (CEST)
Subject: [Buildroot] [PATCH] Makefile: be careful what we remove from
 saved defconfig
In-Reply-To: <ad27d198-54b8-596c-a079-46c756a6617a@celad.com>
References: <20201021200828.3376405-1-yann.morin.1998@free.fr>
 <ad27d198-54b8-596c-a079-46c756a6617a@celad.com>
Message-ID: <alpine.DEB.2.20.2010231929270.29285@defender.svolli.xa>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 23 Oct 2020, Herv? CODINA wrote:

> Maybe I acked too quickly ...
>
> What do you think about this pattern
> @$(SED) '/^BR2_DEFCONFIG=/d' -e '/^# BR2_DEFCONFIG /
> in order to match "BR2_DEFCONFIG=xxxxxxxx" and "# BR2_DEFCONFIG is not set" ?
[...]

I don't think that this is necessary, because savedefconfig only saves the 
ones that are different from preset. So:
- BR2_DEFCONFIG is the name to save to, so an unset instance does not exist
   (a bit like chicken and egg)
- BR2_DL_DIR, when unset, will not appear as "# BR2_DL_DIR is unset" in the
   saved *_defconfig
...or am I missing something?


Greetings,
SvOlli
-- 
|  _______       |
| (  /\          |
|__)v\/lli a.k.a.| Be good, but not TOO good.
|Sven Oliver Moll|   -- Frumpy The Clown by Judd Winick (Final: June, 7th 1998)
