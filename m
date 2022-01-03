Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56611C433EF
	for <buildroot@archiver.kernel.org>; Mon,  3 Jan 2022 22:43:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DA78260B4C;
	Mon,  3 Jan 2022 22:43:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TapGDXsxr15v; Mon,  3 Jan 2022 22:43:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 331E860B47;
	Mon,  3 Jan 2022 22:43:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 54DA51BF983
 for <buildroot@lists.busybox.net>; Mon,  3 Jan 2022 22:43:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 51B8B81D34
 for <buildroot@lists.busybox.net>; Mon,  3 Jan 2022 22:43:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2ZcpQhtwutje for <buildroot@lists.busybox.net>;
 Mon,  3 Jan 2022 22:43:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7339081D16
 for <buildroot@buildroot.org>; Mon,  3 Jan 2022 22:43:14 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id k18so35718102wrg.11
 for <buildroot@buildroot.org>; Mon, 03 Jan 2022 14:43:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=fvOrtXmpspeKokozwofgNATmYQUFQpH0alijYnSB768=;
 b=UeQwFi+/5dIi3tgtlcaRVOQrlDdFwpFSsHo5OOWNkrUTW2fegttr3zvQNtAWdI0/OO
 WpaBUHtKwM8dvkWHLaWxUATYXSyvXbTfkpjMPk4dsuESn2vg4JZ8jhxzcrufF0+G8oBp
 wpD0eOwherq70ppqQQPcpkDDIl2abN30nZ8sXKLbZfSnNC5p0RVxI/pCcCLxJQjOeAHw
 SWJAiqjXCu2d05VS89W/punpom1RYevtH04mIU3PsB0OnaMH0enbyVneUcpsZWx5ZCh9
 hnNAD7Xy1woud2l3quN0hXdHfFVNAI9srZ+wAMMzv+EBw3NF9T78uNNvdann9MpCaRYf
 p7NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=fvOrtXmpspeKokozwofgNATmYQUFQpH0alijYnSB768=;
 b=aSW8e5+PKClhKK7/XdeYCtCAUymmSGloVK9EOK+4shK6uBuU05qqerm/nKbyioWoTy
 sEScLv/N+6uogLnrbhUWXFjTGjPf5YqglqNCveK1qqkF8OSMCSWtyPvOLN/WCE8r854w
 4Oh1OmuqJLUyd5DDJd8RyQpY1jk2Z2Q+8AQZvUggx26rD4phtmsNolj9nSQkOgDTGQcz
 SHthpk7oCpHlTnDQul9oPpjpNNwIGwb1THKuK3XcISx0zAA1bWlZ/o9sIzlUxZja5DGu
 gREUvbnKauTnSM1vklu7NwfRdJKQGPcnxgMD853wSmhcGbtdlbyPG39yZQW9rNMuedwx
 vHOQ==
X-Gm-Message-State: AOAM5338zyX1YBTo4pkef33K6v6mxEx34Y8TPVQQ7ivT7Dn7G0KIm8Cw
 BT0o1LvLKTAwtlygrp8/osA=
X-Google-Smtp-Source: ABdhPJzF/iDo7aLOg+i/vm74WCXP6RWkOLYh5YytLcgcUDinDQOQxIJOgfvcBLgrN2UfRTCEFE8/bA==
X-Received: by 2002:adf:fdc3:: with SMTP id i3mr39227679wrs.125.1641249792638; 
 Mon, 03 Jan 2022 14:43:12 -0800 (PST)
Received: from ?IPV6:2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521?
 (2a01cb058f8a18003dbee9eed79eb521.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521])
 by smtp.gmail.com with ESMTPSA id m17sm39336088wmq.31.2022.01.03.14.43.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Jan 2022 14:43:12 -0800 (PST)
Message-ID: <1b60df77-a795-f328-6651-4e3b5c4b0757@gmail.com>
Date: Mon, 3 Jan 2022 23:43:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, buildroot@buildroot.org
References: <20220103165805.3697636-1-clg@kaod.org>
 <5da6fe27-bf22-7bd9-fcb5-c43551f1ed5c@gmail.com>
 <5aba2002-9e94-4683-b79d-5443f2852ffc@kaod.org>
 <d71851fe-f814-8e1f-104b-bdf5b802b083@gmail.com>
 <16687956-3831-261a-cdf1-2b02ce463602@kaod.org>
From: Romain Naour <romain.naour@gmail.com>
In-Reply-To: <16687956-3831-261a-cdf1-2b02ce463602@kaod.org>
Subject: Re: [Buildroot] [PATCH] package/qemu: bump to version 6.2.0
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

TGUgMDMvMDEvMjAyMiDDoCAyMzoyMCwgQ8OpZHJpYyBMZSBHb2F0ZXIgYSDDqWNyaXTCoDoKPiBI
ZWxsbywKPj4gVW5saWtlIGFsbCBvdGhlciBkZWZjb25maWcsIHFlbXUgZGVmY29uZmlncyBhcmUg
cnVudGltZSB0ZXN0ZWQgaW4gZ2l0bGFiLgo+Pgo+PiBDcmVhdGUgYSB0ZXN0IGJyYW5jaCBuYW1l
ZDogcWVtdS02LjIuMC1kZWZjb25maWdzLXFlbXUKPj4KPj4gV2hlcmU6ICJxZW11LTYuMi4wIiBp
cyBhIHByZWZpeCwgIi1kZWZjb25maWdzLSIgdHJpZ2dlciBhIHBpcGVsaW5lIGZvciB0ZXN0aW5n
Cj4+IEJ1aWxkcm9vdCBkZWZjb25maXMgYW5kICJxZW11IiBpcyBhIHBhdHRlcm4uCj4+Cj4+IFNl
ZToKPj4gaHR0cHM6Ly9naXRsYWIuY29tL2J1aWxkcm9vdC5vcmcvYnVpbGRyb290Ly0vY29tbWl0
LzY1ZDJmMDRjMDEyYWY0OTJhOWI5ZGEwNGRmYTNiM2NiZDIwMzQ3ZjEKPj4KPj4KPj4gInB1c2hp
bmcgYSBicmFuY2ggY2FsbGVkICI8Zm9vPi1kZWZjb25maWdzLTxwYXR0ZXJuPiIgd2hpY2ggd2ls
bCB0ZXN0IGFsbAo+PiBkZWZjb25maWdzIHdob3NlIG5hbWUgc3RhcnQgd2l0aCB0aGUgcGF0dGVy
bi4iCj4gCj4gVGhhdCBsb29rcyBzaW1wbGUgZW5vdWdoLiBTb21ldGhpbmcgaXMgZ29pbmcgd3Jv
bmcgdGhvdWdoIDoKPiAKPiDCoCBodHRwczovL2dpdGxhYi5jb20vbGVnb2F0ZXIvYnVpbGRyb290
Ly0vam9icy8xOTM3NzUyMzUzCj4gCj4gQW0gSSBtaXNzaW5nIHNvbWV0aGluZyA/CgpodW1tLCBt
YXliZSB0aGVyZSBpcyB3ZWFrbmVzcyBpbiB0aGUgc2NyaXB0IHdoZW4gZm9vIGlzICJxZW11LTYu
Mi4wIgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgXgpUcnkgYWdhaW4gd2l0aCBzb21ldGhpbmcgZWxzZSBsaWtlIHFlbXVfNi4yLjAt
ZGVmY29uZmlncy1xZW11CgpCZXN0IHJlZ2FyZHMsClJvbWFpbgoKCj4gCj4gVGhhbmtzLAo+IAo+
IEMuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWls
ZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMu
YnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
