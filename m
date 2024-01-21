Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 762F8C47422
	for <buildroot@archiver.kernel.org>; Sun, 21 Jan 2024 18:01:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E8FD760B15;
	Sun, 21 Jan 2024 18:01:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E8FD760B15
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id R3uvTnIfJunL; Sun, 21 Jan 2024 18:01:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4509C60AEB;
	Sun, 21 Jan 2024 18:01:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4509C60AEB
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 545D21BF426
 for <buildroot@lists.busybox.net>; Sun, 21 Jan 2024 18:01:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3945381EF4
 for <buildroot@lists.busybox.net>; Sun, 21 Jan 2024 18:01:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3945381EF4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RY-LYKASYAwZ for <buildroot@lists.busybox.net>;
 Sun, 21 Jan 2024 18:01:23 +0000 (UTC)
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 24E3C81ED6
 for <buildroot@buildroot.org>; Sun, 21 Jan 2024 18:01:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 24E3C81ED6
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-40e8801221cso24634815e9.1
 for <buildroot@buildroot.org>; Sun, 21 Jan 2024 10:01:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705860081; x=1706464881;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UFUUF6ILUykcUlse0Zan6fEh2lA23xT0Ds5TSY0I06s=;
 b=mpp6ZXfokXMl4QyAawEZWt+d2MzYBhw5ZnWqXOVeDdPPxXtfW8F3v+bX/V7SdeXXDa
 kOME+LeEgcj7xHppWfl3HXmcPp2vrMlkQVHbTQLEM46HXOKXwwcZmAU62afPPwRKpQ13
 ZtqtGeW2Y/p5uzFp03zkCE2ASj+niD4n4D6kdiLbn2EFlqHno9cvqP2jHfOPhcAL6JVu
 KMoF4qvsp9PQZfe/tyv1IzRQdMJDEYDipJjyCBwqqb74Qhgligw/87t9EYiBbZ21bVfA
 3Eyzu8YtypQch3yNghiLyQFUr+YfnRXYRLk2wTACz15scV4p5SSaRgTSJb/z+L1rwKBR
 cpOQ==
X-Gm-Message-State: AOJu0YzhBM/t9JbRalLaXlDEXRE5KfIElCXkfdbraLunlwdIlfW4szWx
 LZmU7dKNDVHiBijUVqmHyKOZ42urPk8G+7zxdXtBSUYfRnaRbieGisNXVtvKh/w=
X-Google-Smtp-Source: AGHT+IHJxC4Nr5cv+G2Cr1lioFS0iCH+t1hganpbKNB1rN3bp/VghT4xiJv5hVZQGHPMhddv7xC18A==
X-Received: by 2002:a05:600c:5491:b0:40e:66c5:3294 with SMTP id
 iv17-20020a05600c549100b0040e66c53294mr2062533wmb.47.1705860080898; 
 Sun, 21 Jan 2024 10:01:20 -0800 (PST)
Received: from ?IPV6:2003:c6:3735:60ca:4989:2bb4:c39e:3713?
 (p200300c6373560ca49892bb4c39e3713.dip0.t-ipconnect.de.
 [2003:c6:3735:60ca:4989:2bb4:c39e:3713])
 by smtp.gmail.com with ESMTPSA id
 iw7-20020a05600c54c700b0040d604dea3bsm35722812wmb.4.2024.01.21.10.01.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 21 Jan 2024 10:01:20 -0800 (PST)
Message-ID: <e7e19488-47f0-4fa5-ad16-0ec453517f56@gmail.com>
Date: Sun, 21 Jan 2024 19:01:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Stefan Ott <stefan@ott.net>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20240118144823.5105c00f@windsurf>
 <20240119021124.92277-1-stefan@ott.net> <20240119122630.3f58dad1@windsurf>
 <20240120150819.GA125940@mort>
Content-Language: en-US
From: Raphael Pavlidis <raphael.pavlidis@gmail.com>
In-Reply-To: <20240120150819.GA125940@mort>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705860081; x=1706464881; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=UFUUF6ILUykcUlse0Zan6fEh2lA23xT0Ds5TSY0I06s=;
 b=ExadysrrdPS2/Txnpm7ymJpfI+SvUfXgNZgdkrcPeQyZ8bLiYOYq2w5LFDCzwzUxbS
 DzLygAbPCUvDwrk3UYZNcKLjyvn1DdYcdkixwSuGVCuEC8XJ+XXGuBEpi+KRMWr9MT8Q
 h8UUjrg3nnTXYPYkZEKpXH8TmmZ0bSxqmh9q4dK5TmVjz/1Cz53o66/dQ8y+/4GL9ZMN
 LjzEjqA9oB83pCRUX09HYZG6LrM74HDX00oc35JTlbGSi2FiaPZd2h9NRXCLOEm5AgYv
 qaAokXxPm8Ii/PHG695hZ0zpMKmYsczyRA+dgxyieCTvgIkjBjY3gCJWrfGo8yAAUUja
 Q75w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Exadysrr
Subject: Re: [Buildroot] [PATCH v2] package/sway: make systemd optional
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
Cc: Stefan Ott via buildroot <buildroot@buildroot.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Stefan,

On 1/20/24 16:08, Stefan Ott wrote:

[SNIP]

> 
> The other values are "auto", "libelogind" and "basu", with "auto"
> being the default.
> 

I just checked the code. "auto" means that it will check if "libelogind" 
is present and then check for "basu". [1]  According to the code, a 
"sd-bus-provider" has to be present if "tray" is enabled [2], else it is 
not used anywhere. So, we can check if "BR2_PACKAGE_SYSTEMD" is enabled 
and enable also "tray", or disable it.

[1]: https://github.com/swaywm/sway/blob/master/meson.build#L89
[2]: https://github.com/swaywm/sway/blob/master/meson.build#L105

Thanks,
Raphael Pavlidis
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
