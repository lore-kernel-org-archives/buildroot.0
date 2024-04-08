Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AD77C67861
	for <buildroot@archiver.kernel.org>; Mon,  8 Apr 2024 23:19:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9B86060B63;
	Mon,  8 Apr 2024 23:19:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aSwrsaWOz8SY; Mon,  8 Apr 2024 23:19:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B856460B86
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B856460B86;
	Mon,  8 Apr 2024 23:19:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A59AD1BF371
 for <buildroot@lists.busybox.net>; Mon,  8 Apr 2024 23:19:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9057B812C9
 for <buildroot@lists.busybox.net>; Mon,  8 Apr 2024 23:19:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HTSQfUmyzdcs for <buildroot@lists.busybox.net>;
 Mon,  8 Apr 2024 23:19:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::634; helo=mail-pl1-x634.google.com;
 envelope-from=chinhuat@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BD722812BF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BD722812BF
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BD722812BF
 for <buildroot@uclibc.org>; Mon,  8 Apr 2024 23:19:05 +0000 (UTC)
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-1dff837d674so43265145ad.3
 for <buildroot@uclibc.org>; Mon, 08 Apr 2024 16:19:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712618344; x=1713223144;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RepzNsbQ5q84/8lpouEQzHwXYlBQX0QQJDD7APK0sww=;
 b=bQreKyf3Xc4SM6cVC6OLSLJ2+B+PiUcbxR289Ancm/ullMCWaHvLJMte/mNcqyfjHp
 4m6YLLzPdxg4ZASIy7Hc83eMSwLf7zZZQ1fUbLgLLGgB24OE85gTdN0xqQhXNX/NM8D9
 sU4AmL6XJx3iS3UPwjK0JLDGBond754Mpv8QQXBzUrUnTHmN/yO4nBaA31J/zTE+AknK
 ucYU3II1P5Cei81n5Dpb47NsUez+Wo8i/8pX0mvEaTcB9yMwRHBiuRvxlWb2Tv4NHREq
 0/7Q3UbSj90NWVSHEBhAPHeaLBsV1cOcN4WZ3Zo93TJVjW9p0BhHBKNKkZRXB+g0/+7f
 kbbQ==
X-Gm-Message-State: AOJu0Yz2QD0RKPhCnjFLN+IV/of5sdqgPRzx63YBcaQO3Pq0H2lVoMG1
 Ae33UOFRaLJ4BDIBsqCISsHEF0MsMUbOFLCIfwJIZBPHBk2d+ZjtZlQk6QwpwJqAYA==
X-Google-Smtp-Source: AGHT+IFMH2dg2scvR3oBTGgupv8Bk2chQOThv9SMs8IaDmv4nCgs/e1QNvaRqiyqDvQ+8NxnD8lttQ==
X-Received: by 2002:a17:902:f644:b0:1e3:e081:d29a with SMTP id
 m4-20020a170902f64400b001e3e081d29amr10339586plg.3.1712618343888; 
 Mon, 08 Apr 2024 16:19:03 -0700 (PDT)
Received: from NUC7CJYS ([175.144.129.205]) by smtp.gmail.com with ESMTPSA id
 k1-20020a170902c40100b001e45240eca4sm1952380plk.196.2024.04.08.16.19.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Apr 2024 16:19:03 -0700 (PDT)
From: Chin Huat Ang <chinhuat@gmail.com>
X-Google-Original-From: Chin Huat Ang <chinhuat>
Date: Tue, 9 Apr 2024 07:18:58 +0800
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <ZhR7YuA59O5EuWHr@NUC7CJYS>
References: <20240408130103.3680258-1-chinhuat__27149.3660447717$1712581334$gmane$org@gmail.com>
 <pan$1f7c6$4b039972$8c14595e$711df073@ID-313208.user.individual.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <pan$1f7c6$4b039972$8c14595e$711df073@ID-313208.user.individual.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1712618344; x=1713223144; darn=uclibc.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=RepzNsbQ5q84/8lpouEQzHwXYlBQX0QQJDD7APK0sww=;
 b=aKxTwtJXJ1KyS/pFlqmN9L+0DfWgsxALurgWhDgEtwPxyI0k5QFfnXRfmQ0/+0U3q1
 2sxEGYLeBAyeQ9iUAHD7tP+bF7iorCFPFhctQuO6hFJODdDO4BL++khQv1WciKOpwvfO
 TWpi4rmViQgbLln+cdTj16sxVmwuDesRCx1JWIC3D3rNwJXBGcczEzTBkfTBpisCLq7A
 2C7E6eGYcsBoFVhfbKNvfUBEQ8sYSbx4OedhhGkc6gy5GBEimXqK64JN1okhHeg3rCaR
 anHE8NumhSlToWh7nO1moGcHW4A/EhYh+7Ez3CZE00Cy8be3l0HlHxdNYsA7QDbKrL1d
 0clQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=aKxTwtJX
Subject: Re: [Buildroot] [PATCH] package/uclibc: bump to version 1.0.47
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
Cc: buildroot@uclibc.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

> this patch is a duplicate of
> https://patchwork.ozlabs.org/project/buildroot/patch/
> ZgQcVayV4juxXnnZ@waldemar-brodkorb.de/

No worries, please ignore mine then. Though I see the earlier patch's
status is still NEW. Any ideas what's the hold up?
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
