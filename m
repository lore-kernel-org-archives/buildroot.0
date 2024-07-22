Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8921BC3DA59
	for <buildroot@archiver.kernel.org>; Mon, 22 Jul 2024 20:47:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 51162810DE;
	Mon, 22 Jul 2024 20:47:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ItjZAjCH4aXA; Mon, 22 Jul 2024 20:47:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 50517810DF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 50517810DF;
	Mon, 22 Jul 2024 20:47:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B31BB1BF296
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 20:47:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9DAC580EEB
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 20:47:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8LORlpeSxfWh for <buildroot@lists.busybox.net>;
 Mon, 22 Jul 2024 20:47:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12e; helo=mail-lf1-x12e.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7C41880EDD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7C41880EDD
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7C41880EDD
 for <buildroot@buildroot.org>; Mon, 22 Jul 2024 20:47:19 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-52f0277daa5so2645792e87.0
 for <buildroot@buildroot.org>; Mon, 22 Jul 2024 13:47:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721681237; x=1722286037;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LoETKdPfWQ0ZJm2XTWfVFcPmhuEi7e1NrCVGcF1ivV0=;
 b=bOBonglZ3xwVx5BYI63y9vTBKvL8EoNZBvT+vYTKQF2WzHqv+tciZkE+fGyEBVG3nS
 +fD/ob60v0UZ1YVAV1J3y/BindTOQPbp9lki6EbC7ALFcLAO1EHBIHx0UhEFk32SAIwO
 W7qySK7stdnaAYHAZwDdfNKW4EnS5bcEXcVfAfDLaRchhWpehfhfAplbDx4sFsGxFkPm
 maWHWkdpjRsU5t1Ch7UZv3/ugG03cWYrx1X5pS+H90JdfBEgsobBy9VsCaYsKjL0Bdli
 MnwSZJlRZj2cHF3BngJuaDfy5Nnn7WgxLN+C4N+cy3nGRPLsWHIEPrKc1qqQngSnusIG
 M7Mw==
X-Gm-Message-State: AOJu0YyiE+L4dpgYA/7ExKwm21wPYOKdCcJrbVrGvT2lb4RC6PoJAqqi
 w3ZoyBEb60WXRt9MR6LtrSKd7NNeBDPKwp2ufCaLulaO2/u1pMu/agTGQsLBJYvpyK+tI1RaSOt
 XgQApFzAa4I04Wwn5lAXR4gtUcTnsHeSW
X-Google-Smtp-Source: AGHT+IGB23gkZmq8LMzqVxecaDw03ZBEdywIfey2uDJq/f6aub5gFMhqOaZOAm+I5fczshiN2JBAGB7Cjx8PwVPm8xI=
X-Received: by 2002:a05:6512:2820:b0:52e:7f18:176b with SMTP id
 2adb3069b0e04-52efb533676mr5730768e87.11.1721681236349; Mon, 22 Jul 2024
 13:47:16 -0700 (PDT)
MIME-Version: 1.0
References: <20240509204218.77779-1-fontaine.fabrice@gmail.com>
 <20240509231050.5365ecf0@windsurf> <20240722222156.4959aec7@windsurf>
In-Reply-To: <20240722222156.4959aec7@windsurf>
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 22 Jul 2024 22:47:04 +0200
Message-ID: <CAPi7W82C-dMF+d_gJY=WYOAKYPQE_5py6cf4aknoHwpQPXCcNA@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721681237; x=1722286037; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LoETKdPfWQ0ZJm2XTWfVFcPmhuEi7e1NrCVGcF1ivV0=;
 b=UmVs2un1tyNlXkGjNtht3no8y2/n5cPSxeAtjJnQC9J+TB06paWwR9gbixfXW2wqQo
 vyHLjDSdigwkxgs8VzXPh7MnRJ/HeMttQpbqYYl35k2iedI7aWdIoIGqE30toJTE9pgd
 p8g8VnvqhnYq3Gf1c+R5FPMuufaY8lB3uLXdis74VjURheA+qon0RM+x6/ek3sLYd46l
 6gGe6UlXUcUytKvbIQ3HxTrAOb1ZmqmRx6nXrX9EHb6oDM9eAy8FzoKUCt5NEWaCeqD0
 hFsI2FwWR/34MhqXcKuD7SPqI5pBoOsKhCx5ZiPCxyImrbD3/oSaFqxAox16awx0GCtQ
 yG+Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=UmVs2un1
Subject: Re: [Buildroot] [PATCH 1/1] package/libp11: fix enginesdir
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
Cc: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gVGhvbWFzLAoKTGUgbHVuLiAyMiBqdWlsLiAyMDI0IMOgIDIyOjIxLCBUaG9tYXMgUGV0
YXp6b25pCjx0aG9tYXMucGV0YXp6b25pQGJvb3RsaW4uY29tPiBhIMOpY3JpdCA6Cj4KPiBIZWxs
byBGYWJyaWNlLAo+Cj4gT24gVGh1LCA5IE1heSAyMDI0IDIzOjEwOjUwICswMjAwCj4gVGhvbWFz
IFBldGF6em9uaSB2aWEgYnVpbGRyb290IDxidWlsZHJvb3RAYnVpbGRyb290Lm9yZz4gd3JvdGU6
Cj4KPiA+ID4gLSMgcGtnLWNvbmZpZyByZXR1cm5zIGEgbGliY3J5cHRvIGVuZ2luZXNkaXIgcHJl
Zml4ZWQgd2l0aCB0aGUgc3lzcm9vdCwKPiA+ID4gLSMgc28gbGV0J3MgcmlwIGl0IG91dC4KPiA+
Cj4gPiBXZWxsLCB0aGlzIHdvcmthcm91bmQgd2FzIGhlcmUgZm9yIGEgcmVhc29uLiBTaW5jZSB3
aGVuIGl0IGlzIG5vIGxvbmdlcgo+ID4gbmVlZGVkPwo+Cj4gUGluZyBvbiB0aGUgYWJvdmUgcXVl
c3Rpb24gOi0pCgpJdCBzZWVtcyB0aGF0IHlvdSBhZGRlZCB0aGlzIHdvcmthcm91bmQgYmFjayBp
biAyMDE5IFsxXS4KSG93ZXZlciwgdG8gbXkgdW5kZXJzdGFuZGluZyBwa2ctY29uZmlnIG9ubHkg
cHJlZml4ZXMgc3lzcm9vdCB0byBhCnN1YnNldCBvZiB2YXJpYWJsZXMgc2luY2UgYXQgbGVhc3Qg
MjAxOCBbMl0gYW5kIGVuZ2luZXNkaXIgaXMgbm90IG9uZQpvZiB0aGVtLgpGaW5hbGx5LCBzaW5j
ZSBpdHMgYWRkaXRpb24gaW4gb3BlbnNzbCBpbiAyMDE2IFszXSwgZW5naW5lc2RpciBoYXMKYWx3
YXlzIGJlZW4gc2V0IHRvICR7bGliZGlyfS9lbmdpbmVzLS4uLgpTbywgSSBkb24ndCBrbm93IHdo
YXQgdHJpZ2dlcnMgdGhlIGJ1aWxkIGZhaWx1cmUgdGhhdCB5b3UgZml4ZWQgYXQgdGhhdCB0aW1l
LgoKPgo+IFRoYW5rcyEKPgo+IFRob21hcwo+IC0tCj4gVGhvbWFzIFBldGF6em9uaSwgY28tb3du
ZXIgYW5kIENFTywgQm9vdGxpbgo+IEVtYmVkZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5naW5lZXJp
bmcgYW5kIHRyYWluaW5nCj4gaHR0cHM6Ly9ib290bGluLmNvbQoKQmVzdCBSZWdhcmRzLAoKRmFi
cmljZQoKWzFdIGh0dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvcHJvamVjdC9idWlsZHJvb3Qv
cGF0Y2gvMjAxODEyMDcxODEzMTQuMjQwNTEtMS10cGllcGhvQGltcGluai5jb20vClsyXSBodHRw
czovL2dpdC5idWlsZHJvb3QubmV0L2J1aWxkcm9vdC9jb21taXQvcGFja2FnZS9wa2djb25mLzAw
MDEtT25seS1wcmVmaXgtd2l0aC10aGUtc3lzcm9vdC1hLXN1YnNldC1vZi12YXJpYWJsZXMucGF0
Y2g/aWQ9NzEyNWZjNWMxYThhOTZmZjhlZWUwNTc3ODkzNTg3MDJlMWI1NTgzNQpbM10gaHR0cHM6
Ly9naXRodWIuY29tL29wZW5zc2wvb3BlbnNzbC9jb21taXQvY2RiYmY5OTAwMjUzZTgwMDY4Njhl
YmE5NDgyNDhiMTA5MmEwNTdkZQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3Jn
Cmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
