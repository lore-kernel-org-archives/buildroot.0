Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60073C433F5
	for <buildroot@archiver.kernel.org>; Thu, 17 Feb 2022 15:45:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DB95341E4A;
	Thu, 17 Feb 2022 15:45:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2PJQ0CtGRH07; Thu, 17 Feb 2022 15:45:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D27F741E39;
	Thu, 17 Feb 2022 15:45:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6076B1BF2B9
 for <buildroot@lists.busybox.net>; Thu, 17 Feb 2022 15:45:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5C6F1417B3
 for <buildroot@lists.busybox.net>; Thu, 17 Feb 2022 15:45:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2qqKwGIvYuLo for <buildroot@lists.busybox.net>;
 Thu, 17 Feb 2022 15:45:11 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd0872.aruba.it (smtpcmd0872.aruba.it [62.149.156.72])
 by smtp4.osuosl.org (Postfix) with ESMTP id 211E0417B6
 for <buildroot@buildroot.org>; Thu, 17 Feb 2022 15:45:10 +0000 (UTC)
Received: from [192.168.50.220] ([146.241.188.82])
 by Aruba Outgoing Smtp  with ESMTPSA
 id Kixunt87kvHpTKixvnzmzB; Thu, 17 Feb 2022 16:45:08 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1645112708; bh=msvNy0Qq+iUsLbpGRX7nQKxRCYcvAkNX6xxyNjgW714=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=EBlNvz7jL3Ojm8bCnuQ77dCaPXzyV86mRC3RHNVKr94dlGNlZ1dUsvhKrVgPfzFtC
 pBw+Wh/O4jscY2QauzWqRR24wyY3WGkHJZwc6TlrPWJZ1opQcbz9v+5B0uWC4CMexP
 ky4ruDrofyQ44lopfI+RCnyX34FvCK0qHXEingbyBN0d4O2c6rbh55Zvz8T+0yz0dt
 +WuHqY2G7uda0yXRIdV9yVEuHV/zsrHwB3zQQAxMEvlpavzLRxZ76GSHpkodhHwehF
 NwDSgN3Dtd3RGVmzL8P5F0WkfM/WyIJh8LoQ3oD27MlgySs9s703g6DaRqleUBpdpc
 3q8+oHflqM2PQ==
Message-ID: <40c0d4fa-1dd3-c41b-09a7-61a031e76880@benettiengineering.com>
Date: Thu, 17 Feb 2022 16:45:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Yu Chien Peter Lin <peterlin@andestech.com>, buildroot@buildroot.org
References: <20220215053327.4046-1-peterlin@andestech.com>
 <20220215053327.4046-3-peterlin@andestech.com>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20220215053327.4046-3-peterlin@andestech.com>
X-CMAE-Envelope: MS4wfK8F+eG3PgzLCVXfvdlLO8A0rXmBGJ7Om6uwYorq4+KKZZ/QbXsThiiLh7cYLz+kw/WY7GmAu+1UqcEJEaGIpkfRZ+unCEMTkj+t3bmlofKuzSIIIASI
 76JmdB0VEzgYSLLWNzH3ir/uWiY5rA/zstfCqWSMyfF1fjVflmKvfOPCTIb39GYTNXZvVg/QrwBhYEQ3P8ZtSQzHOkzUP+ZXtCF2uh9b8wH00L7E5ea1hlsf
 YQMWdS6u/mbpcHFou3u2EftzHNgNELsY9dK7wlOGDb0=
Subject: Re: [Buildroot] [PATCH v3 3/3] DEVELOPERS: add Yu-Chien Lin to
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

On 15/02/22 06:33, Yu Chien Peter Lin wrote:
> Nylon is no longer at Andes.
> 
> Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
> Signed-off-by: Alan Kao <alankao@andestech.com>

Reviewed-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Best regards
-- 
Giulio Benetti
Benetti Engineering sas

> ---
>   DEVELOPERS | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index ac702d8d0f..8848d6a9a7 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -2146,9 +2146,10 @@ N:	Norbert Lange <nolange79@gmail.com>
>   F:	package/systemd/
>   F:	package/tcf-agent/
>   
> -N:	Nylon Chen <nylon7@andestech.com>
> +N:	Yu Chien Peter Lin <peterlin@andestech.com>
>   F:	arch/Config.in.nds32
>   F:	board/andes
> +F:	configs/andes_ae350_45_defconfig
>   F:	configs/andes_ae3xx_defconfig
>   F:	toolchain/toolchain-external/toolchain-external-andes-nds32/
>   

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
