Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D9DDC433EF
	for <buildroot@archiver.kernel.org>; Sat, 23 Apr 2022 06:46:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9784B83E5C;
	Sat, 23 Apr 2022 06:46:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UnT5aAcGIZdG; Sat, 23 Apr 2022 06:46:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 51BD883E5D;
	Sat, 23 Apr 2022 06:46:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 05F711BF255
 for <buildroot@lists.busybox.net>; Sat, 23 Apr 2022 06:46:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E1E4C83E5D
 for <buildroot@lists.busybox.net>; Sat, 23 Apr 2022 06:46:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FwNJL4HLgdCF for <buildroot@lists.busybox.net>;
 Sat, 23 Apr 2022 06:46:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DDF1C83E5C
 for <buildroot@buildroot.org>; Sat, 23 Apr 2022 06:45:59 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id n17so12005866ljc.11
 for <buildroot@buildroot.org>; Fri, 22 Apr 2022 23:45:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=paral.in; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QS9N7p95LwtK/bMXiD9Nu2RSsAZ60qDPNRSpeYg39jw=;
 b=EAybPiFv1KOtexDiqMcTMMxbPSb7d2U74zEIge9TZTkbY4uv6Kvrrwn0pquAa3qcXS
 66Yz6DHtLTdVIC6SF9cxOBzb4i0NjouRgOoL+t6orqjvHBu6LidiqB81+jfzirMCIXNK
 BZp/qNn/ysKGkEMCv8HoWJPIREeftkUQEydVmZFbjGo4MauiVqdu8nVFzPSvhXBokG+L
 sS7r/sTpegztpBoTQRsacjoiUonkZmCzq+JV8DL9lcuYH+m5qOww8INaEgu8Z7CaVv9E
 mtWFPqfRO6cxhiJvn4VOzmyuoxH0Uf60ognl3LLR45k2iveZJsI2fF9SxV//IsvOOjqN
 0Yrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QS9N7p95LwtK/bMXiD9Nu2RSsAZ60qDPNRSpeYg39jw=;
 b=x+oy3xdlw9lsnYA0uqPdkPZEKkvxRxZ8EuG6cLu7kxdSNw1Ua71vFTy1t+QdHmmneT
 hNxl7WhW/jcRcyqiLkPOtrMnKkbmEhdSHhVw8TyMypOEK3tuwLjwAP4QnMqaRpGNzAjh
 ZSzK9EzaluK+eDxvIL146nfsDsTlwrsyOqxGWm/q95W5f6CZPoLOfIp0WEMl4bhv51eE
 1ZiJz46uCCGPZTgcnCdhybZWCELUbUgeGrBeoWKqd9JqNIkOb+IXwQegI/DoMoMxLQD2
 XYlnWuD1fGGeV9cEYPG+Shm2BpYBEnGz0h030oJB5dfW77OObpbBbSyCSBFtiRRmjU52
 1GiQ==
X-Gm-Message-State: AOAM531yLSVkA9JkSxA7n3BvONn6Bz0wveK+BPoqYwFXGDftJJ+N22CN
 VgKs1OBvv0uoKx7IPuzbNKp4Zv+wUIHvyA==
X-Google-Smtp-Source: ABdhPJw9uc1skZNIQuruyGebT1DllMFrTDiB+hx/LYClL9KUCZqaAtSKYx1GiYhjZdjlXxpTLmw3gQ==
X-Received: by 2002:a05:651c:211c:b0:24d:c7e2:7327 with SMTP id
 a28-20020a05651c211c00b0024dc7e27327mr4903607ljq.223.1650696357277; 
 Fri, 22 Apr 2022 23:45:57 -0700 (PDT)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com.
 [209.85.208.169]) by smtp.gmail.com with ESMTPSA id
 v7-20020a2e5047000000b0024f050c6b35sm118760ljd.20.2022.04.22.23.45.56
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Apr 2022 23:45:56 -0700 (PDT)
Received: by mail-lj1-f169.google.com with SMTP id bj36so11994305ljb.13
 for <buildroot@buildroot.org>; Fri, 22 Apr 2022 23:45:56 -0700 (PDT)
X-Received: by 2002:a2e:7a17:0:b0:24f:5c1:8c6 with SMTP id
 v23-20020a2e7a17000000b0024f05c108c6mr691276ljc.394.1650696355986; 
 Fri, 22 Apr 2022 23:45:55 -0700 (PDT)
MIME-Version: 1.0
References: <20220419185821.4087483-1-fontaine.fabrice@gmail.com>
In-Reply-To: <20220419185821.4087483-1-fontaine.fabrice@gmail.com>
Date: Fri, 22 Apr 2022 23:45:44 -0700
X-Gmail-Original-Message-ID: <CA+h8R2oP-U05FXur_dJDQLV8KjB=Qm1RzJtq5gQvr=at-+pvCw@mail.gmail.com>
Message-ID: <CA+h8R2oP-U05FXur_dJDQLV8KjB=Qm1RzJtq5gQvr=at-+pvCw@mail.gmail.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/batman-adv: needs CONFIG_CRC16
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@paral.in>
Cc: Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

 Hi,

On Tue, Apr 19, 2022 at 12:00 PM Fabrice Fontaine
<fontaine.fabrice@gmail.com> wrote:
>
> CONFIG_CRC16 is needed to avoid the following build failure:
>
> ERROR: modpost: "crc16" [/nvmedata/autobuild/instance-6/output-1/build/batman-adv-2021.4/net/batman-adv/batman-adv.ko] undefined!
>
> Fixes:
>  - http://autobuild.buildroot.org/results/64bf0f89ef444dda4d1277c0e46d189ad2515713
>
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/batman-adv/batman-adv.mk | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/package/batman-adv/batman-adv.mk b/package/batman-adv/batman-adv.mk
> index 838f9b1851..6a1aaa699c 100644
> --- a/package/batman-adv/batman-adv.mk
> +++ b/package/batman-adv/batman-adv.mk
> @@ -35,6 +35,7 @@ define BATMAN_ADV_CONFIGURE_CMDS
>  endef
>
>  define BATMAN_ADV_LINUX_CONFIG_FIXUPS
> +       $(call KCONFIG_ENABLE_OPT,CONFIG_CRC16)
>         $(call KCONFIG_ENABLE_OPT,CONFIG_LIBCRC32C)
>  endef

Reviewed-by: Christian Stewart <christian@paral.in>

Thanks,
Christian
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
