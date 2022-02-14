Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E413C433F5
	for <buildroot@archiver.kernel.org>; Mon, 14 Feb 2022 20:42:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 300A8404DA;
	Mon, 14 Feb 2022 20:42:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HR0GPG2aGess; Mon, 14 Feb 2022 20:42:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 01370401B2;
	Mon, 14 Feb 2022 20:42:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3B81D1BF348
 for <buildroot@lists.busybox.net>; Mon, 14 Feb 2022 20:42:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 387B460A98
 for <buildroot@lists.busybox.net>; Mon, 14 Feb 2022 20:42:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2IWGuZn9EQnB for <buildroot@lists.busybox.net>;
 Mon, 14 Feb 2022 20:42:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4A09060634
 for <buildroot@buildroot.org>; Mon, 14 Feb 2022 20:42:13 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 az26-20020a05600c601a00b0037c078db59cso181756wmb.4
 for <buildroot@buildroot.org>; Mon, 14 Feb 2022 12:42:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=J/6XbbzK17NjW7xI/iO16gHUyUt3zAGFAe1cbNF1fLw=;
 b=bvSLDiEtUi5PvdAKvm0cgAyA8c3JEerdvFopFnufLTuLe/O73Ce9Og4J5jMzXwEq4x
 tVGNV9uNsuike8cHWkz4Zn3ubQz5+iqgIh+VGhxBW4Hro0/BmXqEecnvDhxXj8oNMC1D
 iBR7o4PUc3yy4H6vz6bCzoxB/3Hel7ZKcKN7fVkeMSDSFrU4JxU1w7+m8CpLRskoW6Vc
 tIBs/QtATbZI9iFDJcxRrvrLtl82KaaEQqd0NB/LjJ+ZZ+H2OYIz4qYD4SnCxnF3Psr9
 yTRlh67H+9p/vmYPBiovAuO5aXHCGutsG4B7Zbxw1LAlSmYeqQ91062FxCdci45XFUaY
 qPYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=J/6XbbzK17NjW7xI/iO16gHUyUt3zAGFAe1cbNF1fLw=;
 b=XEgiJUohCkZKN00fXpDnGeLM3uEoH+mJyRe3fenDdtg49mzMqYGbflfEdSj0PphwDU
 R96Yw77SlVdanxbtphkp2an1Cc0WkBzfztEp49iZ+W23aJ+6BLb/rq72QP5Y/KSx6TPf
 2m4mG1ZZsA9VmmT5GKSG6K6q9wN61WYB0IJghjCJpRwM/2ge+bl0hyMLIF4MK3mEBt5v
 UYEK29S3Bz6LsGfgQbpNhViDXifRbV11pyakjZt8wSgyVJuINpzeoR2svMWdsFAzUhqK
 FfPy8sv0GCzSSs2ILJTZAheHXeGs2IJJysyo3nWVXJlkW9wgypgUVLsjfMyQQRAtCCTH
 jFkQ==
X-Gm-Message-State: AOAM531xS5w9tJLasDypOhOce/hhvfwCjhItRlPdr6EhFT2MVAqtg9WT
 39yjYxDuGsiNwGphkcaZRyNhXQ==
X-Google-Smtp-Source: ABdhPJxkv7qiaUzskP/Vcj4DrfTe2WAOxVB+aeP/A0rEc43V4aL66S3J0foUFSWH3U3Bk+2FHjCTNw==
X-Received: by 2002:a05:600c:4896:b0:345:6677:41e0 with SMTP id
 j22-20020a05600c489600b00345667741e0mr393958wmp.9.1644871331543; 
 Mon, 14 Feb 2022 12:42:11 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id f13sm8398264wri.82.2022.02.14.12.42.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Feb 2022 12:42:11 -0800 (PST)
Message-ID: <b6683487-280d-c725-8565-77776b2aae32@mind.be>
Date: Mon, 14 Feb 2022 21:42:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-GB
To: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
References: <20220206104120.1580819-1-giulio.benetti@benettiengineering.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220206104120.1580819-1-giulio.benetti@benettiengineering.com>
Subject: Re: [Buildroot] [PATCH v2] package/systemd: don't treat ld warnings
 as errors
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
Cc: Norbert Lange <nolange79@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 06/02/2022 11:41, Giulio Benetti wrote:
> Nios2 ld emits warnings like:
> '
> /home/buildroot/autobuild/instance-2/output-1/host/opt/ext-toolchain/bin/../lib/gcc/nios2-linux-gnu/7.3.1/../../../../nios2-linux-gnu/bin/ld: FDE encoding in /home/buildroot/autobuild/instance-2/output-1/host/opt/ext-toolchain/bin/../lib/gcc/nios2-linux-gnu/7.3.1/libgcc.a(_umoddi3.o)(.eh_frame) prevents .eh_frame_hdr table being created.
> '
> Since '-Wl,--fatal-warnings' is passed by default, build fails, so don't
> treat warnings as errors by appending "-Wl,--no-fatal-warnings" to
> SYSTEMD_LDFLAGS the same way I've done for Microblaze in commit:
> https://git.buildroot.net/buildroot/commit/?id=cc53d5357d84ff9b78d76e45ce216061df8a37c1
> 
> Fixes:
> http://autobuild.buildroot.net/results/5fc884e11e46ab165ea21c8e8f2901516d79ff80/
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
> V1->V2:
> * renamed BR2_nios to BR2_nios2
> ---
>   package/systemd/systemd.mk | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
> index 5626b54e8e..b07fac27d4 100644
> --- a/package/systemd/systemd.mk
> +++ b/package/systemd/systemd.mk
> @@ -90,6 +90,11 @@ SYSTEMD_CONF_OPTS += \
>   	-Dumount-path=/usr/bin/umount \
>   	-Dutmp=false
>   
> +ifeq ($(BR2_nios2),y)
> +# Nios2 ld emits warnings, make warnings not to be treated as errors
> +SYSTEMD_LDFLAGS = $(TARGET_LDFLAGS) -Wl,--no-fatal-warnings
> +endif
> +
>   ifeq ($(BR2_PACKAGE_ACL),y)
>   SYSTEMD_DEPENDENCIES += acl
>   SYSTEMD_CONF_OPTS += -Dacl=true
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
