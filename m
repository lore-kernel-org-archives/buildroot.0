Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2206C433EF
	for <buildroot@archiver.kernel.org>; Mon,  9 May 2022 06:53:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6081741503;
	Mon,  9 May 2022 06:53:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id R_SH3mNF7nts; Mon,  9 May 2022 06:53:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 24B20414C9;
	Mon,  9 May 2022 06:53:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C57E21BF284
 for <buildroot@lists.busybox.net>; Mon,  9 May 2022 06:53:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B2B7540A15
 for <buildroot@lists.busybox.net>; Mon,  9 May 2022 06:53:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FbElWChcb-HN for <buildroot@lists.busybox.net>;
 Mon,  9 May 2022 06:53:05 +0000 (UTC)
X-Greylist: delayed 00:19:59 by SQLgrey-1.8.0
Received: from 1.mo576.mail-out.ovh.net (1.mo576.mail-out.ovh.net
 [178.33.251.173])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 612734028D
 for <buildroot@buildroot.org>; Mon,  9 May 2022 06:53:05 +0000 (UTC)
Received: from player696.ha.ovh.net (unknown [10.111.172.147])
 by mo576.mail-out.ovh.net (Postfix) with ESMTP id 0053823D2A
 for <buildroot@buildroot.org>; Mon,  9 May 2022 06:17:16 +0000 (UTC)
Received: from dopsi.ch (unknown [147.87.105.170])
 (Authenticated sender: dopsi@dopsi.ch)
 by player696.ha.ovh.net (Postfix) with ESMTPSA id C872620189BA2;
 Mon,  9 May 2022 06:17:14 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass
 (GARM-99G003d0850393-b0ef-415a-b0a3-ae13df52f742,
 78D549BC67A32D4F57B2C9CF96F8C4035E46026E) smtp.auth=dopsi@dopsi.ch
X-OVh-ClientIp: 147.87.105.170
Message-ID: <4f2066e78ce300e38332ef957d1ded4be40307ae.camel@dopsi.ch>
From: Simon Doppler <dopsi@dopsi.ch>
To: "Alvaro G. M." <alvaro@linenoise.info>, buildroot@buildroot.org
Date: Mon, 09 May 2022 08:17:14 +0200
In-Reply-To: <20220504080140.03e99fbf@salem.gmr.ssr.upm.es>
References: <20220504080140.03e99fbf@salem.gmr.ssr.upm.es>
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
X-Ovh-Tracer-Id: 12820622243349051509
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrfeekgddutdejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkffuhffvffgjfhgtfggggfesthejredttderjeenucfhrhhomhepufhimhhonhcuffhophhplhgvrhcuoeguohhpshhiseguohhpshhirdgthheqnecuggftrfgrthhtvghrnhepfeffudeiieeigefhgedvueeitdegkefftdejtdekudffieelvdeggfevheekffevnecukfhppedtrddtrddtrddtpddugeejrdekjedruddthedrudejtdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepphhlrgihvghrieeliedrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpeguohhpshhiseguohhpshhirdgthhdpnhgspghrtghpthhtohepuddprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhg
Subject: Re: [Buildroot] Kernel and u-boot DTS include paths
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 2022-05-04 at 08:01 +0200, Alvaro G. M. wrote:
> Hi
> 
> I'm building a system for a zynqmp SoC from Xilinx and I'm facing a
> problem regarding device tree include paths.
> 
> The thing is that the kernel has placed zynqmp .dtsi files on its own
> folder under dts/xilinx, such as xilinx/zynqmp.dtsi and xilinx/zynqmp-clk-ccf.dtsi
> 
> On uboot, these same (or equivalent) files are placed in the same
> folder as any other .dtsi files, meaning that there is no xilinx/
> directory.
> 
> So, now, since my custom DTS for my board starts off by including
> those two files I mentioned (along a few others):
> 
> /dts-v1/;
> 
> #include "xilinx/zynqmp.dtsi"
> #include "xilinx/zynqmp-clk-ccf.dtsi"
> #include <dt-bindings/gpio/gpio.h>
> #include <dt-bindings/phy/phy.h>
> #include <dt-bindings/net/ti-dp83867.h>
> 
> Well... you can see where this is going. Linux kernel builds without
> any issue, but u-boot fails because it cannot find xilinx/ directory.
> But if I were to make uboot happy, then it would be the kernel the one
> who complains about it.
> 
> I could just use two different files, but this duplicity doesn't sit
> well with me. Am I missing some option that coould make this work?
> 
> Thanks, best regards!
> 

Hi Alvaro,

One workaround for this issue is to add a custom patch to Linux so that the dts/xilinx subdirectory
is part of the include path.

Something like this should work:

diff --git a/arch/arm64/boot/dts/Makefile b/arch/arm64/boot/dts/Makefile
index 1ba04e31a438..e141f6f5343c 100644
--- a/arch/arm64/boot/dts/Makefile
+++ b/arch/arm64/boot/dts/Makefile
@@ -31,3 +31,5 @@ subdir-y += tesla
 subdir-y += ti
 subdir-y += toshiba
 subdir-y += xilinx
+
+DTC_FLAGS += -iarch/arm64/boot/dts/xilinx

This will add the arch/arm64/boot/dts/xilinx to the include path for dtc.
Once you have this, you will be able to use both 

#include "xilinx/zynqmp.dtsi"
#include "zynqmp.dtsi"

to include the same file.

Hope this helps,

Regards,

Simon Doppler

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
