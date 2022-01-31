Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4430C433F5
	for <buildroot@archiver.kernel.org>; Mon, 31 Jan 2022 16:41:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4E844410D7;
	Mon, 31 Jan 2022 16:41:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oZWQoJxsMHdW; Mon, 31 Jan 2022 16:41:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 93C8F409D3;
	Mon, 31 Jan 2022 16:41:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5CD391BF375
 for <buildroot@lists.busybox.net>; Mon, 31 Jan 2022 16:41:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 489E960B65
 for <buildroot@lists.busybox.net>; Mon, 31 Jan 2022 16:41:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id C5xC80n_pxjU for <buildroot@lists.busybox.net>;
 Mon, 31 Jan 2022 16:41:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com
 [IPv6:2607:f8b0:4864:20::235])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 78B8760EDD
 for <buildroot@buildroot.org>; Mon, 31 Jan 2022 16:41:10 +0000 (UTC)
Received: by mail-oi1-x235.google.com with SMTP id q8so13220614oiw.7
 for <buildroot@buildroot.org>; Mon, 31 Jan 2022 08:41:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=6nl90qg1xw9gKZwGHn7R2yb2e1TvSLCdupIqv9iB3EY=;
 b=Q+3Dbc5AYD69Y5kyf0T7qkTadBxIb7+4qTUlA/EgHvy9d6yELoJ965Sxr9kkYotjb4
 /M4UwmLknuWXtR0LzX8MhzUFDiAsRQlxfotFE28JJAMZvnedBlbPME5GeRh6eNPhIj0l
 vm/1EQ5W9Xn2THvZf+sTGN0ClsFxI1fB9Q/cZXtDuu6OwF8Al17n52yQCBp81mtgctPH
 Je57AA9I/De2+2AFHaj6D8D4LFiz48+rI3CGU4HPCs9z/uDHrZAKLTr9y89rQ7huoxM1
 4vtvH7cJ4DLqv2+TZIcYayH/uBslpDbdERNflVFPxyy88gkoW/V9D85YhbG0KFa5zeAV
 aoog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=6nl90qg1xw9gKZwGHn7R2yb2e1TvSLCdupIqv9iB3EY=;
 b=N+gSD41S3cH2vaoNfT/ORCNIAmYeaXGqBYDaT5V8isuSIjtYbsufqM+UqfnZPi5EqA
 3mYd+qwAqSh99pD3o/lj75gEVzljlvf6az7kOMcBWHW8BL+d4NRxley2ZPDmYGrvgKRd
 SDjgBd1n2drg1xj6V9OypKx1wMm8qFV1clCKzeueiZeUm8jdD5d8WmzEltAcuQGdl4nQ
 Hwi9Yp4byRtwt7L5hmgMTTNPTUJuHZCMvS/JCHiyYwRD6ptgx67x6jxpFraFyGo1lmEQ
 VHEifd9zeBliMaGxmtMLmWFu2Nb8cstWjanE+Wg7qkXEUd5WHna+iSmotF8hkvZZGPaH
 sFLg==
X-Gm-Message-State: AOAM531592ru6DWn/ot2UT3Jqt07SdHg5DJrwLb4/vxQv1q5mNfqDSov
 90Dxp4nD9vqmMBHOHBrqJHXqFoHONBT4iuO/Ovk=
X-Google-Smtp-Source: ABdhPJzYeDVx2IvEMYWfyNGDYsTLQK1aPDMXcbaK0BBH3Ukxej12h7J7FIyF8Vvwe5TclQQ+oi/+iKwMLr/l8EUrlMw=
X-Received: by 2002:a05:6808:7cc:: with SMTP id
 f12mr13571209oij.143.1643647269504; 
 Mon, 31 Jan 2022 08:41:09 -0800 (PST)
MIME-Version: 1.0
References: <20220129214235.5133-1-thomas.devoogdt@gmail.com>
 <20220130155235.2f51e08a@windsurf>
 <CACXRmJjh3BGWJ5frhAgE9pRKPVpLj1aZ4bQbj1prSrMVT2mguA@mail.gmail.com>
In-Reply-To: <CACXRmJjh3BGWJ5frhAgE9pRKPVpLj1aZ4bQbj1prSrMVT2mguA@mail.gmail.com>
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 31 Jan 2022 17:40:58 +0100
Message-ID: <CAPi7W83csbb0YW4A0f=bqRmVY=imQnNWZ9F5ein-AOawiCTAAw@mail.gmail.com>
To: Thomas Devoogdt <thomas.devoogdt@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/2] package/libglib2: bump version to 2.70.0
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
Cc: Adrian Perez de Castro <aperez@igalia.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGksCgpMZSBsdW4uIDMxIGphbnYuIDIwMjIgw6AgMTc6MTYsIFRob21hcyBEZXZvb2dkdAo8dGhv
bWFzLmRldm9vZ2R0QGdtYWlsLmNvbT4gYSDDqWNyaXQgOgo+Cj4gSGkgVGhvbWFzLCBBbGwsCj4K
Pgo+IEl0J3MgYSBiaXQgZGlmZmljdWx0IHRvIGZvbGxvdyBodHRwOi8vYXV0b2J1aWxkLmJ1aWxk
cm9vdC5uZXQvLCBidXQKPiBJIHNhdyBvbmUgdGhpbmcgd2hlbiBkb2luZyBhIHF1aWNrIHNjYW46
Cj4KPiBibHVlejVfdXRpbHM6IGh0dHA6Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm5ldC9yZXN1bHRz
LzVjNy81Yzc1YWQ3MjRkZjNmZjcyNjU1OWFjZWUwZGEzMWY3NzdlZjZiYzY4L2J1aWxkLWVuZC5s
b2cKPiAtLT4gZ19tZW1kdXAsIGRlcHJlY2F0ZWQgc2luY2UgMi42ODogaHR0cHM6Ly9kb2NzLmd0
ay5vcmcvZ2xpYi9mdW5jLm1lbWR1cC5odG1sCgpZb3UgY2FuIGFsc28gYWRkIHRoaXMgb25lOgot
IGxpYmJsb2NrZGV2OiBodHRwOi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5uZXQvcmVzdWx0cy8yZmQv
MmZkMWI0MDAxYjY0MDA0YmU0OWRkOTEzMjk5NDVhYjEwOGUxYTkwYy9idWlsZC1lbmQubG9nCgpl
eGVjLmM6IEluIGZ1bmN0aW9uICdiZF91dGlsc19leGVjX2FuZF9yZXBvcnRfc3RhdHVzX2Vycm9y
JzoKZXhlYy5jOjIzOTo1OiBlcnJvcjogJ2dfc3Bhd25fY2hlY2tfZXhpdF9zdGF0dXMnIGlzIGRl
cHJlY2F0ZWQ6IFVzZQonZ19zcGF3bl9jaGVja193YWl0X3N0YXR1cycgaW5zdGVhZCBbLVdlcnJv
cj1kZXByZWNhdGVkLWRlY2xhcmF0aW9uc10KICAyMzkgfCAgICAgaWYgKCFnX3NwYXduX2NoZWNr
X2V4aXRfc3RhdHVzIChleGl0X3N0YXR1cywgZXJyb3IpKSB7CiAgICAgIHwgICAgIF5+Cj4KPiBL
ciwKPiBUaG9tYXMKPgpCZXN0IFJlZ2FyZHMsCgpGYWJyaWNlCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRy
b290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlz
dGluZm8vYnVpbGRyb290Cg==
