Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CB39C433FE
	for <buildroot@archiver.kernel.org>; Mon, 21 Nov 2022 21:05:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 83F62410A4;
	Mon, 21 Nov 2022 21:05:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 83F62410A4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nmgHDUDO0-CC; Mon, 21 Nov 2022 21:05:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8B66F4109F;
	Mon, 21 Nov 2022 21:05:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8B66F4109F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5D03D1BF34D
 for <buildroot@lists.busybox.net>; Mon, 21 Nov 2022 21:05:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4586E403A2
 for <buildroot@lists.busybox.net>; Mon, 21 Nov 2022 21:05:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4586E403A2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jgv9cDQz1WID for <buildroot@lists.busybox.net>;
 Mon, 21 Nov 2022 21:05:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0FCA2402F5
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0FCA2402F5
 for <buildroot@buildroot.org>; Mon, 21 Nov 2022 21:05:25 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id BE9CB100006;
 Mon, 21 Nov 2022 21:05:22 +0000 (UTC)
Date: Mon, 21 Nov 2022 22:05:21 +0100
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20221121220521.6d7d7530@windsurf>
In-Reply-To: <20221117194505.949846-1-giulio.benetti@benettiengineering.com>
References: <20221117194505.949846-1-giulio.benetti@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1669064723;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=swRf7JWCwIlzYabHdN9cAaGfqkRqchTqeeLOCNYCSVM=;
 b=PCmbSWHf0XcWd+x//a0H0DcPWAFktU+niIrjw3SgpFGPfwyl4Hj9HJZWEUfFm93LsHMFUe
 m+5OLghspQPd4SICSRZB0XzJZ7T49lSAHuyxfx3oy0DG0vDmXlGwfAZSyJ27kVwoXzjHXs
 LI0cRidMv2TxAHIXP6QiHannxFgm845jz2T6D6hKb6Fuyz7nWp4SZDHP8GymPFN6jpCvpC
 YsN2TLhQM28TKVk4GNhoyCNp9GdF2t9+xypSlAK1av7xJYXFVSIp/bAcBIogHpMEPCoTyt
 ttwnfk3VTJCOspWa/C4NOAOpcbqkVP0K9Mtp7//dYfaIi56+aqyn/1WmFmTa3w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=PCmbSWHf
Subject: Re: [Buildroot] [PATCH] package/libnss: fix build failure with make
 4.3.91
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 17 Nov 2022 20:45:05 +0100
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> Make 4.3.91 doesn't allow to safely override Simple Expanded Variables, so
> let's add a patch pending upstream[0] to make those variable Conditional
> Expanded.
> 
> [0]: https://bugzilla.mozilla.org/show_bug.cgi?id=1801182
> 
> Fixes:
> http://autobuild.buildroot.net/results/1074143dbea60567cd83be0a23f7c0214d470de9/
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>  ...w-overriding-OS_ARCH-OS_TEST-and-OS_.patch | 45 +++++++++++++++++++
>  1 file changed, 45 insertions(+)
>  create mode 100644 package/libnss/0001-Bug-1801182-Allow-overriding-OS_ARCH-OS_TEST-and-OS_.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
