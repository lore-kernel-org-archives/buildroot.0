Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B9B4C001DB
	for <buildroot@archiver.kernel.org>; Mon, 14 Aug 2023 14:40:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F216F61092;
	Mon, 14 Aug 2023 14:40:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F216F61092
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 741_yFUgcem6; Mon, 14 Aug 2023 14:40:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3435761084;
	Mon, 14 Aug 2023 14:39:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3435761084
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 318431BF385
 for <buildroot@lists.busybox.net>; Mon, 14 Aug 2023 14:39:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F1F52814B6
 for <buildroot@lists.busybox.net>; Mon, 14 Aug 2023 14:39:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F1F52814B6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FnlKr9uwNXMN for <buildroot@lists.busybox.net>;
 Mon, 14 Aug 2023 14:39:53 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 048A381465
 for <buildroot@buildroot.org>; Mon, 14 Aug 2023 14:39:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 048A381465
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0E3781BF206;
 Mon, 14 Aug 2023 14:39:48 +0000 (UTC)
Date: Mon, 14 Aug 2023 16:39:46 +0200
To: Yu Chien Peter Lin <peterlin@andestech.com>
Message-ID: <20230814163946.5bc5e75d@windsurf>
In-Reply-To: <20230814024834.11369-2-peterlin@andestech.com>
References: <20230814024834.11369-1-peterlin@andestech.com>
 <20230814024834.11369-2-peterlin@andestech.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1692023990;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iNp4Ta2WuMg+UpyA7vQ6O8v6KvszCNQz4hC7xwwIITU=;
 b=NU3hBGnc1GwtBj9eBn0DRZAD4Wq2f2KjcPHmezRPPIJRsRBJeSA5ezLewJKp5vow5qJt6f
 tJ5gRd0613YwB5hMbfb66FkC2NQZFX7HycdBEc2IK2HanzCZVbvc/pUtNSGqbm7UDr2HG8
 tDvbnpF7qXg3mFShWvnnxn3vVe7kwHyC/5R/BGOyPQnrxSI3SBu29Xhf6Af8JfkmR1qLMj
 MxD1HC4MkW9imajNVi+sfUK4yxFEZpcL7wvB08SxHBiVxgEasMJ/qmCERgLuEg0N9rzFvu
 rsv2UYp0HvNQawkeKKJ3B02sCWQeoWoV1AKEpJl4GpdpdgzjpTIBTYuVMFjzaA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=NU3hBGnc
Subject: Re: [Buildroot] [PATCH 2/2] configs/andes_ae350_45: Select RVA for
 AE350 platform
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
Cc: ycliang@andestech.com, kilian.zinnecker@mail.de, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 14 Aug 2023 10:48:34 +0800
Yu Chien Peter Lin <peterlin@andestech.com> wrote:

> The BR2_PACKAGE_GLIBC_ARCH_SUPPORTS requires the RVA extension,
> so we select it to enable and use glibc by default.

Thanks for the patch. However, the commit log is not a proper
justification. Indeed, BR2_RISCV_ISA_CUSTOM_RVA should be enabled if
the hardware supports it, not because glibc needs it. If glibc needs
it, but the hardware doesn't support this instruction set extension, it
doesn't make sense to enable it.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
