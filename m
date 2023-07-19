Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62884C001B0
	for <buildroot@archiver.kernel.org>; Wed, 19 Jul 2023 21:46:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C30E040584;
	Wed, 19 Jul 2023 21:46:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C30E040584
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Jb-cF7h51uHa; Wed, 19 Jul 2023 21:46:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D8B4F403B3;
	Wed, 19 Jul 2023 21:46:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D8B4F403B3
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A59151BF280
 for <buildroot@lists.busybox.net>; Wed, 19 Jul 2023 21:46:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7E383403B3
 for <buildroot@lists.busybox.net>; Wed, 19 Jul 2023 21:46:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7E383403B3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id H9iZ7IryzrnQ for <buildroot@lists.busybox.net>;
 Wed, 19 Jul 2023 21:46:26 +0000 (UTC)
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 926C840222
 for <buildroot@buildroot.org>; Wed, 19 Jul 2023 21:46:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 926C840222
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-317009c0f9aso118382f8f.0
 for <buildroot@buildroot.org>; Wed, 19 Jul 2023 14:46:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689803183; x=1690407983;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :to:from:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QeDn+3zroDJNY6ScXsXTDxHXMcPIp28n5R5ZMOR8Uro=;
 b=KDRdYsGa1hma6LmIMv/SLbgIuTSfzfpoeCW+1u3hfPcA2m31XzTv5nazC1U4JuYkUs
 HYil6dl/xZOAsZit0Yl8OUVRe/dYkWD2QogqQPeIPSyUJrPSEKVSNTNEdl4Ba+0zGWQ5
 Vv2aYC5ETbetZo9/nLUe0hxohLqIqrAzTEXslaEo584QDZDsS3bYXUDPFq+ZZnffSLSx
 sBN1LCo/AAFJNM0MvTE1om77EQG92/6z54HUSCNN1loAV9adrOdlJpMod6EX1MlCCCll
 gMLjKezfQb2TJ9a+8Wqr+qcOP9x5gtU6kY8WJ/mfjDnrxjw8ErdGvnSTk7mwfIOY04TP
 JrfA==
X-Gm-Message-State: ABy/qLZ/RcAjTavewQs4TjRE0FXTt1lguIRwTDmuIqrNVYrcxeKh/O/c
 t6J8CzUKA6veS5wi3ZTUxSBMew==
X-Google-Smtp-Source: APBJJlEsaXBAul9/9mvrTltSShin8qOv8d7AtnxPT2tZ8E4X5zqp1FXtEahZoomY4qjgTdRR+5VowA==
X-Received: by 2002:a5d:4704:0:b0:313:df08:7b7e with SMTP id
 y4-20020a5d4704000000b00313df087b7emr518737wrq.14.1689803183321; 
 Wed, 19 Jul 2023 14:46:23 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31?
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 w8-20020adfde88000000b00314329f7d8asm6265421wrl.29.2023.07.19.14.46.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Jul 2023 14:46:22 -0700 (PDT)
Message-ID: <b9712883-e531-8328-6849-af2ee16237ab@smile.fr>
Date: Wed, 19 Jul 2023 23:46:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
From: Romain Naour <romain.naour@smile.fr>
To: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org,
 Dick Olsson <hi@senzilla.io>
References: <20230530200728.12239-1-ju.o@free.fr> <ZHicLZXBbEKasztN@debian>
 <5bc01545-1fda-3cc0-1b56-922d29b55996@smile.fr>
Content-Language: fr, en-US
In-Reply-To: <5bc01545-1fda-3cc0-1b56-922d29b55996@smile.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20221208.gappssmtp.com; s=20221208; t=1689803183; x=1690407983;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :to:from:subject:user-agent:mime-version:date:message-id:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QeDn+3zroDJNY6ScXsXTDxHXMcPIp28n5R5ZMOR8Uro=;
 b=nCV2orHI0UdD1TB+7rZqi6pPyLCtPtfviPeNhLtvxE+FN/meqJkNTesyILM7mc5tB2
 7K76k1khz7Jlna1bYHVsrmlGXOLK5tCdPxZE6AOuBm7iAdSu4RwVZZrEyAKgSRjDyxgl
 vfnmI0DBE4fTL9DbGK6w4JatLZWBqfBKojOfh6qUVPyBi8Q/qzXxdnqBlzqgDFJ7QhYN
 xt1eYlweZV1CALiST4Guo12Elu2lkH9yWxJpm5nTaF8slyD965e+sVbJlMCAlOe9gPVT
 HlKXb3kVCFA2VxmPrjLZmdCTpOvKrwkf/ZMeuAXfM/uKkdEPIKAjAJBwUt/RdWLv/l/C
 wMSw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20221208.gappssmtp.com
 header.i=@smile-fr.20221208.gappssmtp.com header.a=rsa-sha256
 header.s=20221208 header.b=nCV2orHI
Subject: Re: [Buildroot] [PATCH 1/3] boot/edk2: bump to version
 edk2-stable202305
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

SGVsbG8gSnVsaWVuLCBWaW5jZW50LCBBbGwsCgpMZSAxOC8wNy8yMDIzIMOgIDIzOjU3LCBSb21h
aW4gTmFvdXIgYSDDqWNyaXTCoDoKPiBIZWxsbyBKdWxpZW4sIFZpbmNlbnQsIEFsbCwKPiAKPiBM
ZSAwMS8wNi8yMDIzIMOgIDE1OjI1LCBWaW5jZW50IFN0ZWhsw6kgYSDDqWNyaXTCoDoKPj4gT24g
VHVlLCBNYXkgMzAsIDIwMjMgYXQgMTA6MDc6MjZQTSArMDIwMCwgSnVsaWVuIE9saXZhaW4gd3Jv
dGU6Cj4+PiBGb3IgY2hhbmdlIGxvZyBzaW5jZSB2ZXJzaW9uIGVkazItc3RhYmxlMjAyMjA4LCBz
ZWU6Cj4+PiAtIGh0dHBzOi8vZ2l0aHViLmNvbS90aWFub2NvcmUvZWRrMi9yZWxlYXNlcy90YWcv
ZWRrMi1zdGFibGUyMDIyMTEKPj4+IC0gaHR0cHM6Ly9naXRodWIuY29tL3RpYW5vY29yZS9lZGsy
L3JlbGVhc2VzL3RhZy9lZGsyLXN0YWJsZTIwMjMwMgo+Pj4gLSBodHRwczovL2dpdGh1Yi5jb20v
dGlhbm9jb3JlL2VkazIvcmVsZWFzZXMvdGFnL2VkazItc3RhYmxlMjAyMzA1Cj4+Pgo+Pj4gVGhl
IG1haW4gbW90aXZhdGlvbiBvZiB0aGlzIGJ1bXAgaXMgdGhlIFJJU0MtViBRRU1VIFZpcnQgc3Vw
cG9ydAo+Pj4gaW50cm9kdWNlZCBpbiBlZGsyLXN0YWJsZTIwMjMwMiAobm90IHlldCBzdXBwb3J0
ZWQgaW4gQnVpbGRyb290KS4KPj4+Cj4+PiBDYzogRGljayBPbHNzb24gPGhpQHNlbnppbGxhLmlv
Pgo+Pj4gQ2M6IFZpbmNlbnQgU3RlaGzDqSA8dmluY2VudC5zdGVobGVAYXJtLmNvbT4KPj4+IFNp
Z25lZC1vZmYtYnk6IEp1bGllbiBPbGl2YWluIDxqdS5vQGZyZWUuZnI+Cj4+PiAtLS0KPj4+IFBh
dGNoIHNlcmllcyB0ZXN0ZWQgb24gYnJhbmNoIG1hc3RlciBhdCBjb21taXQgYzc2NWFjOSB3aXRo
IGNvbW1hbmRzOgo+Pj4KPj4+ICAgICB1dGlscy9kb2NrZXItcnVuIG1ha2UgY2hlY2stcGFja2Fn
ZQo+Pj4gICAgIC4uLgo+Pj4gICAgIDAgd2FybmluZ3MgZ2VuZXJhdGVkCj4+Pgo+Pj4gICAgIHN1
cHBvcnQvdGVzdGluZy9ydW4tdGVzdHMgXAo+Pj4gICAgICAgICAtZCBkbCAtbyBvdXRwdXRfZm9s
ZGVyIFwKPj4+ICAgICAgICAgdGVzdHMuYm9vdC50ZXN0X2VkazIKPj4+ICAgICAuLi4KPj4+ICAg
ICBPSwo+Pj4KPj4+ICAgICBtYWtlIHFlbXVfYWFyY2g2NF9zYnNhX2RlZmNvbmZpZwo+Pj4gICAg
IG1ha2UKPj4+ICAgICAuLi4KPj4+ICAgICBvdXRwdXQvaW1hZ2VzL3N0YXJ0LXFlbXUuc2gKPj4+
ICAgICAuLi4KPj4+ICAgICBidWlsZHJvb3QgbG9naW46Cj4+Cj4+IEhpIEp1bGllbiwKPj4KPj4g
VGhhbmtzIGZvciB0aG9zZSBwYXRjaGVzIQo+Pgo+PiBJIGRpZCB0ZXN0IHRoZSBmb2xsb3dpbmcg
b24gbXkgc2lkZSB3aXRob3V0IGlzc3VlOgo+Pgo+PiAgIHFlbXVfYWFyY2g2NF9zYnNhX2RlZmNv
bmZpZwo+PiAgIHRlc3RzLmJvb3QudGVzdF9lZGsyLlRlc3RFZGsyCj4+ICAgdGVzdHMuYm9vdC50
ZXN0X2dydWIuVGVzdEdydWJBQXJjaDY0RUZJCj4+ICAgdGVzdHMuYm9vdC50ZXN0X2dydWIuVGVz
dEdydWJYODY2NEVGSQo+PiAgIHRlc3RzLmJvb3QudGVzdF9ncnViLlRlc3RHcnViaTM4NkVGSQo+
PiAgIHRlc3RzLmZzLnRlc3RfaXNvOTY2MC5UZXN0SXNvOTY2MEdydWIyRUZJCj4+ICAgdGVzdHMu
ZnMudGVzdF9pc285NjYwLlRlc3RJc285NjYwR3J1YjJIeWJyaWQKPiAKPiBUaGFua3MgZm9yIHRl
c3RpbmcgYnV0IHNvbWUgdGVzdCBpbiBnaXRsYWItY2kgZG9lc24ndCBib290IHNpbmNlIHRoaXMg
cGF0Y2ggaGFzCj4gYmVlbiBhcHBsaWVkOgo+IAo+IGh0dHBzOi8vZ2l0bGFiLmNvbS9idWlsZHJv
b3Qub3JnL2J1aWxkcm9vdC8tL2pvYnMvNDY2NDg0NTg2NQo+IGh0dHBzOi8vZ2l0bGFiLmNvbS9i
dWlsZHJvb3Qub3JnL2J1aWxkcm9vdC8tL2pvYnMvNDY2NDg0NTg2MQo+IGh0dHBzOi8vZ2l0bGFi
LmNvbS9idWlsZHJvb3Qub3JnL2J1aWxkcm9vdC8tL2pvYnMvNDY2NDg0NTc3Nwo+IGh0dHBzOi8v
Z2l0bGFiLmNvbS9idWlsZHJvb3Qub3JnL2J1aWxkcm9vdC8tL2pvYnMvNDY2NDg0NTc3Mwo+IAo+
ICJTeXN0ZW1FcnJvcjogU3lzdGVtIGRvZXMgbm90IGJvb3QiCj4gCj4gSSByZXByb2R1Y2VkIGxv
Y2FsbHkgd2l0aCAidGVzdHMuYm9vdC50ZXN0X2dydWIuVGVzdEdydWJYODY2NEVGSSIgdGhlbiBJ
Cj4gcmV2ZXJ0ZWQgdGhpcyBjb21taXQgdG8gYm9vdCBjb3JyZWN0bHkuCj4gCj4gVGhlcmUgaXMg
bm8gdXNlZnVsIGxvZywgdGhlIGltYWdlIGp1c3QgaGFuZy4KPiAKPiBDYW4geW91IGhhdmUgYSBs
b29rPwoKVGhlIGlzc3VlIGNvbWUgZnJvbSB0aGUgcWVtdSB2ZXJzaW9uICg1LjIueCkgdXNlZCBi
eSBvdXIgZ2l0bGFiLWNpIGRvY2tlciBpbWFnZS4KCklmIHdlIHVzZSB0aGUgImV4cGVyaW1lbnRh
bCBRRU1VIGNvbW1hbmQgbGluZSBvcHRpb24iIChTZWUgWzFdKSwgdGhlIHN5c3RlbSBib290OgoK
ICAtZndfY2ZnIG5hbWU9b3B0L29yZy50aWFub2NvcmUvWC1DcHVocC1CdWdjaGVjay1PdmVycmlk
ZSxzdHJpbmc9eWVzCgpJZiBlZGsyIGRldGVjdCB0aGUgaXNzdWUgaW4gUGxhdGZvcm1DcHVDb3Vu
dEJ1Z0NoZWNrKCksIGl0IHByaW50IGFuIGVycm9yCm1lc3NhZ2UgKHdlIGRpZG4ndCBzZWUgaXQg
aW4gb3VyIGxvZykgYW5kICpoYW5nKiBpZiB0aGUgcWVtdSBpc3N1ZSBpcyBwcmVzZW50LgoKV2Ug
aGF2ZSB0byBhZGQgdGhpcyB3b3JrYXJvdW5kIHRvIGVhY2ggcnVudGltZSB0ZXN0IHVzaW5nIGVk
azIgcGFja2FnZS4KClRob3VnaHRzPwoKWzFdCmh0dHBzOi8vZ2l0aHViLmNvbS90aWFub2NvcmUv
ZWRrMi9jb21taXQvYmY1Njc4YjU4MDI2ODVlMDc1ODNlM2M3ZWM1NmQ4ODNjYmRkNWRhMwoKQmVz
dCByZWdhcmRzLApSb21haW4KCgo+IAo+IEJlc3QgcmVnYXJkcywKPiBSb21haW4KPiAKPiAKPj4K
Pj4gRmVlbCBmcmVlIHRvIGFkZCAob3Igbm90KToKPj4KPj4gICBUZXN0ZWQtYnk6IFZpbmNlbnQg
U3RlaGzDqSA8dmluY2VudC5zdGVobGVAYXJtLmNvbT4KPiAKPiAKPiAKPj4KPj4gQmVzdCByZWdh
cmRzLAo+PiBWaW5jZW50Lgo+Pgo+Pj4gLS0tCj4+PiAgYm9vdC9lZGsyL2VkazIuaGFzaCB8IDIg
Ky0KPj4+ICBib290L2VkazIvZWRrMi5tayAgIHwgMiArLQo+Pj4gIDIgZmlsZXMgY2hhbmdlZCwg
MiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+Pj4KPj4+IGRpZmYgLS1naXQgYS9ib290
L2VkazIvZWRrMi5oYXNoIGIvYm9vdC9lZGsyL2VkazIuaGFzaAo+Pj4gaW5kZXggOTRlZTIyZGRj
NC4uMzRkNGIxMGUyOSAxMDA2NDQKPj4+IC0tLSBhL2Jvb3QvZWRrMi9lZGsyLmhhc2gKPj4+ICsr
KyBiL2Jvb3QvZWRrMi9lZGsyLmhhc2gKPj4+IEBAIC0xLDMgKzEsMyBAQAo+Pj4gICMgTG9jYWxs
eSBjYWxjdWxhdGVkCj4+PiAtc2hhMjU2ICBjMTA1MjBmMjY5NTU3ZDU2NmUzNWZlODEwNDE0MWFh
Mjg2NWY5MDg1YWQyYjNhMzBhYWU4YTdlNzhhM2NhNWFhICBlZGsyLWVkazItc3RhYmxlMjAyMjA4
LWJyMS50YXIuZ3oKPj4+ICtzaGEyNTYgIGNhNTUzNTE5MTNlNjI1OGViZDhjMDgxMDZmMzY5YWM3
MTA3M2Q5Y2ZhYTgwNDI3ZmM1ZjEzMWIwNmQ4MDg5NDAgIGVkazItZWRrMi1zdGFibGUyMDIzMDUt
YnIxLnRhci5nego+Pj4gIHNoYTI1NiAgNTBjZTIwYzljZmRiMGUxOWVlMzRmZTBhNTFmYzBhZmU5
NjFmNzQzNjk3YjA2ODM1OWFiMmY4NjJiNDk0ZGY4MCAgTGljZW5zZS50eHQKPj4+IGRpZmYgLS1n
aXQgYS9ib290L2VkazIvZWRrMi5tayBiL2Jvb3QvZWRrMi9lZGsyLm1rCj4+PiBpbmRleCBmYjZi
OWEzMjgwLi4zOTliZDM0NmVmIDEwMDY0NAo+Pj4gLS0tIGEvYm9vdC9lZGsyL2VkazIubWsKPj4+
ICsrKyBiL2Jvb3QvZWRrMi9lZGsyLm1rCj4+PiBAQCAtNCw3ICs0LDcgQEAKPj4+ICAjCj4+PiAg
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKPj4+ICAKPj4+IC1FREsyX1ZFUlNJT04gPSBlZGsyLXN0
YWJsZTIwMjIwOAo+Pj4gK0VESzJfVkVSU0lPTiA9IGVkazItc3RhYmxlMjAyMzA1Cj4+PiAgRURL
Ml9TSVRFID0gaHR0cHM6Ly9naXRodWIuY29tL3RpYW5vY29yZS9lZGsyCj4+PiAgRURLMl9TSVRF
X01FVEhPRCA9IGdpdAo+Pj4gIEVESzJfTElDRU5TRSA9IEJTRC0yLUNsYXVzZS1QYXRlbnQKPj4+
IC0tIAo+Pj4gMi40MC4xCj4+Pgo+PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwo+PiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4+IGJ1aWxkcm9vdEBidWls
ZHJvb3Qub3JnCj4+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2J1aWxkcm9vdAo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRw
czovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
