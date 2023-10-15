Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C838FCDB47E
	for <buildroot@archiver.kernel.org>; Sun, 15 Oct 2023 22:09:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 39EE14159C;
	Sun, 15 Oct 2023 22:09:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 39EE14159C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3wCKFkBDBxRN; Sun, 15 Oct 2023 22:09:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 767AF4158F;
	Sun, 15 Oct 2023 22:09:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 767AF4158F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B75E51BF350
 for <buildroot@lists.busybox.net>; Sun, 15 Oct 2023 22:09:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 855518186B
 for <buildroot@lists.busybox.net>; Sun, 15 Oct 2023 22:09:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 855518186B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nZtK6OoNs_pU for <buildroot@lists.busybox.net>;
 Sun, 15 Oct 2023 22:09:27 +0000 (UTC)
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F102F817D3
 for <buildroot@buildroot.org>; Sun, 15 Oct 2023 22:09:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F102F817D3
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-50435a9f800so4840497e87.2
 for <buildroot@buildroot.org>; Sun, 15 Oct 2023 15:09:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697407764; x=1698012564;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QzbWYw4yumf8A3x6Q0AFqwAAsrpfniqphTpUpur5qQE=;
 b=NRuPkWvtCS3T7cdpvpRh7OPQOyvYIAw5PpuktyE8Hoydwcfo7e9nbq3OvSmI/2tHuZ
 +fhXapz4fUXDYZRPqnai1v3f7jO8JEc5dPGy9ltw4runatGHaGPpssFd/pHZ9zYMekBi
 yYpPEVGz/lOfrkfAJ7S9GBDM8H8oYfbZ+EkF4PfwIac+Cn44WBxpWwrNZgMBh4yg0SQ7
 +4oQTkMFytv55GKU7hrDOTpD9ogXWKph0OT5veizLckdUUW/F5z06XjaC+lApE+TI7ih
 AnYDx5Fc0rMrpTS7P+jbe/sVY30O7u4WfoWa/yRylgswWsbiFuXxRAgwPXKjR+kn3JRr
 NvMQ==
X-Gm-Message-State: AOJu0Yz2TFYyqXmXV6sWEnpGRTFoj5KStfbAuFtCrpvebpgMHLhOkMSj
 VPbtAxSuSxlM+LQITZJy28A3o5AupdWhI2Hcvf/q7XHeMSs=
X-Google-Smtp-Source: AGHT+IHJjnPUAB/OAjL9eYY4i7litQ5BSA7y1ZtTFYoJ3fCayMTNoRmJPMFrgMHm8lDZadRZ+0LDaBpuTcCuKQMdQdY=
X-Received: by 2002:ac2:5484:0:b0:507:99fe:28f3 with SMTP id
 t4-20020ac25484000000b0050799fe28f3mr5079627lfk.34.1697407764166; Sun, 15 Oct
 2023 15:09:24 -0700 (PDT)
MIME-Version: 1.0
References: <20231015210548.36882-1-bernd@kuhls.net>
In-Reply-To: <20231015210548.36882-1-bernd@kuhls.net>
Date: Mon, 16 Oct 2023 00:09:13 +0200
Message-ID: <CAGm1_kunB=418J-a+bLG4Fkh8e0dH44wY0h6y9Y42jMkutfhug@mail.gmail.com>
To: Bernd Kuhls <bernd@kuhls.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20230601; t=1697407764; x=1698012564; darn=buildroot.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QzbWYw4yumf8A3x6Q0AFqwAAsrpfniqphTpUpur5qQE=;
 b=HfRtXpyFUehW3fZB6/+Y8fdUwq8uWe8F8MBw9k1FfH0i/JosFHU6ywXp+4xMfpVFsF
 ReFAssMXrLKi2rP70QK4qWC7+E8wq9D//aH8Vt3pmlDGVGgeW2FJ/cZqxSB1sJ1TuiVd
 QuVYp7T8XsjWRijbYzc1i4KqP0UiNAzjm/AN05TWKxNiMDjmKm5sIZ2hY6TlzwrbWugG
 hOK4FQy7JC+SAAXorXbPXW1K339Qsr/OSY8hLY6PkE7XJMVS7pHQIawcTdwYhUPKzsUF
 JYahTQIyv4U/TX6g3t/dIAKeEpVnWV6P8LHA9UC3DZakhQJYaBmneExmgu7lGAsETFa1
 455w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20230601 header.b=HfRtXpyF
Subject: Re: [Buildroot] [PATCH 1/1] package/ethtool: switch to git snapshot
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
From: Yegor Yefremov via buildroot <buildroot@buildroot.org>
Reply-To: Yegor Yefremov <yegorslists@googlemail.com>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gU3VuLCBPY3QgMTUsIDIwMjMgYXQgMTE6MDbigK9QTSBCZXJuZCBLdWhscyA8YmVybmRAa3Vo
bHMubmV0PiB3cm90ZToKPgo+IFVwc3RyZWFtIHRhcmJhbGwgZG9lcyBub3QgaW5jbHVkZSBzZXZl
cmFsIGhlYWRlciBmaWxlcyBsZWFkaW5nIHRvIGJ1aWxkCj4gZXJyb3JzIHdpdGggb2xkZXIga2Vy
bmVscy4gRm9yIGRldGFpbHMgc2VlOgo+IGh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcHJv
amVjdC9uZXRkZXZicGYvcGF0Y2gvMjAyMzEwMDUxNjMwNTMuMTgwMDIxOC0xLWZsb3JpYW4uZmFp
bmVsbGlAYnJvYWRjb20uY29tLwo+Cj4gU3dpdGNoIF9TSVRFIHRvIGdpdCBzbmFwc2hvdCBhbmQg
YWRkIF9BVVRPUkVDT05GID0gWUVTIHdoaWNoIG5lZWRzCj4gaG9zdC1wa2djb25mIHRvIGZpeCBz
dWJzZXF1ZW50IGNvbmZpZ3VyZSBlcnJvcjoKPgo+IC4vY29uZmlndXJlOiBsaW5lIDQ3MjM6IFBL
R19QUk9HX1BLR19DT05GSUc6IGNvbW1hbmQgbm90IGZvdW5kCj4KPiAuL2NvbmZpZ3VyZTogbGlu
ZSA1MDU1OiBzeW50YXggZXJyb3IgbmVhciB1bmV4cGVjdGVkIHRva2VuIGBNTkwsJwo+IC4vY29u
ZmlndXJlOiBsaW5lIDUwNTU6IGAgICAgUEtHX0NIRUNLX01PRFVMRVMoTU5MLCBsaWJtbmwpJwo+
Cj4gRml4ZXM6Cj4gaHR0cDovL2F1dG9idWlsZC5idWlsZHJvb3QubmV0L3Jlc3VsdHMvNjllLzY5
ZTAxYjdmMzcwOTIwNjMwZDEzMmZjNDNhNDAxMDRmYTViMzk1OWYvCj4KPiBTaWduZWQtb2ZmLWJ5
OiBCZXJuZCBLdWhscyA8YmVybmRAa3VobHMubmV0PgoKUmV2aWV3ZWQtYnk6IFllZ29yIFllZnJl
bW92IDx5ZWdvcnNsaXN0c0Bnb29nbGVtYWlsLmNvbT4KCj4gLS0tCj4gIHBhY2thZ2UvZXRodG9v
bC9ldGh0b29sLmhhc2ggfCAzICstLQo+ICBwYWNrYWdlL2V0aHRvb2wvZXRodG9vbC5tayAgIHwg
NyArKysrKy0tCj4gIDIgZmlsZXMgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9u
cygtKQo+Cj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvZXRodG9vbC9ldGh0b29sLmhhc2ggYi9wYWNr
YWdlL2V0aHRvb2wvZXRodG9vbC5oYXNoCj4gaW5kZXggOGQyYmY1ODQyMC4uODEyZTRkZDhkMSAx
MDA2NDQKPiAtLS0gYS9wYWNrYWdlL2V0aHRvb2wvZXRodG9vbC5oYXNoCj4gKysrIGIvcGFja2Fn
ZS9ldGh0b29sL2V0aHRvb2wuaGFzaAo+IEBAIC0xLDUgKzEsNCBAQAo+IC0jIEZyb20gaHR0cHM6
Ly93d3cua2VybmVsLm9yZy9wdWIvc29mdHdhcmUvbmV0d29yay9ldGh0b29sL3NoYTI1NnN1bXMu
YXNjCj4gLXNoYTI1NiAgODE0MTcxZWE0YjgwMjZiMDgxYzA3NDFkYmJmMzJlNjk2ODMxMTQ4M2Vj
ZjY0NzExMjMyZmFlYzJhYzcwYTE0YyAgZXRodG9vbC02LjUudGFyLnh6Cj4gICMgTG9jYWxseSBj
YWxjdWxhdGVkCj4gK3NoYTI1NiAgYjFmNWZhNjZmNzFjM2JhYjlkYWVhY2JkNzdlMDEwYjUyYzQ3
ZGYwYTcxMWIyMTY4NDdmNzg0MDVmMzI5OTE4OSAgZXRodG9vbC02LjUudGFyLmd6Cj4gIHNoYTI1
NiAgODE3N2Y5NzUxMzIxMzUyNmRmMmNmNjE4NGQ4ZmY5ODZjNjc1YWZiNTE0ZDRlNjhhNDA0MDEw
NTIxYjg4MDY0MyAgQ09QWUlORwo+ICBzaGEyNTYgIDVkNjMyOTM0Mzk2ZjkwYzgyZGZlYmUzYzk1
MTI2NDhiYmI2MzMzYjQwNjExM2QwY2QzMzFiMGUwYWEyZDM0YTEgIExJQ0VOU0UKPiBkaWZmIC0t
Z2l0IGEvcGFja2FnZS9ldGh0b29sL2V0aHRvb2wubWsgYi9wYWNrYWdlL2V0aHRvb2wvZXRodG9v
bC5tawo+IGluZGV4IDk0ZDE0YjEyM2IuLmVlNzEwZTAwMjEgMTAwNjQ0Cj4gLS0tIGEvcGFja2Fn
ZS9ldGh0b29sL2V0aHRvb2wubWsKPiArKysgYi9wYWNrYWdlL2V0aHRvb2wvZXRodG9vbC5tawo+
IEBAIC01LDggKzUsMTEgQEAKPiAgIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKPgo+ICBFVEhUT09M
X1ZFUlNJT04gPSA2LjUKPiAtRVRIVE9PTF9TT1VSQ0UgPSBldGh0b29sLSQoRVRIVE9PTF9WRVJT
SU9OKS50YXIueHoKPiAtRVRIVE9PTF9TSVRFID0gJChCUjJfS0VSTkVMX01JUlJPUikvc29mdHdh
cmUvbmV0d29yay9ldGh0b29sCj4gK0VUSFRPT0xfU0lURSA9IGh0dHBzOi8vZ2l0Lmtlcm5lbC5v
cmcvcHViL3NjbS9uZXR3b3JrL2V0aHRvb2wvZXRodG9vbC5naXQvc25hcHNob3QKPiArIyBuZWVk
ZWQgb25seSBmb3IgYXV0b3JlY29uZgo+ICtFVEhUT09MX0RFUEVOREVOQ0lFUyA9IGhvc3QtcGtn
Y29uZgo+ICsjIEdJVCB2ZXJzaW9uLCBzaGlwcGVkIHdpdGhvdXQgY29uZmlndXJlCj4gK0VUSFRP
T0xfQVVUT1JFQ09ORiA9IFlFUwo+ICBFVEhUT09MX0xJQ0VOU0UgPSBHUEwtMi4wCj4gIEVUSFRP
T0xfTElDRU5TRV9GSUxFUyA9IExJQ0VOU0UgQ09QWUlORwo+ICBFVEhUT09MX0NQRV9JRF9WRU5E
T1IgPSBrZXJuZWwKPiAtLQo+IDIuMzkuMgo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KPiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4gYnVpbGRyb290
QGJ1aWxkcm9vdC5vcmcKPiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0
aW5mby9idWlsZHJvb3QKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRw
czovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
