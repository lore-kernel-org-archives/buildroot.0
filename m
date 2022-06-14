Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A7DEC433EF
	for <buildroot@archiver.kernel.org>; Tue, 14 Jun 2022 16:55:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C0ACC40A9C;
	Tue, 14 Jun 2022 16:55:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id V6xi98ZVQEd5; Tue, 14 Jun 2022 16:55:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E227840A88;
	Tue, 14 Jun 2022 16:55:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8B3891BF37A
 for <buildroot@lists.busybox.net>; Tue, 14 Jun 2022 16:55:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 871BA40A88
 for <buildroot@lists.busybox.net>; Tue, 14 Jun 2022 16:55:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pMO9JPYfoIeH for <buildroot@lists.busybox.net>;
 Tue, 14 Jun 2022 16:55:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AE4C340191
 for <buildroot@buildroot.org>; Tue, 14 Jun 2022 16:55:10 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id cn20so87068edb.6
 for <buildroot@buildroot.org>; Tue, 14 Jun 2022 09:55:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=9rGWbMzu6uswSzEKNj0gal7tDdcgDVRh6Ej+tZSNA5Q=;
 b=BZ/yqaoRUmuG53OaYTK7rVYuo1Fktew73/Dwge7+nPIH2LZCa5I8nO8Z2VT6UsyTPz
 9U93OiPLmUrFFh5xiXOoskWgZd1IWNXdetmbqeBhjm8euczODAZOaJ1UMEQgBv1osqgO
 +vUtHl2cLPDvhLDJ2JToNrExyCMxUwEWUylnGsewEVWD/szp+mhywx8zqpdbt+OsUpZL
 VdTTD2/4OHJpHQzp6tDJQ6/zjHdAJgawqZBAvUXbscEZapZWdwaAVqmaunmMe6geHQyY
 tDqbliuPfRDVWcQqLRq67IA1cfQz4wDkscQK3sCaf3XOPsyJ+H5pLR32hOxvuTilhhHZ
 CpMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=9rGWbMzu6uswSzEKNj0gal7tDdcgDVRh6Ej+tZSNA5Q=;
 b=nbzRmbA4WhAuyCrtUhNbCDAbCrTCT9Vd1IEi2YDMugBtLtLZXq0yg7VLhiUR5I+fgK
 XQFtDkaTAnS4fTq20MNmUQzJg7MeG/Ymn2Sxs1BiBn79hCI9dHgPXkbDoHb0nAfmAXuM
 /glVu0lX1osK3VgtclZZ+ElecF9pH/upw1lJT24fKdN88s8SJJFmLqw1CGY8b1PHgRl8
 gGA4Lv/605Asgu5wW8BZVqR1QMWG9lnuwZqdS6ZU6DqlnLq/IssIxfDw9d5naiwdrKzS
 y2p7EqM+blhra7ig4pHbAtp41UMzVFdF6SGLxM7wa5ni9d6AaJBXL3q20h38kEsKvMPS
 EjYw==
X-Gm-Message-State: AOAM530p2BEzxAglh6nwHRZLtG41k19noDC90+7RCnM4w3HV5YZ3pMJ1
 WSFnRVue5BX4nXwSK+ZkDMrpyQ==
X-Google-Smtp-Source: ABdhPJz7xNhUN6jQNFgxwLlkEFb4SyK0tKzLwe1cmjFoFQ07onM3MG/+ZSameESDVcEzL89yDTqq4w==
X-Received: by 2002:a05:6402:1f0e:b0:42d:e38a:51f7 with SMTP id
 b14-20020a0564021f0e00b0042de38a51f7mr7483277edb.68.1655225708878; 
 Tue, 14 Jun 2022 09:55:08 -0700 (PDT)
Received: from [10.1.0.138] (ip-188-118-3-185.reverse.destiny.be.
 [188.118.3.185]) by smtp.gmail.com with ESMTPSA id
 w4-20020a17090652c400b006f3ef214dc0sm5282014ejn.38.2022.06.14.09.55.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Jun 2022 09:55:08 -0700 (PDT)
Message-ID: <c491d276-157f-61d4-28f3-edb742388b89@mind.be>
Date: Tue, 14 Jun 2022 17:43:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-GB
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Romain Naour <romain.naour@gmail.com>,
 Buildroot List <buildroot@buildroot.org>
References: <20220608071027.3384469-1-thomas.petazzoni@bootlin.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220608071027.3384469-1-thomas.petazzoni@bootlin.com>
Subject: Re: [Buildroot] [PATCH v2 00/14] Another set of Bootlin toolchain
 integration improvements
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



On 08/06/2022 09:10, Thomas Petazzoni via buildroot wrote:
> Hello,
> 
> Overall summary
> ===============
> 
> Patches 1 to 12 in this series are fixes for autobuilder
> issues. Patches 13 and 14 are improvements.
> 
> Patches 1 and 2 fix the issue of RISC-V 64-bit toolchains being
> available on MMU-less architectures, even though they are not
> supported by the toolchain.
> 
> Patches 3 and 4 fix the issue of ARM little endian toolchains being
> selectable for ARM big endian architectures.
> 
> Patches 5 and 6 fix the issue of i686 toolchains being used for < i686
> platforms.
> 
> Patches 7, 8 and 9 fix the issue of an error when trying to copy
> gdbserver, with toolchains that don't have gdbserver.
> 
> Patches 10, 11 and 12 fix the issue of the "mips64" Bootlin toolchains
> being obsolete, but the gen-bootlin-toolchains still thinking they
> were available. This caused some mips64 n64 configurations to be
> thought of having Bootlin toolchains available, but in fact no such
> toolchains were provided. We fix this by making sure we check if an
> architecture has valid toolchains, and erroring out if not. And of
> course, we remove the "mips64" toolchain config.
> 
> Patches 13 and 14 add support for the ARMv7 big-endian toolchains
> provided by toolchains.bootlin.com.
> 
> Changes since v1
> ================
> 
>   - Patches 10, 11 and 12 added to fix the "mips64" issue.
> 
> Thomas
> 
> Thomas Petazzoni (14):
>    support/scripts/gen-bootlin-toolchains: fix RISC-V 64-bit toolchain
>      description
>    support/testing,toolchain/toolchain-external/toolchain-external-bootlin:
>      regenerate with latest gen-bootlin-toolchains script
>    support/scripts/gen-bootlin-toolchains: improve dependencies of ARM
>      toolchains
>    toolchain/toolchain-external/toolchain-external-bootlin: regenerate
>      with BR2_ARM dependency
>    support/scripts/gen-bootlin-toolchains: adjust dependencies of i686
>      toolchains
>    toolchain/toolchain-external/toolchain-external-bootlin: regenerate
>      after i686 toolchain dependency fixes
>    toolchain/toolchain-external: add
>      BR2_TOOLCHAIN_EXTERNAL_HAS_NO_GDBSERVER option
>    support/scripts/gen-bootlin-toolchains: make use of
>      BR2_TOOLCHAIN_EXTERNAL_HAS_NO_GDBSERVER
>    toolchain/toolchain-external/toolchain-external-bootlin: regenerate
>      with BR2_TOOLCHAIN_EXTERNAL_HAS_NO_GDBSERVER
>    support/scripts/gen-bootlin-toolchains: check that toolchains exists
>      for a certain arch
>    support/scripts/gen-bootlin-toolchains: drop "mips64" architecture
>      variant
>    toolchain/toolchain-external/toolchain-external-bootlin: regenerate
>      after mips64 toolchain removal
>    support/scripts/gen-bootlin-toolchains: add support for ARMv7 big
>      endian toolchain
>    support/testing,toolchain/toolchain-external/toolchain-external-bootlin:
>      regenerate with ARMv7 big endian toolchain
> 
>   support/scripts/gen-bootlin-toolchains        |  44 +++-
>   .../tests/toolchain/test_external_bootlin.py  | 102 ++++++++
>   toolchain/toolchain-external/Config.in        |   4 +
>   .../Config.in.options                         | 234 +++++++++++++++++-
>   .../toolchain-external-bootlin.hash           |  12 +
>   .../toolchain-external-bootlin.mk             |  36 +++
>   6 files changed, 412 insertions(+), 20 deletions(-)
> 


  Series applied to master, thanks.

  Regards,
  Arnout

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
