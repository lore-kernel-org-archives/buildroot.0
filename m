Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC164C433EF
	for <buildroot@archiver.kernel.org>; Mon, 24 Jan 2022 20:45:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4991741545;
	Mon, 24 Jan 2022 20:45:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Chu5ssTNmcjl; Mon, 24 Jan 2022 20:45:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 88ABC41524;
	Mon, 24 Jan 2022 20:45:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E9C5B1BF3FB
 for <buildroot@lists.busybox.net>; Mon, 24 Jan 2022 20:45:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E595660AE1
 for <buildroot@lists.busybox.net>; Mon, 24 Jan 2022 20:45:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jV9sJAeALO71 for <buildroot@lists.busybox.net>;
 Mon, 24 Jan 2022 20:45:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C86B560803
 for <buildroot@buildroot.org>; Mon, 24 Jan 2022 20:45:35 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 64150E0006;
 Mon, 24 Jan 2022 20:45:30 +0000 (UTC)
Date: Mon, 24 Jan 2022 21:45:29 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Message-ID: <20220124214529.56b1bf5d@windsurf>
In-Reply-To: <4a94b253-6fe7-5e79-b1e9-331b0a9051ca@baylibre.com>
References: <20220118111457.2491318-1-adeep@lexina.in>
 <20220122143327.7d1a1cf7@windsurf>
 <27eb54d9-6897-a2df-00c3-fb6dca8aba91@lexina.in>
 <20220122160914.7e4cc513@windsurf>
 <1a3ce2b5-4b17-b79f-5dd5-29637575d473@lexina.in>
 <4a94b253-6fe7-5e79-b1e9-331b0a9051ca@baylibre.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/amlogic-boot-fip: new package
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
Cc: Vyacheslav <adeep@lexina.in>, "Yann E. MORIN" <yann.morin.1998@free.fr>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Neil,

Thanks for the additional feedback.

On Mon, 24 Jan 2022 14:41:49 +0100
Neil Armstrong <narmstrong@baylibre.com> wrote:

> The binaries must be split into 2 categories:
> - Pre-built: bl2, bl31, bl21, bl32, fip_create, aml_encrypt_*, ddr*.fw, acs_tool.py
> - Built in the Vendor U-Boot source: acs.bin bl301.bin

Right.

> In 2019, Amlogic finally added a LICENSE for the pre-built binaries, before
> nobody knew what was the term of the distribution.
> 
> commit 6abaf9a869a6584b3cfca8b96d0946ed49bc9b64
> Author: Lawrence Mok <lawrence.mok@amlogic.com>
> Date:   Mon May 6 12:34:56 2019 -0700
> 
>     add LICENSE file and text referring to it [1/1]
> 
>     Change-Id: Id291f42bec3ddb0c2162e6540ce1f35d1cb1d079
> 
> The LICENSE can be found at [1] in Khadas github.

And this license is the one used at
https://github.com/LibreELEC/amlogic-boot-fip which Vyacheslav wants to
package in Buildroot, and this license is extremely restrictive.
Basically, it says that excepts private use of the content of this
repository, you can't do anything with it.

> Concerning the acs.bin & bl301.bin, they use the U-Boot build system and
> config header files and all these were also updated with the following SPDX:
> /* SPDX-License-Identifier: (GPL-2.0+ OR MIT) */

I don't really see what the license of the U-Boot build system and
config headers has to do with the resulting license of the binaries.

> commit 94de43d3d940cf75b4a9e4fd2a2715be8eff6138
> Author: Jiucheng Xu <jiucheng.xu@amlogic.com>
> Date:   Wed Dec 16 10:11:00 2020 +0800
> 
>     license: Fix the license of amlogic related codes [1/1]
> 
>     PD#SWPL-39001
> 
>     Problem:
>     A customer want to add amlogic driver in uboot to
>     their private bootloader. Since the driver codes
>     are licensed under GPL-2.0, and customer have
>     to open their code, so we need fix the license
>     issue.
> 
>     Solution:
>     Fix the license of our related code in uboot by
>     adding MIT license
> 
>     Verify:
>     Franklin
> 
>     Change-Id: I2f3571e8720d1f4db069f882353d6ae050702cba
>     Signed-off-by: Jiucheng Xu <jiucheng.xu@amlogic.com>
> 
> Note, none of the vendor who publicly published the Amlogic U-Boot
> source has this change, so we can consider acs.bin & bl301.bin
> generated from GPL-2.0 as the commit explains.

This is really a stretch. The question is which source files are
compiled into acs.bin and bl301.bin ? If they use parts under the
GPL-2.0, then indeed we can assume the whole is also under GPL-2.0, as
it is the only license under which derivative works can be published.

But the repository at https://github.com/LibreELEC/amlogic-boot-fip/
contains a lot more things than acs.bin and bl301.bin.

> The pre-built binaries stored on the LibreELEC repository only comes from
> public Vendor sources (Khadas, HardKernel, Libre Computer, FriendlyARM, Radxa)
> and checked against vendor repositories we have access to.
> 
> We assume they got permission from Amlogic to publicly redistribute these binaries
> as we (BayLibre) were allowed to redistribute the VDEC firmware in [2] & [3].

If that's the case, then why does
https://github.com/LibreELEC/amlogic-boot-fip has this LICENSE file
with scary terms?

I am really surprised by how unclear the licensing terms are for those
blobs. This should scare pretty much any company from doing products
based on Amlogic SoCs.

Would it be possible to clarify this with Amlogic, and instead of their
silly terms of "you can't do anything with it", have a license that at
least allows distribution on Amlogic platforms?

Again, thanks for your support on this!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
