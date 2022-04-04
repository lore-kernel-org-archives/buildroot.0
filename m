Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E31D3C433F5
	for <buildroot@archiver.kernel.org>; Mon,  4 Apr 2022 19:45:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9EE0660FB6;
	Mon,  4 Apr 2022 19:45:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eCoHsuEj53vx; Mon,  4 Apr 2022 19:45:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D10A660BEF;
	Mon,  4 Apr 2022 19:45:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DA2F21BF27E
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 19:45:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C8BAF4038B
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 19:45:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5fs0-RP_kct7 for <buildroot@lists.busybox.net>;
 Mon,  4 Apr 2022 19:45:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D30F840327
 for <buildroot@buildroot.org>; Mon,  4 Apr 2022 19:45:20 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id p15so22164829ejc.7
 for <buildroot@buildroot.org>; Mon, 04 Apr 2022 12:45:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=OghR5/qgD9y4vSiWKlUM73kexcwoCNrcUBA3lPboRkk=;
 b=HysCbpXLcX9Ke/VdgHm80RpdDY60J2nuafYCittzRhXUjyZG2rNJ33syotpp7hlzGr
 T+7/sRNDqABRzoqdCQ1yhsabmx5o6hoVsUUNUY+zohBOkBqF39ejfhS7sb3XGAe7vHiU
 HOI//UAnAqHbEQRRC1MVqiEfwZ1pZV1xikTuBNBM0dtQl89p3P/4LltsUHL2o8RhceAZ
 LXgXgAXt0r2QGrl/s8kKQZM3apcjIJkbAOybkZmpCgWVOsCSqleI90xZ/bC5BWAU3BjX
 /fLArfR+ZuvsuD03xgbDlw3jFRhqnHP7s13itl3ncaa44OIObUYhXwps0mc1X7ectgvS
 ipug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=OghR5/qgD9y4vSiWKlUM73kexcwoCNrcUBA3lPboRkk=;
 b=6yZLHOrokfC1mgCJTYsf+sn7n5NEUf1sJZHAdQbCY555TXK2QNwpf47T1jUTXWNoOZ
 sWzLNrcueaSt5OLATH76Eb9QBs/4ddvVPqZU9lrFOJO8/LZrIlxTk9WTPuTbzXXvgtWh
 GGfgGk3a3M2mDOLBlJ+jav6gVVNIQwhVv6F6oSMzP8FyE//CAwFwpDbY2GKeasizjTRs
 xSeIB4MRBRGKSrTG0u0ASnhHQqZYK2IvjQTeTBrz04DcgFY8jCOsnxMowWfujmyWMjA2
 4VLI1V1VxGcdRaTHa3QyLWaf02U+dnNw6H8Tlvh2xPkJlzhh4XlkA/N4Ywh7B4hZ1G4e
 J5vg==
X-Gm-Message-State: AOAM533maMtNmPT1XbS0miLsXylzRle5Hx1l/2jdyoo7m/hyNcwcTUbn
 dTjN9NHe6M1FYWeoBcSrKndHpw==
X-Google-Smtp-Source: ABdhPJw2mRF2XEVa3LOiL5TmIWZFJWsm914/JKBovG1XQsp+o1hP8FEjW4WXmjjbek+T2PilBO8cgQ==
X-Received: by 2002:a17:906:c14b:b0:6da:b30d:76a0 with SMTP id
 dp11-20020a170906c14b00b006dab30d76a0mr1625130ejc.279.1649101519046; 
 Mon, 04 Apr 2022 12:45:19 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 za11-20020a170906878b00b006e7f5d17d4dsm1300509ejb.140.2022.04.04.12.45.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Apr 2022 12:45:18 -0700 (PDT)
Message-ID: <c89f53c2-b107-29bc-5a18-0b0fa1de2c58@mind.be>
Date: Mon, 4 Apr 2022 21:45:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220403211754.2037013-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220403211754.2037013-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/gstreamer1/gstd: fix build with
 gcc 4.8
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



On 03/04/2022 23:17, Fabrice Fontaine wrote:
> Fix the following build failure with gcc 4.8 raised since bump to
> version 0.14.0 in commit a334b9a7668ba412cb2da79b75a019cd89985145 and
> https://github.com/RidgeRun/gstd-1.x/commit/e83c94920bb33846ff0642dcf070fc5fd124e4f6:
> 
> ../libgstd/libgstd.c: In function 'gstd_set_ipc':
> ../libgstd/libgstd.c:119:5: error: 'for' loop initial declarations are only allowed in C99 mode
>       for (gint ipc_idx = 0; ipc_idx < num_ipcs; ipc_idx++) {
>       ^
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/00ad1b8979000aa10a20228c998389bc913cbbd4
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/gstreamer1/gstd/gstd.mk | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/package/gstreamer1/gstd/gstd.mk b/package/gstreamer1/gstd/gstd.mk
> index 08a29f26ff..817e9143ae 100644
> --- a/package/gstreamer1/gstd/gstd.mk
> +++ b/package/gstreamer1/gstd/gstd.mk
> @@ -28,6 +28,8 @@ GSTD_CONF_OPTS = \
>   	-Dwith-gstd-logstatedir=/var/log/gstd \
>   	-Dwith-gstd-systemddir=/usr/lib/systemd/system
>   
> +GSTD_CFLAGS = $(TARGET_CFLAGS) -std=gnu99
> +
>   ifeq ($(BR2_PACKAGE_SYSTEMD),y)
>   GSTD_CONF_OPTS += -Denable-systemd=enabled -Denable-initd=disabled
>   GSTD_DEPENDENCIES += systemd
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
