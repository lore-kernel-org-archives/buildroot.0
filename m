Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F794C433F5
	for <buildroot@archiver.kernel.org>; Tue,  4 Jan 2022 18:00:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CF98A40937;
	Tue,  4 Jan 2022 18:00:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5Ovagdy1gAKK; Tue,  4 Jan 2022 18:00:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BF99740963;
	Tue,  4 Jan 2022 18:00:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 889CF1BF2EF
 for <buildroot@lists.busybox.net>; Tue,  4 Jan 2022 18:00:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 779C160B25
 for <buildroot@lists.busybox.net>; Tue,  4 Jan 2022 18:00:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id E5Gfr1Ff7Zgx for <buildroot@lists.busybox.net>;
 Tue,  4 Jan 2022 18:00:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7ECD460A7D
 for <buildroot@buildroot.org>; Tue,  4 Jan 2022 18:00:19 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id o6so151637035edc.4
 for <buildroot@buildroot.org>; Tue, 04 Jan 2022 10:00:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=I3IM9j4zX4/x7LqC3qeJfCrU1gRk1AXOoYNfz+tb2CA=;
 b=GAU7BU4j2lHWunYOPGrCd63BqgOfVHId0fyqQDMsOLYr/3dM2Wo8rP8qC5q/2eW4ez
 8iUr3w2YVePRUFA/uY00iqPCH0fffyuMBiwRiKQXgLWFYVhWSZK8JfbbFtMQBlAzBi4L
 QjLU/n/qQcn97o9RyqG+GajPQJ04HALNJWnCGViNA9pFobvHoy8X9iZkmrsk3VoZPig1
 K/YVi9B/izPQ73TdGxHyhG06LRJpFYepIHk0EOpzcOhnUgsNp49UEcX9BKnYlxufhF5L
 oUQR04hTUY00wIKLbEbJbFNUR7KcNs46WJVAVMS/t5coOBYY15O9P6OsRATxFvJucgk2
 ouGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=I3IM9j4zX4/x7LqC3qeJfCrU1gRk1AXOoYNfz+tb2CA=;
 b=FIxKhJPty5okbLn608iEz5axksWIVCTWILfsPqSO0rCTRxckxUGKZvQe+pCmCkbMS7
 3nanL0pK7kURRxDNXVpFoEN33G4btbu2cauII2oLIf8NhWGWgyW2qzgdrZKG76prWBa9
 M3pLI75GtKJamzGaDdcyWrxRV5Ai37kpxfT/U7xhM90/Vpm7LqZsDL1lm6fwZ2/bnPxO
 +d5bJ4ll/3aILQHkdoTjpxFTo8X9eqC9mr2DDcwx9G2WZLH7cL2VUs4X7YYKuJlC0/hw
 5wkURx39jTd+yht7cQkXp0J2AAGtzfckJpEPjhffDiJZsAJRaaufp/qcraZbRiBURUjG
 R/EA==
X-Gm-Message-State: AOAM530TW6PHlNYYmNhmp250Xgb1fRmT3Ep0pXW06gwJxcp/8HCpONN7
 UknQ7SfAdnD4ppLDW+sSrFjWJFIVXWhALQ==
X-Google-Smtp-Source: ABdhPJzg3AEy0jZuYDpMs8iBR33m67QMLNBwBBqYu3xQslWjYhxgoxiCxeXpCJGFNkZ/dMQYjascfw==
X-Received: by 2002:a17:906:828a:: with SMTP id
 h10mr40548665ejx.164.1641319217781; 
 Tue, 04 Jan 2022 10:00:17 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id hr28sm11744448ejc.186.2022.01.04.10.00.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Jan 2022 10:00:17 -0800 (PST)
Message-ID: <44a80bd0-9257-9cd5-d192-d6a0985200d6@mind.be>
Date: Tue, 4 Jan 2022 19:00:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220102174659.2824253-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220102174659.2824253-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/alsa-utils: bump to version
 1.2.6
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 02/01/2022 18:46, Fabrice Fontaine wrote:
> https://github.com/alsa-project/alsa-utils/releases/tag/v1.2.6
> https://github.com/alsa-project/alsa-utils/releases/tag/v1.2.5.1
> https://github.com/alsa-project/alsa-utils/releases/tag/v1.2.5
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/alsa-utils/alsa-utils.hash | 2 +-
>   package/alsa-utils/alsa-utils.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/alsa-utils/alsa-utils.hash b/package/alsa-utils/alsa-utils.hash
> index dda009c1af..c2d3ee9bb5 100644
> --- a/package/alsa-utils/alsa-utils.hash
> +++ b/package/alsa-utils/alsa-utils.hash
> @@ -1,3 +1,3 @@
>   # Locally calculated
> -sha256  98ffc2d599de0577d423a48fa5f20a992ca0b82d812ed1f2e58ade49ac6da426  alsa-utils-1.2.4.tar.bz2
> +sha256  6a1efd8a1f1d9d38e489633eaec1fffa5c315663b316cab804be486887e6145d  alsa-utils-1.2.6.tar.bz2
>   sha256  231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c  COPYING
> diff --git a/package/alsa-utils/alsa-utils.mk b/package/alsa-utils/alsa-utils.mk
> index 2603e52f18..c1478bf847 100644
> --- a/package/alsa-utils/alsa-utils.mk
> +++ b/package/alsa-utils/alsa-utils.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -ALSA_UTILS_VERSION = 1.2.4
> +ALSA_UTILS_VERSION = 1.2.6
>   ALSA_UTILS_SOURCE = alsa-utils-$(ALSA_UTILS_VERSION).tar.bz2
>   ALSA_UTILS_SITE = https://www.alsa-project.org/files/pub/utils
>   ALSA_UTILS_LICENSE = GPL-2.0
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
