Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53623E8B37C
	for <buildroot@archiver.kernel.org>; Tue,  3 Feb 2026 22:52:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1891E40759;
	Tue,  3 Feb 2026 22:52:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e9jDuIiA2qoV; Tue,  3 Feb 2026 22:52:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3CA6240780
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770159127;
	bh=xTqMtMbHuyWXcKbE2q6RqvdRx6v7heOZd+MsvnSrgzE=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=HW+NWTqxsAsH04kH7+G8maaK4y+Q4PrkRWvYQ1BvbnKZKPJ0LfV491VIgCsE7SxEO
	 dSHSDW9r1rpeKLfZrN5BA8ZsFXwUfwlodR+iWBTRRy70AGS/4CSMCK2p157wPpyR5r
	 JHaokGOTXKMbozyZ0KbakFGU84Ferbrp/PO8teELhMErIJoEyTdPYH6raihKhp7e7k
	 fjnZhB2VgWA04z9nrxnsIva07aX1fQUw4rREd5ieYt90gGRzSnAI650Nan0h7sj2hj
	 CM6AM+IiHtoZE8CfNj5RjIQ0g9fdoXpNW6G9hFpM1ts1l6XXvCCmzRiEISahAwICBs
	 w5L097c2mEkmQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3CA6240780;
	Tue,  3 Feb 2026 22:52:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7AF7E13D
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 22:52:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 707CF40781
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 22:52:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id reuS3eE3l7XR for <buildroot@buildroot.org>;
 Tue,  3 Feb 2026 22:52:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 73DC240780
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 73DC240780
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 73DC240780
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 22:52:03 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 797111A2BCE
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 22:52:01 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 3E25160728;
 Tue,  3 Feb 2026 22:52:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 5434E119A8888; Tue,  3 Feb 2026 23:52:00 +0100 (CET)
Date: Tue, 3 Feb 2026 23:51:59 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
Message-ID: <aYJ7ap2sv4o4DSkR@windsurf>
References: <20251018181602.1756789-1-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251018181602.1756789-1-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1770159120; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 in-reply-to:references; bh=LqC3JjAHGg/7dlyxK7nBb43p/J7jowTdA+CBKSx1BmQ=;
 b=kiejcoEv6n00YolSQBfUfo0EemOh6aIzVB+aIfds5nO1dmRCan3Xh62d+uHtqe1gdnCLWs
 HKlHXTNHbIof/SvqHiEcMF7pTxnpYTnNps0kz6Dfqbjg4EN+Zfxo8nol5WyvrmaiOKXFPu
 UelxPPaGtgT0iqybCOZ0etzbK9wdqEzmd07tAeWxYXm683RdF8qYerZfdjvI5fR3Vr9Nz7
 mBbln+kjyH4ly8eFose+JkbGi41LRaS7eTk8xIogn0xQkmpS5d+bpMxrheYU3TsVzR58oT
 zRjaN3Sz0R7ZP/+7z9k4AP/X+2I5FUofa0s+O+4cHEA8Wjv04EFFH91auB1gag==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=kiejcoEv
Subject: Re: [Buildroot] [PATCH 1/1] package/dahdi-linux: bump version
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, Oct 18, 2025 at 08:16:02PM +0200, Bernd Kuhls wrote:
> While trying to fix build errors with version 3.3.0 and newer kernels
> some of the upstream patches could not be applied neither to the version
> currently provided by buildroot nor 3.4.0 without backporting.

[...]

Thanks for the patch, but unfortunately it doesn't work, and I believe
we have to remove this package as it cannot be fixed I believe.

It fails to build with:

ERROR: modpost: "crc_ccitt_table" [dahdi.ko] undefined!
ERROR: modpost: "crc_ccitt_table" [wctdm24xxp/wctdm24xxp.ko] undefined!

This shouldn't happen because we do have:

define DAHDI_LINUX_LINUX_CONFIG_FIXUPS
	$(call KCONFIG_ENABLE_OPT,CONFIG_CRC_CCITT)
endef

but the trick is that since Linux 6.15, lib/crc/ has been
significantly rewritte, and CONFIG_CRC_CCITT is now a blind option, so
we can't enable it anymore. The only way to enable it is to select
it... but that requires drivers that are in-tree. I've tried to find
another kernel option that selects CONFIG_CRC_CCITT, but none of the
ones that select it look generic enough to be used as a workaround to
get CONFIG_CRC_CCITT. So I'm tempted to say that we should remove
dahdi-linux. It is badly maintained, and should have been upstreamed
into the Linux kernel.

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
