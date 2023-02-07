Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D479C636CC
	for <buildroot@archiver.kernel.org>; Tue,  7 Feb 2023 21:47:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DD83B81EC9;
	Tue,  7 Feb 2023 21:47:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DD83B81EC9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zZNJgGc25leu; Tue,  7 Feb 2023 21:47:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 08DF181EC6;
	Tue,  7 Feb 2023 21:47:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 08DF181EC6
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 51E1F1BF377
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 21:47:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 333F040B24
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 21:47:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 333F040B24
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id G33RTnO2HmTB for <buildroot@lists.busybox.net>;
 Tue,  7 Feb 2023 21:47:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3BB4D4057A
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3BB4D4057A
 for <buildroot@buildroot.org>; Tue,  7 Feb 2023 21:47:15 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 m16-20020a05600c3b1000b003dc4050c94aso88589wms.4
 for <buildroot@buildroot.org>; Tue, 07 Feb 2023 13:47:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MU37uKHeHrpTq6Mm/7XjTpu3H1rqiHUcgwV5oHGJ8HU=;
 b=gGy7g+Hghvzi4Ixfyc4s5QidAbyX/GwfvmNQ2ZWkO1hVLrYZL693q7WVSFnKlByv6l
 X6OKJgx0g+rCXMH323eYb+JTf3CxJVZ8+jrvyOdynjsE+kx2q/pMYK8tPzr4AG3K75TO
 ONVpoaHFvawWO/XnRYVtX+CQBipKz1l1WC+iwS/Jiv9tLo7VbpRQjqVipx/gCUXjh5fW
 17cP8Jni4XH54iPs/sCNnGcdN3xQCxUgkyqdeN1Atbz2d+SseUnb3B8ZSX4NBjLr+/ql
 BWqSTbc5IolnXZDZ4P/3wQMwKZyVElVkf4U6uSfP9ub5L2kP2Lv69WXca+nhHc5B67+g
 h9YQ==
X-Gm-Message-State: AO0yUKX86gRKO0W/ROak8VP9re0KWLdQ6eEZj65+P57ZZghd0HX9Sopo
 7FuvZYT2l6ggdxfsNsUezC1wrg==
X-Google-Smtp-Source: AK7set9pvcP6l1GqKPSRR8k/LqW/YogfebIg871q56Ke4dC7kwa+PqKO3M2RN23jTx/12rE0nC4jAg==
X-Received: by 2002:a05:600c:4586:b0:3df:9858:c03a with SMTP id
 r6-20020a05600c458600b003df9858c03amr359654wmo.15.1675806433415; 
 Tue, 07 Feb 2023 13:47:13 -0800 (PST)
Received: from ?IPV6:2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31?
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 p4-20020a1c5444000000b003dc4b4dea31sm33049wmi.27.2023.02.07.13.47.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Feb 2023 13:47:12 -0800 (PST)
Message-ID: <5160d115-3650-23a2-bad5-2887ba763957@smile.fr>
Date: Tue, 7 Feb 2023 22:47:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-US
To: "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
References: <cover.1675805584.git.yann.morin.1998@free.fr>
 <3c87e90584519c73eeb1ae2dd5c52fe60d1572a2.1675805584.git.yann.morin.1998@free.fr>
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <3c87e90584519c73eeb1ae2dd5c52fe60d1572a2.1675805584.git.yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=MU37uKHeHrpTq6Mm/7XjTpu3H1rqiHUcgwV5oHGJ8HU=;
 b=TPxk3HUXYlNbLNA46xX2r174z8BRYVADnKaxv2yDvwCmeHa7ig9ihOn+y1yhx0D90L
 cOs3WBDSFLnOtQIoD8cwJqStdU5XtfdhcJ6pAKLtD9u0onwLEkMNWTZlVWmdPvti9F4y
 MPvn2n/um6UBZeGBzTjlP7tIFoPV/U69BouxOnK/dheIvhlWCREa88ZN3Feg8V4+MkJp
 B03RafnyiUORUrwi3PgA6SjI+/Sfg/LvwKlRJsHB8llKmdmSYLZBgNqzc4VopUPo0wzs
 Ko4BiDbH7IEfzkWR1fVsZhdCdUDoKPDfiwJNbjjVUGsA+UNH+8hyYucXWGIBfdtLEczu
 0TPQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20210112.gappssmtp.com
 header.i=@smile-fr.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=TPxk3HUX
Subject: Re: [Buildroot] [PATCH 1/2] gitlab-ci: don't use before_script in
 job templates
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gWWFubiwKCkxlIDA3LzAyLzIwMjMgw6AgMjI6MzMsIFlhbm4gRS4gTU9SSU4gYSDDqWNy
aXTCoDoKPiBXaGVuIGdpdGxhYiBwcmVwYXJlcyBhIGpvYiB0byBydW4sIGl0IGNoZWNrcyBvdXQg
dGhlIHJlcG9zaXRvcnkgd2l0aCBhCj4gbm9uLXJvb3QgdXNlciwgYW5kIHNwYXducyBhIGNvbnRh
aW5lciB0aGF0IHJ1bnMgYXMgcm9vdCwgd2l0aCBzb21lIFVJRAo+IG1hcHBpbmcgdGhhdCBtYWtl
cyB0aGUgZmlsZXMgYmUgb3duZWQgYnkgcm9vdCBpbiB0aGUgY29udGFpbmVyLiBIb3dldmVyLAo+
IG91ciBwaXBlbGluZXMgcnVuIGFzIGEgbm9udC1yb290IHVzZXIuCj4gCj4gQ29tbWl0IGJkZTE2
NWY3YWQgKC5naXRsYWItY2kueW1sOiB1cGRhdGUgRG9ja2VyIGltYWdlIHRvIHVzZSkgdXBkYXRl
ZAo+IHRoZSBkb2NrZXIgaW1hZ2UgdGhhdCBpcyB1c2VkIHRvIHJ1biBpbiBvdXIgcGlwZWxpbmVz
Lgo+IAo+IFRoYXQgbmV3IGltYWdlIGluY2x1ZGVzIGEgZ2l0IHZlcnNpb24gdGhhdCBpcyBzdHJp
Y3RlciBhYm91dCB0aGUKPiBvd25lcnNoaXAgb2YgdGhlIGdpdCB0cmVlIGl0IGlzIGFjdGluZyBp
bjogZ2l0IGFib3J0cyBpbiBlcnJvciB3aGVuIHRoZQo+IHVzZXIgcnVubmluZyBpdCBkb2VzIG5v
dCBvd24gdGhlIHJlcG9zaXRvcnkuCj4gCj4gV2UgdXNlIGBnaXQgbHMtdHJlZWAgcXVpdGUgYSBs
b3QgaW4gb3VyIGNoZWNrLXtmbGFrZTgscGFja2FnZSxzeW1ib2xzfQo+IHJ1bGVzLCBzbyB0aGV5
IGFsbCBmYWlsIChpbiB2YXJpb3VzIHdheXMpLgoKaXMgZmxha2U4IGhhcyBiZWVuIHVwZGF0ZWQg
dG9vPyBmbGFrZTggbWF5IHRyaWdnZXIgbmV3IGNoZWNrLXBhY2thZ2Ugd2FybmluZyBub3cuCj4g
Cj4gVG8gZml4IHRoaXMsIHdlIGVpdGhlciBuZWVkIHRvIGZpeCB0aGUgb3duZXJzaGlwIG9yIHRl
bGwgZ2l0IHRvIGlnbm9yZQo+IHRoZSBzaXR1YXRpb24uIEluIGVpdGhlciBjYXNlLCB3ZSdsbCBu
ZWVkIHRvIHJ1biBhIHNjcmlwdGxldCBiZWZvcmUgYWxsCj4gb3VyIGpvYnMuCj4gCj4gR2l0bGFi
LWNpIGFsbG93cyB0byBwcm92aWRlIGEgZ2xvYmFsIGJlZm9yZV9zY3JpcHQsIHRoYXQgaXMgaW5o
ZXJpdGVkIGJ5Cj4gYWxsIGpvYnMuIEhvd2V2ZXIsIHNvbWUgb2Ygb3VyIGpvYnMgYWxyZWFkeSBk
ZWNsYXJlIGEgYmVmb3JlX3NjcmlwdCwgYW5kCj4gdGhhdCB3b3VsZCBzaGFkb3cgdGhlIGdsb2Jh
bCBiZWZvcmVfU2NyaWtwdC4KCmJlZm9yZV9TY3Jpa3B0L2JlZm9yZV9zY3JpcHRzCgo+IAo+IFRo
ZXJlIGlzIG5vIHRlY2huaWNhbCByZWFzb24gdG8gZG8gb3VyIGJlZm9yZV9zY3JpcHQgc2VwYXJh
dGVseSBmcm9tCj4gdGhlIGFjdHVhbCBzY3JpcHQsIHNvIHdlIG1vdmUgdGhlIGNvZGUgZnJvbSB0
aGUgYmVmb3JlX3NjcmlwdHMgdG8gdGhlCj4gY29ycmVzcG9uZGluZyBzY3JpcHRzLgo+IAoKUmV2
aWV3ZWQtYnk6IFJvbWFpbiBOYW91ciA8cm9tYWluLm5hb3VyQHNtaWxlLmZyPgoKQmVzdCByZWdh
cmRzLApSb21haW4KCgo+IFNpZ25lZC1vZmYtYnk6IFlhbm4gRS4gTU9SSU4gPHlhbm4ubW9yaW4u
MTk5OEBmcmVlLmZyPgo+IENjOiBBcm5vdXQgVmFuZGVjYXBwZWxsZSAoRXNzZW5zaXVtL01pbmQp
IDxhcm5vdXRAbWluZC5iZT4KPiBDYzogUm9tYWluIE5hb3VyIDxyb21haW4ubmFvdXJAZ21haWwu
Y29tPgo+IENjOiBUaG9tYXMgUGV0YXp6b25pIDx0aG9tYXMucGV0YXp6b25pQGJvb3RsaW4uY29t
Pgo+IC0tLQo+ICBzdXBwb3J0L21pc2MvZ2l0bGFiLWNpLnltbC5pbiB8IDEyICsrKystLS0tLS0t
LQo+ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQo+IAo+
IGRpZmYgLS1naXQgYS9zdXBwb3J0L21pc2MvZ2l0bGFiLWNpLnltbC5pbiBiL3N1cHBvcnQvbWlz
Yy9naXRsYWItY2kueW1sLmluCj4gaW5kZXggMGNjZjM2NjY1ZS4uOWMxZmFmMGQ1ZiAxMDA2NDQK
PiAtLS0gYS9zdXBwb3J0L21pc2MvZ2l0bGFiLWNpLnltbC5pbgo+ICsrKyBiL3N1cHBvcnQvbWlz
Yy9naXRsYWItY2kueW1sLmluCj4gQEAgLTIzLDkgKzIzLDggQEAKPiAgICAgICAgICAtIHV0aWxz
L2NoZWNrLXN5bWJvbHMKPiAgCj4gIC5kZWZjb25maWdfY2hlY2s6Cj4gLSAgICBiZWZvcmVfc2Ny
aXB0Ogo+ICsgICAgc2NyaXB0Ogo+ICAgICAgICAgIC0gREVGQ09ORklHX05BTUU9JChlY2hvICR7
Q0lfSk9CX05BTUV9IHwgc2VkIC1lICdzLF9jaGVjayQsLGcnKQo+IC0gICAgc2NyaXB0Ogo+ICAg
ICAgICAgIC0gZWNobyAiQ29uZmlndXJlIEJ1aWxkcm9vdCBmb3IgJHtERUZDT05GSUdfTkFNRX0i
Cj4gICAgICAgICAgLSBtYWtlICR7REVGQ09ORklHX05BTUV9Cj4gICAgICAgICAgLSBzdXBwb3J0
L3NjcmlwdHMvY2hlY2stZG90Y29uZmlnLnB5IC5jb25maWcgY29uZmlncy8ke0RFRkNPTkZJR19O
QU1FfQo+IEBAIC00NCwxMCArNDMsOSBAQAo+ICAgICAgICB9Cj4gIAo+ICAuZGVmY29uZmlnX2Jh
c2U6Cj4gLSAgICBiZWZvcmVfc2NyaXB0Ogo+ICsgICAgc2NyaXB0Ogo+ICAgICAgICAgIC0gREVG
Q09ORklHX05BTUU9JHtDSV9KT0JfTkFNRX0KPiAgICAgICAgICAtIE9VVFBVVF9ESVI9b3V0cHV0
Cj4gLSAgICBzY3JpcHQ6Cj4gICAgICAgICAgLSBlY2hvICJDb25maWd1cmUgQnVpbGRyb290IGZv
ciAke0RFRkNPTkZJR19OQU1FfSIKPiAgICAgICAgICAtIG1ha2UgJHtERUZDT05GSUdfTkFNRX0K
PiAgICAgICAgICAtIC4vc3VwcG9ydC9zY3JpcHRzL2NoZWNrLWRvdGNvbmZpZy5weSAuY29uZmln
IC4vY29uZmlncy8ke0RFRkNPTkZJR19OQU1FfQo+IEBAIC03MiwxMyArNzAsMTIgQEAKPiAgICAg
ICAgICAgICAgLSBydW50aW1lLXRlc3QubG9nCj4gIAo+ICAucnVudGltZV90ZXN0X2Jhc2U6Cj4g
LSAgICBiZWZvcmVfc2NyaXB0Ogo+IC0gICAgICAgIC0gVEVTVF9DQVNFX05BTUU9JHtDSV9KT0Jf
TkFNRX0KPiAgICAgICMgS2VlcCBidWlsZCBkaXJlY3RvcmllcyBzbyB0aGUgcm9vdGZzIGNhbiBi
ZSBhbiBhcnRpZmFjdCBvZiB0aGUgam9iLiBUaGUKPiAgICAgICMgcnVubmVyIHdpbGwgY2xlYW4g
dXAgdGhvc2UgZmlsZXMgZm9yIHVzLgo+ICAgICAgIyBNdWx0aXBseSBldmVyeSBlbXVsYXRvciB0
aW1lb3V0IGJ5IDEwIHRvIGF2b2lkIHNwb3JhZGljIGZhaWx1cmVzIGluCj4gICAgICAjIGVsYXN0
aWMgcnVubmVycy4KPiAgICAgIHNjcmlwdDoKPiArICAgICAgICAtIFRFU1RfQ0FTRV9OQU1FPSR7
Q0lfSk9CX05BTUV9Cj4gICAgICAgICAgLSBlY2hvICJTdGFydGluZyBydW50aW1lIHRlc3QgJHtU
RVNUX0NBU0VfTkFNRX0iCj4gICAgICAgICAgLSAuL3N1cHBvcnQvdGVzdGluZy9ydW4tdGVzdHMg
LW8gdGVzdC1vdXRwdXQvIC1kIHRlc3QtZGwvIC1rIC0tdGltZW91dC1tdWx0aXBsaWVyIDEwICR7
VEVTVF9DQVNFX05BTUV9Cj4gICAgICBhcnRpZmFjdHM6Cj4gQEAgLTkxLDkgKzg4LDggQEAKPiAg
Cj4gIC50ZXN0X3BrZzoKPiAgICAgIHN0YWdlOiBidWlsZAo+IC0gICAgYmVmb3JlX3NjcmlwdDoK
PiArICAgIHNjcmlwdDoKPiAgICAgICAgICAtIE9VVFBVVF9ESVI9JHtDSV9KT0JfTkFNRX0KPiAt
ICAgIHNjcmlwdDoKPiAgICAgICAgICAtIGVjaG8gIkNvbmZpZ3VyZSBCdWlsZHJvb3QgZm9yICR7
T1VUUFVUX0RJUn0iCj4gICAgICAgICAgLSBtYWtlIE89JHtPVVRQVVRfRElSfSBzeW5jY29uZmln
Cj4gICAgICAgICAgLSBtYWtlIE89JHtPVVRQVVRfRElSfSBzYXZlZGVmY29uZmlnCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGlu
ZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
