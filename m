Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83EA6C433F5
	for <buildroot@archiver.kernel.org>; Tue, 11 Jan 2022 20:13:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 40E6160EC5;
	Tue, 11 Jan 2022 20:13:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NKTB_sex3pwc; Tue, 11 Jan 2022 20:13:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 98AC160EB3;
	Tue, 11 Jan 2022 20:13:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E60401BF239
 for <buildroot@lists.busybox.net>; Tue, 11 Jan 2022 20:13:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D4F6B414CA
 for <buildroot@lists.busybox.net>; Tue, 11 Jan 2022 20:13:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Y6f-IfXKzg72 for <buildroot@lists.busybox.net>;
 Tue, 11 Jan 2022 20:13:19 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::231])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6E095414C8
 for <buildroot@buildroot.org>; Tue, 11 Jan 2022 20:13:19 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id 2E028100006;
 Tue, 11 Jan 2022 20:13:16 +0000 (UTC)
Date: Tue, 11 Jan 2022 21:13:16 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Yu Chien Peter Lin <peterlin@andestech.com>
Message-ID: <20220111211316.7f94cb45@windsurf>
In-Reply-To: <20220111035859.12895-1-peterlin@andestech.com>
References: <20220111035859.12895-1-peterlin@andestech.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/2] board/andes: rearrange nds32 folder
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
Cc: Alan Kao <alankao@andestech.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Yu,

On Tue, 11 Jan 2022 11:58:58 +0800
Yu Chien Peter Lin <peterlin@andestech.com> wrote:

> Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
> Signed-off-by: Alan Kao <alankao@andestech.com>
> ---
>  .../patches/linux/0001-nds32-Fix-boot-messages-garbled.patch    | 0
>  board/andes/{ => ae3xx}/readme.txt                              | 0
>  configs/andes_ae3xx_defconfig                                   | 2 +-
>  3 files changed, 1 insertion(+), 1 deletion(-)
>  rename board/andes/{ => ae3xx}/patches/linux/0001-nds32-Fix-boot-messages-garbled.patch (100%)
>  rename board/andes/{ => ae3xx}/readme.txt (100%)

Thanks for your patch. However, I am a bit confused, because after your
two patches, we will have:

	board/andes/ae3xx/	=> the NDS32 platform
	board/andes/ae350/	=> the RISC-V platform

but the ae3xx wildcard matches ae350, so it feels really odd.

Could you clarify?

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
