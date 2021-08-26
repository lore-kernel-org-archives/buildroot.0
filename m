Return-Path: <SRS0=2pYX=NR=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F196C432BE
	for <buildroot@archiver.kernel.org>; Thu, 26 Aug 2021 19:39:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2C28D6103E
	for <buildroot@archiver.kernel.org>; Thu, 26 Aug 2021 19:39:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2C28D6103E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EBED9606B6;
	Thu, 26 Aug 2021 19:39:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dHrd-L64TNzt; Thu, 26 Aug 2021 19:39:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E77AF606CB;
	Thu, 26 Aug 2021 19:39:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 19D0C1BF2B7
 for <buildroot@lists.busybox.net>; Thu, 26 Aug 2021 19:39:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 16D5780C34
 for <buildroot@lists.busybox.net>; Thu, 26 Aug 2021 19:39:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wa72zNnQxp9w for <buildroot@lists.busybox.net>;
 Thu, 26 Aug 2021 19:39:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F37A980C67
 for <buildroot@buildroot.org>; Thu, 26 Aug 2021 19:39:21 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id t15so557953wrg.7
 for <buildroot@buildroot.org>; Thu, 26 Aug 2021 12:39:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=Xp2g85xV5qS50yNuAEiW7zKrVnvEjUY4IEbic0BgDsQ=;
 b=ItHVJ8N2I6tGhjoCTI9WNEXAHJHPW9j/04cJTW8YzGoAJAHUppXp/cwGKqA7SSBTGu
 JCjF+lIrQSsNoPqknKfVabcR+/0wEcfJhnZ+7obN6IEfOVilsxd/F7OcX1wSzkm/uZlW
 OHfZuD6vWBC18ouuWUgW7WBJ52tSM2ZSipBBgu5gShRsr9fZVgDJY8P2ryMX53yHMcZm
 fbYxQcJ+ZZSbIO2KGl7z9XkLuHZjmpg1z3f0s6aaPAB/Zn4Q8pu8JvzkGAxRkg6T4KxV
 XOIunF2tS4GnsY+Q4tSTGM9xrfUsbxxPPOfN3EModHaxhG1i2FPIibsIfKAMc1oi4134
 +lgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:from:subject:message-id:date:user-agent
 :mime-version:content-language:content-transfer-encoding;
 bh=Xp2g85xV5qS50yNuAEiW7zKrVnvEjUY4IEbic0BgDsQ=;
 b=bDmHQtLNn0gHb/zQ38lSHpTM0rqyPARARdJRZRrXUjfAQ0GAdA8YAOzeN5cf/2JsW7
 DfvEtXQMC0D5gU7/Y6XLlE7KTqGUWGF6bH5THyuf5V3pqsZ4dHgcRozS9kIw4uryR1Go
 OBAeJmVPTLAg6ItR6NOPvLu9X1mdmc/rupjyhdsey54aZPLzAZVZTGpw9hfyFUz4F+hB
 uvLBFGEqScE2XqTye/DP8BQpel9VOQ4DYFhBG8Kbf5MGfMPo1kdGQzFZV6yFS3E/1XMo
 yFE27nLhfKMyLra5fGHAahzVLkpN0frp1Pn3EU0Vu/QLxna6Tq3l6rM/01lXZE9zQkC2
 3yqQ==
X-Gm-Message-State: AOAM531q2mNnFPTTBeOVwwYNpKTPzopGrYpuabsPJqGIpKPBegPwKOMm
 cPKDYf9e3joLH4HsT2l13Lc=
X-Google-Smtp-Source: ABdhPJx+vvn939mfE48ezYninJrT7SNXho0h5KV8FSykJijr8HSOgLHmpwnigPeMWEFrrpvSb7ziVA==
X-Received: by 2002:adf:c54a:: with SMTP id s10mr6007147wrf.405.1630006760070; 
 Thu, 26 Aug 2021 12:39:20 -0700 (PDT)
Received: from ?IPv6:2a01:cb05:8f8a:1800:9881:4a9a:ef63:7f91?
 (2a01cb058f8a180098814a9aef637f91.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:9881:4a9a:ef63:7f91])
 by smtp.gmail.com with ESMTPSA id c7sm3364195wmq.13.2021.08.26.12.39.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Aug 2021 12:39:19 -0700 (PDT)
To: Guo Ren <ren_guo@c-sky.com>
From: Romain Naour <romain.naour@gmail.com>
Message-ID: <37a2790a-8c48-1cfd-a160-567618850bbe@gmail.com>
Date: Thu, 26 Aug 2021 21:39:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
Content-Language: en-US
Subject: [Buildroot] csky 8xx toolchain issue
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Hello Guo,

I noticed that the csky 8xx toolchain doesn't build with a recent compiler.
It trigger an internal compiler error with the gcc installed on the host (Debian
buster, gcc 8.3.0-6); Fedora 33, gcc 10.3.1-1; Fedora 34, gcc 11.0.1-0.3).

[qemu_csky807_virt_defconfig]
https://gitlab.com/kubu93/buildroot/-/jobs/1535464974

[qemu_csky810_virt_defconfig]
https://gitlab.com/kubu93/buildroot/-/jobs/1535464975

[qemu_csky860_virt_defconfig]
https://gitlab.com/kubu93/buildroot/-/jobs/1535464976

The last know host compiler is gcc 6 from Debian stretch that is still used by
the gitlab-ci builds. It was not noticed before because csky is not tested by
Buildroot autobuilders.

Since csky is now upstream in gcc/binutils and the csky internal toolchain is
based on gcc 6, it would make sens to upgrade to an upstream version.

Can you update the csky toolchain?

I'm not sure what we have to do for the upcoming 2021.08 release.
Remove csky defconfigs and the gcc csky fork (select
BR2_ARCH_HAS_NO_TOOLCHAIN_BUILDROOT)?
Thomas, what do you think?

Best regards,
Romain
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
