Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4D0DC05027
	for <buildroot@archiver.kernel.org>; Mon,  6 Feb 2023 10:12:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4D93941525;
	Mon,  6 Feb 2023 10:12:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4D93941525
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id i4P3D60XqXG2; Mon,  6 Feb 2023 10:12:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2512A41526;
	Mon,  6 Feb 2023 10:12:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2512A41526
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1364A1BF2CF
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 10:12:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8658F81B01
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 10:12:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8658F81B01
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8HItGRlhkZIo for <buildroot@lists.busybox.net>;
 Mon,  6 Feb 2023 10:12:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 183CC81497
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 183CC81497
 for <buildroot@buildroot.org>; Mon,  6 Feb 2023 10:12:14 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id j17so16914149lfr.3
 for <buildroot@buildroot.org>; Mon, 06 Feb 2023 02:12:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zPcTs8E2dic8lYrPPHRr4dEHbJUm+7JRu4709QyAnH0=;
 b=SYLPUT+aOgS79o71Ow4WWi3Vi3NTtZPdC58XuykDE59805CUHEdO3psVXpEexL1HG9
 TGcVABJhKk0L36imtxQw/TOZI2KNguyuxrf/OghCWTC3etP4i+Den7/MEeR7K+uwbMUE
 k8ERj5dIYoIl3uRZ3srNrgCXRqJYl+UCRJg7lFQc89OrOkAZt8sBLIHXJ2PwvHrDLB9G
 rWfb1m+WZUzIQ6OqARGxm1+vP9/ogT1Whz/boy9L0eKGEO4eTJCp5wG/ErHawPGbkAKq
 WzbWockLoQ4y5TNHoAlOiQ7cJ54K53GGlELQPkXdz7ckCIiU4iiFWFmZH4Xe01gwGtAi
 VdCQ==
X-Gm-Message-State: AO0yUKUSE8TYP9TMUVfy5pTuGUk+z/mMekWjHMvtHNqJ0948uFxWrrao
 mRT3QaWqlTZWXgyhVNLRCfb1mdZsJvlKZkCA/rU=
X-Google-Smtp-Source: AK7set9mAzHis0ERvgE07xAQo8xnyIdl2FU1Qs+3OYIO5c5sBsj5tSVFoXBhMuE45M57ePeDsgXRMPd7K8he+QdElWM=
X-Received: by 2002:a05:6512:1091:b0:4d5:86a8:55d1 with SMTP id
 j17-20020a056512109100b004d586a855d1mr3554770lfg.155.1675678331990; Mon, 06
 Feb 2023 02:12:11 -0800 (PST)
MIME-Version: 1.0
References: <20220920232154.1219792-1-KAMenyaev@sberdevices.ru>
In-Reply-To: <20220920232154.1219792-1-KAMenyaev@sberdevices.ru>
From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Mon, 6 Feb 2023 11:12:00 +0100
Message-ID: <CAEyMn7YCnxWokN9y90TeqAr4fW21jz0dXZSzYqtEs+qYqG3cxQ@mail.gmail.com>
To: KAMenyaev@sberdevices.ru
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=zPcTs8E2dic8lYrPPHRr4dEHbJUm+7JRu4709QyAnH0=;
 b=ZOdp2C5g1io8mx9DIdIc4DXr7invFFjSWapU4k2OdtR6T0L+qRlifeMPY12LH4aKD6
 XCJHfEov/dSkpQu4skixg6G0neVh4lFc5pnnIFTSi1AI9bqfXMAe7wnrWQSnmNV3X5C0
 o+fmbaESGqPfh+IhnJBP/7HXvCT8mdfTjtskw+sKxuKX09FZjwJkeS3w+0+ZD/HIh4ap
 PxEXLdVoWJCVrS3RoB/98ERbWyNXbGcHTSr3qNj5bCgus4UlGMmzwXis0wOmb+eIFPpj
 rAaZAOenEYnSSS9FzyQqBQccRpYl8iBXC0m18jso1Np8nKjT+z8VsVR3rX6xDFzD1k30
 ThMg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=ZOdp2C5g
Subject: Re: [Buildroot] [PATCH 1/2] package/python-iniparse: add
 host-python-iniparse
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
Cc: Zoltan Gyarmati <zgyarmati@zgyarmati.de>, sdfw_system_team@sberdevices.ru,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi,

Am Mi., 21. Sept. 2022 um 01:24 Uhr schrieb <KAMenyaev@sberdevices.ru>:
>
> From: Konstantin Menyaev <KAMenyaev@sberdevices.ru>
>
> Make the host variant of python-iniparse
> as host-crudini dependency.
>
> Signed-off-by: Konstantin Menyaev <KAMenyaev@sberdevices.ru>

Reviewed-by: Heiko Thiery <heiko.thiery@gmail.com>

> ---
>  package/Config.in.host                     |  1 +
>  package/python-iniparse/Config.in.host     | 11 +++++++++++
>  package/python-iniparse/python-iniparse.mk |  1 +
>  3 files changed, 13 insertions(+)
>  create mode 100644 package/python-iniparse/Config.in.host
>
> diff --git a/package/Config.in.host b/package/Config.in.host
> index f437ef680c..fb805577d1 100644
> --- a/package/Config.in.host
> +++ b/package/Config.in.host
> @@ -72,6 +72,7 @@ menu "Host utilities"
>         source "package/pkgconf/Config.in.host"
>         source "package/pru-software-support/Config.in.host"
>         source "package/pwgen/Config.in.host"
> +       source "package/python-iniparse/Config.in.host
>         source "package/python-cython/Config.in.host"
>         source "package/python-greenlet/Config.in.host"
>         source "package/python-kflash/Config.in.host"
> diff --git a/package/python-iniparse/Config.in.host b/package/python-iniparse/Config.in.host
> new file mode 100644
> index 0000000000..e93022e815
> --- /dev/null
> +++ b/package/python-iniparse/Config.in.host
> @@ -0,0 +1,11 @@
> +config BR2_PACKAGE_HOST_PYTHON_INIPARSE
> +       bool "host python-iniparse"
> +       select BR2_PACKAGE_HOST_PYTHON_SIX # runtime
> +       help
> +         iniparse is an INI parser for Python which is API compatible
> +         with the standard library's ConfigParser, preserves
> +         structure of INI files (order of sections & options,
> +         indentation, comments, and blank lines are preserved when
> +         data is updated), and is more convenient to use.
> +
> +         https://pypi.python.org/pypi/iniparse
> diff --git a/package/python-iniparse/python-iniparse.mk b/package/python-iniparse/python-iniparse.mk
> index d31a490bd8..e76987d1e9 100644
> --- a/package/python-iniparse/python-iniparse.mk
> +++ b/package/python-iniparse/python-iniparse.mk
> @@ -12,3 +12,4 @@ PYTHON_INIPARSE_LICENSE_FILES = LICENSE-PSF LICENSE
>  PYTHON_INIPARSE_SETUP_TYPE = setuptools
>
>  $(eval $(python-package))
> +$(eval $(host-python-package))
> --
> 2.37.3
>
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
