Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2303EC4167B
	for <buildroot@archiver.kernel.org>; Tue, 27 Dec 2022 21:35:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C018F40946;
	Tue, 27 Dec 2022 21:35:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C018F40946
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bMqMNqEAMZLK; Tue, 27 Dec 2022 21:35:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C22704093D;
	Tue, 27 Dec 2022 21:35:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C22704093D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DC1211BF847
 for <buildroot@lists.busybox.net>; Tue, 27 Dec 2022 21:35:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C3EE54093D
 for <buildroot@lists.busybox.net>; Tue, 27 Dec 2022 21:35:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C3EE54093D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PhY0FdxyNK3A for <buildroot@lists.busybox.net>;
 Tue, 27 Dec 2022 21:35:17 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7A8A14092B
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7A8A14092B
 for <buildroot@buildroot.org>; Tue, 27 Dec 2022 21:35:17 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id BBA6AC0002;
 Tue, 27 Dec 2022 21:35:15 +0000 (UTC)
Date: Tue, 27 Dec 2022 22:35:14 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20221227223514.503ad1c2@windsurf>
In-Reply-To: <20221222165117.62002-1-fontaine.fabrice@gmail.com>
References: <20221222165117.62002-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1672176915;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5mFFqqyXQ2PLUuWjgWw36dYT3GwNbFbgtVYzsoEUsG4=;
 b=eTggOOa+3HE5e98/SAjt7AVjK+hstV4keH2IYy9W1NNr4FIUMpTtIXkSaddZU239V+a/A9
 PE/GWxr83Okwxi8ycnfKIc90h2cLTunkzSn06v9H4GWN9CmNlx1waWGn8nYgOGVsv3Nsho
 PGBqA16P2KMdZCA1Ms4O+zi0OYUfyZUB89UA6kV4Ns3znuF/+cinBuyOAAmIMmg8q0zmIi
 hrVCwgLaNFizy2kSmiAZA0YmIG4y5G/4rntVO/P8OSVvix/tjq5hPL2cqD0BUUyDucguRN
 fnS1eBVqJ628ssrwL+EjESsFzZqPPV9nM2n454DkYrFs26f1Ik9nFJ1cKH5CrQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=eTggOOa+
Subject: Re: [Buildroot] [PATCH 1/1] package/tiff: add libdeflate optional
 dependency
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

On Thu, 22 Dec 2022 17:51:17 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> libdeflate is an optional dependency which is enabled by default since
> version 4.2.0 and
> https://gitlab.com/libtiff/libtiff/-/commit/3a2de853a932bd0ea79d1677d319841edb736c38
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/tiff/Config.in | 6 ++++++
>  package/tiff/tiff.mk   | 7 +++++++
>  2 files changed, 13 insertions(+)
> 
> diff --git a/package/tiff/Config.in b/package/tiff/Config.in
> index f842c2ead8..58e2052ea5 100644
> --- a/package/tiff/Config.in
> +++ b/package/tiff/Config.in
> @@ -11,6 +11,12 @@ config BR2_PACKAGE_TIFF_CCITT
>  	bool "CCITT Group 3 & 4 support"
>  	default y
>  
> +config BR2_PACKAGE_TIFF_LIBDEFLATE
> +	bool "Libdeflate usage (still requires Zlib)"
> +	default y

Is there any reason to have this "default y"? We normally try to
disable optional features by default, especially if they bring extra
dependencies.

I see it's a policy that has not been really applied to the tiff
package, but I'm wondering if there's a particular reason to not apply
our normal policy to this new option?

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
