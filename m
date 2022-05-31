Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 696FAC433EF
	for <buildroot@archiver.kernel.org>; Tue, 31 May 2022 20:42:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 28F2840503;
	Tue, 31 May 2022 20:42:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vKxT3Q8845fU; Tue, 31 May 2022 20:42:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 28F9F40292;
	Tue, 31 May 2022 20:42:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9EE0E1BF27E
 for <buildroot@lists.busybox.net>; Tue, 31 May 2022 20:42:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8D3C840146
 for <buildroot@lists.busybox.net>; Tue, 31 May 2022 20:42:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mK0EKf5f3Cjb for <buildroot@lists.busybox.net>;
 Tue, 31 May 2022 20:42:22 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd15177.aruba.it (smtpcmd15177.aruba.it [62.149.156.177])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0561840292
 for <buildroot@buildroot.org>; Tue, 31 May 2022 20:42:21 +0000 (UTC)
Received: from [192.168.50.225] ([146.241.66.179])
 by Aruba Outgoing Smtp  with ESMTPSA
 id w8h2naK0aXOlAw8h2n1iqB; Tue, 31 May 2022 22:42:20 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1654029740; bh=ThxRdgjSLK3of1ZwZpgi9wHJj34dgRbof4bGvJNAtXc=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=Kf9HOP4Qq1hrMeh4qP0xX9XTRFK7kbv3dwxREm2gc4h50rxTt8ZJk2WcCDEUJP/UY
 EYgtd+6lHKxduxq+6soFmsOsZtzIzQxAoOEyjpVTLZo7FkCCT0dmU6+82K0G5jAmOz
 woNfxykuGlncKFpAGwbnzWpaMqcr1mqwiJyuHTZKUapJArZUg+yw3BpSF0XV64476g
 sCAkB87fhLhxEbCepvNkwBs9Sqsqf9mNgqvJqoys26tgwdMBTK32ykFlWnF3KuzxOm
 CShf3oyYPCcBQzdbhG1KZOtznmSiayXmqYLfOXqiSVZSQjEjU26oBDwV8zTFJ/O9w0
 sfZ8j9P+4DP7g==
Message-ID: <9027c73a-fea2-77a9-5f64-70c82ffe41bf@benettiengineering.com>
Date: Tue, 31 May 2022 22:42:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Content-Language: en-US
To: buildroot@buildroot.org
References: <20220529002356.1275791-1-giulio.benetti@benettiengineering.com>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20220529002356.1275791-1-giulio.benetti@benettiengineering.com>
X-CMAE-Envelope: MS4xfKh2V+ZrBsm9sfQpb+Od5Nvw98yYRJ515Rt+mdQC+/o8TNnTaXHJ080pjeYhU93Lr7ee24ICtyoPfUI68CIP7DQYCix2dO9nRiURJrSMuq9iBz0KI9MM
 DYByDKezHczswk3qnozVAejCO+5hKER+HTUtDzcYqx5ytk+81IUQDvRM24ipvjTREvyZQhE7o40Mk4LMtmskLUhAbsnQ6WTZVchfOXTfcjv0UUtOsZ5665SK
Subject: Re: [Buildroot] [PATCH] package/libnspr: bump to version 4.34
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

I've forgotten to modify the Subject-suffix with for-next. So this patch
is for next branch.

Best regards
-- 
Giulio Benetti
CTO/CEO@Benetti Engineering sas

On 29/05/22 02:23, Giulio Benetti wrote:
> Unfortunately local patch is still pending upstream. I've just pinged
> them:
> https://bugzilla.mozilla.org/show_bug.cgi?id=1765100
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>   package/libnspr/libnspr.hash | 4 ++--
>   package/libnspr/libnspr.mk   | 2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/libnspr/libnspr.hash b/package/libnspr/libnspr.hash
> index 0064a9b279..4795b52aaf 100644
> --- a/package/libnspr/libnspr.hash
> +++ b/package/libnspr/libnspr.hash
> @@ -1,4 +1,4 @@
> -# From https://ftp.mozilla.org/pub/nspr/releases/v4.33/src/SHA256SUMS
> -sha256  b23ee315be0e50c2fb1aa374d17f2d2d9146a835b1a79c1918ea15d075a693d7  nspr-4.33.tar.gz
> +# From https://ftp.mozilla.org/pub/nspr/releases/v4.34/src/SHA256SUMS
> +sha256  beef011cd15d8f40794984d17014366513cec5719bf1a78f5e8a3e3a1cebf99c  nspr-4.34.tar.gz
>   # Locally calculated
>   sha256  fab3dd6bdab226f1c08630b1dd917e11fcb4ec5e1e020e2c16f83a0a13863e85  nspr/LICENSE
> diff --git a/package/libnspr/libnspr.mk b/package/libnspr/libnspr.mk
> index 7491d18884..5d64d110ef 100644
> --- a/package/libnspr/libnspr.mk
> +++ b/package/libnspr/libnspr.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -LIBNSPR_VERSION = 4.33
> +LIBNSPR_VERSION = 4.34
>   LIBNSPR_SOURCE = nspr-$(LIBNSPR_VERSION).tar.gz
>   LIBNSPR_SITE = https://ftp.mozilla.org/pub/mozilla.org/nspr/releases/v$(LIBNSPR_VERSION)/src
>   LIBNSPR_SUBDIR = nspr

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
