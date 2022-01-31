Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A2A0C433F5
	for <buildroot@archiver.kernel.org>; Mon, 31 Jan 2022 21:38:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E02BC400E3;
	Mon, 31 Jan 2022 21:38:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mdJ4VrW5-Fds; Mon, 31 Jan 2022 21:38:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BEC18401C9;
	Mon, 31 Jan 2022 21:38:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B6ABC1BF362
 for <buildroot@lists.busybox.net>; Mon, 31 Jan 2022 21:38:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AB60D82572
 for <buildroot@lists.busybox.net>; Mon, 31 Jan 2022 21:38:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5ChIDhFIulmn for <buildroot@lists.busybox.net>;
 Mon, 31 Jan 2022 21:38:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C9C1D824E3
 for <buildroot@buildroot.org>; Mon, 31 Jan 2022 21:38:09 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id e8so28104314wrc.0
 for <buildroot@buildroot.org>; Mon, 31 Jan 2022 13:38:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JKdjtX4gNNn6h4gA8gpLfUmMfjenSQVVyyNK3fACuIw=;
 b=DyE+SZyU1iTSrm0z+pMZDzq0eFnxPGGvnNy1O/aTsg0uocyhUJbS8jotvT4Crd3tBV
 yo5UFUvlB14RBh6xsIiH8Mqk/m6lAihF87NXeoyk55LGijWWyVWHTrsat2dwAncOm5p9
 R+GeQzd6T4Kg5q9Uk/TOJzU1UGV8nwPJrP5LaeuEiLPkuviFo8LARHSod3Tr9x3ei7m5
 KFM7M9811la13z5f4Wx6vj5eSOW45ct9bSu83oMJzBF0aZkBoUemYe61UU2WpBR1lX33
 LZGMfjOW6R0mNtW8Yxmdb8a9snFomzqFnjK+dBef4Qx/pq3yU/G5SHa0/81l6u9YTslY
 37aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=JKdjtX4gNNn6h4gA8gpLfUmMfjenSQVVyyNK3fACuIw=;
 b=UcaWJw4cJwCAIaAIeyDgZFhUJA6Gqg4QO9qTrMipGU5vID7yAfmitgtwaA+dmvB01Y
 IG3d9aFkGGlfEgQsuUQiPvsQjATtGKmC+6EBoWJ7VTfMTNtWVJDHs1XfcEGK166wWEoi
 uZz4a+sfjttNwRkK4cGEEX9dPTax99PvfOaomAQH9Ozc+zbzNRFZvJDe3JI7orwf8Lv0
 84LMhH7l9J6oWeBk5OI/jWylxfJSgpojKSyHVqr+j6qzn5o7Xf5dgy/DOeVSFzldZ9b2
 ZBYdNHGHae0p7y9SXuiSGaWchU9K80inMcL/tjzseS8I7k6brsRw2CvU/1ITxCWXGaZj
 4qkQ==
X-Gm-Message-State: AOAM532S/49P7tKSRY/UUXvcsmj515/k6tfpgttc8a0vVP+MvMTtr0wS
 p6xFBFNFDWTYzjTc31+twotXqQVRk38=
X-Google-Smtp-Source: ABdhPJx8xeIbWWHTnvRtX5FOTan2vU1mCWE08D5gdr2DtBZJOYLAyJOwY6JsEEHXsK6dxsiRFZI8Gg==
X-Received: by 2002:a5d:6489:: with SMTP id o9mr17837700wri.628.1643665088029; 
 Mon, 31 Jan 2022 13:38:08 -0800 (PST)
Received: from scaer.home ([2a01:cb19:8b51:cb00:b1b4:bb20:1902:cd8e])
 by smtp.gmail.com with ESMTPSA id n26sm449151wms.13.2022.01.31.13.38.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jan 2022 13:38:07 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 31 Jan 2022 22:38:06 +0100
Message-Id: <cover.1643665029.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 0/2 v2] linux|uboot: fix build with host-gcc 10+
 for older versions (branch yem/yylloc)
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello All!

This two-patch series aims at side-stepping the multiple symbol
declaration in older Linux and U-Boot, where the infamous yylloc is
defined more than once.

Like we have a fix for the perl timeconst issue in linux, do s similar
tweak for yylloc in the two packages known to be affected, Linux and
U-Boot.

Here is a pipeline with all the defconfig builds:
    https://gitlab.com/ymorin/buildroot/-/pipelines/460207930

There are still some failures, but none relate to the yylloc issue:

  - too long build time or not space left on device (I am only using
    elastic runners)

  - defconfig not up-to-date (e.g. using kernel headers version since
    removed)

  - missing host dependencies for kernel (openssl, libelf) or uboot
    (python)

  - another host-gcc 10+ symbol redefinition issue (galileo [0])

  - make 4.3 issues. For example: amarula_a64_relic_defconfig
    https://gitlab.com/ymorin/buildroot/-/jobs/2035820886

      DTC     arch/arm/dts/sun50i-a64-amarula-relic.dtb
    Error: arch/arm/dts/.sun50i-a64-amarula-relic.dtb.pre.tmp:66.1-10 syntax error
    FATAL ERROR: Unable to parse input tree

    This is caused by make 4.3 that no longer treats '#' as special in
    macros, and shall no longer be escaped:
        https://lwn.net/Articles/810071/

    This causes '\#include "something"' to be injected as-is at the end
    of the temporary DTS, and of course, dtc does not cope nicely with
    that... [1]

    Unfortuantely, I don't think we can do a generic fixup for that
    one...

  - some other issues (e.g. deprecated 'partition-type' for geniamge..)

[0] this was fixed in 2014 in the kernel:
      - eeeda4cd06e828b331b15741a204ff9f5874d28d
[1] this was fixed in 2018 in uboot:
      - e5e701c2b8470de044c5c71d2a54ecfc72680d59
      - 0c544115379ed77c1843a194e26960e5b8f3d369

Changes v1 -> v2:
  - don't fail if no file to fix: use 'grep -Z |xargs -0 -r' (Arnout)
  - extend cover-ltter with a pipeline reference and analysese of
    remaining build failures

Regards,
Yann E. MORIN.


----------------------------------------------------------------
Yann E. MORIN (2):
      boot/uboot: fix build with host-gcc 10+
      linux: fix build with host-gcc 10+

 boot/uboot/uboot.mk | 7 +++++++
 linux/linux.mk      | 7 +++++++
 2 files changed, 14 insertions(+)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
