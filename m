Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 439A4C433EF
	for <buildroot@archiver.kernel.org>; Tue,  4 Jan 2022 17:56:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DF43E60BBE;
	Tue,  4 Jan 2022 17:56:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FrdDNQDOCboS; Tue,  4 Jan 2022 17:56:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3F85060B97;
	Tue,  4 Jan 2022 17:56:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B11C71BF2EF
 for <buildroot@lists.busybox.net>; Tue,  4 Jan 2022 17:56:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A034681ABA
 for <buildroot@lists.busybox.net>; Tue,  4 Jan 2022 17:56:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HaBMAXlCJnpN for <buildroot@lists.busybox.net>;
 Tue,  4 Jan 2022 17:56:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9BA4A8297F
 for <buildroot@buildroot.org>; Tue,  4 Jan 2022 17:56:09 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id o6so151594403edc.4
 for <buildroot@buildroot.org>; Tue, 04 Jan 2022 09:56:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=0SIKbLrhcK8r9QIGXVBn8F/ZOwW2Ni1gjslEO18WzQ0=;
 b=TNSLXivhy0Y0SzdhU9v/dA6acCgZdh654bVi3Egf1M2vFGjHhgFmUBZ1wD1LVmt+e7
 ZBBGVtVQQzvOla66y25QnbS3D+TAZrpjG0A6HKUt7o6yIuz83p/WHO3rMupZl794LhY3
 PIr1WRdWeR3vw1jcacHHpQvsv0o/pyklcpVIr4/gapvIVsrl/XzUqB+LFlwP+2keeDy+
 VgrCEZKa1LA5OB0erqOhzQRAlxoYlcvCnef+uxL1Yw+sa1e9Da1qDmTUOnrHv0UlgnGL
 AbkNBiS+wNYfHnuq/i2olse2PF+MMlTwK6qsIUL+zZqm1EA7023owZFb+ziwVs4rFzTH
 9zzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=0SIKbLrhcK8r9QIGXVBn8F/ZOwW2Ni1gjslEO18WzQ0=;
 b=Yp8LtU0Ng/8e76sJ35S8V6lMgsP3KKB17IsJYbv/UfeM57s97QpwzZwROdU7V24xbw
 vTQJuuhelZkJeY2eyEUVkx6zifJ9BZmRZNhRdhVhKvZ+TUNGHAoH6WoWmnH2Hzo/XP41
 Q5zp8apbcq+wt7Ch7OSDid6nj3iOtbYDWrXBDwcZB/EP8H1XCDWEPVBvP86gMBAc+jY2
 6ZjcDgn0YHPpN3hQndgQPOcBmgJFFBV6nQSsDCBBn/Qno2K2HNllK/+dgrC2N4ySbkV3
 KEKTGozDblchsIFGi8+lnTJvwjPK+X7yU3/QqBV5ub//qdtWPAksv2xNK5Jvc4i7VSI9
 LoBw==
X-Gm-Message-State: AOAM532wCzRzkqPxzyAoWRJ/olK7/toaV4mHidOZG019kWvqvGrxfuik
 p82pHW+dVJ6MIykDD+OJaqO3qg==
X-Google-Smtp-Source: ABdhPJytAtgBYtyWFUTA2kNqjtVPL/v0A3CDsFbn09nwk2Lqos8+yo29WFSyrf5fua2fdgNW3YbofQ==
X-Received: by 2002:a05:6402:4241:: with SMTP id
 g1mr49669902edb.11.1641318967902; 
 Tue, 04 Jan 2022 09:56:07 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id b6sm805546edd.47.2022.01.04.09.56.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Jan 2022 09:56:07 -0800 (PST)
Message-ID: <61aad133-ed50-1cda-80bb-b04ce9dbd133@mind.be>
Date: Tue, 4 Jan 2022 18:56:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220101225906.2341845-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220101225906.2341845-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/lxc: bump to version 4.0.11
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
Cc: =?UTF-8?B?SsOpcsO0bWUgUG91aWxsZXI=?= <jezz@sysmic.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 01/01/2022 23:59, Fabrice Fontaine wrote:
> The LXC 4.0 branch is supported until June 2025.
> Only bugfixes and securitiy issues get included into the stable bugfix
> releases, so it's always safe and recommended to keep up and run the
> latest bugfix release.
> 
> https://discuss.linuxcontainers.org/t/lxc-4-0-11-has-been-released/12427
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/lxc/lxc.hash | 2 +-
>   package/lxc/lxc.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/lxc/lxc.hash b/package/lxc/lxc.hash
> index efd7a8e42c..2b58df2f1d 100644
> --- a/package/lxc/lxc.hash
> +++ b/package/lxc/lxc.hash
> @@ -1,4 +1,4 @@
>   # Locally calculated
> -sha256  a10c518056d2e497bd600e4ffac2853bdeab1e835bf455a6d87cc8df128bfae9  lxc-4.0.10.tar.gz
> +sha256  afa481e17ca9a9cf9fd3d2d7a04e42a8f6bfe60b323909326c968e852cd9f02c  lxc-4.0.11.tar.gz
>   sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  LICENSE.GPL2
>   sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  LICENSE.LGPL2.1
> diff --git a/package/lxc/lxc.mk b/package/lxc/lxc.mk
> index 93f6d2535f..4d63fc14cb 100644
> --- a/package/lxc/lxc.mk
> +++ b/package/lxc/lxc.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -LXC_VERSION = 4.0.10
> +LXC_VERSION = 4.0.11
>   LXC_SITE = https://linuxcontainers.org/downloads/lxc
>   LXC_LICENSE = GPL-2.0 (some tools), LGPL-2.1+
>   LXC_LICENSE_FILES = LICENSE.GPL2 LICENSE.LGPL2.1
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
