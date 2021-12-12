Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA13AC433EF
	for <buildroot@archiver.kernel.org>; Sun, 12 Dec 2021 15:11:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8322085A53;
	Sun, 12 Dec 2021 15:11:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Xcxi6Z96n5aM; Sun, 12 Dec 2021 15:11:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A390885A4E;
	Sun, 12 Dec 2021 15:11:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D27651BF3EC
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 15:11:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BF8D585A42
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 15:11:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bpfVVPE-qxxn for <buildroot@lists.busybox.net>;
 Sun, 12 Dec 2021 15:11:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AEE64859D2
 for <buildroot@buildroot.org>; Sun, 12 Dec 2021 15:11:46 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id r25so44082080edq.7
 for <buildroot@buildroot.org>; Sun, 12 Dec 2021 07:11:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=3mXJA9JcZLkNiYdWGYcS+p7ppYK5IWMzpkp+UO/UNn0=;
 b=RstmrDtcHde1/xDx4wdXhn4ub4t0Gg1jOgbsDTqzvVYrHLxn6eylZmKZqdtMthhMtr
 yexytLnCnry9yB/I04LLaa9h3JwZW0jOYGcqyrgVan4Rfd3XWrIxRqxrDU8Lu3ObCcKo
 yZ+dgaMGNMBJuWozrFMKS+90tfzKVGzCuWZmhM6iLdzjas2S0OJ0cmM2vU/Uwtj3nF3Y
 wC/rmftCYQXoJPZCDOqlf5Dqmp8LmgjEkQ8t+HUtFYmE/CAUT2dFRxRhdZUxIjCNlw1b
 m/FQqR7s20mgF4Ox3p8EDP/FixlVYq3KMNZoy83mMXDsWnS5dot+Jgb0+Xf3cxi72jPD
 jKew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=3mXJA9JcZLkNiYdWGYcS+p7ppYK5IWMzpkp+UO/UNn0=;
 b=R3QdJhA6Kvle9/pNrXM0KW6qAJTViAMbijn5EE1G2YOe3kPtMvxgHBGOT6VVU1v/CV
 5CQiF7WRnE19MQD9a/Gacbl6mjtMiWl/fXPswKJZwnw+CgyuRvsLElsxFkzV00bCwuUO
 TTUPqXUB4nG8BZuPNTyqgh1svnkUUoAStrZUNbjzKKRVLdMuIXA4RYM0/r6GFa8HKmaC
 nCi74wi9bZNJx7wo8MRFKNp1cDdz7njz6PV/2amvddRVG7rH9EmyqHESvcdiPsDNKJmY
 jjEr8I1ofJ65Uc3VE9umbhyK3Ml16jeyZikHb+Eob4lJZ6xpHSoW2I/EL4tygaSWN2SZ
 5Z6Q==
X-Gm-Message-State: AOAM532LtzrIMiMndmi9YOiAPTpMnE1gxPL70cNXHoCDTWuOnCK+arrS
 Un0m+C9Uv+XquTXjYp5ob769NPEe6F2cKw==
X-Google-Smtp-Source: ABdhPJxYMlU6Lj7w/bTg6QGre7/K/T2ggo4UxjDVu1lunOi/EcEpVn/6zmE8oz03x6rJDk4TuVERFw==
X-Received: by 2002:a05:6402:60c:: with SMTP id
 n12mr57655720edv.17.1639321905052; 
 Sun, 12 Dec 2021 07:11:45 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id dz18sm5001162edb.74.2021.12.12.07.11.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 12 Dec 2021 07:11:44 -0800 (PST)
Message-ID: <013b7045-1592-2e75-2608-eeb2aa08fb15@mind.be>
Date: Sun, 12 Dec 2021 16:11:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-GB
To: Bernd Kuhls <bernd.kuhls@t-online.de>, buildroot@buildroot.org
References: <20211211223518.2634490-1-bernd.kuhls@t-online.de>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211211223518.2634490-1-bernd.kuhls@t-online.de>
Subject: Re: [Buildroot] [PATCH v2 1/1] package/tvheadend: bump version
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 11/12/2021 23:35, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
> v2: fixed patch to apply on master branch (Arnout)
> 
>   package/tvheadend/tvheadend.hash | 2 +-
>   package/tvheadend/tvheadend.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/tvheadend/tvheadend.hash b/package/tvheadend/tvheadend.hash
> index 1c896df140..db06af53b7 100644
> --- a/package/tvheadend/tvheadend.hash
> +++ b/package/tvheadend/tvheadend.hash
> @@ -1,3 +1,3 @@
>   # Locally computed
> -sha256  fc734c36c98aa1535172621c3b6fcac9f1d253f850abc50d01b771937bfd2a76  tvheadend-dbaa0f850394af8ab845df802f5f781ac0218ec4.tar.gz
> +sha256  11eeca461e74fbe8306916933cab96d35a99fa89d81e26126e194875c41b6fad  tvheadend-b8710206eb073c72b142bce95846b77a0ffa34a6.tar.gz
>   sha256  54dc3cbc00bf126bcba43e2af7f3ad1dc00f335985da1409fa943c7b7256d942  LICENSE.md
> diff --git a/package/tvheadend/tvheadend.mk b/package/tvheadend/tvheadend.mk
> index 3c1764c478..27443307da 100644
> --- a/package/tvheadend/tvheadend.mk
> +++ b/package/tvheadend/tvheadend.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -TVHEADEND_VERSION = dbaa0f850394af8ab845df802f5f781ac0218ec4
> +TVHEADEND_VERSION = b8710206eb073c72b142bce95846b77a0ffa34a6
>   TVHEADEND_SITE = $(call github,tvheadend,tvheadend,$(TVHEADEND_VERSION))
>   TVHEADEND_LICENSE = GPL-3.0+
>   TVHEADEND_LICENSE_FILES = LICENSE.md
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
