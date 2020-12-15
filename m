From: Romain Naour <romain.naour@gmail.com>
Date: Tue, 15 Dec 2020 11:46:17 +0100
Subject: [Buildroot] [PATCH] arch/Config.in.powerpc: Drop PPC601 support
In-Reply-To: <c64d54bc5b158ee6f2e1a09a969c61e5@walle.cc>
References: <20201215081433.4254-1-michael@walle.cc>
 <09b2f8e8-da8e-63d1-7b07-55a2d87280ad@gmail.com>
 <c64d54bc5b158ee6f2e1a09a969c61e5@walle.cc>
Message-ID: <bfae9d1b-f879-1cec-5631-ec28d0dd2b85@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le 15/12/2020 ? 11:15, Michael Walle a ?crit?:
> Am 2020-12-15 11:06, schrieb Romain Naour:
>> Hello Michael,
>>
>> Le 15/12/2020 ? 09:14, Michael Walle a ?crit?:
>>> Linux support was removed in 5.10 [1]. Since no in-tree defconfig
>>> depends on it, just remove it.
>>
>> Thanks for the patch.
>>
>> I'm ok with this patch but I would like a feedback from maintainers because
>> PPC601 removal from the latest kernel doesn't mean that we have to remove it
>> from Buildroot immediately.
>> OTOH who is still using PPC601 in 2020 with the latest Buildroot ?
>> Also, since there was no kernel in-tree defconfig for this target I'm not sure
>> it worth the effort.
> 
> So the other possibility would be to make 5.9 the last kernel for ppc601
> and 5.10 for ppc40x. But that would mean we also have to keep the 5.9 one
> indefinitely? right?

Buildroot doesn't have to keep indefinitely a support for an unmaintained cpu
architecture or package.
At some point it's removed (see bfin, avr32 removal etc...).
Except if there is someone that really want to keep it and help us to take care
of this support.

There is a similar issue with ppc w/ SPE that was deprecated in gcc 8 and
removed in gcc 9:

https://git.buildroot.net/buildroot/commit/?id=96e80ad214ced86c802d561946fa7da88c1595eb

Should we keep indefinitely gcc 8 for ppc w/ spe ?
Yes and no because we know that ArcturusNetworks people (maybe other) are still
using ppc w/ spe and they have sent patches for arcturus_ucp1020_defconfig.
But gcc-8 is not maintained anymore.

Best regards,
Romain

> 
> -michael
