Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9434C433EF
	for <buildroot@archiver.kernel.org>; Wed,  9 Feb 2022 23:09:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5D98960E46;
	Wed,  9 Feb 2022 23:09:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Srsykzn2Td9h; Wed,  9 Feb 2022 23:09:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9E88260E43;
	Wed,  9 Feb 2022 23:09:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D046D1BF3D9
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 23:09:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B121660E43
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 23:09:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jq5DGxAs08y7 for <buildroot@lists.busybox.net>;
 Wed,  9 Feb 2022 23:09:29 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd0987.aruba.it (smtpcmd0987.aruba.it [62.149.156.87])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7A05A60E42
 for <buildroot@buildroot.org>; Wed,  9 Feb 2022 23:09:29 +0000 (UTC)
Received: from [192.168.50.220] ([146.241.179.156])
 by Aruba Outgoing Smtp  with ESMTPSA
 id Hw5XnZkzPks1JHw5XnJhXs; Thu, 10 Feb 2022 00:09:27 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1644448167; bh=lq/C7AiyrCgBIPc1gG9uSSLuxQc5KP6l7n9h9U8tzyQ=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=gXw2Kdsm0Kb0uUd02kuo6W1490IPBwZLug5+l4Y481Ggl9bnw4r+Q+YmE6MBjWusJ
 X+HGBWZAvI3ySJz5A+gBtInMXIGrtaWMPvw7r4OAmNzbeXHzyj37Fzj2TjfxkuIMQL
 ptIfrqeelmm8g9LGnH8wWwWclweQ/0f9Udrkjq0s1H3f1nIgbCcIyPOUf7gxqo2l2k
 ZpR8n7oA89LHbiU6CxUBnvVbwYUpciEOxZp+WhWl7hX3hhWgIjH54FWYKlSviDa7Tz
 rsbM13hAZv+3bf7HF5VOxnNJ37/06ViD3edjpMs+5Rk05SLOpSehbwe2f6xKAaOwhg
 LU5KI4c/9De1Q==
Message-ID: <674c1c83-4bcf-3740-8f79-184c1a86cda3@benettiengineering.com>
Date: Thu, 10 Feb 2022 00:09:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Yu Chien Peter Lin <peterlin@andestech.com>, buildroot@buildroot.org
References: <20220125054956.27492-1-peterlin@andestech.com>
 <20220125054956.27492-3-peterlin@andestech.com>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20220125054956.27492-3-peterlin@andestech.com>
X-CMAE-Envelope: MS4wfP3n03jy4iFmYGhgou5NCqDuo2wy1zOb3iPHir9oPrLkde+mKMtkONZrsHBncFLg+ixehlRvLhbguGI4ydzaeLNCA1Dq1SczjU9tnZVnqnS3D82Bf1m+
 YKFeH5M62IizXMWcpt5iEv8GTcnld6Wh0gGdqpTsHxGMj+DRILTbziBAmwTm1Ddox6sUQKV0ZjXqWSMU9HjnRrafmwOnGxrtE9nAPDvXBgq0ephHSCqaqPgj
 dNGdiQ/CqmxaIrVHlykGFrtx0bXOt+Gt8kOxK28R0KA=
Subject: Re: [Buildroot] [PATCH v2 3/3] DEVELOPERS: add Yu-Chien Lin to
 board/andes
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
Cc: alankao@andestech.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Peter,

On 25/01/22 06:49, Yu Chien Peter Lin wrote:
> Nylon is no longer at Andes.
> 
> Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
> Signed-off-by: Alan Kao <alankao@andestech.com>
> ---
>   DEVELOPERS | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index dc810b6fe1..b191734d5a 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -2137,10 +2137,11 @@ N:	Norbert Lange <nolange79@gmail.com>
>   F:	package/systemd/
>   F:	package/tcf-agent/
>   
> -N:	Nylon Chen <nylon7@andestech.com>
> +N:	Yu Chien Peter Lin <peterlin@andestech.com>
>   F:	arch/Config.in.nds32
>   F:	board/andes
>   F:	configs/andes_ae3xx_defconfig
> +F:	configs/andes_ae350_45_defconfig

This ^^^ line goes before its previous one for alphabetical order

>   F:	toolchain/toolchain-external/toolchain-external-andes-nds32/
>   
>   N:	Olaf Rempel <razzor@kopf-tisch.de>

Best regards
-- 
Giulio Benetti
Benetti Engineering sas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
