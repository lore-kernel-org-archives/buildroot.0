Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C288EC8759
	for <buildroot@archiver.kernel.org>; Thu,  7 Sep 2023 23:28:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9D43C60F5E;
	Thu,  7 Sep 2023 23:28:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9D43C60F5E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Yz64pUj5g-q5; Thu,  7 Sep 2023 23:28:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CEE0960EE2;
	Thu,  7 Sep 2023 23:28:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CEE0960EE2
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 89C821BF3EC
 for <buildroot@lists.busybox.net>; Thu,  7 Sep 2023 23:28:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5C31340144
 for <buildroot@lists.busybox.net>; Thu,  7 Sep 2023 23:28:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5C31340144
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EYmWocv2vj9w for <buildroot@lists.busybox.net>;
 Thu,  7 Sep 2023 23:28:52 +0000 (UTC)
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 58240404F7
 for <buildroot@buildroot.org>; Thu,  7 Sep 2023 23:28:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 58240404F7
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2b95d5ee18dso26691661fa.1
 for <buildroot@buildroot.org>; Thu, 07 Sep 2023 16:28:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694129330; x=1694734130;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5klqKwNBI0ha42YYXv/aV7gIQU8Q5DMjHgMF5LQFA2o=;
 b=Xr1eEM0cJ/oj4SiZv4YipBmXbw7ZtliiaZ1oNeveU774l3wudefx61IHLy1qH1C8nz
 kgOhs+0MbDkoA4UcDlreyeRJLilV7bKf8/p+F038J8e1811V+RZZTirq5YW+WzaTzfT5
 6Sggr3ObxzLbXBPVkEDje6V1FOjeCFa3WmAv7ywx/WGS/ZssF1OYiDRsMQrHi6xyy1BF
 DvFw4N0VSTXFfMySOkjDScXMsFU2xNqf0KXzats3ojXSW7BpDWEfv1Rat8A5ENXGU1Yj
 mAIItLtXQM9gfMLyAfVkCUYrUd0erwEJk7NlFW3DLC0Kd2zCBvYwymMLkBttILGJtRmK
 M8fQ==
X-Gm-Message-State: AOJu0YzgVxSvlTJ43HVBoX/envxyZhf3atxVtFUcwWRM+F7ZVVOtQqQT
 5kPIqqdfphrNdQbxQHweeqTa9AvKBwOexpioB2pr7A==
X-Google-Smtp-Source: AGHT+IF3NRomEvyMRPXAtuc9oxNP824/6h3bJzq1VOpT63+ksPbyloYkjcXEUeehtcB4dr7ne0uAvw==
X-Received: by 2002:a2e:b613:0:b0:2bc:fc2e:7671 with SMTP id
 r19-20020a2eb613000000b002bcfc2e7671mr477887ljn.13.1694129329436; 
 Thu, 07 Sep 2023 16:28:49 -0700 (PDT)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com.
 [209.85.128.51]) by smtp.gmail.com with ESMTPSA id
 gf13-20020a170906e20d00b009928b4e3b9fsm230757ejb.114.2023.09.07.16.28.48
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Sep 2023 16:28:48 -0700 (PDT)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-402c1407139so16921245e9.1
 for <buildroot@buildroot.org>; Thu, 07 Sep 2023 16:28:48 -0700 (PDT)
X-Received: by 2002:a5d:410b:0:b0:31d:d3db:4566 with SMTP id
 l11-20020a5d410b000000b0031dd3db4566mr580030wrp.4.1694129327876; Thu, 07 Sep
 2023 16:28:47 -0700 (PDT)
MIME-Version: 1.0
References: <20230727232235.449788-1-christian@aperture.us>
 <b73fb293249bcf48f42ebaed0f78f1c1@agner.ch>
In-Reply-To: <b73fb293249bcf48f42ebaed0f78f1c1@agner.ch>
Date: Thu, 7 Sep 2023 16:28:36 -0700
X-Gmail-Original-Message-ID: <CA+h8R2r3sxFvPN5QFt9szw638M_9o=WRC3a8pUQ1O2KrGMvrkw@mail.gmail.com>
Message-ID: <CA+h8R2r3sxFvPN5QFt9szw638M_9o=WRC3a8pUQ1O2KrGMvrkw@mail.gmail.com>
To: Stefan Agner <stefan@agner.ch>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1694129330; x=1694734130; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5klqKwNBI0ha42YYXv/aV7gIQU8Q5DMjHgMF5LQFA2o=;
 b=BUx9c9pJ7GMpsZgLxoTP9gelihLz1IEwocn7M0uCL7pdAnrnnlzenoL942mBXsNTUk
 gTG/Xcpc7NnJnIXh/DyNa72W96z7utjozArD1zO72j3UH6P0zmiGxtLghIdVu3ZHybZ7
 O6dhnIoNeTAniFWK5RdxdYP/fmhbY/jkhxyw6R2xvnYjcQu2t2NZ36O4qCqWghZr0J9U
 lnE7BIZkG74iecW3PhWxbs7Bb50wbj9E/8hCGOTUNfchDa6tDqnhF0rIe161w+lTr49y
 Djn6DXh8BRCeUHPvr7SxORVeEwCR2W5V8PPmminpsmP/WYEf4wU47y4yWF4OLHSe8i/y
 wJmA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=aperture.us header.i=@aperture.us
 header.a=rsa-sha256 header.s=google header.b=BUx9c9pJ
Subject: Re: [Buildroot] [PATCH v1 1/1] package/containerd: bump version to
 v1.6.22
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@aperture.us>
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgU3RlZmFuLAoKT24gVGh1LCBTZXAgNywgMjAyMyBhdCA0OjIz4oCvUE0gU3RlZmFuIEFnbmVy
IDxzdGVmYW5AYWduZXIuY2g+IHdyb3RlOgo+Cj4gSGkgQ2hyaXN0aWFuLAo+Cj4gSXQgc2VlbXMg
dGhhdCB0aGlzIHZlcnNpb24gaGFuZ3MgYXQgc3RhcnR1cCwgYXQgbGVhc3Qgd2hlbiBidWlsdCB3
aXRoCj4gQnVpbGRyb290IDIwMjMuMDIuNC4KCkkgYW0gcnVubmluZyAxLjcueCBvbiBteSBzeXN0
ZW1zIHNvIEkgY2FuJ3QgY29uZmlybSB0aGlzIGN1cnJlbnRseS4KCj4gQnR3LCBvbiBtYXN0ZXIs
IHdoZXJlIHdlIHVzZSBEb2NrZXIgMjQuMC54LCBzaG91bGRuJ3QgY29udGFpbmVyZCBiZQo+IHVw
Z3JhZGVkIHRvIHRoZSAxLjcueCBzZXJpZXM/CgpBY2NvcmRpbmcgdG8gdGhpcyAxLjYueCBpcyBM
VFMgYW5kIHN0aWxsIGdldHRpbmcgdXBkYXRlczoKCmh0dHBzOi8vY29udGFpbmVyZC5pby9yZWxl
YXNlcy8KCkFjY29yZGluZyB0byB0aGVzZSByZWxlYXNlIG5vdGVzLCAxLjYueCAiaGFzIGFsc28g
YmVjb21lIGEgbG9uZyB0ZXJtCnN0YWJsZSByZWxlYXNlIGZvciB1c2VycyB3aG8gcHJlZmVyIHJl
bGVhc2VzIHdpdGggbW9zdGx5IHN0YWJpbGl0eQppbXByb3ZlbWVudHMgYW5kIHdpc2ggdG8gd2Fp
dCBhIGZldyByZWxlYXNlcyBmb3IgbmV3IGZ1bmN0aW9uYWxpdHkuIgoKU2VlOiBodHRwczovL2dp
dGh1Yi5jb20vY29udGFpbmVyZC9jb250YWluZXJkL3JlbGVhc2VzL3RhZy92MS43LjAKClNpbmNl
IERvY2tlciBpcyBzdXBwb3NlZCB0byBiZSBhZ25vc3RpYyB0byBkaWZmZXJlbnQgY29udGFpbmVy
ZAp2ZXJzaW9ucyBpdCBtYWRlIHNlbnNlIHRvIHVzZSB0aGUgTFRTLgoKSG93ZXZlciwgSSBhbSBu
b3QgYWdhaW5zdCB1cGRhdGluZyBpdCB0byAxLjcueCBhcyBJJ20gY3VycmVudGx5IHVzaW5nCiYg
dGVzdGluZyB0aGF0IGJyYW5jaCBhbnl3YXkuCgpCZXN0LApDaHJpc3RpYW4gU3Rld2FydApfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFp
bGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
