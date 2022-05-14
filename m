Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F6A6C433F5
	for <buildroot@archiver.kernel.org>; Sat, 14 May 2022 09:48:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 41F4840C5F;
	Sat, 14 May 2022 09:48:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MvyEjgePrgnA; Sat, 14 May 2022 09:48:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4D94840A62;
	Sat, 14 May 2022 09:48:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D8D1E1BF85D
 for <buildroot@lists.busybox.net>; Sat, 14 May 2022 09:47:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B107D83FA9
 for <buildroot@lists.busybox.net>; Sat, 14 May 2022 09:47:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id apYYZ8Hfvbzg for <buildroot@lists.busybox.net>;
 Sat, 14 May 2022 09:47:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C3BA483F9B
 for <buildroot@busybox.net>; Sat, 14 May 2022 09:47:55 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id dk23so20297857ejb.8
 for <buildroot@busybox.net>; Sat, 14 May 2022 02:47:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=KvsBvTGpohtfL8pkl8EVleoo3D+oFt7D1UQA+nVqmFU=;
 b=MCkwq9G4bxSjUnmgBlIZ2pxT4D3F4VjeOtmLQeIKohLvW0I43SNoRvgX1JqQfKonk6
 2Eyjx9Q9IXK/Qu6VXIiNLLyEj/FpxfErPGEJt494W6vbmsgF1LeyRXOzHqfbcp+6SBTf
 UoNI5i1iKFIQqfkdFAs6hO2e98GqR+enVdA4xvZcuC7/3cdBgfOM/xChHqy8tnrHQM8q
 GGIIluGRf0ll1mI5f1tXS1vLwWareHkLGqg3/1GR1TWbkUkkHvi5lKa1Fqp7SxDpBygB
 0hQHTeg2wfFuv3WgR7ZbTPgiddK8s0qGmHB0zxVusnM/In1A3pD3cTsy+LXg9ngvSq8S
 TFfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=KvsBvTGpohtfL8pkl8EVleoo3D+oFt7D1UQA+nVqmFU=;
 b=4DMbAgAAVe5e4q3OcKTXK2SznRoc8IwqdGy/IMHvObKBSjsQKgghDlIw+MVlqqyeAN
 tGvYj3uDE1jhWFwDgmcuVBSNCsdaidqPkVIGm1k5Qm9Sxmpt4HJ7Z6R3uCOaTkQI1ebQ
 tPuolVrsSaNxcukG5vKeMEMuqh9D/olDiI2qFuO8NKCedNygiQh8IH/unEP1oF5qp9LZ
 tet4w4xctlCf2+paJX2oXDhfBJWk+PduYrK9kG1+jNxLpUvmILq+D8TkgSDqzrNlBhB/
 mdjYLwml8+gUKZuNJPUZLIONssoCBlW+zTzb5ta24O/hrDvsD7KCEyj7D+rQ+A/nV9A7
 4TgQ==
X-Gm-Message-State: AOAM533Kjiu2LrN09glCUsAu6JNdwRrbvV9D8tt4rzjI20xJ5j2IvvRX
 GTvm+Z8rAmV8SYOh/Oy1pMgC3ZPVRwr1mQ==
X-Google-Smtp-Source: ABdhPJySWWfylDF/aleghtfEVx14lb7LXIiXuuL6w1KQ+sstaRc/ep4jRUM7U2CDKpXTHIs8mfSQIQ==
X-Received: by 2002:a17:907:3da1:b0:6f4:2d69:75f6 with SMTP id
 he33-20020a1709073da100b006f42d6975f6mr7739296ejc.389.1652521673821; 
 Sat, 14 May 2022 02:47:53 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 j29-20020a170906535d00b006f3ef214e64sm1544472ejo.202.2022.05.14.02.47.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 14 May 2022 02:47:53 -0700 (PDT)
Message-ID: <8ca0c224-5735-eb73-f801-0e8b99968889@mind.be>
Date: Sat, 14 May 2022 11:47:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-GB
To: Baruch Siach <baruch@tkos.co.il>, buildroot@busybox.net
References: <6588b9e983ce137243bb72afad96bab8a595bf32.1652362968.git.baruch@tkos.co.il>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <6588b9e983ce137243bb72afad96bab8a595bf32.1652362968.git.baruch@tkos.co.il>
Subject: Re: [Buildroot] [PATCH 1/2] package/pciutils: requires C99
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



On 12/05/2022 15:42, Baruch Siach via buildroot wrote:
> Since version 3.8.0 pciutils requires C99 toolchain as documented in its
> README file. Use the gnu99 variant because the code requires the GNU
> extended getopt(3) and the 'asm' keyword.
> 
> Fixes:
> http://autobuild.buildroot.net/results/1c9988105b64594185a4002ca046aec8b87ea141/
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>

  Applied both to master, thanks.

  Regards,
  Arnout

> ---
>   package/pciutils/pciutils.mk | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/pciutils/pciutils.mk b/package/pciutils/pciutils.mk
> index c1445968b91c..140276dbc47e 100644
> --- a/package/pciutils/pciutils.mk
> +++ b/package/pciutils/pciutils.mk
> @@ -13,7 +13,7 @@ PCIUTILS_LICENSE_FILES = COPYING
>   PCIUTILS_MAKE_OPTS = \
>   	CROSS_COMPILE="$(TARGET_CROSS)" \
>   	HOST="$(NORMALIZED_ARCH)-linux" \
> -	OPT="$(TARGET_CFLAGS)" \
> +	OPT="$(TARGET_CFLAGS) -std=gnu99" \
>   	LDFLAGS="$(TARGET_LDFLAGS)" \
>   	DNS=no \
>   	STRIP=
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
