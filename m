Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD2A7C001B0
	for <buildroot@archiver.kernel.org>; Tue, 15 Aug 2023 01:11:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1D44160EA7;
	Tue, 15 Aug 2023 01:11:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1D44160EA7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4Crvq334oItN; Tue, 15 Aug 2023 01:11:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6874360E96;
	Tue, 15 Aug 2023 01:11:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6874360E96
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B9AB11BF312
 for <buildroot@lists.busybox.net>; Tue, 15 Aug 2023 01:10:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8B95140600
 for <buildroot@lists.busybox.net>; Tue, 15 Aug 2023 01:10:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8B95140600
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tef1DyZhkqYt for <buildroot@lists.busybox.net>;
 Tue, 15 Aug 2023 01:10:58 +0000 (UTC)
Received: from Atcsqr.andestech.com (60-248-80-70.hinet-ip.hinet.net
 [60.248.80.70])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0E6824020B
 for <buildroot@buildroot.org>; Tue, 15 Aug 2023 01:10:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0E6824020B
Received: from mail.andestech.com (ATCPCS16.andestech.com [10.0.1.222])
 by Atcsqr.andestech.com with ESMTP id 37F1AkSE013014;
 Tue, 15 Aug 2023 09:10:46 +0800 (+08)
 (envelope-from peterlin@andestech.com)
Received: from APC323 (10.0.12.98) by ATCPCS16.andestech.com (10.0.1.222) with
 Microsoft SMTP Server id 14.3.498.0; Tue, 15 Aug 2023 09:10:42 +0800
Date: Tue, 15 Aug 2023 09:10:39 +0800
From: Yu-Chien Peter Lin <peterlin@andestech.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <ZNrQj9u0v_PVxKEe@APC323>
References: <20230814024834.11369-1-peterlin@andestech.com>
 <20230814024834.11369-2-peterlin@andestech.com>
 <20230814163946.5bc5e75d@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230814163946.5bc5e75d@windsurf>
User-Agent: Mutt/2.2.10 (2023-03-25)
X-Originating-IP: [10.0.12.98]
X-DNSRBL: 
X-MAIL: Atcsqr.andestech.com 37F1AkSE013014
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
Cc: ycliang@andestech.com, kilian.zinnecker@mail.de, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, Aug 14, 2023 at 04:39:46PM +0200, Thomas Petazzoni wrote:
> On Mon, 14 Aug 2023 10:48:34 +0800
> Yu Chien Peter Lin <peterlin@andestech.com> wrote:
> 
> > The BR2_PACKAGE_GLIBC_ARCH_SUPPORTS requires the RVA extension,
> > so we select it to enable and use glibc by default.
> 
> Thanks for the patch. However, the commit log is not a proper
> justification. Indeed, BR2_RISCV_ISA_CUSTOM_RVA should be enabled if
> the hardware supports it, not because glibc needs it. If glibc needs
> it, but the hardware doesn't support this instruction set extension, it
> doesn't make sense to enable it.

No problem, will reword properly in the next patch.
Thanks!

Peter Lin

> Thomas
> -- 
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
