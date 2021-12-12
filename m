Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1A9DC433EF
	for <buildroot@archiver.kernel.org>; Sun, 12 Dec 2021 14:53:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6FCF861CEB;
	Sun, 12 Dec 2021 14:53:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iVimWeP0QONL; Sun, 12 Dec 2021 14:53:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C408361CE6;
	Sun, 12 Dec 2021 14:53:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 685831BF33B
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 14:53:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 632884014E
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 14:53:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ELrTACfV2Avt for <buildroot@lists.busybox.net>;
 Sun, 12 Dec 2021 14:53:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4291540131
 for <buildroot@buildroot.org>; Sun, 12 Dec 2021 14:53:12 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id r25so43989146edq.7
 for <buildroot@buildroot.org>; Sun, 12 Dec 2021 06:53:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=BfEToEZsg4V5gDugoCrCx3VBZQNCP9ntEfYBcuyfixA=;
 b=Ou0Y4Rqi3q7vCp0952ePHuGSsncpBNhZalAYCbIoQQ6k0NZxV+2Tvaaxqx5vMoOKCJ
 OxbjBzSySKkFwCe/jUvNZ1DZ0EmKKh+qVY+snH5e4WYHN3kULOiugOCHMbtdlhJYld0O
 kIUgDQ4/qoHx72XK6ooDDVCvC4tnwR5rUVe5uAect6RVv4LDdx4oBjEKEJFMAvNxfc8b
 krn7x8cp/WilUirr6kVfAJCB3ydykhu0OzEjmFXp8VilRThl8C1bNwZ+PjGSyD4uChve
 WDCTz0S/QH8CoTxeDPl7ruI6Kbd875GGETpgLsuoN/usQiz2fQUC8scpWIbV8WtDwyrI
 Dlmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=BfEToEZsg4V5gDugoCrCx3VBZQNCP9ntEfYBcuyfixA=;
 b=U0SWBqE+j+YxU/2sINYZlwmpHUdc96xE2biuWc26ImMlSuV0Ro43sWjxolpO1b/527
 e23CcDT9qLCGOFDfUlAtmuey8ZwVjSOAnYK1lZA2z1Xpsh3XLmcJ+iMPX6hs8HigkGSw
 C9c6eshBnSfLH9GF6+RnV+7kV0OkFYogMwG7V0/tWZWHAn55PFq5rqynEQTNwfTWmHnT
 3B7o2TVNMR0VALvWomsgFFRg0dKBpyEHWwDyJbS3qqrXQBDMK5gA8E+mvZmJhJGdHCqM
 H/IzkMqQtQJQMand9Oame1yzHFI8E597n0HjLqpNF28W64SWzVIMdfdwm4EZPdbcwSWW
 f1kg==
X-Gm-Message-State: AOAM533A1UIR4LjSdQnYGRvRCWBFnDtSkhyXANjqP4cMvOHH7xlW97xC
 ErlN9/08pfnvgZ0Qm3rav0VUAw==
X-Google-Smtp-Source: ABdhPJyKsQPtqrJJiiJWOhCbskA3HJ6xqt0KYHFvQX+aV1v9p2jvTxXq/uhx290iv8Qq8joQFWhkTw==
X-Received: by 2002:a17:907:6d82:: with SMTP id
 sb2mr37991982ejc.440.1639320790397; 
 Sun, 12 Dec 2021 06:53:10 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id ne37sm4602219ejc.87.2021.12.12.06.53.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 12 Dec 2021 06:53:10 -0800 (PST)
Message-ID: <33f8eefc-2d0b-d463-1b0a-ffe12f782143@mind.be>
Date: Sun, 12 Dec 2021 15:53:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20211211211946.233703-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211211211946.233703-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/cups-pk-helper: add
 CUPS_PK_HELPER_CPE_ID_VENDOR
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



On 11/12/2021 22:19, Fabrice Fontaine wrote:
> cpe:2.3:a:cups-pk-helper_project:cups-pk-helper is a valid CPE
> identifier for this package:
> 
>    https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Acups-pk-helper_project%3Acups-pk-helper
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/cups-pk-helper/cups-pk-helper.mk | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/package/cups-pk-helper/cups-pk-helper.mk b/package/cups-pk-helper/cups-pk-helper.mk
> index c90b94da14..c688743160 100644
> --- a/package/cups-pk-helper/cups-pk-helper.mk
> +++ b/package/cups-pk-helper/cups-pk-helper.mk
> @@ -9,6 +9,7 @@ CUPS_PK_HELPER_SITE = https://www.freedesktop.org/software/cups-pk-helper/releas
>   CUPS_PK_HELPER_SOURCE = cups-pk-helper-$(CUPS_PK_HELPER_VERSION).tar.xz
>   CUPS_PK_HELPER_LICENSE = GPL-2.0+
>   CUPS_PK_HELPER_LICENSE_FILES = COPYING
> +CUPS_PK_HELPER_CPE_ID_VENDOR = cups-pk-helper_project
>   CUPS_PK_HELPER_DEPENDENCIES = cups libglib2 polkit
>   
>   $(eval $(autotools-package))
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
