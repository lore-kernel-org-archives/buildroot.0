Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 597DDC433EF
	for <buildroot@archiver.kernel.org>; Tue, 26 Jul 2022 13:21:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D841641BBC;
	Tue, 26 Jul 2022 13:21:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D841641BBC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YV5wbZTLztF8; Tue, 26 Jul 2022 13:21:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7CFDA419C9;
	Tue, 26 Jul 2022 13:21:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7CFDA419C9
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7B85E1BF2B4
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 13:21:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 456B2419C9
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 13:21:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 456B2419C9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DYd_qQaAIoGc for <buildroot@lists.busybox.net>;
 Tue, 26 Jul 2022 13:21:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B0D1041997
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B0D1041997
 for <buildroot@buildroot.org>; Tue, 26 Jul 2022 13:21:11 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 715991BF204;
 Tue, 26 Jul 2022 13:21:09 +0000 (UTC)
Date: Tue, 26 Jul 2022 15:21:08 +0200
To: Alexey Brodkin via buildroot <buildroot@buildroot.org>
Message-ID: <20220726152108.3470eb7d@windsurf>
In-Reply-To: <IA1PR12MB62107029D82ADA688CF7C210A18F9@IA1PR12MB6210.namprd12.prod.outlook.com>
References: <20220717200407.1400318-1-thomas.petazzoni@bootlin.com>
 <IA1PR12MB62105EDFE310AD93A55A33B6A18D9@IA1PR12MB6210.namprd12.prod.outlook.com>
 <20220718091350.4b968717@windsurf>
 <IA1PR12MB62107029D82ADA688CF7C210A18F9@IA1PR12MB6210.namprd12.prod.outlook.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658841670;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SSLsIZLwNXu0rGu8y7sJedl0SwswitjnGo1Bm6bnHOM=;
 b=EQAYyfRqfSuZ74Qs/zdNiGp9el2Z4/83appj5SSb5zvSS3UtCfh85BU0QBEBZsM9Phf6te
 gpBc07N9ez2dGLMwWTLUFg7HRCRY4frQH5hFIcz0wqWO9XGpVukbw0U/0b9oJxxzl1einw
 vVC3gIgEFTE2IpW+YQSYnc8drXwWFevQZdIeFd4E1evTNDwwdu5/lZOlirxUjr4vIltb/X
 U5nmP/GTKLi1R84kOMKlZ6NIYSXqEiYBATehHLOeMZQKMwe0QX6LbNoQ8c1zFDGI5gPL+X
 QkkFc27W1fVwt1tcvW59ywToDSx0ASQsqAvFQFwT0zdtRw/T4QAO/CDjsZb5+Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=EQAYyfRq
Subject: Re: [Buildroot] [arc-buildroot] [PATCH] arch: remove support for
 BR2_ARC_PAGE_SIZE_4K
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
Cc: Alexey Brodkin <Alexey.Brodkin@synopsys.com>,
 ARC Maintainers <arc-buildroot@synopsys.com>,
 Claudiu Zissulescu <Claudiu.Zissulescu@synopsys.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Alexey,

On Tue, 19 Jul 2022 18:20:25 +0000
Alexey Brodkin via buildroot <buildroot@buildroot.org> wrote:

> So that seems to be a good catch indeed.
> 
> 1. In older GNU LD such a check doesn't exist and so LD never craps out.
>    And here I mean the latest ARC Binutils ("arc-2020.09-release"), which are based
>    on upstream v2.35. Thus if building with 4KiB pages but ARC Binutils,
>    the problem is not seen. I'm sure even built that way binaries work perfectly
>    fine as I do remember trying it not that long ago myself.
>    
>    BTW that pre-defined "common-page-size" comes from GCC actually, see
>    https://gcc.gnu.org/git/?p=gcc.git;a=blob;f=gcc/config/arc/linux.h;h=0f1ff055be757ad1483910fc4918e7fef7fe4d5e;hb=1ea978e3066ac565a1ec28a96a4d61eaf38e2726#l48

OK.

> 2. And in case of building for ARCv3 processors we don't mess with "page-size"
>    stuff in the "LINK_SPEC", see https://github.com/foss-for-synopsys-dwc-arc-processors/gcc/blob/arc64/gcc/config/arc64/linux32.h#L26

OK, but I don't really see the relationship.

> That said I'd like to get our GCC & Binutils maintainer input on what needs
> to be done with these "page-size" options in the "LINK_SPEC".
> 
> Maybe with use of up-to-date Binutils those default values are no longer needed?

Why no longer needed? Of course is you change the page size, you need
to pass some options to the linker so that it can place sections and
define load addresses (and other related stuff) accordingly.

> Or we may keep default "max" value and then not explicitly set outside "common"
> value will be adjusted as needed automatically.

I don't understand what you mean here. Today, we are setting
max-page-size, and that doesn't work because the common-page-size value
is higher. As I mentioned in my initial patch, passing
-Wl,-z,max-page-size=4096 (already done) and
-Wl,-z,common-page-size=4096 would most likely fix the error, but I
wasn't sure it was the correct thing to do.

Do you have more feedback from your GCC and binutils maintainer perhaps?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
