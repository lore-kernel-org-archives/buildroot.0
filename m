Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA2A5C61DA4
	for <buildroot@archiver.kernel.org>; Sun, 19 Feb 2023 17:05:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7585240B51;
	Sun, 19 Feb 2023 17:05:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7585240B51
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id F878dk68vTRe; Sun, 19 Feb 2023 17:05:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BFEE6404F4;
	Sun, 19 Feb 2023 17:05:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BFEE6404F4
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4A3681BF423
 for <buildroot@lists.busybox.net>; Sun, 19 Feb 2023 17:05:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 24A1A404F4
 for <buildroot@lists.busybox.net>; Sun, 19 Feb 2023 17:05:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 24A1A404F4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jY-fL0U5tyDy for <buildroot@lists.busybox.net>;
 Sun, 19 Feb 2023 17:05:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4AC4D404A5
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4AC4D404A5
 for <buildroot@buildroot.org>; Sun, 19 Feb 2023 17:05:10 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.243.59])
 by smtp5-g21.free.fr (Postfix) with ESMTP id 1B9095FF33;
 Sun, 19 Feb 2023 18:05:08 +0100 (CET)
Received: from 37-174-20-96.coucou-networks.fr ([37.174.20.96])
 by webmail.free.fr
MIME-Version: 1.0
Date: Sun, 19 Feb 2023 18:05:08 +0100
From: Julien Olivain <ju.o@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
In-Reply-To: <20230219164822.142283-2-fontaine.fabrice@gmail.com>
References: <20230219164822.142283-1-fontaine.fabrice@gmail.com>
 <20230219164822.142283-2-fontaine.fabrice@gmail.com>
Message-ID: <3be3f2958ee3260c0ef88382b92ccd3d@free.fr>
X-Sender: ju.o@free.fr
User-Agent: Webmail Free/1.3.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1676826308;
 bh=7/+TSiHgRbVMjj1b2Q2TGsEyzOAQ1GlbrHcn6NyBPWs=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Dd7ux1NOPz4H2r7n5q1FzQBctIx/TgGuxyjl95RoNj8vZ+odvGaF3IiJvKHTDjGJu
 oh0m5KRdEFf4w5xELOMuqis5k7zHwg3QcTYIyOA8QXLrBOywkQdHCne0km5I16l8L2
 uQhRusdCer0JfojGJP4A4PTqQHVVb+YhFllNtO8IA5NC4VbvRLCnvRymXILP/o/RIv
 DEdOzw5k4Xk9yafl7vhQzKink+JV8Uab3HbmDlUGcAFoqCLUWYlgDNnqI5GCoWd3tI
 7tCZ6WN/vwkwC5pKqU9QYWF1XM2pH/kg4965Xao+I3DP8HtaffjTB2znCWLC8KVfuv
 UV+askMtOQB0g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Dd7ux1NO
Subject: Re: [Buildroot] [PATCH v2,
 2/3] package/libjxl: disable benchmark and tests
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
Cc: buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Fabrice,

On 19/02/2023 17:48, Fabrice Fontaine wrote:
> Disable benchmark and tests which are enabled by default since the
> addition of the package in commit
> e648d399d8bd609697e78f13f7fa76be06d91a57
> 

Reviewed-by: Julien Olivain <ju.o@free.fr>

> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/libjxl/libjxl.mk | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/libjxl/libjxl.mk b/package/libjxl/libjxl.mk
> index 1257928efd..b4dfbecf82 100644
> --- a/package/libjxl/libjxl.mk
> +++ b/package/libjxl/libjxl.mk
> @@ -23,7 +23,9 @@ endif
>  LIBJXL_CONF_OPTS = \
>  	-DJPEGXL_BUNDLE_LIBPNG=OFF \
>  	-DJPEGXL_BUNDLE_SKCMS=OFF \
> +	-DJPEGXL_ENABLE_BENCHMARK=OFF \
>  	-DJPEGXL_ENABLE_DOXYGEN=OFF \
> +	-DJPEGXL_ENABLE_EXAMPLES=OFF \
>  	-DJPEGXL_ENABLE_JNI=OFF \
>  	-DJPEGXL_ENABLE_MANPAGES=OFF \
>  	-DJPEGXL_ENABLE_OPENEXR=OFF \

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
