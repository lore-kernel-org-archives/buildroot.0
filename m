Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9BDDC4332F
	for <buildroot@archiver.kernel.org>; Tue,  7 Nov 2023 13:12:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0A0C082A6C;
	Tue,  7 Nov 2023 13:12:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0A0C082A6C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ot5MJGqfJycy; Tue,  7 Nov 2023 13:12:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5465782AAA;
	Tue,  7 Nov 2023 13:12:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5465782AAA
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A4B8D1BF3B5
 for <buildroot@lists.busybox.net>; Tue,  7 Nov 2023 13:12:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8056B40B05
 for <buildroot@lists.busybox.net>; Tue,  7 Nov 2023 13:12:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8056B40B05
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 910XK3um6i32 for <buildroot@lists.busybox.net>;
 Tue,  7 Nov 2023 13:12:02 +0000 (UTC)
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3D49B402A7
 for <buildroot@buildroot.org>; Tue,  7 Nov 2023 13:12:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3D49B402A7
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-9e1021dbd28so288713766b.3
 for <buildroot@buildroot.org>; Tue, 07 Nov 2023 05:12:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699362720; x=1699967520;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=K0u9JzznK/wd5KpdT0qJ/ps9RV17EkOw633NNRIn6Nc=;
 b=gbjBY2clyv1/LarPoBKQs17tlYuBu+JDkyycNe/rFRIt4ooTC/HlZ6XGJ6eLcfotiR
 5rx5etzOcoZXFGfSqfDu+n9dIA3bD/xBT62tCPhxnZ2v2Fn0FckB8cwXmZjGCW2KfaS1
 iHi2FGuSnw09RO5+/+xEHJ4K0q5DmC5StLnOpvRvOIqV6yCaShTNKp5hqCcPjd0fV+yd
 wz39zePuAUjUl2ujFGEtMdr4XdjX2HkkSWGDm6D4erzZEnD8LWYYNTN/JhkcFTk2wcAQ
 v+P86XCMaj1SB5FBrJ36/Rc1Vaif++4IMdmdEELEGvd0LCvxbKysXeg3dAyKioTTEmT9
 MrKQ==
X-Gm-Message-State: AOJu0Yy/YZCyOv7YzkdNzhNqxyMoaCpIkf08/+r7WiysigtcGE/L9aOt
 yyZ3m/FsqTmzd5Lb6qAxxCq78PrE34oz3axMuqas2w==
X-Google-Smtp-Source: AGHT+IFzbtRhLyZBMifcQWARn1PGTHkAVVFr3lHooc2GauUM4k59tX9ZxIYOVEXtIkp+ZWOKs26TfzR7+/inmazEb+0=
X-Received: by 2002:a17:907:318d:b0:9c5:6cf5:448a with SMTP id
 xe13-20020a170907318d00b009c56cf5448amr16565615ejb.44.1699362720109; Tue, 07
 Nov 2023 05:12:00 -0800 (PST)
MIME-Version: 1.0
References: <20231107110909.401532-1-sairon@sairon.cz>
 <7de12a5434c759ebfc9770fd9affea29@agner.ch>
In-Reply-To: <7de12a5434c759ebfc9770fd9affea29@agner.ch>
From: =?UTF-8?B?SmFuIMSMZXJtw6Fr?= <sairon@sairon.cz>
Date: Tue, 7 Nov 2023 14:11:34 +0100
Message-ID: <CAPa5EdAQ3SE51XT+Q3xXHS7xumdXNXuKt2SG_E_KP-OZaBhf8g@mail.gmail.com>
To: Stefan Agner <stefan@agner.ch>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sairon.cz; s=google; t=1699362720; x=1699967520; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=K0u9JzznK/wd5KpdT0qJ/ps9RV17EkOw633NNRIn6Nc=;
 b=fPzdKzJfhvL5SBtBHUG+UrBxfT/qGEGB/vNsNBCBgKzf2frtkCl+kHaJdxb6jyJFtX
 c2TjGREvpp0FHEasP1xw/0wFY++D7Z0fsSNE1lLl5U3uhV2KicvLi1rueQzbEZZuc2Hc
 2uzcAPck4pKmq/BEOZ1UmGF7rUSNvaiyxFVQRgxleMK4ED++rocx9nhu97afMnLkyGLK
 8VrZ3F/beFE6RzD6YT+FbSfsmbLEquAh+nBVl7jJtXT/jsk+m8Skp0UYmCcwu/QL+13P
 jbXxK85QGagXjhVwa/8n7pzE27Tke89/hLn1u/DneH8taYFMRHiYgrmARG7ZVkC0dUgS
 mqvQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=sairon.cz header.i=@sairon.cz
 header.a=rsa-sha256 header.s=google header.b=fPzdKzJf
Subject: Re: [Buildroot] [PATCH] package/linux-firmware: add RTL8851/RTL8852
 firmware
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
Cc: Bernd Kuhls <bernd@kuhls.net>, "Yann E. MORIN" <yann.morin.1998@free.fr>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 7 Nov 2023 at 13:23, Stefan Agner <stefan@agner.ch> wrote:
> There is also rtl8852cu_fw_v2.bin in newer linux-firmware releases
> (Buildroot master uses the latest tag 20231030). So while at it, we
> could add this firmware as well.

Thanks for the heads-up, Stefan, my bad, I took the list of files from 20230804.

Will send an updated patch right away, please ignore this one.


Jan
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
