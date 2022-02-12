Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D996CC433EF
	for <buildroot@archiver.kernel.org>; Sat, 12 Feb 2022 13:15:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8D45E4150E;
	Sat, 12 Feb 2022 13:15:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1e9WguCvh6Xp; Sat, 12 Feb 2022 13:15:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B7D00414E4;
	Sat, 12 Feb 2022 13:15:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A4AAC1BF283
 for <buildroot@lists.busybox.net>; Sat, 12 Feb 2022 13:14:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 92E4740272
 for <buildroot@lists.busybox.net>; Sat, 12 Feb 2022 13:14:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EjXKe459KEPz for <buildroot@lists.busybox.net>;
 Sat, 12 Feb 2022 13:14:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7857240445
 for <buildroot@buildroot.org>; Sat, 12 Feb 2022 13:14:00 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id qk11so7776054ejb.2
 for <buildroot@buildroot.org>; Sat, 12 Feb 2022 05:14:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=eWIrfoLo4g55TVHXAUFfqNSymfPS2J+fiZbmHtnmKho=;
 b=QcS4ZsPWNuTvIFg8Dcrh84N8v0bSBrtAp4xnUCROAlp8arHHX1mzqOh4b8l2vUbz8c
 NWumRue4+JPYdruuqvVRe43JxLzxIK/nVEQY5QFZK4Lt8nTmW4kVcdivLOTik+Mw7Qir
 ahO9ePiIdoce4mUmW2nFbrwdyjgZq7zc8jkTYoHKPj1nSrc5J9eIuga4qhvpixAuAp5a
 5fzJxVNB1g9U148JwERj/VRKegUmORi2izUYBwio4qoZQV7o+7HjmtG8lQ6mbKzcTSRe
 CzJQFrjnJIzpyqRjimnQQz76sKWNSArVSATzJmSakdpMUlRf5Wy3ZbsqnhjDnNLI0AZX
 Kx/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=eWIrfoLo4g55TVHXAUFfqNSymfPS2J+fiZbmHtnmKho=;
 b=0yLEQxZgf05XVd7Le7CiC8O+5ovUd2JrWyjH1yFCDAZr7bhOIfz5vvJNApFysn5hc3
 ZSs7DEvK6hCOWgzPH4hFNfAWYTfrDkV06UvzKV5JMtJR2fwvp5HrIWwhnhzvyBHHJD/p
 l3xeK3OYbPRMgyg4va9oNCnMInDAr1eE9zpmq7SqI0g1v2EUeFxzgL1psn74MUk/RlvJ
 xpGSpBS02bo80MEAHyesAaAK6jQQ6zMSIRRG+Jq3yi01M1U40zCTYnMaDkWNnVOtsfmx
 k9mHtXSO1RTHuwOc/duFjuXi1jL9T26hn9s9QoRV9uXlz70/+4e7SFyuT7ueW+qkjqdj
 dHhQ==
X-Gm-Message-State: AOAM532gh5vMSgduqB1Y+s3Mao/KUY6kGGnT6QoLZ8d2RWi13gZL9FmV
 jGPZp3c2MZXTcMtIUZIiba4OyA==
X-Google-Smtp-Source: ABdhPJyTuwnzI8REGg0aOSY6cN8jnW/q3dGRHJVW1lH0s8OpKGSN1l5mDp4TXNJOIs4Z1CRs46sNUA==
X-Received: by 2002:a17:906:4dd5:: with SMTP id
 f21mr4929014ejw.474.1644671638626; 
 Sat, 12 Feb 2022 05:13:58 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id s15sm116346ejj.84.2022.02.12.05.13.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 12 Feb 2022 05:13:58 -0800 (PST)
Message-ID: <e3841657-b9ec-6d87-0877-8ec6525093a6@mind.be>
Date: Sat, 12 Feb 2022 14:13:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-GB
To: Maxim Kochetkov <fido_max@inbox.ru>, buildroot@buildroot.org
References: <20220128060728.800722-1-fido_max@inbox.ru>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220128060728.800722-1-fido_max@inbox.ru>
Subject: Re: [Buildroot] [PATCH 1/1 next] package/osm2pgsql: bump version
 1.6.0
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



On 28/01/2022 07:07, Maxim Kochetkov via buildroot wrote:
> Release-notes: https://github.com/openstreetmap/osm2pgsql/releases/tag/1.6.0
> 
> Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/osm2pgsql/osm2pgsql.hash | 2 +-
>   package/osm2pgsql/osm2pgsql.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/osm2pgsql/osm2pgsql.hash b/package/osm2pgsql/osm2pgsql.hash
> index 88299745fb..898fcd5500 100644
> --- a/package/osm2pgsql/osm2pgsql.hash
> +++ b/package/osm2pgsql/osm2pgsql.hash
> @@ -1,3 +1,3 @@
>   # Locally calculated
> -sha256  4af0b925180ead2710eb68af28f70c91a81fb21dde5f80659d78e9fd14cf52cc  osm2pgsql-1.5.2.tar.gz
> +sha256  0ec8b58ab972ac8356185af4161270c1b625a77299f09e5fb7f45e616ef1a9a5  osm2pgsql-1.6.0.tar.gz
>   sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
> diff --git a/package/osm2pgsql/osm2pgsql.mk b/package/osm2pgsql/osm2pgsql.mk
> index 43440e0db8..b00976d28b 100644
> --- a/package/osm2pgsql/osm2pgsql.mk
> +++ b/package/osm2pgsql/osm2pgsql.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -OSM2PGSQL_VERSION = 1.5.2
> +OSM2PGSQL_VERSION = 1.6.0
>   OSM2PGSQL_SITE = $(call github,openstreetmap,osm2pgsql,$(OSM2PGSQL_VERSION))
>   OSM2PGSQL_LICENSE = GPL-2.0+
>   OSM2PGSQL_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
