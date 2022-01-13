Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E41AC433F5
	for <buildroot@archiver.kernel.org>; Thu, 13 Jan 2022 21:56:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CD0C080C7B;
	Thu, 13 Jan 2022 21:56:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id q2_LP-wLn6XN; Thu, 13 Jan 2022 21:56:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3777B80C13;
	Thu, 13 Jan 2022 21:56:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4E9171BF616
 for <buildroot@lists.busybox.net>; Thu, 13 Jan 2022 21:56:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2DEAC40A6D
 for <buildroot@lists.busybox.net>; Thu, 13 Jan 2022 21:56:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BdHGcoizHdqt for <buildroot@lists.busybox.net>;
 Thu, 13 Jan 2022 21:56:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AC5704010C
 for <buildroot@buildroot.org>; Thu, 13 Jan 2022 21:56:48 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id s30so24308730lfo.7
 for <buildroot@buildroot.org>; Thu, 13 Jan 2022 13:56:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:to:cc:references
 :from:in-reply-to:content-transfer-encoding;
 bh=dG4kP8bO6sU1P0Wu2PjnuDM76hUqCWN9UETvZlSALD0=;
 b=FkzZK2uD3LDwjYwkQ340qpCTEtXrX2y3UL2bdTmhisfzZ0cYeTeT53ZbHLQn8XfB6i
 5pMg75pvxQ+BJ+MA5xbgyy1KSB9d9dVCq0yBCI2+5rM1d+AGskPDvWbFU+/Iuyi0IYsM
 PGz3zw7Jugy2pYC0Utdve98S8q4/1l2loI0PqxXh4BjSW+E7Mz80eOdffSbeI89vRQr0
 d6p1gmbIuoM9KAEECCgebUQZhRQL087lrVxeBshqZkrgq1d2tz39ZuGy/DpAnymYYpWh
 cS/g12LSHV2xC83pqcn6tskNF/BnxYBLN/nfFe5p7ZMly9dEmD3uHUMAL7XtCsqxARED
 dGjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :to:cc:references:from:in-reply-to:content-transfer-encoding;
 bh=dG4kP8bO6sU1P0Wu2PjnuDM76hUqCWN9UETvZlSALD0=;
 b=Knenk1Qo/rNpvidCkjINSz+hM9motk15N/HKirsr7Qt2kO+AiQdhxbvRpk0xATK9+V
 d5KhL/j52MEAjP9ioYAwLDtaRwz961Bwc+U8wLjTuXfrw8XN6I2mebb/LQdfRHP3AMSP
 O/T/GqbjA+f99X32o5kSaCkub4oUi0R/Uia1Ps576EcFFQyMp3uy4OUQgR8y3m+i7/B2
 jDtElvAbWaBW+EoiXVBTEpr2mURSt6M2h81Z5+xS5H6xWjPYFlN5o5ZZ6oV23oKzOgT4
 3SNjFSN/fAvtVU9LF3Whp3kGHX3EceyTVMHkbD4x4L0qZSJh96bf5tRRlCem8gHywhdS
 ENIQ==
X-Gm-Message-State: AOAM530ck5iiROWBN2vY6mQliMDCGwnOfG77YgxyE9D/6LIil8OMpT9y
 IbGUM/r2akyAo4UffLyrzHg7IuTdu1c=
X-Google-Smtp-Source: ABdhPJxZ7UpQ8sdAX9/E7hw9I/QodnaARVfOVRqPzpdVCu7XhSGasYlUmEQKyMA3J7oZdovhvxxvcQ==
X-Received: by 2002:ac2:532f:: with SMTP id f15mr4673392lfh.644.1642111006645; 
 Thu, 13 Jan 2022 13:56:46 -0800 (PST)
Received: from [192.168.26.149]
 (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
 by smtp.googlemail.com with ESMTPSA id g41sm401015lfv.47.2022.01.13.13.56.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Jan 2022 13:56:46 -0800 (PST)
Message-ID: <f1d00786-1b7c-5385-fcca-8560048eea02@gmail.com>
Date: Thu, 13 Jan 2022 22:56:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:96.0) Gecko/20100101
 Thunderbird/96.0
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20211021085540.18764-1-zajec5@gmail.com>
 <20220113224252.0a46e30b@windsurf>
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
In-Reply-To: <20220113224252.0a46e30b@windsurf>
Subject: Re: [Buildroot] [PATCH] board/broadcom: add support for bcm47xx
 platform devices
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
Cc: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
 buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 13.01.2022 22:42, Thomas Petazzoni wrote:
> Thanks for this contribution, but it doesn't seem to be really useful
> as it is: the root filesystem generated as a tarball is not even used,
> and there is no readme.txt. We prefer to have directly useful defconfig
> files.

Thank you for your feedback, I'm still "learning" buildroot.

I aim to upstream 3 Broadcom platforms support and I already learnt
about kernel + rootfs + readme.txt in another patch review. I didn't
send V2 for bcm47xx yet, I plan to get back to working on it once I
(hopefully) get:
[PATCH V2] board/broadcom: add support for BCM4908 platform devices

accepted (V2 or another one). I want to learn on 1 platform and then
get other ones. So I'll work on bcm47xx V2 a bit later.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
