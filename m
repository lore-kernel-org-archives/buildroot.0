Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55D52C433FE
	for <buildroot@archiver.kernel.org>; Thu, 12 May 2022 07:22:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B6CB960D5B;
	Thu, 12 May 2022 07:22:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZveapatDbKHb; Thu, 12 May 2022 07:22:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9D45860BF5;
	Thu, 12 May 2022 07:22:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 00D551BF4D8
 for <buildroot@lists.busybox.net>; Thu, 12 May 2022 07:22:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E398240343
 for <buildroot@lists.busybox.net>; Thu, 12 May 2022 07:22:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=googlemail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GX7NfTQu66cP for <buildroot@lists.busybox.net>;
 Thu, 12 May 2022 07:22:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com
 [IPv6:2607:f8b0:4864:20::d2d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CA3F04033C
 for <buildroot@buildroot.org>; Thu, 12 May 2022 07:22:21 +0000 (UTC)
Received: by mail-io1-xd2d.google.com with SMTP id a10so4392365ioe.9
 for <buildroot@buildroot.org>; Thu, 12 May 2022 00:22:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dDn9QxBwN8jQp/8xZRMvVllr/datykAdwxmBqmV+Me8=;
 b=ZbHTI28TPVWtrDb2FdEwHMNnwPoIYIwMflA1ufQlWfwpvEl0I+M8r7TbMi1+p2kfc0
 iuQTDKbptVcpQnOWWRowehEI2r+SOnVLHXDN5ZTWql2msX0tj/Yjikdh+1wMTTexCfTQ
 UDu6sSgfGuHMziR1rchhEnY+iTryOMwD0ybRf1lsPFlDeeYMUCfAtRFfsilZvOeJ4mLQ
 Apnhos8m4XZQUVCrcDV1qm/jWprJpYBvVGEpWBE+1BtmRzCmXevdSOF0Ao/ehAGGUQ6+
 4oS+vDXBiek6C+d3I66tTsRwQbuIzQkWtkFg67KtuzZ611MmSC/pU+O1a3ARm3e6Aq1X
 A0GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dDn9QxBwN8jQp/8xZRMvVllr/datykAdwxmBqmV+Me8=;
 b=1rAbOG5nr8AsI9u+qFI0sEUI+4d+iyenDkTQEpgOrga4lPkaoDQXe8kT2+lStP5Yss
 pNLDD2PSa5q8iF7ATCFikKnBbsDK0ryKo5p3xH4FctSnv89WqqwAIb6pCbdMoiryMyLA
 L4ESMCzUZaXJf8tVIDn/fuZUNVahq2218fwfoAtt3556hZwKbDCPmhiidS3FYoO0fADM
 tzaEgb5qo5gp8F25vwCx11hXNeF5Hse41V8waTe3Ka18e3JtMR9hfESnpI0NZBmwD1/D
 Min+bBqP2QRtCmsZplemZJFEE6dOxdFrcbVWm7e/yPWRJ63Ts6ZpXbC6qAWGTD05cjd7
 aiAQ==
X-Gm-Message-State: AOAM533evQrzl2ijIMxSHo+weQwFjz7me5Z552k33xtFb0KKryOL8kWF
 nUKy2kh1ejol2MA2GWgnLoTAw7bNfMEUdCg+tQw=
X-Google-Smtp-Source: ABdhPJymydYcTs0z+frPs7JqySw7W6vZZX4KSDRU5XN4PhgWjuzbEf50BSxNodXXaVURCQlerGToL6sKkOW1WRNw+B4=
X-Received: by 2002:a05:6638:2584:b0:32d:b5e8:b271 with SMTP id
 s4-20020a056638258400b0032db5e8b271mr7559913jat.113.1652340140712; Thu, 12
 May 2022 00:22:20 -0700 (PDT)
MIME-Version: 1.0
References: <20220511194616.2272499-1-geomatsi@gmail.com>
In-Reply-To: <20220511194616.2272499-1-geomatsi@gmail.com>
Date: Thu, 12 May 2022 09:22:10 +0200
Message-ID: <CAGm1_kvOq3F_BNFqWOQhaJsRthOLG1k8vNWtJr3cAqZex2A4Eg@mail.gmail.com>
To: Sergey Matyukevich <geomatsi@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/wpa_supplicant: wired driver
 needs headers >= 4.6
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
From: Yegor Yefremov via buildroot <buildroot@buildroot.org>
Reply-To: Yegor Yefremov <yegorslists@googlemail.com>
Cc: Matt Weber <matthew.weber@collins.com>, buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Sergey,

On Wed, May 11, 2022 at 9:46 PM Sergey Matyukevich <geomatsi@gmail.com> wrote:
>
> Wired driver enables macsec support which depends on if_macsec.h.
> That header has only been exported since kernel v4.6, see commit:
> https://github.com/torvalds/linux/commit/dece8d2b78d19df7fe5e4e965f1f0d1a3e188d1b
>
> Fixes:
> - http://autobuild.buildroot.net/results/6bb619eb7fdecf7824fcc549c4ccb8e487665d10/
>
> Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>

Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>

Regards,
Yegor

> ---
>  package/wpa_supplicant/Config.in | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/package/wpa_supplicant/Config.in b/package/wpa_supplicant/Config.in
> index 7e2432985c..92953f69f0 100644
> --- a/package/wpa_supplicant/Config.in
> +++ b/package/wpa_supplicant/Config.in
> @@ -42,6 +42,7 @@ config BR2_PACKAGE_WPA_SUPPLICANT_WEXT
>  config BR2_PACKAGE_WPA_SUPPLICANT_WIRED
>         bool "Enable wired support"
>         depends on BR2_TOOLCHAIN_HAS_THREADS # libnl
> +       depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_6
>         select BR2_PACKAGE_LIBNL
>         select BR2_PACKAGE_WPA_SUPPLICANT_EAP
>         help
> @@ -49,6 +50,9 @@ config BR2_PACKAGE_WPA_SUPPLICANT_WIRED
>           supplicant can be used with Ethernet.  This also enables
>           support for MACSEC.
>
> +comment "wired macsec support needs a toolchain w/ headers >= 4.6"
> +       depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_6
> +
>  comment "wired support needs a toolchain w/ threads"
>         depends on !BR2_TOOLCHAIN_HAS_THREADS
>
> --
> 2.35.1
>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
