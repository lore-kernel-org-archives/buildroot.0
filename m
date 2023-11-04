Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7901C4332F
	for <buildroot@archiver.kernel.org>; Sat,  4 Nov 2023 13:56:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7B2F18229C;
	Sat,  4 Nov 2023 13:56:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7B2F18229C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qCYibxLTy46c; Sat,  4 Nov 2023 13:56:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BF5F0822A3;
	Sat,  4 Nov 2023 13:56:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BF5F0822A3
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 79D871BF30C
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 13:55:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4136A822A5
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 13:55:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4136A822A5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ALHeJ1GQ27PL for <buildroot@lists.busybox.net>;
 Sat,  4 Nov 2023 13:55:58 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E03938229A
 for <buildroot@buildroot.org>; Sat,  4 Nov 2023 13:55:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E03938229A
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0337D240006;
 Sat,  4 Nov 2023 13:55:55 +0000 (UTC)
Date: Sat, 4 Nov 2023 14:55:55 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20231104145555.5013c783@windsurf>
In-Reply-To: <20231103221540.43254-1-fontaine.fabrice@gmail.com>
References: <20231103221540.43254-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1699106156;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pHbGDzOIbL1vlNfqETM7OgB78VORtW2FWnhfgi2TyRs=;
 b=lwqi+a13YrVjxk/MukvPDLRGHPiX727OVQ1Rj+l1e2FhIrIXZ7z3YpmX7ThJhNlR+b1tZI
 zhJLnPzKMmiSia7nllbYbCFPUNsoMg8Ar68nY9bRFwhrdwkpaT7ApzW19Sey9+lVGr16YQ
 dMB1Z7A06oqAWSwiBTUvlEPI32got70m932m7Nmb1rwMFibj6/9TWO7+TRaMhIooBv1eBg
 H1gDpON3hBCMFByfTmD2jFrpYY0XgjULbnk++a6xKNPWBSTkFyjKjzNhRcQp27084NPfaY
 y4HDGun58pOQx5Y+MPnhEh6pWrKnLIEsywednkg0fC8pOUXjL2mILvdhRk0q8Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=lwqi+a13
Subject: Re: [Buildroot] [PATCH 1/1] package/libgsm: bump to version 1.0.22
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri,  3 Nov 2023 23:15:40 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Refresh patch
> 
> Thu Aug  4 18:47:10 2022	Jutta Degener (jutta@pobox.com)
> 
> 	* Release 1.0 Patchlevel 22
> 	Remove unused, and occasionally out of date, VERSION variable
> 	from Makefile.
> 
> Sun Jul 31 16:17:59 2022	Jutta Degener (jutta@pobox.com)
> 
> 	* Release 1.0 Patchlevel 21
> 	Use $(LN), not ln, in the Makefile rules for the installed binary
>  	of untoast and tcat.
> 	(Thanks to Carlo Cabrera for pointing that out!)
> 
> Mon Jul  4 10:34:18 2022
> 
> 	* Release 1.0 Patchlevel 20
> 	Use $(RMFLAGS) with the rms in the Makefile; add -f to $(RMFLAGS) to
>         avoid spurious error messages during build.
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  .../0001-misc-fixes-from-archlinux.patch      | 82 +------------------
>  package/libgsm/libgsm.hash                    |  2 +-
>  package/libgsm/libgsm.mk                      |  2 +-
>  3 files changed, 6 insertions(+), 80 deletions(-)

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
