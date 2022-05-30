Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 290D4C433F5
	for <buildroot@archiver.kernel.org>; Mon, 30 May 2022 19:06:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BF6F440AEA;
	Mon, 30 May 2022 19:06:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CtrXjdnWvhgB; Mon, 30 May 2022 19:06:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DB24040A63;
	Mon, 30 May 2022 19:06:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 498FB1BF2AB
 for <buildroot@lists.busybox.net>; Mon, 30 May 2022 19:06:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 37E5960FCF
 for <buildroot@lists.busybox.net>; Mon, 30 May 2022 19:06:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VN3JivNISGiN for <buildroot@lists.busybox.net>;
 Mon, 30 May 2022 19:06:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1120860B04
 for <buildroot@buildroot.org>; Mon, 30 May 2022 19:06:19 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 1F643240003;
 Mon, 30 May 2022 19:06:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1653937577;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YpDSie1+EyYtgK1sdtLv9fBKIWzQHbCjP2b4MmBsYOA=;
 b=iAvfhbOsH9HY5P35OccJv8FZk+1pp/HLYKt1GYzYllFW4aIdKWyzV4nOzKq38kKAgQvdp5
 uE7//wRtcLLkYklE9Wz/BZ5u6yIxtS+3+TbodjK4y/sz1DcVjAPdgVDa2/sbO4l6FxOIw6
 Ane4oYXMvgJyXOBMCgSOyvUYkZL2QtTwLb9ghJ6YuLKbQbxeyCvwlgjFJ78uSp2NsKdkQ3
 nq0YwRXBQMeTIZ5h+vJH0vL1AATuSgZqgp5NAXJlw3bG92Da+BVN7BbcJRcGDj4Ik8+Ldi
 ptcrkSO1qMkodhEt9k5STNIyYI1wh0ktkXV4QgOHL2YywXOsWjKVkIcHrHhbFA==
Date: Mon, 30 May 2022 21:06:15 +0200
To: Damien Le Moal via buildroot <buildroot@buildroot.org>
Message-ID: <20220530210615.3a4976c7@windsurf>
In-Reply-To: <20220530033836.474926-3-damien.lemoal@opensource.wdc.com>
References: <20220530033836.474926-1-damien.lemoal@opensource.wdc.com>
 <20220530033836.474926-3-damien.lemoal@opensource.wdc.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2 02/11] package: elf2flt: Update RISC-V
 64-bits support
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Niklas Cassel <Niklas.Cassel@wdc.com>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 Alistair Francis <alistair@alistair23.me>, "Yann E
 . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 30 May 2022 12:38:27 +0900
Damien Le Moal via buildroot <buildroot@buildroot.org> wrote:

> From: Damien Le Moal <damien.lemoal@wdc.com>
> 
> Remove the old elf2flt 0002-elf2flt-add-riscv-64-bits-support.patch
> patch file for riscv64 architecture and replace it with 3 patches:
> 
> (1) The first patch fixes the data section alignment
> (2) The second patch fixes a bug with the handling of the eh_frame
>     section causing text and data section overlap problems.
> (3) The third patch adds a simpler riscv64 flat bin relocation support.
> 
> These 3 patches are submitted to the upstream elf2flt project as pull
> request #22:
> 
> https://github.com/uclinux-dev/elf2flt/pull/22
> 
> Signed-off-by: Niklas Cassel <niklas.cassel@wdc.com>
> Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
> ---
>  ...tate-32-byte-alignment-for-.data-sec.patch | 81 +++++++++++++++++++
>  ...f2flt-fix-.eh_frame-section-handling.patch | 73 +++++++++++++++++
>  ...4-elf2flt-add-riscv-64-bits-support.patch} | 80 +++++++-----------
>  3 files changed, 181 insertions(+), 53 deletions(-)
>  create mode 100644 package/elf2flt/0002-elf2flt.ld-reinstate-32-byte-alignment-for-.data-sec.patch
>  create mode 100644 package/elf2flt/0003-elf2flt-fix-.eh_frame-section-handling.patch
>  rename package/elf2flt/{0002-elf2flt-add-riscv-64-bits-support.patch => 0004-elf2flt-add-riscv-64-bits-support.patch} (52%)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
