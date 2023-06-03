Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA2CEC77B73
	for <buildroot@archiver.kernel.org>; Sat,  3 Jun 2023 19:08:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3ADCB41C4D;
	Sat,  3 Jun 2023 19:08:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3ADCB41C4D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id y53gyQAN3iWc; Sat,  3 Jun 2023 19:08:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DA09741BD5;
	Sat,  3 Jun 2023 19:08:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DA09741BD5
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 64C401BF487
 for <buildroot@lists.busybox.net>; Sat,  3 Jun 2023 19:08:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3544A41BD5
 for <buildroot@lists.busybox.net>; Sat,  3 Jun 2023 19:08:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3544A41BD5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id I-nOU0Z4Hbpj for <buildroot@lists.busybox.net>;
 Sat,  3 Jun 2023 19:08:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AB9E541BBD
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AB9E541BBD
 for <buildroot@buildroot.org>; Sat,  3 Jun 2023 19:08:46 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-970056276acso494227766b.2
 for <buildroot@buildroot.org>; Sat, 03 Jun 2023 12:08:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685819325; x=1688411325;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tRmy6IODwwuTy09gPpo97eWLBUEuaOwPecN/ClEIdww=;
 b=hmHlRrAqvJbAMWfgulUdaPpMwj0pDKWh/cSuVXdpygBGn4M/GPzW8jnqmuPPNDfQdK
 OfsMrAfsTwegB9RmMsB7QHNRq1b2lCZAfB5RrIAwOyMcGMmSl7trTE4+FhF25IHrFWl0
 DBIEA5WWdgcMXCMNFhUysppJx8Bw0BxJz4Vp3RLlM7yKFq3LlOMCl5oxrOqfsUYhyL5F
 ooLVdmT76ddQpkPTSP/XMCN7B57bxpcC/Qsy7z5+UI7QhywwjNSnliWCAZadkBxuoxGb
 YQz/dvd/6GYISkObOyuhhv9NMt/sOMtaQV9Kc/fN3SczK6Q5/TluZvJTeV/k9kqn6eag
 zEIA==
X-Gm-Message-State: AC+VfDzObM+Di2TxpxEreFh3AObvw32mGGLFuvkC4L7h83cXFdbeXbfa
 My4mGX/lke8b/hNECGM+eVA7t0Id8J0pB8uQ3jg=
X-Google-Smtp-Source: ACHHUZ7oBWjsgpvJEGPirVJ+Z15kLp+beRGU7U8ANFFxfPgixh+b+mFRO3iG0bDq5f0O5fGdCIhb3Q==
X-Received: by 2002:a17:907:c12:b0:969:f54c:dee2 with SMTP id
 ga18-20020a1709070c1200b00969f54cdee2mr2406630ejc.26.1685819324750; 
 Sat, 03 Jun 2023 12:08:44 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 n12-20020a170906118c00b0096fbc516a93sm2193721eja.211.2023.06.03.12.08.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 03 Jun 2023 12:08:44 -0700 (PDT)
Message-ID: <6227b2ec-957f-6f2f-72ee-1da107152193@mind.be>
Date: Sat, 3 Jun 2023 21:08:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-GB
To: Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org
References: <20230527134326.1855997-1-romain.naour@gmail.com>
In-Reply-To: <20230527134326.1855997-1-romain.naour@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1685819325; x=1688411325;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=tRmy6IODwwuTy09gPpo97eWLBUEuaOwPecN/ClEIdww=;
 b=DNeLsS5Qob5Bcbwc1J+7G7PPNu6tgPiNzSxTlTvCXSBXSQobfAM2Uq4CuhPKijxHdk
 q9RbQuerIkOrHiCu2Yo+m2XBRc7u4FwCx33tF7pMCmmmQf9AralCrreGCl+Gyxi4CDwh
 qeUY2Ix+cxDgwGShoTTarVtOZO+Fy2E5Gwl7jjfo9hfELm4R/RtMH6dHW02/lBtjCbr6
 HKwCQfeT5tJX9gYdtBt/jAqT19Q3sqRK0OuR32qxbI/pH9W+aypVQ1oDLVwZIL581ZNE
 BrV7hFnZx5bqq1sQJm7ygc3giQ/MGgalfk7ZjihWDx9khqO3QMP9HzCAQXKYWiNTK6Cj
 3aPw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=DNeLsS5Q
Subject: Re: [Buildroot] [PATCH]
 support/testing/tests/package/test_kexec.py: fix kexec test for qemu 5.2
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Cc: "Signed-off-by : Julien Olivain" <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 27/05/2023 15:43, Romain Naour wrote:
> The commit f69c972ae61 (support/testing/tests/package/test_kexec.py:
> new runtime test) was tested locally with a qemu version (>= 7.x) more
> recent than the one available in our buidroot/base Docker image (5.2).
> As a consequence, that test fails to run in gitlab-ci as reported by [1].
> 
> Remove "dtb-kaslr-seed=off" from the Qemu command line and pass
> a custom devicetree to qemu virt machine. This devicetree is
> based on qemu aarch64 5.2 dts with kaslr-seed set 0.
> 
> The qemu aarch64 devicetree has been exported [2] and updated with the
> following method:
> 
>    qemu-system-aarch64 -machine virt -machine dumpdtb=qemu-aarch64-virt-5.2-machine.dtb
>    dtc -I dtb qemu-aarch64-virt-5.2-machine.dtb > qemu-aarch64-virt-5.2-machine.dts
>    edit the dts and replace kaslr-seed parameter by "kaslr-seed = <0 0>;"
> 
> As soon as our buidroot/base Docker image is updated and a newer qemu version
> is available, we can safely revert this change and use the initial method.
> 
> Fixes:
> https://gitlab.com/buildroot.org/buildroot/-/jobs/4322819092
> 
> [1] http://lists.busybox.net/pipermail/buildroot/2023-May/668091.html
> [2] https://u-boot.readthedocs.io/en/latest/develop/devicetree/dt_qemu.html#obtaining-the-qemu-devicetree
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: Signed-off-by: Julien Olivain <ju.o@free.fr>

  Applied to master, thanks.

  Regards,
  Arnout

[snip]
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
