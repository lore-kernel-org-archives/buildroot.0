Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C7CAC001B0
	for <buildroot@archiver.kernel.org>; Thu, 10 Aug 2023 19:06:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ADD2D61341;
	Thu, 10 Aug 2023 19:06:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ADD2D61341
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ocji0XWY-utC; Thu, 10 Aug 2023 19:06:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E6A5F61337;
	Thu, 10 Aug 2023 19:06:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E6A5F61337
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1ECE51BF5A6
 for <buildroot@lists.busybox.net>; Thu, 10 Aug 2023 19:06:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 055D283F43
 for <buildroot@lists.busybox.net>; Thu, 10 Aug 2023 19:06:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 055D283F43
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id p2nrG-tiSiQT for <buildroot@lists.busybox.net>;
 Thu, 10 Aug 2023 19:06:15 +0000 (UTC)
Received: from mail-qv1-xf2a.google.com (mail-qv1-xf2a.google.com
 [IPv6:2607:f8b0:4864:20::f2a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1FC3E83F3E
 for <buildroot@buildroot.org>; Thu, 10 Aug 2023 19:06:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1FC3E83F3E
Received: by mail-qv1-xf2a.google.com with SMTP id
 6a1803df08f44-6418cc115cdso471556d6.0
 for <buildroot@buildroot.org>; Thu, 10 Aug 2023 12:06:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691694374; x=1692299174;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=iybCb/F/67hqDyvbZwkfRTzaotOqpiq8J+6WBACJTd8=;
 b=cLrIkFOpHexs2WqalyCt3oCQxsfmMEF/p+4DlDGK1bv+odj0OK65PhN8KmE6SWB7aa
 ttsEXE3pGLL1vNPGPG8vZm/oM3Us1/NrVRwHTD7ppZz9zr5NrIhgiZdsP6EDh8LvGBhf
 eSCqSZpbsRyzWE1pO7YJxmwu87ttErINh8IBlSugxFUcjNb74YPctbQvH7kGvus+RFta
 nGOjzHkHwK4QJAffB5sQC6HrYMFqI4Ad6o2ncqYqYcF0DR/jbVavDtCcoTyvAXKqr8wg
 HOUgZzl3DIrRowYNGZpykPD4t0mJ/AWkljLGMP2cKQzRWsazUyMmLG++Aw3Q08uwlGT+
 KnwQ==
X-Gm-Message-State: AOJu0YxTvtT2IVBiz2KPPDP2VRkqPCEoNqq9l+sbpMp8edmLpTIY/zNr
 SEIZKZ5VEypuqq5VOKdxjQUw1wd3Zd9/ih1wUK4=
X-Google-Smtp-Source: AGHT+IFSy2ZXvnv0O8hYwmMECGB5jC7jHUyBxaVGX2y4teqvLf5OKFfyr6dxnPjto5kUBHqORJwkeexiJ15HaPNegRw=
X-Received: by 2002:a0c:ae8a:0:b0:63d:3bea:f663 with SMTP id
 j10-20020a0cae8a000000b0063d3beaf663mr2916880qvd.47.1691694373882; Thu, 10
 Aug 2023 12:06:13 -0700 (PDT)
MIME-Version: 1.0
References: <2691942.mvXUDI8C0e@kilian-aisec>
 <CAOCHtYjiGK+oKiYoPPosM6Ead+kcw1YEN8225FT3n=r=oqJ_Yw@mail.gmail.com>
 <845846062.0ifERbkFSE@kilian-aisec>
 <CAOCHtYgFMQMYvubF7nU53dgZwB4zF=hycJkX4WjyvjbFfs+iwA@mail.gmail.com>
In-Reply-To: <CAOCHtYgFMQMYvubF7nU53dgZwB4zF=hycJkX4WjyvjbFfs+iwA@mail.gmail.com>
From: Robert Nelson <robertcnelson@gmail.com>
Date: Thu, 10 Aug 2023 14:05:48 -0500
Message-ID: <CAOCHtYj0J3m7KJG2uj2f0RK+v9TPGj+_gPPxbcGh3aXswL1Ltg@mail.gmail.com>
To: Kilian Zinnecker <kilian.zinnecker@mail.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691694374; x=1692299174;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=iybCb/F/67hqDyvbZwkfRTzaotOqpiq8J+6WBACJTd8=;
 b=Vag8wJ/q47CpunsIuQtjbjb9uS/I7Cf6XdhhbMbHje4Z3TSE5sN7ln8LSNWBklqv6m
 Um4jJcnzu/i9gIWL5jCdvyJl7FpDzq+KUyD20ahuziGdDXSwEEqY5DUWhRhod9o7U6PM
 T65yMjtkZgToCEpxctAzEjJpEPZ0Vx9TaxMhcXD2m1VXQ8S6n6IXsB3WYqZ1K9W5NC9R
 sAE7RZLsHnNsHb2yj2egPlwDljQ6CsE73p6WB6EOq7WF30wCCUk52nQHu4TsyXAFHSle
 728Wn24IuJptH6nRiHmlOfj7HrEEm92A4elouFxBUnlZHizVhkv+GcdrHYySEgRIKwzn
 jWyg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=Vag8wJ/q
Subject: Re: [Buildroot] Interested in board support for BeagleV-Ahead
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

u-boot partition:

This is where I chopped up the multi partition eMMC into 2 generic
ones..  SO if you want to do all the A/B rootfs stuff, this how they
originally did it;

https://git.beagleboard.org/beaglev-ahead/beaglev-ahead-u-boot/-/commit/d594ec74845b38d84edd845b019c837258b64cb7

`fastboot oem format` is what runs this:

Factory A/B boot:

partitions=name=table,size=2031KB;name=boot,size=200MiB,type=boot;name=root,size=4000MiB,type=linux,uuid=${uuid_rootfsA};name=bootB,size=200MiB,type=boot;name=rootB,size=4000MiB,type=linux,uuid=${uuid_rootfsB};name=data,size=-,type=linux

Our simple 2 partition:

partitions=name=table,size=2031KB;name=boot,size=200MiB,type=boot;name=root,size=-,type=linux,uuid=${uuid_rootfsA}

Regards,

-- 
Robert Nelson
https://rcn-ee.com/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
