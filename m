Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA2CCC433EF
	for <buildroot@archiver.kernel.org>; Wed, 12 Jan 2022 07:23:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7186583EF1;
	Wed, 12 Jan 2022 07:23:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id A7xfnkAzKjCo; Wed, 12 Jan 2022 07:23:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C072883EE7;
	Wed, 12 Jan 2022 07:23:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2A0D21BF38E
 for <buildroot@lists.busybox.net>; Wed, 12 Jan 2022 07:23:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 102594054B
 for <buildroot@lists.busybox.net>; Wed, 12 Jan 2022 07:23:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id alm6-tWCR0NY for <buildroot@lists.busybox.net>;
 Wed, 12 Jan 2022 07:23:12 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from 10.mo552.mail-out.ovh.net (10.mo552.mail-out.ovh.net
 [87.98.187.244])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E7E3540186
 for <buildroot@buildroot.org>; Wed, 12 Jan 2022 07:23:11 +0000 (UTC)
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.164])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 2215022209;
 Wed, 12 Jan 2022 07:07:41 +0000 (UTC)
Received: from kaod.org (37.59.142.104) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Wed, 12 Jan
 2022 08:07:40 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-104R00526f15ca9-996b-4d42-aa06-e78f9aea7fa1,
 C5437DA5DF8DB845CC48CAA380855665EAA33ED7) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <09709dad-59ac-23b6-e3f0-3ec3457c7a14@kaod.org>
Date: Wed, 12 Jan 2022 08:07:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-US
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20220110210235.817082-1-clg@kaod.org>
 <20220111214509.79c5c88e@windsurf>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220111214509.79c5c88e@windsurf>
X-Originating-IP: [37.59.142.104]
X-ClientProxiedBy: DAG7EX1.mxp5.local (172.16.2.61) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 78e00722-ed0d-40c9-881a-1d6db4b65d5a
X-Ovh-Tracer-Id: 9096426824759544800
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrudehgedguddthecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthejredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeevjeefkeeludevueekkeeileekvdffjeeuveevieejledtgfevuedvhfehteffffenucffohhmrghinhepghhithhhuhgsrdgtohhmpdgsohhothhlihhnrdgtohhmpdhlihhnuhigqdhkvhhmrdhorhhgnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtoheprhhomhgrihhnrdhnrghouhhrsehgmhgrihhlrdgtohhm
Subject: Re: [Buildroot] [PATCH 1/3] configs/qemu: Add a ppc64le-powernv8
 configuration
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Gerome Burlats <gerome.burlats@smile.fr>,
 Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Thomas,

> Thanks, entire patch series applied. One small change was done: add
> appropriate entries to the DEVELOPERS file, so that we know who to
> contact for those defconfigs :-) Especially if our Gitlab CI
> infrastructure detects build issues, you will be notified.

sure. I have a generated set here :

   https://github.com/legoater/qemu-ppc-boot/tree/main/buildroot

that I use for non regression on QEMU PPC.

> Since you are a PowerPC expert, I'd like to take this opportunity to
> ask you about the toolchains we're providing at
> https://toolchains.bootlin.com/. For the moment for PowerPC, we are
> providing the following toolchains:
> 
> powerpc-440fp, not tested

The bamboo machine uses a 440EP CPU implementation, which has a
floating point unit.
     
> powerpc64-e5500, tested with qemu_ppc64_e5500_defconfig
> powerpc64-e6500, not tested

e6500 is nearly the same CPU as e5500. AFAIK, the main differences
are altivec instructions and more HV support for guest translations.

More info here :

   https://www.linux-kvm.org/page/E500_virtual_CPU_specification

> powerpc64le-power8, tested with qemu_ppc64le_pseries_defconfig
> powerpc64-power8, tested with qemu_ppc64_pseries_defconfig
> powerpc-e300c3, not tested
> powerpc-e500mc, not tested

you could use the 32bit ppce500 machine for that.

> I suppose I could now test the powerpc-440fp toolchain with the
> qemu_ppc_bamboo_defconfig you have added. Is that correct?

yes.
  
> What about the other toolchain configurations? Is there some matching
> Qemu emulation?>
> And generally speaking, does this selection of PowerPC architecture
> variants make sense to offer pre-compiled toolchains? For quite a

Here is a quick status of machine/CPUs that QEMU implements :

* prep

   prep: 604 CPU (we might remove 601-603 CPUs)

* embedded

   ref405ep: 405EP (user space segfaults but same image works on 44x CPUs
                    I hope to get that one fixed by QEMU 7.0 )
   bambo:    440FP
   sam460ex: 460EP is very much like the 440fp

* Mac

   g3beige:  G3 (or 75x CPU) family
   mac99:    G4 (7400 7410 7441 7447 7448 7450 7451 7455 7457) family

* book3e 32bit:

   ppce500:   e500mc
   mpc8544ds: mpc8544

* book3e 64bit:

   ppce500 (KVM): e5500, e6500
   
* book3s 64bit (para virtualized and baremetal):

   mac99: PPC970
   pseries (BE only): PPC970, PPC970mp, POWER5+
   pseries (LE, BE and KVM) : POWER7, POWER8, POWER9, POWER10
   powernv: POWER8, POWER9, POWER10

Most of the attention is on book3s 64bit CPUs. MAC emulation is well
maintained. Embedded world is not.

> while, we've had requests for other PowerPC variants:
> https://github.com/bootlin/toolchains-builder/issues/2. Your input
> would be very welcome :-)

OK. I will take a look.

Thanks,

C.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
