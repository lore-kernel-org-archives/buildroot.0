Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0492C4167B
	for <buildroot@archiver.kernel.org>; Mon, 27 Nov 2023 11:42:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 67AE9404F7;
	Mon, 27 Nov 2023 11:42:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 67AE9404F7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OnWBytY4b_Dq; Mon, 27 Nov 2023 11:42:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 47DF7404E0;
	Mon, 27 Nov 2023 11:42:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 47DF7404E0
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D29431BF3EA
 for <buildroot@lists.busybox.net>; Mon, 27 Nov 2023 11:42:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AAAE2404DE
 for <buildroot@lists.busybox.net>; Mon, 27 Nov 2023 11:42:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AAAE2404DE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lduqEyDzdwIm for <buildroot@lists.busybox.net>;
 Mon, 27 Nov 2023 11:42:24 +0000 (UTC)
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [IPv6:2607:f8b0:4864:20::436])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9553340457
 for <buildroot@buildroot.org>; Mon, 27 Nov 2023 11:42:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9553340457
Received: by mail-pf1-x436.google.com with SMTP id
 d2e1a72fcca58-6bd32d1a040so3995113b3a.3
 for <buildroot@buildroot.org>; Mon, 27 Nov 2023 03:42:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701085344; x=1701690144;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=N46BmuAeTXvIoxvR/YFIq0VqLlmnNQ7aM760+8tIbRk=;
 b=sl3dLpvz9e+t6yQdps2KDyWX5efQWZ50gFYDi7Y6eECArKasqZNOreCmoQVF00AQWp
 6Z2DFM0DrE5UDZ/P9i/JrFktKv67A+1jh7/fDoY2WhBBN12T6yv8Gye3efFuLNecUjgI
 04LV1aKuD9E6mPhfsYP1VxZFMslLk9y857FRn81SQi5HobwCANHMcvkQIUIxFnxfED8e
 SJPRY32XJ5sGxGocvX0OXr9bcKzRobwzBTBkY2dOdqXGB7cpbe74KVKjbjTPIutHZmRI
 W30tSwJbZMBJpSurTCdDyBHrUOHeGUsouebajuopTgD7SyP8wHNSwNJLmnVfViS2Qx4h
 Wzeg==
X-Gm-Message-State: AOJu0Yx/NVqoG5ZCcIHMTL8LLnHGBBSXHWA476VUZSzlGQN5WkQdHv2Q
 a+Od5DxCFLRBN5Gv8Jf0PZjCiEbW1SQeW8n84nM=
X-Google-Smtp-Source: AGHT+IEiR5A0KBT3ei5KuYG/popNxOQAxTpJ/bS1pPlU3LnZjggmwhyECGoZI5c0X2xnNFqYSnckqw==
X-Received: by 2002:a05:6a20:d90e:b0:18b:d17c:6af2 with SMTP id
 jd14-20020a056a20d90e00b0018bd17c6af2mr15684667pzb.57.1701085343820; 
 Mon, 27 Nov 2023 03:42:23 -0800 (PST)
Received: from Red ([2a01:cb1d:3d5:a100:4a02:2aff:fe07:1efc])
 by smtp.googlemail.com with ESMTPSA id
 x14-20020a170902a38e00b001cfc1a593f3sm3141665pla.34.2023.11.27.03.42.23
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Nov 2023 03:42:23 -0800 (PST)
Date: Mon, 27 Nov 2023 12:42:21 +0100
From: Corentin LABBE <clabbe@baylibre.com>
To: buildroot@buildroot.org
Message-ID: <ZWSAnROGOMUP69lt@Red>
References: <20231106123705.311899-1-clabbe@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231106123705.311899-1-clabbe@baylibre.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1701085344; x=1701690144;
 darn=buildroot.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=N46BmuAeTXvIoxvR/YFIq0VqLlmnNQ7aM760+8tIbRk=;
 b=pZ9U/8CIIYqZV/Zm0FaNWLo/2sx2e6lbM4F/Yu77bV7058nfG7CS7jUuuri5MPgknP
 aOG9UKMoPNCLa5wU4pnm2CViKuOSCa7Kk/7zHVwxNdtmsIOjDxxD6YQoWYuNLQI2hhAW
 fnvNv3rmiuZOGZA9dRs1Xynp/6fMiiq1RtMxirX7PqWKkWUhNm3qWJqGugd1cxM1kC91
 r07itOp6iwOX7SflBNyYmEOWu0KyIT15fepJstpk6TdtXwJoFW57pL4lWZXTFoVwqgA2
 SVYLac75WbRTbFL/7v0SHwDPPNko4MlRb40AOecHYIR8h+l2nfi/k1At584w7M4ILUTE
 HG6w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com
 header.i=@baylibre-com.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=pZ9U/8CI
Subject: Re: [Buildroot] [PATCH 1/1] linux: Use the choosen rootfs
 compression type when rootfs is builtin
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Le Mon, Nov 06, 2023 at 12:37:05PM +0000, Corentin Labbe a =E9crit :
> I have built a buildroot with:
> BR2_TARGET_ROOTFS_CPIO_XZ=3Dy
> BR2_TARGET_ROOTFS_INITRAMFS=3Dy
> With this buildroot produces an images/rootfs.cpio.xz but the kernel stil=
l use gzip (CONFIG_INITRAMFS_COMPRESSION_GZIP)
> as compression for a plain rootfs.cpio
> =

> Setting CONFIG_INITRAMFS_COMPRESSION_XZ in a linux.fragment does not
> work as it seems the fragment is setup before buildroot set
> CONFIG_INITRAMFS_SOURCE which reset the CONFIG_INITRAMFS_COMPRESSION
> choice.
> =

> So buildroot have to change CONFIG_INITRAMFS_COMPRESSION after setup
> CONFIG_INITRAMFS_SOURCE.
> =

> Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
> ---

Hello

Ping

Regards
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
