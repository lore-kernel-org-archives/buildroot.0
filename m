Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEBEBC433F5
	for <buildroot@archiver.kernel.org>; Wed, 23 Feb 2022 21:27:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9DD3B82C35;
	Wed, 23 Feb 2022 21:27:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vGyBKorzdYKd; Wed, 23 Feb 2022 21:27:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F0E2C82C21;
	Wed, 23 Feb 2022 21:27:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0CE3A1BF36F
 for <buildroot@lists.busybox.net>; Wed, 23 Feb 2022 21:27:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EF43982C21
 for <buildroot@lists.busybox.net>; Wed, 23 Feb 2022 21:27:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JSowKLALe9R2 for <buildroot@lists.busybox.net>;
 Wed, 23 Feb 2022 21:27:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 295648274E
 for <buildroot@buildroot.org>; Wed, 23 Feb 2022 21:27:23 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id a23so161498eju.3
 for <buildroot@buildroot.org>; Wed, 23 Feb 2022 13:27:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
 :content-disposition:in-reply-to;
 bh=FvaFFWtMdzr4+e0gzPN3nsBq9ko6/lPsFdpRXXLV64E=;
 b=YQyw/JNWmaYEPDZCV+x2c/1ZU4uT3N/EIAgF/LVeAqUg3KjKx34JvJI1dC4RQ998Nv
 DtkkTbKUa9GCXxEqKJDi6fIPVUkVWA6LoHW8/DYbfF04tJB2uX28eyI8Whw/8/EDObMt
 EGHKfCEmS5FIijsoHXDMaOwBky7wS+354WPzttAriTR3/nHR4Jp771bAqZl3VWEpe94n
 7lJWmJg0PgT2kvHmn3OtsEvtxEdXkhDMOAf/ywa8BTM5MpsMjfwGmC7R/GGGxAdfXWAX
 zlGZzYJJUzrZsQqpcAtTgog97QyMd7GBg7t9jBCl89Nb2D3GUlq467zQy34RzWRjtolp
 qJiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
 :references:mime-version:content-disposition:in-reply-to;
 bh=FvaFFWtMdzr4+e0gzPN3nsBq9ko6/lPsFdpRXXLV64E=;
 b=ScN397PDnMIojoLuRArOczMc1cvH9tigfm6jqeOfJ/NB7r9rfO+uDPwBMeSiNZF6I8
 Ka2phAhqIwaTV4L9JyzI29pQJV3u6lnTlTZl+0iIBiIFQuun5/bnAc2RmcSvsxAfg+c7
 /xhEwJT4KCoQ1DTTTjNFqSnqiZkNoYDsb19ZvhfbJHin54PSXg/6osM7aGCEUi1pGxUR
 ar1Oukn+Wkc5Xb4fMSmyBf6LGlA7iC0HXa0JsQ1wD9cM0rNb7eZrnXlkEsExtrS3asWU
 /hTTB4aZpBZson9wMWcCpLnfvc7kVuwqwCkEzA9yjV34KfW739CilcSgyJNdToJXGjgr
 Xgtw==
X-Gm-Message-State: AOAM532kMKdcp3w8M001puZ2YzSDlAiZuGa3oURj52bEA26TWAujNjqp
 w/CZEAXt1hOsgWYRh8Vl/sak2ObbubWUig==
X-Google-Smtp-Source: ABdhPJy1nHsXM+cSPq8q8dqDoP4g9XpaPcTHqDdk9dR4Ul6siuzqRvv2QtHyF2we0YmhcslJ2Z6Mdg==
X-Received: by 2002:a17:906:954b:b0:6ce:a859:71f8 with SMTP id
 g11-20020a170906954b00b006cea85971f8mr1181097ejy.380.1645651641782; 
 Wed, 23 Feb 2022 13:27:21 -0800 (PST)
Received: from pevik (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id bn15sm337743ejb.93.2022.02.23.13.27.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Feb 2022 13:27:21 -0800 (PST)
Date: Wed, 23 Feb 2022 22:27:17 +0100
From: Petr Vorel <petr.vorel@gmail.com>
To: buildroot@buildroot.org
Message-ID: <YhamtUnWXh4Qis0z@pevik>
References: <20220222220255.22327-1-petr.vorel@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220222220255.22327-1-petr.vorel@gmail.com>
Subject: Re: [Buildroot] [RFC][PATCH 1/1] package/bind: bump to version
 9.16.26
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
Reply-To: Petr Vorel <petr.vorel@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi,

Build tested:
                    bootlin-armv5-uclibc [1/6]: OK
                     bootlin-armv7-glibc [2/6]: OK
                   bootlin-armv7m-uclibc [3/6]: SKIPPED
                     bootlin-x86-64-musl [4/6]: OK
                      br-arm-full-static [5/6]: SKIPPED
                            sourcery-arm [6/6]: OK
6 builds, 2 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed

                             andes-nds32 [ 1/45]: OK
                             arm-aarch64 [ 2/45]: OK
                   bootlin-aarch64-glibc [ 3/45]: OK
               bootlin-arcle-hs38-uclibc [ 4/45]: OK
                    bootlin-armv5-uclibc [ 5/45]: OK
                     bootlin-armv7-glibc [ 6/45]: OK
                   bootlin-armv7m-uclibc [ 7/45]: SKIPPED
                      bootlin-armv7-musl [ 8/45]: OK
             bootlin-microblazeel-uclibc [ 9/45]: OK
                   bootlin-mipsel-uclibc [10/45]: OK
                bootlin-mipsel32r6-glibc [11/45]: OK
                bootlin-m68k-5208-uclibc [12/45]: SKIPPED
               bootlin-m68k-68040-uclibc [13/45]: OK
                     bootlin-nios2-glibc [14/45]: OK
                 bootlin-openrisc-uclibc [15/45]: OK
           bootlin-powerpc-e500mc-uclibc [16/45]: OK
        bootlin-powerpc64le-power8-glibc [17/45]: OK
                   bootlin-riscv32-glibc [18/45]: OK
                   bootlin-riscv64-glibc [19/45]: OK
                    bootlin-riscv64-musl [20/45]: OK
                      bootlin-sh4-uclibc [21/45]: OK
                    bootlin-sparc-uclibc [22/45]: SKIPPED
                   bootlin-sparc64-glibc [23/45]: OK
                   bootlin-xtensa-uclibc [24/45]: OK
                    bootlin-x86-64-glibc [25/45]: OK
                     bootlin-x86-64-musl [26/45]: OK
                   bootlin-x86-64-uclibc [27/45]: OK
                            br-arm-basic [28/45]: OK
                    br-arm-full-nothread [29/45]: SKIPPED
                      br-arm-full-static [30/45]: SKIPPED
                br-i386-pentium-mmx-musl [31/45]: OK
                   br-i386-pentium4-full [32/45]: OK
                      br-mips64-n64-full [33/45]: OK
                 br-mips64r6-el-hf-glibc [34/45]: OK
               br-powerpc-603e-basic-cpp [35/45]: OK
               br-powerpc64-power7-glibc [36/45]: OK
                       linaro-aarch64-be [37/45]: OK
                          linaro-aarch64 [38/45]: OK
                              linaro-arm [39/45]: OK
                     sourcery-arm-armv4t [40/45]: OK
                            sourcery-arm [41/45]: OK
                     sourcery-arm-thumb2 [42/45]: OK
                           sourcery-mips [43/45]: OK
                         sourcery-mips64 [44/45]: OK
                          sourcery-nios2 [45/45]: OK
45 builds, 5 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed

Kind regards,
Petr
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
