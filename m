Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60E4AC88CB4
	for <buildroot@archiver.kernel.org>; Tue, 13 Jun 2023 11:12:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F343160F00;
	Tue, 13 Jun 2023 11:12:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F343160F00
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pYBhJ6IEbJJT; Tue, 13 Jun 2023 11:11:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B3E4060F97;
	Tue, 13 Jun 2023 11:11:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B3E4060F97
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D58581BF3BB
 for <buildroot@lists.busybox.net>; Tue, 13 Jun 2023 11:11:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A7C34410A7
 for <buildroot@lists.busybox.net>; Tue, 13 Jun 2023 11:11:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A7C34410A7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zaoQsExcsey1 for <buildroot@lists.busybox.net>;
 Tue, 13 Jun 2023 11:11:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2E8FB409BE
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2E8FB409BE
 for <buildroot@buildroot.org>; Tue, 13 Jun 2023 11:11:55 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-3f8d2bfec3bso2947485e9.2
 for <buildroot@buildroot.org>; Tue, 13 Jun 2023 04:11:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686654713; x=1689246713;
 h=content-transfer-encoding:subject:from:to:content-language
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=I6BUaTBM261qTGpXzrCqKqvT/pUWlCxm/ZiFWx0CFnU=;
 b=X3uWWDphkSj4SQBufZK36wfZDGDdWpvCsh8vuq8wo1tqrTVFU0ydUjXUffestKi48p
 IbMKuV9thejyi19OgCQIAf7NA1ySHMgJjAMQyNBT1tw3FzsR0QQ1IOvzDBt1rk8Cq2uP
 hVvakK6iIORVApZSuBoAWcFJEd3yevy9RLAc7DG5FFs57dSogEOG9gfTCQT4EukJEX+b
 rDhwhjgUBiIYQDqwJzFRx9zgpO/Ppd5khwOecbX6Lh7pCVHC4gQCOi6yjqVjOxOEPhpZ
 DuOWjYcdX40rAQbRl3Kq/04WLKGMfPwLchbPz9I1aWyprnU+mhqHtToaVeycE9EFmDl7
 kpMA==
X-Gm-Message-State: AC+VfDypHubkk8JN+bOaHI8KGPypKVnOKj/A70o/39bHSClOf9zns75R
 zR0B9NxjijFUyvk9+4I53okRQIMGSv27GA==
X-Google-Smtp-Source: ACHHUZ6RrQlZ9S4JZgR5BUMUq7KE6Js0scfZjIAzyvcnhXSjjgzGJVjWBY3P8rmRcTikr8jKAcPZMA==
X-Received: by 2002:a5d:4284:0:b0:30f:be1f:8711 with SMTP id
 k4-20020a5d4284000000b0030fbe1f8711mr4897889wrq.63.1686654713005; 
 Tue, 13 Jun 2023 04:11:53 -0700 (PDT)
Received: from [10.0.0.120] (static-90-255-244-241.vodafonexdsl.co.uk.
 [90.255.244.241]) by smtp.gmail.com with ESMTPSA id
 m6-20020adfdc46000000b0030e5bd253aasm15175786wrj.39.2023.06.13.04.11.52
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Jun 2023 04:11:52 -0700 (PDT)
Message-ID: <e928ab82-fa17-3168-59c0-0a298b049115@gmail.com>
Date: Tue, 13 Jun 2023 12:11:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To: buildroot@buildroot.org
From: Nick Betteridge <lists.nick.betteridge@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1686654713; x=1689246713;
 h=content-transfer-encoding:subject:from:to:content-language
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=I6BUaTBM261qTGpXzrCqKqvT/pUWlCxm/ZiFWx0CFnU=;
 b=oZ13YAEi/W/Q/T4yL3Frt/7sVCZMzPqgCM5j4DFfmciANMceoezp7tJFieNlIXiAOR
 nx2toocATt9hV4OlRBm5x8SQmERPUbLtTSBewSbTyD2RJRU4i89pMRwttycXgdOGmWYu
 Y2b3VSn9qZnmb/Iqr7cRaaA8yOorjhzlVXBHGmcytJsc4dkkVe5GH6jwFt+gjTNStYg0
 66o313gCHnfM+p9rFVWJsiNJQKb28ckuCqS+i1bpP6ZGxNf3MT1rVkXRbLQj730casyX
 CMjHAzB6itaZIcX5FfYmWvXRVjl7Qb4Qm31XXkVzWpadfvt676PhjwaZvyoOLYZ0razf
 Co7w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=oZ13YAEi
Subject: [Buildroot] rpi4 - building but 'Firmware not found' error
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

Hello!

I have a problem using buildroot for rpi4b - using buildroot 2023.05 and 
raspberrypi4_64_defconfig - I manage to complete the build and generate 
the image but when booting the device it complains of 'Firmware not found'.

I left all of the options in menuconfig as default - could anyone 
possibly tell me if I need to alter anything to get the device to boot.

Thanks in advance,

Nick

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
