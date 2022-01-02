Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30667C433EF
	for <buildroot@archiver.kernel.org>; Sun,  2 Jan 2022 20:37:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9B71381379;
	Sun,  2 Jan 2022 20:37:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IvXvosPp0hZ8; Sun,  2 Jan 2022 20:37:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E2D2C81363;
	Sun,  2 Jan 2022 20:37:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 407DA1BF3E8
 for <buildroot@lists.busybox.net>; Sun,  2 Jan 2022 20:37:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 235F081363
 for <buildroot@lists.busybox.net>; Sun,  2 Jan 2022 20:37:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8fx9VzOSCbFh for <buildroot@lists.busybox.net>;
 Sun,  2 Jan 2022 20:37:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C84E281359
 for <buildroot@buildroot.org>; Sun,  2 Jan 2022 20:37:35 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id o6so128903458edc.4
 for <buildroot@buildroot.org>; Sun, 02 Jan 2022 12:37:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=8OhJ/La0q7vhpYM9Qcu2ipGD0qDVTySHD5EHpEDqqfE=;
 b=Q5chAs8M6ryN1mZPnxae5G0uoUv6m1xf5C31gQzLWLrBC1DFAemZUnScJSrwnJejyW
 Lga8oQLywwiKRNORTA78kPDlylk/YLf2rJDtEGs0F13pBzM7ZrLGs+5U++Vu60p6OrhM
 H43ViDgoJECvRsB/4sXridNaruhiDUCC56Yzz0AgI2fW81Y44ABgPMLmksTE4QtBpuWb
 MwH0RdXGAuMZ561hy5ba7gJL2ALCILpZ4St4W3CybiKlPIAtgfl5X4L63G9ZJLdSVX28
 2YEQ7iGgOm/+5h2SY2hyQHcdG/GdfrMIvcl630g/LtLnrPPsOQkJi22+Jpg9YnldZcvb
 5Udg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=8OhJ/La0q7vhpYM9Qcu2ipGD0qDVTySHD5EHpEDqqfE=;
 b=yJTZ7Do/f8wNGMEw+0JDLL57fJWNtbU9LQbtUC7F2GI6uvnttn2z5qlgmPAOIwWNUz
 EbcqW+NgqpikHOCdcSLuzRqQshc8KwCTxunsfSd1/PjuXknYVis8ndSeqgXa8uEj0dda
 4TdVlErVdsyhsbKlPN8fkq7uYRGqrl7ZThqkwHU+R8zAG6EdXyDYmCiQJ0Co86Xmiwvg
 lfjDxNPsZLcKDHf1wm0IWwqi/HuZvzICji0ooYceN4Wrf1JmBibQ3GpcZBZr1tooy5nE
 PaQaIi2MB+ZJFeGqaVkkiXFteleLiOfZDhgIwHPtrU6P+doE/zKPzIKAMLjpT1wGkUbY
 BVmw==
X-Gm-Message-State: AOAM533miI9/r9MJ4QLKPhf6LtuVAuouFg/PmO7tKP/g+vUf2M+daBwJ
 Eb6oikzEzTtceZ8NyBGkQeGaaZPyssus5m9aIIQ=
X-Google-Smtp-Source: ABdhPJyR7U2vhm8K62VMWMeEbbOqRSBF/Ac5XKq6D0oZgxv6rwKfIroiefQihGNav8s9YMlt1ryMUpbcL+zfHKPBmDw=
X-Received: by 2002:a05:6402:2682:: with SMTP id
 w2mr41571243edd.393.1641155853861; 
 Sun, 02 Jan 2022 12:37:33 -0800 (PST)
MIME-Version: 1.0
References: <20211228153345.4087026-1-fontaine.fabrice@gmail.com>
 <20211228164916.2beec0d6@windsurf>
 <CAPi7W80OfGF3AhM2h6mjtsUjLEnYEV4gteJ12GFq4edNysEV5A@mail.gmail.com>
 <20211228181447.2a42dc86@windsurf>
 <ed10db1b-6b39-344d-8c4b-aa0a6d085d40@gmail.com>
In-Reply-To: <ed10db1b-6b39-344d-8c4b-aa0a6d085d40@gmail.com>
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 2 Jan 2022 21:36:34 +0100
Message-ID: <CAPi7W8094+7P-RRPafDfRgSCe94aqQUfoQ7z=WvGRFsj_wdpww@mail.gmail.com>
To: Joachim Wiberg <troglobit@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/2] package/mbedtls3: new package
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
Cc: Samuel Martin <s.martin49@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGksCgpMZSB2ZW4uIDMxIGTDqWMuIDIwMjEgw6AgMDk6MjYsIEpvYWNoaW0gV2liZXJnIDx0cm9n
bG9iaXRAZ21haWwuY29tPiBhIMOpY3JpdCA6Cj4KPiBIaSBldmVyeW9uZSEKPgo+IE9uIDEyLzI4
LzIxIDY6MTQgUE0sIFRob21hcyBQZXRhenpvbmkgd3JvdGU6Cj4gPiBPbiBUdWUsIDI4IERlYyAy
MDIxIDE4OjA3OjAzICswMTAwIEZhYnJpY2UgRm9udGFpbmUgPGZvbnRhaW5lLmZhYnJpY2VAZ21h
aWwuY29tPiB3cm90ZToKPiA+Pj4gQW4gaW1wb3J0YW50IChhbmQgdW5mb3J0dW5hdGUgcG9pbnQp
IGlzIHRoYXQgYXBwYXJlbnRseSBtYmVkdGxzMyBjYW5ub3QKPiA+Pj4gYmUgaW5zdGFsbGVkIHNp
ZGUtYnktc2lkZSB3aXRoIG1iZWR0bHMuIEF0IGxlYXN0IHRoYXQncyB3aGF0IHlvdXIKPiA+Pj4g
ImRlcGVuZHMgb24gIUJSMl9QQUNLQUdFX01CRURUTFMiIHNlZW1zIHRvIGhpbnQuCj4gPj4gSW5k
ZWVkLCBib3RoIHZlcnNpb25zIGluc3RhbGwgdGhlaXIgaGVhZGVycyBpbiBpbmNsdWRlL21iZWR0
bHMuCj4gPj4+IFRoaXMgaXMgYSBtYWpvciBhbm5veWFuY2UsIGFuZCBJJ20gbm90IHN1cmUgaG93
IExpbnV4IGRpc3RyaWJ1dGlvbnMKPiA+Pj4gd2lsbCBoYW5kbGUgdGhpcyBtaWdyYXRpb24gaWYg
dGhleSBjYW5ub3QgaGF2ZSBtYmVkdGxzIDIueCBhbmQgbWJlZHRscwo+ID4+PiAzLnggaW5zdGFs
bGVkIHNpZGUgYnkgc2lkZS4KPiA+PiAzLjAgd2FzIHJlbGVhc2VkIGluIEp1bHkuCj4gPj4gVG8g
bXkga25vd2xlZGdlLCBoaWF3YXRoYSBpcyBvbmUgb2YgdGhlIGZpcnN0IHBhY2thZ2UgdGhhdCB1
c2VzIHRoaXMKPiA+PiBuZXcgQVBJIGFuZCBidWlsZHJvb3Qgd2lsbCBwcm9iYWJseSBiZSBvbmUg
b2YgdGhlIGZpcnN0IGJ1aWxkIHN5c3RlbQo+ID4+IHRoYXQgd2lsbCBwcm92aWRlIG1iZWR0czMu
Cj4gPj4gSU1ITywgYmVpbmcgdW5hYmxlIHRvIGluc3RhbGwgYm90aCB2ZXJzaW9ucyBzaWRlIGJ5
IHNpZGUgaXMgcHJldHR5Cj4gPj4gY29tbW9uOiB3ZSBoYWQgdGhlIHNhbWUgaXNzdWUgd2l0aCBs
aWJ1cG5wIDEuNi54IGFuZCBsaWJ1cG5wIDEuOC54Lgo+ID4+IENvbmNlcm5pbmcgbGlidXBucCwg
d2UgZXZlbiBoYWQgdG8gcmV2ZXJ0IHRoZSBwb3NzaWJpbGl0eSB0byBpbnN0YWxsCj4gPj4gYm90
aCB2ZXJzaW9ucyBzaWRlIGJ5IHNpZGUgYmVjYXVzZSBpdCB3YXMgYSAiYnVyZGVuIHRvIHByb2dy
YW1zCj4gPj4gbGlua2luZyBhZ2FpbnN0IGxpYnVwbnAiOgo+ID4+IGh0dHBzOi8vZ2l0aHViLmNv
bS9wdXBucC9wdXBucC9jb21taXQvMDdmNTA0YzYxYmQ5ZTRkOTNlYjNkMzczZmZjODUyN2NhZmUw
YjlhZgo+ID4gSSdtIG5vdCBzdXJlIHRvIGZvbGxvdyB5b3UgaGVyZS4gVGhlIGZhY3QgdGhhdCBp
dCdzIHByZXR0eSBjb21tb24KPiA+IGRvZXNuJ3QgbWFrZSBpdCBhIGdvb2Qgc29sdXRpb24uIEl0
IG1ha2VzIHRoZSB0cmFuc2l0aW9uIHBlcmlvZAo+ID4gYWJzb2x1dGVseSBhd2Z1bC4KPiA+IFdp
dGggdGhlIGN1cnJlbnRseSBwcm9wb3NlZCBhcHByb2FjaCwgc29tZW9uZSB3aG8gdG9kYXkgaGFz
IGEgd29ya2luZwo+ID4gY29uZmlndXJhdGlvbiB0aGF0IGhhcyBoaWF3YXRoYSBhbmQgYmVsbGUt
c2lwIGNhbiBjb252ZW5pZW50bHkgYnVpbGQKPiA+IGJvdGggaW4gdGhlIHNhbWUgaW1hZ2UuIFdp
dGggeW91ciBwYXRjaCBhcHBsaWVkLCB0aGlzIGlzIG5vIGxvbmdlcgo+ID4gcG9zc2libGUsIGR1
ZSB0byBoaWF3YXRoYSBub3cgdXNpbmcgbWJlZHRsczMsIHdoaWNoIGNhbm5vdCBiZSBpbnN0YWxs
ZWQKPiA+IHNpZGUtYnktc2lkZSB3aXRoIG1iZWR0bHMuCj4gPiBUaGlzIGRvZXNuJ3Qgc2VlbSB2
ZXJ5IGFjY2VwdGFibGUgZm9yIHVzLCBhbmQgcHJvYmFibHkgaXMgZXZlbiBsZXNzCj4gPiBhY2Nl
cHRhYmxlIGZvciBtYWpvciBMaW51eCBkaXN0cmlidXRpb25zLgo+Cj4gSSBsb29rZWQgaW50byB0
aGlzLCBldmVyIHNvIGJyaWVmbHksIGFuZCB3aXRob3V0IGNoZWNraW5nIHdpdGggYW55IG9mCj4g
dGhlIHBhY2thZ2VzIHRoYXQgc2VsZWN0IEJSMl9QQUNLQUdFX01CRURUTFMuCj4KPiBIb3dldmVy
LCBzZWVpbmcgYXMgaXQgaXMgb25seSBIaWF3YXRoYSB0aGF0IHJlcXVpcmVzIGEgdmVyc2lvbiA+
PSAzLjAsCj4gZm9yIGEgdHJhbnNpdGlvbiBwZXJpb2QsIHdlIGNvdWxkIGNoYW5nZSBpdCB0byAt
RFVTRV9TWVNURU1fTUJFRFRMUz1PRkYKPiBhbmQgbGV0IEhpYXdhdGhhIHVzZSBpdHMgYnVuZGxl
ZCBtYmVkdGxzIGluc3RlYWQuCkluZGVlZCwgdGhpcyBpcyBhbHNvIGFuIGFsdGVybmF0aXZlLCBl
dmVuIGlmIEkgdGhpbmsgdGhhdCBhZGRpbmcKbWJlZHRsczMgd291bGQgYmUgYSBncmVhdCBhZGRp
dGlvbi4KRm9yIGV4YW1wbGUsIGxpYmN1cmwgc3VwcG9ydHMgbWJlZHRzIDMuMCBzaW5jZSBpdHMg
dmVyc2lvbiA3Ljc5IGFuZApodHRwczovL2dpdGh1Yi5jb20vY3VybC9jdXJsL2NvbW1pdC8zZjEy
NjEzOGJlM2M0NTlhMjc5NGQzNWY4MTcwZTkyZTY1YTUwZGFkLgoKT3RoZXJ3aXNlLCBhcyByZXF1
ZXN0ZWQgYnkgVGhvbWFzLCBJIHNlbnQgYW4gZW1haWwgdG8gbWJlZHRscyBtYWlsaW5nCmxpc3Q6
IGh0dHBzOi8vbGlzdHMudHJ1c3RlZGZpcm13YXJlLm9yZy9hcmNoaXZlcy9saXN0L21iZWQtdGxz
QGxpc3RzLnRydXN0ZWRmaXJtd2FyZS5vcmcvdGhyZWFkL0hFSENOUVpUQk9aVjU2UlRHUlRHU1FR
Uk1FV1lKUEdJLwpIZXJlIGlzIGFuIGV4dHJhY3Qgb2YgdGhlaXIgYW5zd2VyOiAieW91IG5lZWQg
dG8gaW5zdGFsbCB0aGUgaGVhZGVyCmZpbGVzIGFuZCB0aGUgbGlicmFyaWVzIHVuZGVyIGRpZmZl
cmVudCBwYXRocy4gQXQgbW9zdCBvbmUgY2FuIGJlIGluCnRoZSBkZWZhdWx0IGluY2x1ZGUgYW5k
IGxpYiBkaXJlY3Rvcmllcy4gU2luY2UgZWFjaCBwcm9ncmFtIGNhbiBvbmx5CnVzZSBvbmUgdmVy
c2lvbiwgeW91IG5lZWQgdG8gcGljayB0aGUgZGVzaXJlZCAtSS8tTCBwYXRocyBhdApjb21waWxl
L2xpbmsgdGltZXMuIgpTbyBiYXNpY2FsbHksIHdlIGNhbid0IHJlYWxseSBpbnN0YWxsIHRoZW0g
c2lkZSBieSBzaWRlIGluIHRoZSBjb250ZXh0Cm9mIGJ1aWxkcm9vdCBleGNlcHQgaWYgeW91IHdh
bnQgdG8gcGF0Y2ggZXZlcnkgc2luZ2xlIG1iZWR0bHMgcGFja2FnZQp3aXRoIGN1c3RvbSBDRkxB
R1MgYW5kIExERkxBR1MgLi4uCklmIG9uZSBvZiB5b3Ugd2FudHMgdG8gZGViYXRlIHdpdGggdGhl
bSwgZmVlbCBmcmVlIHRvIGRvIGl0Lgo+Cj4KPiBCZXN0IHJlZ2FyZHMKPiAgL0pvYWNoaW0KQmVz
dCBSZWdhcmRzLAoKRmFicmljZQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3Jn
Cmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
