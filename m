Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26085C433F5
	for <buildroot@archiver.kernel.org>; Mon, 25 Apr 2022 20:24:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BA52B60F35;
	Mon, 25 Apr 2022 20:24:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CvATyjajG81I; Mon, 25 Apr 2022 20:24:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CFD4360EA3;
	Mon, 25 Apr 2022 20:24:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9D80C1BF2AB
 for <buildroot@lists.busybox.net>; Mon, 25 Apr 2022 20:24:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8BFFF60EA3
 for <buildroot@lists.busybox.net>; Mon, 25 Apr 2022 20:24:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id e6BXC8fI0Dy4 for <buildroot@lists.busybox.net>;
 Mon, 25 Apr 2022 20:24:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 334DF60E81
 for <buildroot@buildroot.org>; Mon, 25 Apr 2022 20:24:32 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id z99so19837252ede.5
 for <buildroot@buildroot.org>; Mon, 25 Apr 2022 13:24:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=La0DmdQ1hVqviXMfDWIMTtBaxbUOh4VAjkaaeHgd3v0=;
 b=ebRyyuHgbcUBDyK9Io8LHByIiuy/Xer3OJxcJE3fd1VyC35ivv+qIXOy1/QLrvGSL/
 UNFwq3czmKPZwQsz2S14d7fNIyYgyfQhcKMCJAhWb+N4TbkTYd1NG82r2CvsWXGwBSgP
 BtrtyCUMeNyV1yNZ5e67vEIBB1ewF89joeDbyDBMTOY/cabh3xhT12ORWMQ/+EZOa961
 7T3i+C/Xs5ZJH5INLVPErinIgkFq1Y/tgFsaXO8H6mLPWcHTWbx0R2x/17UxXeemOIJL
 ApD35n7pGgb7HNTTmkxMw1mHfCfdHZrt9IyrHIRwd+CH1HFPqSiWVz8USRiHfCQGeWhG
 5v/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=La0DmdQ1hVqviXMfDWIMTtBaxbUOh4VAjkaaeHgd3v0=;
 b=H/+QIpSWBEJLV198r9twWl7egCeviRane3lz3qWoWIu8OnLk1wPqbi68wDHFo2Qte4
 DJ2R9gqzvkqPTF28revXhTzEEXImPKrGkyjV+f7sduWTnHXD3fhN/EJ+DoOU2vO0G02b
 mFB/gi4i/WqKAyjCxlt/NbRcpNEOzfLHqd40LOPYkPIVnGXjTQNwlccgj2mbJVkIDQ/J
 yDjNZwTMUZPWuHiP7D3Ax7vvBu/UKQ1tIKXEGGbcvIYF1aWySJlpXnmKbKNkw3ftHUoQ
 +/7W7tmJH7kzrURaFcCx7+efOOQtM08p648FrV16WBEjHqbZuEwFoV/QtFIYyykrqoHX
 C2JA==
X-Gm-Message-State: AOAM532M5zqPwLk4DmnjqT8cHmai1A8H9/DVGA1WYkz9vTBmPThdvSwY
 vPzIPYUj0dElmvXd1OuHXcMYIw==
X-Google-Smtp-Source: ABdhPJwu73QSLq92FO9mDwrIUVUq/QuoMpfK6oS3WjC16W/FVeWtpkroM3Swg0l8KZLjAXZ/3/wApQ==
X-Received: by 2002:a05:6402:5114:b0:423:f33d:b3c with SMTP id
 m20-20020a056402511400b00423f33d0b3cmr20870239edd.199.1650918270447; 
 Mon, 25 Apr 2022 13:24:30 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 x7-20020aa7cd87000000b004207282701fsm4960626edv.63.2022.04.25.13.24.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Apr 2022 13:24:29 -0700 (PDT)
Message-ID: <8baa31f4-f273-6d03-3436-8cfc8bc3a5a7@mind.be>
Date: Mon, 25 Apr 2022 22:24:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220423202458.299067-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220423202458.299067-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/2] package/libhtp: bump to version 0.5.40
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



On 23/04/2022 22:24, Fabrice Fontaine wrote:
> https://github.com/OISF/libhtp/releases/tag/0.5.40
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/libhtp/libhtp.hash | 2 +-
>   package/libhtp/libhtp.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/libhtp/libhtp.hash b/package/libhtp/libhtp.hash
> index eae3009c76..8759823e16 100644
> --- a/package/libhtp/libhtp.hash
> +++ b/package/libhtp/libhtp.hash
> @@ -1,3 +1,3 @@
>   # Locally computed:
> -sha256  d5956b49314fc6a058864130fbcf040a12584ee1e38f3b6ea52aedfa99d4c14a  libhtp-0.5.39.tar.gz
> +sha256  0afaff837c295c868db8c967b87b1b5e21c0386c15c3b5ead474799724c54ef8  libhtp-0.5.40.tar.gz
>   sha256  87c93904e5434c81622ea690c2b90097b9f162aaa92a96542649a157dbf98d15  LICENSE
> diff --git a/package/libhtp/libhtp.mk b/package/libhtp/libhtp.mk
> index 532eaa340b..bb8aa73b42 100644
> --- a/package/libhtp/libhtp.mk
> +++ b/package/libhtp/libhtp.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -LIBHTP_VERSION = 0.5.39
> +LIBHTP_VERSION = 0.5.40
>   LIBHTP_SITE = $(call github,OISF,libhtp,$(LIBHTP_VERSION))
>   LIBHTP_LICENSE = BSD-3-Clause
>   LIBHTP_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
