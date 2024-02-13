Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0EA2C48BC3
	for <buildroot@archiver.kernel.org>; Tue, 13 Feb 2024 08:23:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6E58960A84;
	Tue, 13 Feb 2024 08:23:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Em_7vAdMii5J; Tue, 13 Feb 2024 08:23:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7AEED60AE4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7AEED60AE4;
	Tue, 13 Feb 2024 08:23:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7FE1D1BF2C1
 for <buildroot@lists.busybox.net>; Tue, 13 Feb 2024 08:23:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6BD5D40B91
 for <buildroot@lists.busybox.net>; Tue, 13 Feb 2024 08:23:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id W6hCxyuUmwQo for <buildroot@lists.busybox.net>;
 Tue, 13 Feb 2024 08:23:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4683040B85
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4683040B85
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4683040B85
 for <buildroot@buildroot.org>; Tue, 13 Feb 2024 08:23:21 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-411a5b8765bso6031625e9.1
 for <buildroot@buildroot.org>; Tue, 13 Feb 2024 00:23:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707812600; x=1708417400;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xbEe5JqkKzIt/nlDK81p6j/NcYMtCS5sS2zQrOdNAP4=;
 b=PRzVv7B/zT6m/qGL5YThxE2EZzAgGfGOI8gpcE1H1cHoaPYDnztLbg0+Nm9gkhANKH
 l1sruBBR4Zx8tumOSERO1UQKYDILC8eU4lxBXcpAcBRKBFi1xJz7YyR+poZNPOIUveMC
 L3Uthh5Du27Ut2H9orVC/J1FHL5U6kt1t/h/KJ0tf9AhnJLveQPhmkGaJXh0kVzqKXG4
 PmeQgN9rK93wIQ0z4Ji4Lo4mJQ1PBqWUugsrF+VL1LvYd0PASKBWUBEwGnJAAeYdF+Gt
 moUIrU+F73lv6GMR1IoRNmVbBx3/tKFTCTMI6bcxfDi5nn5U47bTUi6NNMwlSeKdrKJ3
 Ztzg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWEWS9fhg6A+V5k7izhuz1+SU0Xy3j9R1+O3+pKHokZqLro9DPxMPdpwx3kRkESvOk5NIjwZlJZr4FuZkt+ECf7UPT2wkZ7vg==
X-Gm-Message-State: AOJu0YxM3m/e6ZTzI6+QDr1MOvheghdIyHxk6yPUuxzBrD5/pyQi/xEj
 17a8m3kRdRL5XtFhFx8M99gWHuwZAXwdYGiRi0aha6QGftvc/yKzAYqPyTCfrog=
X-Google-Smtp-Source: AGHT+IEnVieHgr2q5i6sxFXWCdk+KotjoiWYS8BjcfGABFgViTNnoBg3eoyfW9z5X89Xk/PzMnM9IA==
X-Received: by 2002:a05:600c:468c:b0:410:745a:f20 with SMTP id
 p12-20020a05600c468c00b00410745a0f20mr1465124wmo.9.1707812599770; 
 Tue, 13 Feb 2024 00:23:19 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCXygOC68xgQOIj3B5DPSLnzNkeApJbxJMjp61oX9EbxMhj6BBlWJYySGUpGH+zHalu+gC3uGUiQp7WI9t/XepoU7yhz8m+LlkcWrazIevrF8u/PMEbqFK6zlz8SucdBGy4Zm6GapPBC36fv8K6UodL7m5Mj0EdJiR0hy81UQPiMnygk+9p4YqJEjeryuTNOWjgeWCiP2zvM7JJNKvTmo79vG4TttfQnaEV8sw==
Received: from [192.168.43.18] ([109.140.153.204])
 by smtp.gmail.com with ESMTPSA id
 jj19-20020a05600c6a1300b0040fccf7e8easm10853063wmb.36.2024.02.13.00.23.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Feb 2024 00:23:19 -0800 (PST)
Message-ID: <f9583858-aa22-491a-adc3-c951892277a9@mind.be>
Date: Tue, 13 Feb 2024 09:23:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Nayab Sayed via buildroot <buildroot@buildroot.org>
References: <20240131-kernel_dir-v2-1-555eeeee1722@microchip.com>
 <20240212225953.79488771@windsurf>
In-Reply-To: <20240212225953.79488771@windsurf>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1707812600; x=1708417400; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xbEe5JqkKzIt/nlDK81p6j/NcYMtCS5sS2zQrOdNAP4=;
 b=QoOgEwcFmsULdhjUbG2KoqqXE4Iolyh8ObTnFzEUg2q1pyyWPxiEdOuHP7UlvhcO4x
 8wNseVEsnrt5TGCUfTajPlbmv4TNX36Zc5i5vtE7nEtUTtjECPlRJU3wZqJo/6HI/Ubq
 jGjpH1XcSJLurotUSdbvN3Y9zw6eoAqB4qX9LmoIi1aaMWr/etGvqubLyKfiVBlHLzAp
 rEtRyRQGQRuSVWWK5OtgUNrzjjdbFLHgx95DFV8Rg2+yoM+OR+zV0b/KmHHjbQH85N4R
 2uI6g028//kv315hY+c9wyKfYT4+/vvg8vfC8wC9M04+MRYjgr2Decdd7WIkwCJIlQWS
 aZuQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=QoOgEwcF
Subject: Re: [Buildroot] [PATCH v2] package/environment-setup: add variable
 KERNEL_DIR alongside KERNELDIR
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
Cc: Nayab Sayed <nayabbasha.sayed@microchip.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Romain Naour <romain.naour@smile.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 12/02/2024 22:59, Thomas Petazzoni wrote:
> Hello Nayab,
> 
> On Wed, 31 Jan 2024 23:48:28 +0530
> Nayab Sayed via buildroot <buildroot@buildroot.org> wrote:
> 
>> Update host environment setup helper script to incorporate the variable
>> KENREL_DIR alongside the existing KERNELDIR. This adjustment ensures
>> consistency, as some projects utilize KERNELDIR while others use KERNEL_DIR.
>>
>> Signed-off-by: Nayab Sayed <nayabbasha.sayed@microchip.com>
> 
> Thanks for this new iteration, but on my side, I'm tempted to reject
> this patch, and actually to remove the support for KERNELDIR as well.
> 
> Indeed, even Angelo, who added the environment-setup script was not
> able to provide a solid reason for exporting KERNELDIR in the first
> place. I don't think there is any standard, or somewhat standard
> variable to point to the Linux kernel source directory.
> 
> I'm fine with environment-setup exposing CC, LD, CFLAGS, LDFLAGS, or
> even CROSS_COMPILE as these are reasonably standardized by various
> build systems. But KERNELDIR or KERNEL_DIR are not, and the simple fact
> that both would be needed/useful is a clear hint of that. The whole
> thing I didn't like in the first place with environment-setup is the
> fact that it exports a mixed bag of somewhat random environment
> variables, and exposing both KERNELDIR and KERNEL_DIR clearly goes
> further into this direction in my opinion.

  Well, without an exported KERNELDIR, it will be very hard to build kernel 
modules outside of buildroot (and the whole point of this environment-setup 
thing is to make it easier to build stuff outside of buildroot). Indeed, 
output/build/linux-* will match stuff like linux-pam as well.

  That said, I agree that exporting both KERNELDIR and KERNEL_DIR sounds a bit 
over the top.

  Regards,
  Arnout
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
