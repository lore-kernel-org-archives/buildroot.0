Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3987EC4167D
	for <buildroot@archiver.kernel.org>; Tue, 31 Oct 2023 11:09:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8D52A83376;
	Tue, 31 Oct 2023 11:09:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8D52A83376
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4FX1XMOunYZK; Tue, 31 Oct 2023 11:09:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E38B683168;
	Tue, 31 Oct 2023 11:09:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E38B683168
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 176391BF31A
 for <buildroot@lists.busybox.net>; Tue, 31 Oct 2023 11:09:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E478742853
 for <buildroot@lists.busybox.net>; Tue, 31 Oct 2023 11:09:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E478742853
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VRTJ1G5gCB3U for <buildroot@lists.busybox.net>;
 Tue, 31 Oct 2023 11:09:01 +0000 (UTC)
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B52B342150
 for <buildroot@buildroot.org>; Tue, 31 Oct 2023 11:09:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B52B342150
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2c5b7764016so60940791fa.1
 for <buildroot@buildroot.org>; Tue, 31 Oct 2023 04:09:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698750538; x=1699355338;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CHYGQmZOT5LWm4bIo6bZlDxL5ijR9mGWfJdNeXv2aNc=;
 b=Ode5jmCdcm/g1LV4oAcqc0RgwzqHe+9zIn2w95sm/lwl5G9vCEgbZBcVu+/OX5vMcn
 Fn6xbKXduOkVTOvAU3CDj4oRWgyJvPZ8kl1kiWl3nRYupU6AxyctgG3RTPTbN5OlYM7X
 JBWW/NCSIeaeFWs4TCl44fffiJKxpdw/lOprw9fDniiSxpjDu2tUaXhjgLgec8uBWbVH
 8auQMfnn38oY3mlHZJoTDdVbDuycZye0dICFEHgtsyOOxRWyueOTj4oaOUWxwhelrSHk
 Eqwj8bjoGLpwAtNcJmLZsXYuxWR7WM7pmkJMfBUK91O7/mHyOVAkwQgDMSOxaotez9Ts
 oGPQ==
X-Gm-Message-State: AOJu0YwrESAxsacDevk+kef7AM5uiLT9LayZbuy8xfZH4ryZxFqDDk1o
 4aXVqhXiK519VGfI2kfyFpSpxUxU275MUcKH2qS74F1ncYk=
X-Google-Smtp-Source: AGHT+IEdn2OvXsLk70zXCodsMFQ9hQK257J1ReZV5eLIYufQn81n9Q25LkVnG90BH+Moa3I1WS7EGobdNM9cFJ7M/iQ=
X-Received: by 2002:a2e:8919:0:b0:2c5:18ed:1809 with SMTP id
 d25-20020a2e8919000000b002c518ed1809mr11239300lji.34.1698750538114; Tue, 31
 Oct 2023 04:08:58 -0700 (PDT)
MIME-Version: 1.0
References: <20231026181904.3218122-1-bernd@kuhls.net>
 <87o7gf1b6h.fsf@48ers.dk>
 <CAFkzVZacX8bhs_2qKcSKifXm7JkUSLpg5ZaVKfz7Zvq7FBbQLw@mail.gmail.com>
 <87jzr315sl.fsf@48ers.dk>
In-Reply-To: <87jzr315sl.fsf@48ers.dk>
From: Scott Fan <fancp2007@gmail.com>
Date: Tue, 31 Oct 2023 19:08:46 +0800
Message-ID: <CAFkzVZbf3A4npP1DvXYkKo0dDTm_zxJMptdwR73J5EG3YpXH-w@mail.gmail.com>
To: Peter Korsgaard <peter@korsgaard.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698750538; x=1699355338; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CHYGQmZOT5LWm4bIo6bZlDxL5ijR9mGWfJdNeXv2aNc=;
 b=ZTIyWFxh0JLe2GxizZpBzPc9HZrYCL/6uRqCyBMaxCyV24PwID/ErwZcMvGcRjD6o+
 okZHWkbS8AbnvWY1TzehH3bP+37r6m/tL51JZLD2aitaLT1vBkSAu5iRzwXAeTlsavBD
 hfy0rq+RkJqwZylKJoT3/lsPWUkkUPpSxeRil1yFY/4nvLs2mLfeeEUI3B/9aLMEkmhZ
 coYAFwWbw156cB9FAB5c8yiHdkCUO2V2m7fnXBqxKcDRKlCyc2O8g3IPF7KwZ4dEYxXc
 6S7L/AT5m3DIz8qiDjqWc0zpCv+0Unaklhy/hfOAcG7M/WpQnvyAaHYdt8Meroh5mpAt
 nMsA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=ZTIyWFxh
Subject: Re: [Buildroot] [PATCH 1/1] package/libopenssl: security bump
 version to 3.1.4
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
Cc: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

U29ycnksIGkgdGhvdWdodCBpdCB3b3VsZCBhbHdheXMgZm9sbG93IHRoZSB1cHN0cmVhbS4KClNj
b3R0IEZhbgoKT24gVHVlLCBPY3QgMzEsIDIwMjMgYXQgNTo0OOKAr1BNIFBldGVyIEtvcnNnYWFy
ZCA8cGV0ZXJAa29yc2dhYXJkLmNvbT4gd3JvdGU6Cj4KPiA+Pj4+PiAiU2NvdHQiID09IFNjb3R0
IEZhbiA8ZmFuY3AyMDA3QGdtYWlsLmNvbT4gd3JpdGVzOgo+Cj4gID4gRm9yIDIwMjMuMDIueCBi
cmFuY2gsIGl0IG5lZWQgYnVtcCB0byAxLjEuMXcgdmVyc2lvbi4KPgo+IFdoeT8gSXNuJ3QgMS4x
LjF3IG9ubHkgaW5jbHVkaW5nIHRoZSBzZWN1cml0eSBmaXggZm9yIHRoZSBXaW5kb3dzLW9ubHkK
PiBDVkUtMjAyMy00ODA3IHZ1bG5lcmFiaWxpdHk/Cj4KPiBodHRwczovL3d3dy5vcGVuc3NsLm9y
Zy9uZXdzL3NlY2Fkdi8yMDIzMDkwOC50eHQKPgo+IC0tCj4gQnllLCBQZXRlciBLb3JzZ2FhcmQK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290
IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxk
cm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
