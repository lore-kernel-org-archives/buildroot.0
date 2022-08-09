Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D6F7C19F2D
	for <buildroot@archiver.kernel.org>; Tue,  9 Aug 2022 11:39:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AF73E60E26;
	Tue,  9 Aug 2022 11:39:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AF73E60E26
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 825BSpH2vJfQ; Tue,  9 Aug 2022 11:39:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E02B3605B5;
	Tue,  9 Aug 2022 11:39:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E02B3605B5
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2E2301BF2C7
 for <buildroot@lists.busybox.net>; Tue,  9 Aug 2022 11:39:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1474540509
 for <buildroot@lists.busybox.net>; Tue,  9 Aug 2022 11:39:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1474540509
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id N5He4nhQm1eQ for <buildroot@lists.busybox.net>;
 Tue,  9 Aug 2022 11:39:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7944D404F8
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7944D404F8
 for <buildroot@buildroot.org>; Tue,  9 Aug 2022 11:39:37 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id BF149240006;
 Tue,  9 Aug 2022 11:39:33 +0000 (UTC)
Date: Tue, 9 Aug 2022 13:39:32 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220809133932.721b8cd8@windsurf>
In-Reply-To: <20220808215404.1804219-1-fontaine.fabrice@gmail.com>
References: <20220808215404.1804219-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1660045174;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dg3SKRbVQGU561z0UOKJqHQj9yRCZdNHBDGWnIPFr2E=;
 b=jdd8CIgzaNo0NSZzWFMmk9EBsobR1UtzAKl5ODyZGT9L0fRcIFyqUPL8VPMUxeS+mlcm1i
 dEzH0yy+xXn1hcii2fpNXcrIZsIEcSpcKMkJyIk0aP4Ppec9xS7QCyh3PLYhNmj4Xo19KG
 t2tRO4YK3+9Yx9R7XxXhQj3odrHxGa3zJumievkxwsAaOdF8nm2Co+WS3GIYEIoM2CywEW
 EvaxAzF6NisOl2dzMUzS2AHdVbaME5gdby4qalUY0dzfvDb3uTCSiPExGVQSVK+Sj7tzej
 D2j+hz/QNDOQrpr2EqjqWSlQC3kTo26vncfTV+lMQJfh/LR1gjRuoN2abtsJ4Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=jdd8CIgz
Subject: Re: [Buildroot] [PATCH 1/1] package/xenomai: always set default
 version
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon,  8 Aug 2022 23:54:04 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Always set a default value for BR2_PACKAGE_XENOMAI_VERSION to avoid a
> build failure when BR2_PACKAGE_XENOMAI_VERSION is empty with
> BR2_PACKAGE_XENOMAI_CUSTOM_{GIT,VERSION}
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/d80c295a848b5be69324f5dfbd269b046dc68e8c
>  - http://autobuild.buildroot.org/results/4e57a499b43208e546dd962ca04b43408c0c082c
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/xenomai/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/xenomai/Config.in b/package/xenomai/Config.in
> index ec6d9e5d29..5c179eec72 100644
> --- a/package/xenomai/Config.in
> +++ b/package/xenomai/Config.in
> @@ -73,8 +73,8 @@ config BR2_PACKAGE_XENOMAI_VERSION
>  	string "Custom Xenomai version" if \
>  		!BR2_PACKAGE_XENOMAI_LATEST_VERSION && \
>  		!BR2_PACKAGE_XENOMAI_CUSTOM_TARBALL
> -	default "3.0.10" if BR2_PACKAGE_XENOMAI_LATEST_VERSION
>  	default "custom" if BR2_PACKAGE_XENOMAI_CUSTOM_TARBALL
> +	default "3.0.10"

Meh, I don't like how Xenomai handles things differently than all other
packages that have a configurable version.

IMO, we should make Xenomai look like the other packages, which means:

 - Dropping default "https://gitlab.denx.de/Xenomai/xenomai.git"

 - Not have any default value for BR2_PACKAGE_XENOMAI_VERSION

We really want consistency on how this "custom version" thing is
handled.

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
