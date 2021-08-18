Return-Path: <SRS0=Hlwc=NJ=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42ADBC4338F
	for <buildroot@archiver.kernel.org>; Wed, 18 Aug 2021 21:04:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BCB81610A3
	for <buildroot@archiver.kernel.org>; Wed, 18 Aug 2021 21:04:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BCB81610A3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7CB794042F;
	Wed, 18 Aug 2021 21:04:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0ErFwVqX355r; Wed, 18 Aug 2021 21:04:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8448C4044D;
	Wed, 18 Aug 2021 21:04:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 43E5B1BF344
 for <buildroot@lists.busybox.net>; Wed, 18 Aug 2021 21:04:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 342144074C
 for <buildroot@lists.busybox.net>; Wed, 18 Aug 2021 21:04:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MObAmkEY1Spu for <buildroot@lists.busybox.net>;
 Wed, 18 Aug 2021 21:04:07 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd01-ws.aruba.it (smtpcmd01-ws.aruba.it [62.149.158.241])
 by smtp4.osuosl.org (Postfix) with ESMTP id F3A2C40791
 for <buildroot@buildroot.org>; Wed, 18 Aug 2021 21:04:06 +0000 (UTC)
Received: from [192.168.47.129] ([89.164.22.37])
 by Aruba Outgoing Smtp  with ESMTPSA
 id GSjFm2uvSZx06GSjFmh82T; Wed, 18 Aug 2021 23:04:05 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1629320645; bh=V5avLz1dwrLWb1hqj5E6j+Z0QRZV0yu/sI2AcVkE18I=;
 h=Subject:To:From:Date:MIME-Version:Content-Type;
 b=kFv8m7dtn5zK5NrpK2DP2Ypxt+qaC8enpypFhmzGO+sgSQrnn1g2imxh6CnIZ7Em/
 is3b+tUURi8b3BVt8dZbXcY6V2IRGEBcnChSiqo/zU5e4JpKJHqm/eXTJIBLS3UtdK
 kHfRCI0eRlW4zanGKtxekh3rwdCiDGVpIVobIS3u1+2ajTVIc6zM0zMe4NKgNe8IOx
 bJA45HnP7y2ex+ATckzrC32IjNPDwtVn8hG12HImbN53h1djHUls5sl2B3jewySNhw
 E355sHLU39jeUCh6xaGvRh3/hqHwSIMrpQzgn2OSJd3zCGAAGCEOb8X+/Lg7mgqzpq
 wcf3BoSur/6Ew==
To: buildroot@buildroot.org
References: <20210818210219.351801-1-giulio.benetti@benettiengineering.com>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <ac7a21c9-919d-351e-4f91-5b7ecbc0357d@benettiengineering.com>
Date: Wed, 18 Aug 2021 23:04:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210818210219.351801-1-giulio.benetti@benettiengineering.com>
Content-Language: en-US
X-CMAE-Envelope: MS4wfGtd1jUaiynIoGvnPyeysIEwx2an6PeHSCa4S9jz5C4QEw2JAJFBVagptO/fnODLeKdYMRw/XEuQxziDEDjPUrbHCYuKSmFuN6n+n0K3OyoZ3PGUnJkk
 /bnKm9rNtCph4CF87KMihV1EXGIwa+TqB4r6bVNjjkh6vC8lLdS8LgruQfzMYmlweGVEo1+8/+aA+wrcmvaBgwwvkLY49DzG0hE=
Subject: Re: [Buildroot] [PATCH] DEVELOPERS: add myself to toolchain topic
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>



On 8/18/21 11:02 PM, Giulio Benetti wrote:
> Since I've dealt and deal with toolchain bugs and their work-around very
> often add myself to toolchain topic(toolchain/).
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>   DEVELOPERS | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index af97de02de..328c7ba943 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1059,6 +1059,7 @@ F:	package/minicom/
>   F:	package/nfs-utils/
>   F:	package/sunxi-mali-mainline/
>   F:	package/sunxi-mali-mainline-driver/
> +F:	toolchain/

Alphabet... Going to re-send

>   F:	package/udisks/
>   
>   N:	Gregory Dymarek <gregd72002@gmail.com>
> 

-- 
Giulio Benetti
Benetti Engineering sas
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
