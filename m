Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 662B9C433FE
	for <buildroot@archiver.kernel.org>; Thu, 16 Dec 2021 20:16:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0A3DF40B60;
	Thu, 16 Dec 2021 20:16:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BdgxFEKwvBXn; Thu, 16 Dec 2021 20:16:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 18E5A40B5F;
	Thu, 16 Dec 2021 20:16:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B7A581BF325
 for <buildroot@lists.busybox.net>; Thu, 16 Dec 2021 20:16:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A691E61053
 for <buildroot@lists.busybox.net>; Thu, 16 Dec 2021 20:16:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lkA9prL3phIe for <buildroot@lists.busybox.net>;
 Thu, 16 Dec 2021 20:16:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4DF7E6103B
 for <buildroot@buildroot.org>; Thu, 16 Dec 2021 20:16:04 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id z9so35694870edb.5
 for <buildroot@buildroot.org>; Thu, 16 Dec 2021 12:16:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=ctMn4zDxovBYmINPaXOttaCK+QE23DU73kz8NMRSZQA=;
 b=Z6ibtP6zk0QXYX4zMFA19/Fq7JORKe/QAqSBc9026xoQgTYdjXnravrB5zRXC7hN/Z
 KoMRSu+UNPNcHr3Xr9W3bH9x9BST5+UlWBWWyrSGbWeYaKPDYAXqKymcWujgQNZbZMTy
 Ovt2c6lQDOVeoTnaVt1TLaRnzhgGf+OlH32biPSl+ojpZvYk+0yoptJOwSy3X9NmGoKj
 tL9QyXo/oY9zAzmJgjo/oPpurZpxcXq9/iAm1dK2F4QjlTA3R5X+UyyX6xmGsfBm9an5
 pVK9y/NVDMihdRLgr6cnBk622Ds95vGoiokPpcpjQnMDNFSbZqiZGf3bzim0SNVVTzrP
 nMig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=ctMn4zDxovBYmINPaXOttaCK+QE23DU73kz8NMRSZQA=;
 b=mCHN+pBcCd7ASphyswLp+osJT31X+POVE36NXDYCzs8sQm0f2wGxSa4rurIK8L8A/i
 7yoqu+/WgbEFMS5x5DB0GVP2Ro7r8snGwWBj7RIyts7ER+QerSfAanpAEi5/RkxnsUzo
 b6rY7XKJAgDr1lntaRFnx/PGi5s1WW6g1swz+jfdhLamsXkz71eAUumkDfkFLLm0spWv
 nO6pCemTHELGgNVISrYxwv7PT5O9Ls8QS+UBld8GVm1zahHBjaZuOlM2aEj+ptoEFhFL
 zk0W3vtlI352jlWosFNCv1FjNO2/Co86okaLuD+68DzNeOIn26WAPBdfuADrhlsVo5eu
 cjWg==
X-Gm-Message-State: AOAM5315Y2zVKTJhSkS4vv6186ZlndSCzLBjO2Rr6qxsrGwjavuzZvoQ
 43PgbWCqGvdz8lk79mBHWjonAA==
X-Google-Smtp-Source: ABdhPJyf34UI+DBYc5BjdpzJPSYAGVUO/XDwv6QVmZE1+qhVsFIcxKd4DfhtvJoUvWaptgpC+45+Mg==
X-Received: by 2002:a17:906:ff14:: with SMTP id
 zn20mr10234285ejb.649.1639685762559; 
 Thu, 16 Dec 2021 12:16:02 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id nb16sm2120038ejc.99.2021.12.16.12.16.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Dec 2021 12:16:02 -0800 (PST)
Message-ID: <1b1dd539-d5c7-bc90-8336-2c60aa8bd312@mind.be>
Date: Thu, 16 Dec 2021 21:15:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20211216185710.658720-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211216185710.658720-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/frr: add zeromq optional
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
Cc: Vadim Kochan <vadim4j@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 16/12/2021 19:57, Fabrice Fontaine wrote:
> zeromq is an optional dependency since version 4.0 and
> https://github.com/FRRouting/frr/commit/b6116506ec81735afa647af112c6aaa1ed35e9df
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/frr/frr.mk | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/package/frr/frr.mk b/package/frr/frr.mk
> index 49b4a190f0..8e53faaf33 100644
> --- a/package/frr/frr.mk
> +++ b/package/frr/frr.mk
> @@ -40,6 +40,13 @@ else
>   FRR_CONF_OPTS += --disable-capabilities
>   endif
>   
> +ifeq ($(BR2_PACKAGE_ZEROMQ),y)
> +FRR_DEPENDENCIES += zeromq
> +FRR_CONF_OPTS += --enable-zeromq
> +else
> +FRR_CONF_OPTS += --disable-zeromq
> +endif
> +
>   ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
>   FRR_CONF_ENV += LIBS=-latomic
>   endif
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
