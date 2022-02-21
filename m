Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EB5AC433F5
	for <buildroot@archiver.kernel.org>; Mon, 21 Feb 2022 03:38:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9994A404EE;
	Mon, 21 Feb 2022 03:38:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PYEh82PfJHah; Mon, 21 Feb 2022 03:38:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 827AC404EC;
	Mon, 21 Feb 2022 03:38:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7383B1BF386
 for <buildroot@lists.busybox.net>; Mon, 21 Feb 2022 03:38:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 59AAB404EC
 for <buildroot@lists.busybox.net>; Mon, 21 Feb 2022 03:38:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZaSEn64UH41p for <buildroot@lists.busybox.net>;
 Mon, 21 Feb 2022 03:38:35 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from Atcsqr.andestech.com (atcsqr.andestech.com [60.248.187.195])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1A514404D7
 for <buildroot@buildroot.org>; Mon, 21 Feb 2022 03:38:34 +0000 (UTC)
Received: from mail.andestech.com (ATCPCS16.andestech.com [10.0.1.222])
 by Atcsqr.andestech.com with ESMTP id 21L3cKvD054125;
 Mon, 21 Feb 2022 11:38:20 +0800 (+08)
 (envelope-from peterlin@andestech.com)
Received: from APC323 (10.0.12.98) by ATCPCS16.andestech.com (10.0.1.222) with
 Microsoft SMTP Server id 14.3.498.0; Mon, 21 Feb 2022 11:38:20 +0800
Date: Mon, 21 Feb 2022 11:37:26 +0800
From: Yu Chien Peter Lin <peterlin@andestech.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <YhMI2gtO4W/g5qhv@APC323>
References: <20220215053327.4046-1-peterlin@andestech.com>
 <b7e77527-b4a2-e0ea-90d9-eebc08a9ac62@benettiengineering.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b7e77527-b4a2-e0ea-90d9-eebc08a9ac62@benettiengineering.com>
User-Agent: Mutt/2.1.4 (93ef06ae) (2021-12-11)
X-Originating-IP: [10.0.12.98]
X-DNSRBL: 
X-MAIL: Atcsqr.andestech.com 21L3cKvD054125
Subject: Re: [Buildroot] [PATCH v3 1/3] board/andes: rearrange nds32 folder
 structure
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
Cc: alankao@andestech.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Giulio,

On Thu, Feb 17, 2022 at 04:55:49PM +0100, Giulio Benetti wrote:
> Hi Peter,
> 
> On 15/02/22 06:33, Yu Chien Peter Lin wrote:
> > Rearrange nds32 folder structure to add AE350 platform.
> > 
> > Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
> > Signed-off-by: Alan Kao <alankao@andestech.com>
> > ---
> >   .../patches/linux/0001-nds32-Fix-boot-messages-garbled.patch    | 0
> >   ...2-scripts-dtc-Remove-redundant-YYLOC-global-declaratio.patch | 0
> >   board/andes/{ => ae3xx}/readme.txt                              | 0
> >   configs/andes_ae3xx_defconfig                                   | 2 +-
> >   4 files changed, 1 insertion(+), 1 deletion(-)
> >   rename board/andes/{ => ae3xx}/patches/linux/0001-nds32-Fix-boot-messages-garbled.patch (100%)
> >   rename board/andes/{ => ae3xx}/patches/linux/0002-scripts-dtc-Remove-redundant-YYLOC-global-declaratio.patch (100%)
> >   rename board/andes/{ => ae3xx}/readme.txt (100%)
> 
> Here we have both:
> board/andes/ae3xx
> and
> board/andes/ae350
> 
> ae3xx should be use for every ae3xx family(ae350 included), but for ae350
> you use a specific folder.
> What I see digging into ae3xx is that it is for FPGA demonstration, so I
> would move ae3xx directory to be name as ae3xx-fpga. Otherwise I would
> expect ae350(and newer parts) to be part of ae3xx.
> 
> Same goes for the defconfig, I would name it like:
> andes_ae3xx_fpga_defconfig
> 
> This way we can divide the 2 typologies:
> - fpga demonostration for ae3xx
> - ae3xx SoC family
> 
> Otherwise you should provide a single family folder(ae3xx) compatible for
> both fpgas and SoCs.
> 
> Thank you
> 
> Best regards
> -- 
> Giulio Benetti
> Benetti Engineering sas

For this naming issue, we decide to make ae3xx
explicit to have these two platform residing
in its own folder. So it would be:

board/andes/
 |- {ae3xx => ae300}/
 `- ae350/

If this make sense to you, I will submit PATCH v4.

Thanks,
Yu Chien Peter Lin
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
