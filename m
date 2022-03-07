Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70212C433F5
	for <buildroot@archiver.kernel.org>; Mon,  7 Mar 2022 21:48:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2E9A0415A4;
	Mon,  7 Mar 2022 21:48:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id G8sgFRPTjk7i; Mon,  7 Mar 2022 21:48:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5BEC84154F;
	Mon,  7 Mar 2022 21:48:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 83F9D1BF2C3
 for <buildroot@lists.busybox.net>; Mon,  7 Mar 2022 21:48:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 72EBB60BF7
 for <buildroot@lists.busybox.net>; Mon,  7 Mar 2022 21:48:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8Ry729Iaq2-s for <buildroot@lists.busybox.net>;
 Mon,  7 Mar 2022 21:48:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AE6B660B50
 for <buildroot@buildroot.org>; Mon,  7 Mar 2022 21:48:30 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id qa43so34898706ejc.12
 for <buildroot@buildroot.org>; Mon, 07 Mar 2022 13:48:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=GhPzDv4Ao5ry+SglN81whBo383mRKA7PPPyTGD8ZAYo=;
 b=YG0wsh+747jiBhlhnQT3HPKcbhdCx5JxAoEsrfdbaAAeQyAeX2ZUIsM1oBFelmoQlq
 vjtjr4FpYfkT/Qv7/RmfzAzieDNWVP1YHV61+wH8mByemQOojlHTJ0O8S6t+OBL3qpcz
 WzszdWFJRR09Gjfbo4N9N8BKGHoi/VnDejxG8cQoHsHwOwfKS7JIbouvtGmPIr1nN314
 IKCV63UT13LPAXP30Po7ZFRnrYstiEQfqITEEtl4RcvYw3PohfsNvFXWRKjcYb8nrWrl
 vSuZpN1QsFLVZTqKNXWPL1k1KIE7t/+jDfQr1XkQX90JMIADwtFXNst/EOe5y+/EnIee
 6vQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=GhPzDv4Ao5ry+SglN81whBo383mRKA7PPPyTGD8ZAYo=;
 b=FQ0spJfSlZL4vh63c34HCAciU84KK5I2V3PK2jJFPt753JaluMsiqmSyo0LwHSpZp4
 PWE9Guv6u3afrMPzVcRBRu74BLgxUSdCdq2S44HQHDS+te5bNqHUcqGkxLzzoSECci2t
 CWv5zr4X1QRk78EwQHZUkhzExvzs4vRFJeeTPDzmN9Adle/L+ok6UfgdeJhYNzzDo/uJ
 NvE2T75dvwH3N0SN8yoAY1saKG+iz97k9HiqW765l7mP4/k9T1EphHyl5V/dl1hczJU+
 K2yx7HFyt1As1sUDKsZvlVgsVqY9qb9H5daZSU6rmPU8HelYchHZDV99zK8D+ZjUbegk
 OfSA==
X-Gm-Message-State: AOAM532qa6TxgBN08+emOzlVdcLnndhHR45Dr55TMW0/FFaNi7ChJIv9
 pqdWaDithTwmeNR12LF2WRqOLjOtOXhTpA==
X-Google-Smtp-Source: ABdhPJzMHx3ZG4zNSoEtX1TXCnz4mF9+Fmo7PaJ88NwIA6kmiQFsQasuTCbEsFku0Z8I4njrf5hunA==
X-Received: by 2002:a17:906:2699:b0:6d0:9f3b:a6a7 with SMTP id
 t25-20020a170906269900b006d09f3ba6a7mr10563965ejc.397.1646689708991; 
 Mon, 07 Mar 2022 13:48:28 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 i6-20020a17090685c600b006daecf0b350sm3465096ejy.75.2022.03.07.13.48.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Mar 2022 13:48:28 -0800 (PST)
Message-ID: <11add763-9e59-52de-65af-d9130a7bdbf7@mind.be>
Date: Mon, 7 Mar 2022 22:48:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-GB
To: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
References: <20220219212211.1304441-1-giulio.benetti@benettiengineering.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220219212211.1304441-1-giulio.benetti@benettiengineering.com>
Subject: Re: [Buildroot] [PATCH v2] manual: board support: add instructions
 to test defconfig in the official docker
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
Cc: Luca Ceresoli <luca@lucaceresoli.net>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 19/02/2022 22:22, Giulio Benetti wrote:
> Sometimes new boards have not been tested with official docker so let's add
> instructions to do it with utils/docker-run.
> 
> Cc: Luca Ceresoli <luca@lucaceresoli.net>
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

  Applied to master with Luca's improvement, thanks.

  Regards,
  Arnout

> ---
> V1->V2:
> * use the available utils/docker-run
> * improve explanation as suggested by Luca Ceresoli
> ---
>   docs/manual/adding-board-support.txt | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/docs/manual/adding-board-support.txt b/docs/manual/adding-board-support.txt
> index 33ed709535..074bab7a00 100644
> --- a/docs/manual/adding-board-support.txt
> +++ b/docs/manual/adding-board-support.txt
> @@ -46,3 +46,11 @@ create a directory +board/<manufacturer>+ and a subdirectory
>   +board/<manufacturer>/<boardname>+. You can then store your patches
>   and configurations in these directories, and reference them from the main
>   Buildroot configuration. Refer to xref:customize[] for more details.
> +
> +Before submitting patches for new boards it is recommended to test it by
> +building it using latest gitlab-CI docker container. To do this use
> +utils/docker-run script and inside it hint:
> +--------------------
> + $ make +<boardname>_defconfig+
> + $ make
> +--------------------
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
