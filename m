Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DACB7C433FE
	for <buildroot@archiver.kernel.org>; Sat,  5 Nov 2022 21:32:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8CE0F60B2B;
	Sat,  5 Nov 2022 21:32:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8CE0F60B2B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SpkLyueLrJJd; Sat,  5 Nov 2022 21:32:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B59CB60AEF;
	Sat,  5 Nov 2022 21:32:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B59CB60AEF
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0449D1BF283
 for <buildroot@lists.busybox.net>; Sat,  5 Nov 2022 21:32:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E0D504032A
 for <buildroot@lists.busybox.net>; Sat,  5 Nov 2022 21:32:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E0D504032A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6Zuz17nLAKxO for <buildroot@lists.busybox.net>;
 Sat,  5 Nov 2022 21:32:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6D508400D9
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6D508400D9
 for <buildroot@buildroot.org>; Sat,  5 Nov 2022 21:32:03 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 7AB08240003;
 Sat,  5 Nov 2022 21:32:00 +0000 (UTC)
Date: Sat, 5 Nov 2022 22:31:58 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20221105223158.33f2ed84@windsurf>
In-Reply-To: <20221105205239.300732-1-fontaine.fabrice@gmail.com>
References: <20221105205239.300732-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1667683920;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WeDq+b03Iw5PsH/WZMk+0VLjwhtlnpTHa+eG+iR77Ms=;
 b=Y/OKNTRspuQYBNT+gX6SfTwTRt/iEMiIL8NtAgCBZoNRjDh4kDmUq0bAuUtVdZWzODlI67
 WAs+cLglJzrVvs7WWtMOCFSem+aRAhwnHNsjPBdaSpFPVsLoPuYPo0LO0OrOatoMIQDzY2
 RXbYppT2Q+7hXQUJB3uqmhuAxsLQqomAjbuM9FIMhPJhthgyh76rZi0rBi0Z8KMfRaIljE
 Pnl3QcnLiwjg0ThURK+1citRnQPCNog4Xhbb1rFbQucsRw35Gd0MuQAI8FlcG+jVivywQ9
 4BNNPTE/h51et2RD55OC1WhzJH4A9NAmGjMDknHwLdi1DHkgmMYZHMZz8CUbGw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Y/OKNTRs
Subject: Re: [Buildroot] [PATCH 1/1] package/gsl: fix powerpc build
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat,  5 Nov 2022 21:52:39 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix the following powerpc build failures on:
>  - musl raised because fpu_control.h is not available:
> 
> In file included from fp.c:8:
> fp-gnuppc.c:21:10: fatal error: fpu_control.h: No such file or directory
>    21 | #include <fpu_control.h>
>       |          ^~~~~~~~~~~~~~~
> 
>  - glibc raised because _FPU_RC_NEAREST is undefined if _SOFT_FLOAT is
>    set:
> 
>    In file included from fp.c:8:
> fp-gnuppc.c: In function 'gsl_ieee_set_mode':
> fp-gnuppc.c:53:15: error: '_FPU_RC_NEAREST' undeclared (first use in this function)
>    53 |       mode |= _FPU_RC_NEAREST ;
>       |               ^~~~~~~~~~~~~~~
> 
> These build failures are raised since the addition of the package in
> commit 9d9f7feba4ffbfeb54479f1ad90d47acca1a6f0b
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/d73e116c81bf16d2e55fced215d6bd3b382fef10
>  - http://autobuild.buildroot.org/results/48403946bb4cda9013e51db59c1b2ffdcf4e2854
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...01-configure.ac-fix-build-on-powerpc.patch | 53 +++++++++++++++++++
>  package/gsl/gsl.mk                            |  2 +
>  2 files changed, 55 insertions(+)
>  create mode 100644 package/gsl/0001-configure.ac-fix-build-on-powerpc.patch

Applied to master, thanks! Don't forget to submit upstream :-)

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
