Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE27BC433EF
	for <buildroot@archiver.kernel.org>; Mon, 25 Jul 2022 06:36:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4729F83F0E;
	Mon, 25 Jul 2022 06:36:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4729F83F0E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id E-lBjGzf2kN4; Mon, 25 Jul 2022 06:36:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3BED583EBF;
	Mon, 25 Jul 2022 06:36:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3BED583EBF
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4A1971BF38C
 for <buildroot@lists.busybox.net>; Mon, 25 Jul 2022 06:36:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 21860417A8
 for <buildroot@lists.busybox.net>; Mon, 25 Jul 2022 06:36:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 21860417A8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kLipSQb2KiG9 for <buildroot@lists.busybox.net>;
 Mon, 25 Jul 2022 06:36:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6AA1C417A4
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6AA1C417A4
 for <buildroot@buildroot.org>; Mon, 25 Jul 2022 06:36:43 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 8C0256000C;
 Mon, 25 Jul 2022 06:36:39 +0000 (UTC)
Date: Mon, 25 Jul 2022 08:36:38 +0200
To: Nicolas Tran <nicolas.tran@smile.fr>
Message-ID: <20220725083638.6f14624a@windsurf>
In-Reply-To: <20220519082800.926607-1-nicolas.tran@smile.fr>
References: <20220519082800.926607-1-nicolas.tran@smile.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658731000;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6dhBFFcXm19sxp2tkq1zDl2UUOuuvbfuwVVRxRGqb00=;
 b=L+0FuzSiPXch77Jg+xujoTm8+l71WZdbCQqeadrOiyJodbniLd/6YPVvYm7pd/QCnQSIW/
 thJdVIRusvDoRyp6/heuEKRKFqejxOR0X1W3USBBu+TYV9TW4/ce7jJc7OrKiGCI3DPjHt
 fCccILmCQHjX5ii9T3HednRkT5w+KtcIszxW/kZhKiQetjkJSJyMQNfmgZgXl66C5M4WjJ
 c5lulLmkALMEQiMTsP3pawe5rmUbJoNCX79DmV+MbFLMcn5GN1I16IzMV9Mokoh4Rl3kE1
 MQsNRG6D7JQPA4vG8kyiXrCqYP5QNLqTS7MZTZYB3gEr5beS0KVvSQXtNBEkNw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=L+0FuzSi
Subject: Re: [Buildroot] [PATCH 1/1] package/hyperfine: new package
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Romain Naour <romain.naour@smile.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Thu, 19 May 2022 10:28:00 +0200
Nicolas Tran <nicolas.tran@smile.fr> wrote:

> hyperfine is a benchmark tool written in Rust. It evaluates
> execution time of a command passed in arguments and make
> a relative comparison if multiple arguments are used at the
> same time.
> It can be convinient for purposes of Rust-written systems as
> it runs in a stable version of Rust.
> 
> The package has been checked with correct formatting and
> without typos:
> ./utils/check-package package/hyperfine/*
> 
> A CI test was run on gitlab.com to verify toolchain compatibilities.
> 
> Signed-off-by: Nicolas Tran <nicolas.tran@smile.fr>
> ---
> test-pkg config:
> BR2_PACKAGE_HYPERFINE=y
> ---
>  package/Config.in                |  1 +
>  package/hyperfine/Config.in      | 11 +++++++++++
>  package/hyperfine/hyperfine.hash |  4 ++++
>  package/hyperfine/hyperfine.mk   | 12 ++++++++++++
>  4 files changed, 28 insertions(+)
>  create mode 100644 package/hyperfine/Config.in
>  create mode 100644 package/hyperfine/hyperfine.hash
>  create mode 100644 package/hyperfine/hyperfine.mk

Thanks a lot, I've applied your patch, after fixing two minor issues:

 - An entry in the DEVELOPERS file was missing, so I've added it

 - There were some trailing white space in Config.in, which were
   reported by check-package, so I was surprised to read in your commit
   log that you had no check-package warning. Anyway, I fixed this up
   as well.

Thanks for your contribution!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
