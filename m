Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C76F2C0015E
	for <buildroot@archiver.kernel.org>; Tue, 15 Aug 2023 23:09:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 63479611E1;
	Tue, 15 Aug 2023 23:09:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 63479611E1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id P6_iKa40rdXC; Tue, 15 Aug 2023 23:09:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9576F611DF;
	Tue, 15 Aug 2023 23:09:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9576F611DF
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D5F3B1BF3C2
 for <buildroot@lists.busybox.net>; Tue, 15 Aug 2023 23:09:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AF49C820F6
 for <buildroot@lists.busybox.net>; Tue, 15 Aug 2023 23:09:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AF49C820F6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LuG3o024mBZT for <buildroot@lists.busybox.net>;
 Tue, 15 Aug 2023 23:09:42 +0000 (UTC)
Received: from mail-qk1-x736.google.com (mail-qk1-x736.google.com
 [IPv6:2607:f8b0:4864:20::736])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 018B2820F4
 for <buildroot@buildroot.org>; Tue, 15 Aug 2023 23:09:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 018B2820F4
Received: by mail-qk1-x736.google.com with SMTP id
 af79cd13be357-76ca8921c6cso267922785a.1
 for <buildroot@buildroot.org>; Tue, 15 Aug 2023 16:09:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692140980; x=1692745780;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FawccpTWPxlzmZb3tsTPCrLHNQJSdwqo8/6Ior9Pq1I=;
 b=JZMtTn0XeqvFfs7njn0zFtilpAN5dUbge+0Xy/KGwr+84c51Zlpt2Jb8SpSU+iiq5N
 gpn75PK7ijk82aeNjfscBIlrLXDgY3odcwWRMOdLMdWGFBPVOSIsbvHZZ4i4mcI2l5q6
 Inpp1y25K7R1eDLEsrzhIlvNv12DzMRwsxuYsTAFx9JtA3Fbz/SwJwdZLvp1Dtc1DOHI
 EeJyC+AxUydqP/+fJe6r5Nv+dvhSoEkFjGd1TGEYg/vVtGV9PDPlQG58Nl7cwNPkGnFB
 QM9E2Hfe9VRD4ungIKQLle2B+wxHb3ZWB/QrQsZzWGEbV+Bn4QDXZCNfy8t0BIsiwDzj
 aWKQ==
X-Gm-Message-State: AOJu0Yx/giJycoKMQp2s/3xKgGk3q/mdfJI4eFNHMIpz+Q9+xugVcqd+
 /orRFd5lUSEbefWSkk3J51/c9KfZYFe+g+1XUUVx4+X7jdc=
X-Google-Smtp-Source: AGHT+IFctXP1ZAvxiTIXCfRLipG4wDhMoTb7BqivZB7DjWu/KxRm6ksSg6cpRgFVUuBxMZJDVzITUFNcx+rlJCfa5E0=
X-Received: by 2002:a05:620a:2982:b0:76c:e661:448b with SMTP id
 r2-20020a05620a298200b0076ce661448bmr4763328qkp.33.1692140980527; Tue, 15 Aug
 2023 16:09:40 -0700 (PDT)
MIME-Version: 1.0
References: <CAEg67GmsMwVm0Hh23EjdR_SmRpbz_51MBGgjjn2WGkv3jjncXg@mail.gmail.com>
In-Reply-To: <CAEg67GmsMwVm0Hh23EjdR_SmRpbz_51MBGgjjn2WGkv3jjncXg@mail.gmail.com>
From: Patrick Oppenlander <patrick.oppenlander@gmail.com>
Date: Wed, 16 Aug 2023 09:09:29 +1000
Message-ID: <CAEg67GkjKXqZcgM2xG=zZDDSFSE+zK217w0RKbsogSPp282ffA@mail.gmail.com>
To: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692140980; x=1692745780;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FawccpTWPxlzmZb3tsTPCrLHNQJSdwqo8/6Ior9Pq1I=;
 b=qSUGHpl1p28Y+Y/yQs4qyEDwUxMooNqoAR/xQ4DIQxnNhqxtcRGPxnTizEIrBCe+eD
 c14s2OHlwUO3fg1fhHzKEFNIi8b1sM/QzsrwETwINRJ6YRKQO//VtfuKB2zvq0p7iM0z
 KPkB2Ocng7gC3ZTjxAY6bfsrlt29uz8EalkRQGOY3QKSiPRvjbFfTNLwlNURi10bRLux
 DGi6oaUmK06QnoPEThG0QslN4PkoJhUKSpViBLkRtK1vBK576ThHfKgHzIrYy9Cz01Em
 KSOC5XLgi7NvSGl9p5y0KqWYDOdHanQTpGt7xWSeCjwA/rYphG2gck53Bv8mylp07rBx
 sxlw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=qSUGHpl1
Subject: Re: [Buildroot] [PATCH] ti-k3-r5-loader: support devicetree
 customisation
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
Cc: Andreas Dannenberg <dannenberg@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gV2VkLCBKdWwgNSwgMjAyMyBhdCA1OjE24oCvUE0gUGF0cmljayBPcHBlbmxhbmRlcgo8cGF0
cmljay5vcHBlbmxhbmRlckBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gVGhpcyBpcyBkdXBsaWNhdGVk
IGZyb20gdGhlIFUtQm9vdCBtYWtlZmlsZSAmIEtjb25maWcuCj4KPiBTaW1pbGFybHkgdG8gVS1C
b290IGN1c3RvbSBib2FyZHMgc29tZXRpbWVzIG5lZWQgdG8gYWRqdXN0IHRoZSBVLUJvb3QKPiBk
ZXZpY2V0cmVlLiBGb3IgZXhhbXBsZSwgdGhlIEFNNjR4IFNEUkFNIGNvbnRyb2xsZXIgc3VwcG9y
dHMgaW5saW5lIEVDQwo+IHdoaWNoIG5lZWRzIHRvIGJlIGVuYWJsZWQgaW4gdGhlIFI1IGxvYWRl
ciBkZXZpY2V0cmVlLgo+Cj4gUGxlYXNlIG5vdGUgdGhhdCBzb21lIHZlcnNpb25zIG9mIFUtQm9v
dCBoYXZlIGJyb2tlbiBleHRlcm5hbCBkZXZpY2V0cmVlCj4gc3VwcG9ydCBhbmQgbWF5IHJlcXVp
cmUgbWFudWFsIHBhdGNoaW5nIHRvIGJ1aWxkLiBTZWUgY29tbWl0Cj4gMzYwOWUxZGM1ZjRkNGMy
MzhkY2QyM2UwNDViYTYyMjMzMTBmZWZmYSBpbiB0aGUgVS1Cb290IHRyZWUuCj4KClBpbmcgYWRk
aW5nIEFuZHJlYXMgdG8gY2MuCgpIaSBBbmRyZWFzLCBjb3VsZCB5b3UgdGFrZSBhIGxvb2sgYXQg
dGhpcy4gRm9yIG91ciBwcm9qZWN0IHdlIG5lZWQgdG8KZW5hYmxlIGlubGluZSBFQ0Mgc3VwcG9y
dCwgd2hpY2ggcmVxdWlyZXMgY3VzdG9taXNhdGlvbiBvZiB0aGUgUjUKbG9hZGVyIGRldmljZXRy
ZWUuCgpUaGFua3MsCgpQYXRyaWNrCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5v
cmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290
Cg==
