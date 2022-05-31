Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D1CBC433F5
	for <buildroot@archiver.kernel.org>; Tue, 31 May 2022 20:42:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 555A640FC5;
	Tue, 31 May 2022 20:42:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NqpwQljAtPVZ; Tue, 31 May 2022 20:42:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6B77140FC2;
	Tue, 31 May 2022 20:42:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8A56D1BF27E
 for <buildroot@lists.busybox.net>; Tue, 31 May 2022 20:42:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 797834185F
 for <buildroot@lists.busybox.net>; Tue, 31 May 2022 20:42:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MtL_G8Tbnqyh for <buildroot@lists.busybox.net>;
 Tue, 31 May 2022 20:42:38 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd15177.aruba.it (smtpcmd15177.aruba.it [62.149.156.177])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5E0624185D
 for <buildroot@buildroot.org>; Tue, 31 May 2022 20:42:38 +0000 (UTC)
Received: from [192.168.50.225] ([146.241.66.179])
 by Aruba Outgoing Smtp  with ESMTPSA
 id w8hInaKUIXOlAw8hIn1iwd; Tue, 31 May 2022 22:42:36 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1654029756; bh=NgOQASUOaIItlC0iaHdw2a9qdDnej34iWQWq5C7FCpo=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=OPU3wvlDLPcCrhBWKRReY4Rpq6rm1KwcI0Ag+SEU4u2WRgYu76NoCnQ20kAeab2Pq
 xvtop2p1W2fERkIXZQ1GG84klSfIyxDFGBIsDzHAU2Qt37wWkOsogjt++fZnmAwpZj
 dOIrWiyuKibEyQJ6JSKUieAWW13WeH4jssFBT5FRKQiUa9vaaJahHe1NCWLx4zmBwZ
 JojNEkcXSQ05MWx3ZjGF321Udw2krc9egzE4T/hBasSNsDD7xj4YOCt64QnPIAsRzK
 5evMEKB7drrbO5Czydlnxb63JyU/KmP/uyqE6u2cXvNrUmHgVQDmVSFDq6k5dV4vSv
 dmxfj4R0ZeGoQ==
Message-ID: <40f0b3d3-b200-0d9c-4634-f26a31e7f612@benettiengineering.com>
Date: Tue, 31 May 2022 22:42:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Content-Language: en-US
To: buildroot@buildroot.org
References: <20220529002320.1275752-1-giulio.benetti@benettiengineering.com>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20220529002320.1275752-1-giulio.benetti@benettiengineering.com>
X-CMAE-Envelope: MS4xfPaHeKlc41ltB3YkhJ2nwI5nsE4JUTRfEn8QbrG4FfONLwugnh8iSW8TIsZLxuHIEqKokkgyZFZdTS+xh9Hd/Mu1YfqRoG8xi8kMEbv8f4Jzn2Z3tbGd
 y0txRJXk/mFtBdWEg6Xm5m2mIpBy9gdlWFIR+jZor5mp3KAhXtdLwmeG5hW6Os+RTOG+ef6w1KWg5cka5bkO/XT/RzjjroN2DYmwUGum6h9f64Un8aCLVQhj
 viM1znKPSmTSU5zItcsrJg==
Subject: Re: [Buildroot] [PATCH] package/libfuse3: bump to version 3.11.0
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
Cc: Asaf Kahlon <asafka7@gmail.com>
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
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>   package/libfuse3/libfuse3.hash | 2 +-
>   package/libfuse3/libfuse3.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/libfuse3/libfuse3.hash b/package/libfuse3/libfuse3.hash
> index cce2b11171..2fb5f329e3 100644
> --- a/package/libfuse3/libfuse3.hash
> +++ b/package/libfuse3/libfuse3.hash
> @@ -1,3 +1,3 @@
>   # Locally calculated sha256 checksums
> -sha256  e73f75e58da59a0e333d337c105093c496c0fd7356ef3a5a540f560697c9c4e6  libfuse3-3.10.5.tar.gz
> +sha256  25a00226d2d449c15b2f08467d6d5ebbb2a428260c4ab773721c32adbc6da072  libfuse3-3.11.0.tar.gz
>   sha256  b8832d9caaa075bbbd2aef24efa09f8b7ab66a832812d88c602da0c7b4397fad  LICENSE
> diff --git a/package/libfuse3/libfuse3.mk b/package/libfuse3/libfuse3.mk
> index 1dbe918c5b..b3e3176708 100644
> --- a/package/libfuse3/libfuse3.mk
> +++ b/package/libfuse3/libfuse3.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -LIBFUSE3_VERSION = 3.10.5
> +LIBFUSE3_VERSION = 3.11.0
>   LIBFUSE3_SITE = $(call github,libfuse,libfuse,fuse-$(LIBFUSE3_VERSION))
>   LIBFUSE3_LICENSE = LGPL-2.1
>   LIBFUSE3_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
