From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Mon, 24 Jun 2019 11:30:23 +0200
Subject: [Buildroot] [PATCH 18/27] toolchain: introduce
 BR2_TOOLCHAIN_HAS_GCC_BUG_63261
In-Reply-To: <20190622195322.47a8c59f@windsurf>
References: <20190614210346.121013-1-giulio.benetti@micronovasrl.com>
 <20190614210346.121013-19-giulio.benetti@micronovasrl.com>
 <20190622195322.47a8c59f@windsurf>
Message-ID: <b26f7a34-42c8-8b70-88dc-72832e88ad12@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

Il 22/06/2019 19:53, Thomas Petazzoni ha scritto:
> On Fri, 14 Jun 2019 23:03:37 +0200
> Giulio Benetti <giulio.benetti@micronovasrl.com> wrote:
> 
>> GCC hangs while building fxload for the Microblaze Arch using following
> 
> So gcc does not "hang", but there is a build failure, which is a bit
> different.

Yes, my bad, it fails.

> I applied this patch as well as 19/27 (fxload) and 20/27 (dmalloc).

Thanks

> However, could you double check if the issue occurs with just
> optimization enabled, or only when optimization *and*
> BR2_ENABLE_DEBUG=y are enabled?

I've built both dmalloc and fxload without debugging symbols but fxload 
fails on building with Gcc 7 only. So I would keep it as it is.

What do you think?

Best regards
-- 
Giulio Benetti
CTO

MICRONOVA SRL
Sede: Via A. Niedda 3 - 35010 Vigonza (PD)
Tel. 049/8931563 - Fax 049/8931346
Cod.Fiscale - P.IVA 02663420285
Capitale Sociale ? 26.000 i.v.
Iscritta al Reg. Imprese di Padova N. 02663420285
Numero R.E.A. 258642

> Indeed, my original gcc bug report said that the problem only occurred
> when both are combined.
> 
> I applied anyway, because that debugging thing would simply be a
> further refinement, so it's not that important.
> 
> Thomas
> 
