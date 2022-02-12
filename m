Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C5F2C433EF
	for <buildroot@archiver.kernel.org>; Sat, 12 Feb 2022 11:53:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C296440104;
	Sat, 12 Feb 2022 11:53:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0MA7bFiDLi7X; Sat, 12 Feb 2022 11:53:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A86F040278;
	Sat, 12 Feb 2022 11:53:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 952B61BF3A4
 for <buildroot@lists.busybox.net>; Sat, 12 Feb 2022 11:53:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7279F40278
 for <buildroot@lists.busybox.net>; Sat, 12 Feb 2022 11:53:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7PYS6LbS5Gd2 for <buildroot@lists.busybox.net>;
 Sat, 12 Feb 2022 11:53:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DB2A840104
 for <buildroot@buildroot.org>; Sat, 12 Feb 2022 11:53:52 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id p15so27855215ejc.7
 for <buildroot@buildroot.org>; Sat, 12 Feb 2022 03:53:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=2AkYLNVyrFmwkNjD/O7hv9fvzTHFNNwJmEKfkwSwk3k=;
 b=RyjjiuB6hfzZLI8OCvDc6Qwy9tQub7sWJjOfqDHWp7fVE/VtvxNkHjHsduwBaAuIDa
 k+A2Y+gzN49WbFq3WkvxHZ0ndmJCG8rNo8pJ0MGYw3yEqCmpBwm9Im1kProf/a7j52rZ
 gEfglwd0vlimb3u3dlLS2pEcl+OU6iftgPtsp4lC4P4TQffVVVD2COaA/WaEkQDMR4cc
 si9b48s8gUciAqS7GOlUW6Vfavtrovlru+l4iQevw1aEgzMqrgmnq7PQYj9QxapA4smu
 3/+S/SpdBJJC67sDlbSEIwq6Oyw+RehmstM+jhhfF+ZAZEROAjY47RswAGwANaz+AprH
 10oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=2AkYLNVyrFmwkNjD/O7hv9fvzTHFNNwJmEKfkwSwk3k=;
 b=3Ujznl4JB/9/Fj+EiT1fYew/Wxr/GryMzCKsn+Ldk4iooSOHOww21QEcaPXLJng5v6
 a32SC91y42wBDdTW8tsP6BEHYfGnMwTApXSr7ZcSgCPmiH5ABME8I/lL/LCKYYMVUJhA
 AG5ncT+iv/TOSap0Dd2hObFGCCB4D/lM/kk8K8MhFTwp+XOTmZ5fK/XavWMg0R3dk9AX
 HoOm68/io/jHvJ0ob4LXZFIV6FB9atwQg3jj7ZZqxJnwXWB4oplPG9mu5U/JzdLn7GSe
 ZK89CFh098lGEckeMj0JHRYw9XXWTIZWwEF+GY6w6rkQ1lPASZa4l1pFFFi55CgGBipu
 VD6A==
X-Gm-Message-State: AOAM532yzV3271bEhAkoxdjB49e9PqRjCx5cNWJ2Yd0rRwLcAYUrw4tQ
 tcjF6jIOOTzHw51Te/veOy2PlQ==
X-Google-Smtp-Source: ABdhPJyd8yNO+BG247XRm5c0dQlDj8KqG4p46g5H0xzY2IIIjuGkrqcFpopjcC5/5dGqDe3YlUET9w==
X-Received: by 2002:a17:907:7292:: with SMTP id
 dt18mr4465895ejc.667.1644666831100; 
 Sat, 12 Feb 2022 03:53:51 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id cr8sm12315347edb.47.2022.02.12.03.53.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 12 Feb 2022 03:53:49 -0800 (PST)
Message-ID: <57cb38e0-b657-a6be-9722-4444ec9c0558@mind.be>
Date: Sat, 12 Feb 2022 12:53:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-GB
To: Sergey Matyukevich <geomatsi@gmail.com>, buildroot@buildroot.org
References: <20220131081214.12773-1-geomatsi@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220131081214.12773-1-geomatsi@gmail.com>
Subject: Re: [Buildroot] [PATCH 0/5] synopsys: boards maintenance
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
Cc: Joao Pinto <jpinto@synopsys.com>,
 ARC Maintainers <arc-buildroot@synopsys.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 31/01/2022 09:12, Sergey Matyukevich wrote:
> Hi all,
> 
> This is a maintenance patch series for Synopsys boards. Outdated
> and unused VDK configurations are removed. All the other boards
> receive Linux kernel and U-Boot updates.
> 
> Regards,
> Sergey
> 
> 
> Sergey Matyukevich (5):
>    configs/snps_arc700_axs101: bump kernel and u-boot versions
>    configs/snps_archs32_axs103: bump kernel and u-boot versions
>    configs/snps_archs38_hsdk: bump kernel and u-boot versions
>    configs/snps_archs38_haps: bump kernel and u-boot versions
>    board/synopsys: remove outdated vdk boards

  Series applied to master, thanks!

  Regards,
  Arnout

> 
>   board/synopsys/axs10x/uboot-fragment.config   |   1 +
>   .../synopsys/vdk/linux-vdk-aarch64-defconfig  | 143 ------------------
>   board/synopsys/vdk/readme.txt                 |  65 --------
>   configs/snps_aarch64_vdk_defconfig            |  12 --
>   configs/snps_arc700_axs101_defconfig          |  10 +-
>   configs/snps_archs38_axs103_defconfig         |  10 +-
>   configs/snps_archs38_haps_defconfig           |   6 +-
>   configs/snps_archs38_hsdk_defconfig           |   7 +-
>   configs/snps_archs38_vdk_defconfig            |  20 ---
>   9 files changed, 20 insertions(+), 254 deletions(-)
>   create mode 100644 board/synopsys/axs10x/uboot-fragment.config
>   delete mode 100644 board/synopsys/vdk/linux-vdk-aarch64-defconfig
>   delete mode 100644 board/synopsys/vdk/readme.txt
>   delete mode 100644 configs/snps_aarch64_vdk_defconfig
>   delete mode 100644 configs/snps_archs38_vdk_defconfig
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
