Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 219C3C433EF
	for <buildroot@archiver.kernel.org>; Mon, 18 Apr 2022 18:27:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C36406125F;
	Mon, 18 Apr 2022 18:27:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sDgiHxxQiK0Y; Mon, 18 Apr 2022 18:27:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 31D4A61257;
	Mon, 18 Apr 2022 18:27:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 356501BF2F5
 for <buildroot@lists.busybox.net>; Mon, 18 Apr 2022 18:27:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 15B3A61257
 for <buildroot@lists.busybox.net>; Mon, 18 Apr 2022 18:27:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KtFVXfhiqkOx for <buildroot@lists.busybox.net>;
 Mon, 18 Apr 2022 18:26:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5132760AD0
 for <buildroot@buildroot.org>; Mon, 18 Apr 2022 18:26:59 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id q3so18837560wrj.7
 for <buildroot@buildroot.org>; Mon, 18 Apr 2022 11:26:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:subject:message-id:reply-to:references:mime-version
 :content-disposition:in-reply-to;
 bh=Gx+oRX/jST2sC4iArHX+jt0YdNdrgHkwFsUeXXllXNw=;
 b=Mf0a6SrYhmzQP3n2WAchZvutGyV2figqK4/CwRxhu8UC2dd/7azZkEIZjslo0ZCK4Y
 shXm1fV8q61Gk6kLLvcPLqvCAn7oldyDrq1Y9KKAxhAaV+bZZNAgCDrHmY8MzewBfDR9
 0ZJvPkjS5suhDs5gW+rPHzTaRB5yvEfw+8m0BeRcwAXCTW2xos90m0yMBKYsrPmLqC1i
 9moualNGjoYitupcD8zVOX8U/tbh/rIKMSsu2uGvhqZSeLv7af2L8iwrZHNdEBnyWQhB
 /8RcYYvP53mykSVY07y76AEqzUcXzsL/iWNeyMWyhgOEROadHweMlTWzZhloJL2p4lp9
 PMEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:subject:message-id:reply-to
 :references:mime-version:content-disposition:in-reply-to;
 bh=Gx+oRX/jST2sC4iArHX+jt0YdNdrgHkwFsUeXXllXNw=;
 b=4TZnOwvYit7xcSRQf93BayfAYVMtYVHYLOc1fT8mujF0YMyvXnTt1zyekuR4Ee0Otb
 qDH/SXNVeGP+F28ZZF6e6pIOopRGNJ9XhQH58N6FhB70X8HRTBJetUfWRmCoeB83xHIv
 EUYXuCFsnNvalebeDCJFDApos9Vl5x/rgk9iJ9JI6USF7cSPvNh/ro4ocwOrd0Eqarkl
 Dhu35LtBYS7QfjKiCDyYK9UuLYw/7MElVuegqw767pRW6TgzYx6YsXOzYopuW2Ap1CpF
 VORTKidHCSuBwpjN7g05WDKIRTUiomOs0WmqxNUuE0SsU4h9OwPj7a012lsS+5u3dIe3
 VBxw==
X-Gm-Message-State: AOAM531Zdfogw+zY7jXNlCkaLtXfxE7JtQy0AfK2ezbEdvL50Na9PMJ/
 1k/UK+HpookiXaRjK1gyPKBkiDUg81A=
X-Google-Smtp-Source: ABdhPJzxQUhlhk6W5pp6TLQkEzuTbADA3KCzwBfF2PQuJXMTUJIA8SLRiDht0SJD0WumQRGan49Hjw==
X-Received: by 2002:a05:6000:385:b0:207:991a:d367 with SMTP id
 u5-20020a056000038500b00207991ad367mr8887628wrf.352.1650306417585; 
 Mon, 18 Apr 2022 11:26:57 -0700 (PDT)
Received: from pevik (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id
 w12-20020adf8bcc000000b002060e3da33fsm11062240wra.66.2022.04.18.11.26.56
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Apr 2022 11:26:57 -0700 (PDT)
Date: Mon, 18 Apr 2022 20:26:55 +0200
From: Petr Vorel <petr.vorel@gmail.com>
To: buildroot@buildroot.org
Message-ID: <Yl2tb6BRnl8WdNWa@pevik>
References: <20220418162045.3408-1-petr.vorel@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220418162045.3408-1-petr.vorel@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/coreutils: bump version to 9.1
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
More tests:

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
                    bootlin-sparc-uclibc [22/45]: OK
                   bootlin-sparc64-glibc [23/45]: OK
                   bootlin-xtensa-uclibc [24/45]: OK
                    bootlin-x86-64-glibc [25/45]: OK
                     bootlin-x86-64-musl [26/45]: OK
                   bootlin-x86-64-uclibc [27/45]: OK
                            br-arm-basic [28/45]: SKIPPED
                    br-arm-full-nothread [29/45]: OK
                      br-arm-full-static [30/45]: OK
                br-i386-pentium-mmx-musl [31/45]: OK
                   br-i386-pentium4-full [32/45]: OK
                      br-mips64-n64-full [33/45]: OK
                 br-mips64r6-el-hf-glibc [34/45]: OK
               br-powerpc-603e-basic-cpp [35/45]: SKIPPED
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
45 builds, 4 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed

Kind regards,
Petr
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
