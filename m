Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86CD0EEAA6E
	for <buildroot@archiver.kernel.org>; Thu, 14 Sep 2023 20:33:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1CA1461036;
	Thu, 14 Sep 2023 20:33:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1CA1461036
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UDX5Lpw7qaca; Thu, 14 Sep 2023 20:33:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4D9A060A4F;
	Thu, 14 Sep 2023 20:33:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4D9A060A4F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AA7111BF3E3
 for <buildroot@lists.busybox.net>; Thu, 14 Sep 2023 20:33:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9086E80EEC
 for <buildroot@lists.busybox.net>; Thu, 14 Sep 2023 20:33:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9086E80EEC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HlfRNf2XJj_1 for <buildroot@lists.busybox.net>;
 Thu, 14 Sep 2023 20:33:44 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3A47680EB0
 for <buildroot@buildroot.org>; Thu, 14 Sep 2023 20:33:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3A47680EB0
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5C6EE1BF209;
 Thu, 14 Sep 2023 20:33:40 +0000 (UTC)
Date: Thu, 14 Sep 2023 22:33:39 +0200
To: Niklas Cassel via buildroot <buildroot@buildroot.org>
Message-ID: <20230914223339.5ee8e854@windsurf>
In-Reply-To: <20230912110420.1111238-1-niklas.cassel@wdc.com>
References: <20230912110420.1111238-1-niklas.cassel@wdc.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1694723621;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aexHucq/FjZpsQPbw8oTlFESTA+MUyBRsK0zHWB2+QQ=;
 b=awrI4gnurdiyPSX6FUvlWwqEn519HU9ZAYTI8VBUmj88asTCbNPfBkerIqdNYtBZhLEXpI
 LVg6kdb+3h/CTDmZQb+DSoCccgjK/DYI6b0byPGkS68gL30zmGhm1VEoCoGf7HYWR5JCTD
 qP+ttkezYKsllyH67SFxHilgxJ4Gftop6dGy/QcHIfPSojci9n/K8uPFODNJ7d3J4i77np
 Ah4XJhVJtCWOEAXzGoPLLSugzFgAb1XUSbqlGSeoijE6v9mwXFIv5ZI5NRMGZPWsseTNjt
 GlXjYduXAEXLmBR+x1ccItNVzWvQlPaVxmH6w8kbcOfiY1Pvtk52IqFDSmkw/A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=awrI4gnu
Subject: Re: [Buildroot] [PATCH] package/elf2flt: update to version 2023.09
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
Cc: Greg Ungerer <gregungerer@westnet.com.au>,
 Niklas Cassel <niklas.cassel@wdc.com>, Damien Le Moal <Damien.LeMoal@wdc.com>,
 Waldemar Brodkorb <mail@waldemar-brodkorb.de>,
 Jesse T <mr.bossman075@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 12 Sep 2023 13:04:20 +0200
Niklas Cassel via buildroot <buildroot@buildroot.org> wrote:

> Several of our patches have been accepted upstream and are included in
> elf2flt version 2023.09.
> 
> Patch 0001-elf2flt-handle-binutils-2.34.patch is upstream as of commit
> c70b9f208979 ("elf2flt: handle binutils >= 2.34").
> 
> Patch 0002-elf2flt.ld-reinstate-32-byte-alignment-for-.data-sec.patch is
> upstream as of commit 679c94adf27c ("elf2flt.ld: reinstate 32 byte
> alignment for .data section").
> 
> Patch 0003-elf2flt-add-riscv-64-bits-support.patch is upstream as of
> commit c5c8043c4d79 ("elf2flt: add riscv 64-bits support").
> 
> Patch 0008-riscv64-add-more-relocations-required-to-be-handled.patch was
> squashed into upstream commit c5c8043c4d79 ("elf2flt: add riscv 64-bits
> support") during upstreaming.
> 
> Patch 0006-xtensa-fix-text-relocations.patch is upstream as of commit
> 26dfb54a59c8 ("elf2flt: xtensa: fix text relocations").
> 
> Patch 0007-elf2flt-remove-use-of-BFD_VMA_FMT.patch is upstream as of
> commit a36df7407d9e ("elf2flt: remove use of BFD_VMA_FMT").
> 
> Patch 0004-elf2flt-create-a-common-helper-function.patch simply added
> a helper function to make the changes in the follow-up patch
> 0005-elf2flt-fix-fatal-error-regression-on-m68k-xtensa-ri.patch
> less intrusive.
> 
> Patch 0005-elf2flt-fix-fatal-error-regression-on-m68k-xtensa-ri.patch
> is no longer needed as upstream has reverted the commit that necessitated
> this patch, see upstream commit 35c692ca4546 ("Revert "elf2flt: fix for
> segfault on some ARM ELFs""). The problem that the reverted upstream patch
> solved is now instead solved by the combination of upstream commits
> 7a59b265c2dc ("Revert "elf2flt: fix relocations for read-only data"") and
> a934fb42cf59 ("elf2flt: force ARM.exidx section into text").
> 
> Signed-off-by: Niklas Cassel <niklas.cassel@wdc.com>
> ---
> Resending from an email address that is subscribed to the buildroot
> mailing list, since my previous mail got rejected.

Amazing to see that we're down to 0 patches against elf2flt. Thanks for
doing this, and thanks for the testing. Just the update of the
.checkpackageignore file was missing, so I did that when applying.
Thanks again!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
