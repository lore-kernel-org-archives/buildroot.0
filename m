Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 455C0C433EF
	for <buildroot@archiver.kernel.org>; Thu, 10 Mar 2022 20:57:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D18BF40B79;
	Thu, 10 Mar 2022 20:57:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8oYfrGNxg_8B; Thu, 10 Mar 2022 20:57:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8F2C54057F;
	Thu, 10 Mar 2022 20:57:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 55F811BF331
 for <buildroot@lists.busybox.net>; Thu, 10 Mar 2022 20:57:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5284860B34
 for <buildroot@lists.busybox.net>; Thu, 10 Mar 2022 20:57:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id V2pk1MT1OqXy for <buildroot@lists.busybox.net>;
 Thu, 10 Mar 2022 20:57:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5E9B060768
 for <buildroot@buildroot.org>; Thu, 10 Mar 2022 20:57:40 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id b15so4475372edn.4
 for <buildroot@buildroot.org>; Thu, 10 Mar 2022 12:57:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=kGsS56KlmaUn0gCAuVmHR/c5cE+XTxv4UYjFbYNP9ic=;
 b=PymF9pqrxlxVrGxNi8lulhUIb85fNukhg2iulQw3UEHJrU4uMB0y6iyKuFvmz4ur4y
 Oz9nI45qVF6xKrEtisc7hRUHQ6Wu3K8RUflJOjcE2cTLJY0atzFIZQ8uVxntHOfLprqQ
 ILC65uFUon5aWF0/PEHMgcLWJ7vGVmx/dd+KKNMbvmBRnY/2lo06IkEHp341Lsj4kApK
 kretMQjuiZeEh4OC8Tqne1AlZVcxIxcuOUmg8NonZNjcJsiudkOxZTMP4986cZT06mPZ
 H/kpGGZHX6E85XJ67UpAQ0mK3Szy7XLh3Eemn55OyOjWiDga6l9T0e9Tq4BBcHgV5G8e
 X+RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=kGsS56KlmaUn0gCAuVmHR/c5cE+XTxv4UYjFbYNP9ic=;
 b=kItbiGPxWdTlvzbB95E5d2eX2/6fX+TrB5JjUdKmefTAAIEyCbxk0PB7jcNcMLrRdO
 eVKS5T1bNJ4/U8GN3yeki/2E9Weuxyp+02kwAn5zS9L9JWRfxdbyrFAwWeifjigpuNK2
 9nQZKHvYqF9naGEfx5WLx+JCT02/42G+f+j/b3YjwRk720aWHKG2szK9FBfjCooe57rd
 YcBe65yrTDV/4U5v2fUq3SLKprRiaKH0FsSBEALQ8M/Le1rsFI3dfQ3vg+rWd0sCf1/T
 RHebtdy1I+OB1hNMcZcG7KboSZQS2BocHddUnDSZ0K3gzApl1AI/YVeywrbkOiJFk5YT
 D8rA==
X-Gm-Message-State: AOAM533kPhkae5mwvBUSNJwt/S8gVunNV3ASm/p3C1zVtS4rV//ymo9h
 0YDtQYNpBNzKuUm2HF5z+3QiWg==
X-Google-Smtp-Source: ABdhPJzB3yx0qKJjhXBljQA40T+kRJWwB6rB7c7qWtatK4gUNyKe5gQ0Ys3JUuUwrfy/ttgWxIbO8w==
X-Received: by 2002:a50:bf0f:0:b0:410:c512:cb6f with SMTP id
 f15-20020a50bf0f000000b00410c512cb6fmr6314928edk.262.1646945858401; 
 Thu, 10 Mar 2022 12:57:38 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 g2-20020aa7c842000000b0041314b98872sm2382104edt.22.2022.03.10.12.57.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Mar 2022 12:57:37 -0800 (PST)
Message-ID: <2df4d52d-03db-3af9-8ef9-808236638379@mind.be>
Date: Thu, 10 Mar 2022 21:57:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-GB
To: Yu Chien Peter Lin <peterlin@andestech.com>, buildroot@buildroot.org
References: <20220225092509.16478-1-peterlin@andestech.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220225092509.16478-1-peterlin@andestech.com>
Subject: Re: [Buildroot] [PATCH v5 0/3] Add andes ae350 support
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
Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, alankao@andestech.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 25/02/2022 10:25, Yu Chien Peter Lin wrote:
> This patchset
> - renames andes/ae3xx and its defconfig to ae300 for nds32 architecture.
> - adds ae350 platform support and andes_ae350_45_defconfig.
> 
> Yu Chien Peter Lin (3):
>    board/andes: rearrange andes folder structure
>    board/andes/ae350: add support for Andes AE350
>    DEVELOPERS: add Yu-Chien Lin to board/andes

  Series applied to master, thanks.

  Regards,
  Arnout

> 
>   DEVELOPERS                                    |   5 +-
>   .../ae3xx.fragment => ae300/ae300.fragment}   |   0
>   ...0001-nds32-Fix-boot-messages-garbled.patch |   0
>   ...ve-redundant-YYLOC-global-declaratio.patch |   0
>   board/andes/{ => ae300}/readme.txt            |  10 +-
>   board/andes/ae350/ae350.dts                   | 274 ++++++++++++++++++
>   board/andes/ae350/genimage_sdcard.cfg         |  26 ++
>   ...isable-PIC-explicitly-for-assembling.patch |  29 ++
>   ...2-Enable-cache-for-opensbi-jump-mode.patch |  25 ++
>   ...001-Fix-mmc-no-partition-table-error.patch |  27 ++
>   ...2-Prevent-fw_dynamic-from-relocation.patch |  27 ++
>   ...0003-Fix-u-boot-proper-booting-issue.patch |  26 ++
>   ...04-Enable-printing-OpenSBI-boot-logo.patch |  25 ++
>   board/andes/ae350/post-build.sh               |   3 +
>   board/andes/ae350/readme.txt                  |  65 +++++
>   .../boot/extlinux/extlinux.conf               |   4 +
>   board/andes/ae350/uboot.config.fragment       |   5 +
>   ..._ae3xx_defconfig => andes_ae300_defconfig} |   4 +-
>   configs/andes_ae350_45_defconfig              |  43 +++
>   .../toolchain-external-andes-nds32/Config.in  |   2 +-
>   20 files changed, 590 insertions(+), 10 deletions(-)
>   rename board/andes/{ae3xx/ae3xx.fragment => ae300/ae300.fragment} (100%)
>   rename board/andes/{ => ae300}/patches/linux/0001-nds32-Fix-boot-messages-garbled.patch (100%)
>   rename board/andes/{ => ae300}/patches/linux/0002-scripts-dtc-Remove-redundant-YYLOC-global-declaratio.patch (100%)
>   rename board/andes/{ => ae300}/readme.txt (71%)
>   create mode 100755 board/andes/ae350/ae350.dts
>   create mode 100644 board/andes/ae350/genimage_sdcard.cfg
>   create mode 100644 board/andes/ae350/patches/opensbi/0001-Disable-PIC-explicitly-for-assembling.patch
>   create mode 100644 board/andes/ae350/patches/opensbi/0002-Enable-cache-for-opensbi-jump-mode.patch
>   create mode 100644 board/andes/ae350/patches/uboot/0001-Fix-mmc-no-partition-table-error.patch
>   create mode 100644 board/andes/ae350/patches/uboot/0002-Prevent-fw_dynamic-from-relocation.patch
>   create mode 100644 board/andes/ae350/patches/uboot/0003-Fix-u-boot-proper-booting-issue.patch
>   create mode 100644 board/andes/ae350/patches/uboot/0004-Enable-printing-OpenSBI-boot-logo.patch
>   create mode 100755 board/andes/ae350/post-build.sh
>   create mode 100644 board/andes/ae350/readme.txt
>   create mode 100644 board/andes/ae350/rootfs_overlay/boot/extlinux/extlinux.conf
>   create mode 100644 board/andes/ae350/uboot.config.fragment
>   rename configs/{andes_ae3xx_defconfig => andes_ae300_defconfig} (69%)
>   create mode 100644 configs/andes_ae350_45_defconfig
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
