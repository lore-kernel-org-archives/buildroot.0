Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71A5DD10BF4
	for <buildroot@archiver.kernel.org>; Sat, 26 Oct 2024 09:46:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F1EF180DF0;
	Sat, 26 Oct 2024 09:46:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qM9_2UefKz22; Sat, 26 Oct 2024 09:46:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E6BE780E01
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E6BE780E01;
	Sat, 26 Oct 2024 09:46:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id C9EAB5C24
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 09:46:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B80CF80DF0
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 09:46:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5bPvJF2SEuzK for <buildroot@buildroot.org>;
 Sat, 26 Oct 2024 09:46:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0686E80E01
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0686E80E01
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0686E80E01
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 09:46:50 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4316a44d1bbso25145425e9.3
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 02:46:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729936009; x=1730540809;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :to:from:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TYVP/CTJxFyNe6PjY8fKtgabadGW8kOwERw3L2hiQTE=;
 b=k1ipauAisjxcBuEBACeK6usmAf+L9SL0F012vJIVjmf0vZOB2gbppisphWsNn9oA5V
 SvgcHlwFhQ2M4OksYqZ0XCEMd/GeYxRqL3vt2XduvyoNANyr0uLbKt8EiK7hJ0WOaoq3
 Dka8l7HZMBkvmH9PYdJFocifv2lOwuCXQTB/mC2+843L1uHdXYamPvpiTf7mcOg4ZzDO
 VXMlACZQFVyD6lJXxe9P9ZdAGN+LJXZeeGtQf4yQRTnAkorXMWhrsj56cbRuNdyeYgUA
 EI1OoLI8bmaTa4Tz39wgDeeueECz5jTHRZXOPdqW6qDi3UO0C1A3uxxyfkR4w+CbrbdG
 nnow==
X-Forwarded-Encrypted: i=1;
 AJvYcCWLVT1BzwzBDQgSe7koJPk4wFpHLE/T8tTy9HSR2Li178dAmo+1ptYeJ8luCcCrkntGOtjB/Ts4aIw=@buildroot.org
X-Gm-Message-State: AOJu0Yxoz00kHhmALV7iUZDy5PKRgfjWV47C4/6q/TVuu3IrNo7YfLul
 Ksy2xYrCWmkPKKPWTDyTKCBHmBhgpnHSsybr6vIh3zVCdw/ZhJg35g8Z/xJTPFnlZc+7GnrjJKg
 Z
X-Google-Smtp-Source: AGHT+IGJTfyXCeTAFSc1H42Xfa+iPI4ninHS09ovFHCu5yQhXj9Vk3Lan78GMePJ9ntA9klE9tXvWg==
X-Received: by 2002:a05:600c:1c03:b0:431:5d89:646e with SMTP id
 5b1f17b1804b1-4319ad30bfcmr17060005e9.32.1729936008718; 
 Sat, 26 Oct 2024 02:46:48 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:e3ef:2d7a:4131:71f?
 (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43193573ce2sm42375145e9.10.2024.10.26.02.46.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 26 Oct 2024 02:46:48 -0700 (PDT)
Message-ID: <9bc95d4b-0224-42b8-93e1-447e02808433@smile.fr>
Date: Sat, 26 Oct 2024 11:46:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Waldemar Brodkorb <wbx@openadk.org>, buildroot@buildroot.org
References: <Zuk8u8Ja5KMX9Pvw@waldemar-brodkorb.de>
 <e117b332-3c34-4079-99c8-8e59097c956b@smile.fr>
Content-Language: fr
In-Reply-To: <e117b332-3c34-4079-99c8-8e59097c956b@smile.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1729936009; x=1730540809; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :to:from:subject:user-agent:mime-version:date:message-id:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TYVP/CTJxFyNe6PjY8fKtgabadGW8kOwERw3L2hiQTE=;
 b=JLbZoXHZib7UdIdgHTLlKy80QidFcIGPH6poscHXqCD6FXAQBpf3mJwOktxo4KHAtn
 6NbXqRljxc3KG3w1KFfQRT9YlSiYVvMZGQxpZ36MKz+xA4Ppts2I0O43bHIdNlhAGXa6
 qrBscbUH92fyzkUHqs8Xuw9k3zX2M5LnQldtI=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=JLbZoXHZ
Subject: Re: [Buildroot] [PATCH v2 1/3] qemu: fixup riscv32/64 bootup with
 Qemu 9.1.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gV2FsZGVtYXIsIEFsbCwKCkxlIDI1LzEwLzIwMjQgw6AgMjM6MzAsIFJvbWFpbiBOYW91
ciBhIMOpY3JpdMKgOgo+IEhlbGxvIFdhbGRlbWFyLCBBbGwsCj4gCj4gTGUgMTcvMDkvMjAyNCDD
oCAxMDoyNCwgV2FsZGVtYXIgQnJvZGtvcmIgYSDDqWNyaXTCoDoKPj4gU2lnbmVkLW9mZi1ieTog
V2FsZGVtYXIgQnJvZGtvcmIgPHdieEBvcGVuYWRrLm9yZz4KPj4gLS0tCj4+IHYxLT52MjoKPj4g
IC0gbmV3IHBhdGNoLCBmb3VuZCB2aWEgR2l0bGFiIGF1dG9tYXRpYyB0ZXN0aW5nCj4gCj4gV2hh
dCB3YXMgdGhlIGlzc3VlIHlvdSBub3RpY2VkPwo+IFdoeS9ob3cgYWRkaW5nIGlmPW5vbmUgZml4
IHRoZSBib290IGlzc3VlPwoKU2VlIHRoZSBmb2xsb3dpbmcgY29tbWl0IGZyb20gUWVtdSA5LjE6
Cgpody9yaXNjdi92aXJ0LmM6IE1ha2UgYmxvY2sgZGV2aWNlcyBkZWZhdWx0IHRvIHZpcnRpbwoK
UklTQy1WIHZpcnQgaXMgY3VycmVudGx5IG1pc3NpbmcgZGVmYXVsdCB0eXBlIGZvciBibG9jayBk
ZXZpY2VzLiBXaXRob3V0CnRoaXMgYmVpbmcgc2V0LCBwcm9wZXIgYmFja2VuZCBpcyBub3QgY3Jl
YXRlZCB3aGVuIG9wdGlvbiBsaWtlIC1jZHJvbQppcyB1c2VkLiBTbywgbWFrZSB0aGUgdmlydCBi
b2FyZCdzIGRlZmF1bHQgYmxvY2sgZGV2aWNlIHR5cGUgYmUKSUZfVklSVElPIHNpbWlsYXIgdG8g
b3RoZXIgYXJjaGl0ZWN0dXJlcy4KCmh0dHBzOi8vZ2l0bGFiLmNvbS9xZW11LXByb2plY3QvcWVt
dS8tL2NvbW1pdC80NDA2YmEyYjVlZmNlNmFmNjQ5MDVmODI3Y2EyNDRmNjk5ZGI4MTcwCgpJdCBt
ZWFucyB3ZSBubyBsb25nZXIgbmVlZCAiLWRldmljZSB2aXJ0aW8tYmxrLWRldmljZSxkcml2ZT1o
ZDAiIG9uIHRoZSBxZW11CmNvbW1hbmQgbGluZSwgc28gImlmPW5vbmUiIGlzIG5vdCBuZWVkZWQu
CgpUZXN0ZWQgbG9jYWxseSB3aXRoIG9ubHk6CgpxZW11LXN5c3RlbS1yaXNjdjY0IC1NIHZpcnQg
LWJpb3MgZndfanVtcC5lbGYgLWtlcm5lbCBJbWFnZSAtYXBwZW5kIHJvb3R3YWl0CnJvb3Q9L2Rl
di92ZGEgcm8gLWRyaXZlIGZpbGU9cm9vdGZzLmV4dDIsZm9ybWF0PXJhdyAtbmV0ZGV2IHVzZXIs
aWQ9bmV0MCAtZGV2aWNlCnZpcnRpby1uZXQtZGV2aWNlLG5ldGRldj1uZXQwIC1ub2dyYXBoaWMK
CkJlc3QgcmVnYXJkcywKUm9tYWluCgoKPiAKPiBCZXN0IHJlZ2FyZHMsCj4gUm9tYWluCj4gCj4g
Cj4+IC0tLQo+PiAgYm9hcmQvcWVtdS9yaXNjdjMyLXZpcnQvcmVhZG1lLnR4dCAgICAgfCA0ICsr
LS0KPj4gIGJvYXJkL3FlbXUvcmlzY3Y2NC12aXJ0LWVmaS9yZWFkbWUudHh0IHwgMiArLQo+PiAg
Ym9hcmQvcWVtdS9yaXNjdjY0LXZpcnQvcmVhZG1lLnR4dCAgICAgfCA0ICsrLS0KPj4gIDMgZmls
ZXMgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQo+Pgo+PiBkaWZmIC0t
Z2l0IGEvYm9hcmQvcWVtdS9yaXNjdjMyLXZpcnQvcmVhZG1lLnR4dCBiL2JvYXJkL3FlbXUvcmlz
Y3YzMi12aXJ0L3JlYWRtZS50eHQKPj4gaW5kZXggNTU1OTI0Zjk0OS4uMDQ4MzA2Y2Q1NCAxMDA2
NDQKPj4gLS0tIGEvYm9hcmQvcWVtdS9yaXNjdjMyLXZpcnQvcmVhZG1lLnR4dAo+PiArKysgYi9i
b2FyZC9xZW11L3Jpc2N2MzItdmlydC9yZWFkbWUudHh0Cj4+IEBAIC0xLDcgKzEsNyBAQAo+PiAg
UnVuIExpbnV4IGluIGVtdWxhdGlvbiB3aXRoOgo+PiAgCj4+IC0gIHFlbXUtc3lzdGVtLXJpc2N2
MzIgLU0gdmlydCAtYmlvcyBvdXRwdXQvaW1hZ2VzL2Z3X2p1bXAuZWxmIC1rZXJuZWwgb3V0cHV0
L2ltYWdlcy9JbWFnZSAtYXBwZW5kICJyb290d2FpdCByb290PS9kZXYvdmRhIHJvIiAtZHJpdmUg
ZmlsZT1vdXRwdXQvaW1hZ2VzL3Jvb3Rmcy5leHQyLGZvcm1hdD1yYXcsaWQ9aGQwIC1kZXZpY2Ug
dmlydGlvLWJsay1kZXZpY2UsZHJpdmU9aGQwIC1uZXRkZXYgdXNlcixpZD1uZXQwIC1kZXZpY2Ug
dmlydGlvLW5ldC1kZXZpY2UsbmV0ZGV2PW5ldDAgLW5vZ3JhcGhpYyAjIHFlbXVfcmlzY3YzMl92
aXJ0X2RlZmNvbmZpZwo+PiArICBxZW11LXN5c3RlbS1yaXNjdjMyIC1NIHZpcnQgLWJpb3Mgb3V0
cHV0L2ltYWdlcy9md19qdW1wLmVsZiAta2VybmVsIG91dHB1dC9pbWFnZXMvSW1hZ2UgLWFwcGVu
ZCAicm9vdHdhaXQgcm9vdD0vZGV2L3ZkYSBybyIgLWRyaXZlIGZpbGU9b3V0cHV0L2ltYWdlcy9y
b290ZnMuZXh0Mixmb3JtYXQ9cmF3LGlkPWhkMCxpZj1ub25lIC1kZXZpY2UgdmlydGlvLWJsay1k
ZXZpY2UsZHJpdmU9aGQwIC1uZXRkZXYgdXNlcixpZD1uZXQwIC1kZXZpY2UgdmlydGlvLW5ldC1k
ZXZpY2UsbmV0ZGV2PW5ldDAgLW5vZ3JhcGhpYyAjIHFlbXVfcmlzY3YzMl92aXJ0X2RlZmNvbmZp
Zwo+PiAgCj4+IC0gIHFlbXUtc3lzdGVtLXJpc2N2MzIgLU0gdmlydCAtYmlvcyBub25lIC1rZXJu
ZWwgb3V0cHV0L2ltYWdlcy9JbWFnZSAtYXBwZW5kICJyb290d2FpdCByb290PS9kZXYvdmRhIHJv
IiAtZHJpdmUgZmlsZT1vdXRwdXQvaW1hZ2VzL3Jvb3Rmcy5leHQyLGZvcm1hdD1yYXcsaWQ9aGQw
IC1kZXZpY2UgdmlydGlvLWJsay1kZXZpY2UsZHJpdmU9aGQwIC1ub2dyYXBoaWMgLWNwdSBydjMy
LG1tdT1vZmYgLW5ldGRldiB1c2VyLGlkPWV0aDAgLWRldmljZSB2aXJ0aW8tbmV0LWRldmljZSxu
ZXRkZXY9ZXRoMCAjIHFlbXVfcmlzY3YzMl9ub21tdV92aXJ0X2RlZmNvbmZpZwo+PiArICBxZW11
LXN5c3RlbS1yaXNjdjMyIC1NIHZpcnQgLWJpb3Mgbm9uZSAta2VybmVsIG91dHB1dC9pbWFnZXMv
SW1hZ2UgLWFwcGVuZCAicm9vdHdhaXQgcm9vdD0vZGV2L3ZkYSBybyIgLWRyaXZlIGZpbGU9b3V0
cHV0L2ltYWdlcy9yb290ZnMuZXh0Mixmb3JtYXQ9cmF3LGlkPWhkMCxpZj1ub25lIC1kZXZpY2Ug
dmlydGlvLWJsay1kZXZpY2UsZHJpdmU9aGQwIC1ub2dyYXBoaWMgLWNwdSBydjMyLG1tdT1vZmYg
LW5ldGRldiB1c2VyLGlkPWV0aDAgLWRldmljZSB2aXJ0aW8tbmV0LWRldmljZSxuZXRkZXY9ZXRo
MCAjIHFlbXVfcmlzY3YzMl9ub21tdV92aXJ0X2RlZmNvbmZpZwo+PiAgCj4+ICBUaGUgbG9naW4g
cHJvbXB0IHdpbGwgYXBwZWFyIGluIHRoZSB0ZXJtaW5hbCB0aGF0IHN0YXJ0ZWQgUWVtdS4KPj4g
ZGlmZiAtLWdpdCBhL2JvYXJkL3FlbXUvcmlzY3Y2NC12aXJ0LWVmaS9yZWFkbWUudHh0IGIvYm9h
cmQvcWVtdS9yaXNjdjY0LXZpcnQtZWZpL3JlYWRtZS50eHQKPj4gaW5kZXggNmI5NjUxYTAxMS4u
YzdiMzE3N2FmMSAxMDA2NDQKPj4gLS0tIGEvYm9hcmQvcWVtdS9yaXNjdjY0LXZpcnQtZWZpL3Jl
YWRtZS50eHQKPj4gKysrIGIvYm9hcmQvcWVtdS9yaXNjdjY0LXZpcnQtZWZpL3JlYWRtZS50eHQK
Pj4gQEAgLTIyLDcgKzIyLDcgQEAgUnVuIHRoZSBlbXVsYXRpb24gd2l0aDoKPj4gICAgICAgICAg
LWJsb2NrZGV2IG5vZGUtbmFtZT1wZmxhc2gwLGRyaXZlcj1maWxlLHJlYWQtb25seT1vbixmaWxl
bmFtZT1vdXRwdXQvaW1hZ2VzL1JJU0NWX1ZJUlRfQ09ERS5mZCBcCj4+ICAgICAgICAgIC1ibG9j
a2RldiBub2RlLW5hbWU9cGZsYXNoMSxkcml2ZXI9ZmlsZSxmaWxlbmFtZT1vdXRwdXQvaW1hZ2Vz
L1JJU0NWX1ZJUlRfVkFSUy5mZCBcCj4+ICAgICAgICAgIFwKPj4gLSAgICAgICAgLWRyaXZlIGZp
bGU9b3V0cHV0L2ltYWdlcy9kaXNrLmltZyxmb3JtYXQ9cmF3LGlkPWhkMCBcCj4+ICsgICAgICAg
IC1kcml2ZSBmaWxlPW91dHB1dC9pbWFnZXMvZGlzay5pbWcsZm9ybWF0PXJhdyxpZD1oZDAsaWY9
bm9uZSBcCj4+ICAgICAgICAgIC1kZXZpY2UgdmlydGlvLWJsay1kZXZpY2UsZHJpdmU9aGQwIFwK
Pj4gICAgICAgICAgXAo+PiAgICAgICAgICAtbmV0ZGV2IHVzZXIsaWQ9bmV0MCBcCj4+IGRpZmYg
LS1naXQgYS9ib2FyZC9xZW11L3Jpc2N2NjQtdmlydC9yZWFkbWUudHh0IGIvYm9hcmQvcWVtdS9y
aXNjdjY0LXZpcnQvcmVhZG1lLnR4dAo+PiBpbmRleCBmMWM3YmY0MWI1Li41YjNiYjg1YjRiIDEw
MDY0NAo+PiAtLS0gYS9ib2FyZC9xZW11L3Jpc2N2NjQtdmlydC9yZWFkbWUudHh0Cj4+ICsrKyBi
L2JvYXJkL3FlbXUvcmlzY3Y2NC12aXJ0L3JlYWRtZS50eHQKPj4gQEAgLTEsNyArMSw3IEBACj4+
ICBSdW4gTGludXggaW4gZW11bGF0aW9uIHdpdGg6Cj4+ICAKPj4gLSAgcWVtdS1zeXN0ZW0tcmlz
Y3Y2NCAtTSB2aXJ0IC1iaW9zIG91dHB1dC9pbWFnZXMvZndfanVtcC5lbGYgLWtlcm5lbCBvdXRw
dXQvaW1hZ2VzL0ltYWdlIC1hcHBlbmQgInJvb3R3YWl0IHJvb3Q9L2Rldi92ZGEgcm8iIC1kcml2
ZSBmaWxlPW91dHB1dC9pbWFnZXMvcm9vdGZzLmV4dDIsZm9ybWF0PXJhdyxpZD1oZDAgLWRldmlj
ZSB2aXJ0aW8tYmxrLWRldmljZSxkcml2ZT1oZDAgLW5ldGRldiB1c2VyLGlkPW5ldDAgLWRldmlj
ZSB2aXJ0aW8tbmV0LWRldmljZSxuZXRkZXY9bmV0MCAtbm9ncmFwaGljICMgcWVtdV9yaXNjdjY0
X3ZpcnRfZGVmY29uZmlnCj4+ICsgIHFlbXUtc3lzdGVtLXJpc2N2NjQgLU0gdmlydCAtYmlvcyBv
dXRwdXQvaW1hZ2VzL2Z3X2p1bXAuZWxmIC1rZXJuZWwgb3V0cHV0L2ltYWdlcy9JbWFnZSAtYXBw
ZW5kICJyb290d2FpdCByb290PS9kZXYvdmRhIHJvIiAtZHJpdmUgZmlsZT1vdXRwdXQvaW1hZ2Vz
L3Jvb3Rmcy5leHQyLGZvcm1hdD1yYXcsaWQ9aGQwLGlmPW5vbmUgLWRldmljZSB2aXJ0aW8tYmxr
LWRldmljZSxkcml2ZT1oZDAgLW5ldGRldiB1c2VyLGlkPW5ldDAgLWRldmljZSB2aXJ0aW8tbmV0
LWRldmljZSxuZXRkZXY9bmV0MCAtbm9ncmFwaGljICMgcWVtdV9yaXNjdjY0X3ZpcnRfZGVmY29u
ZmlnCj4+ICAKPj4gLSAgcWVtdS1zeXN0ZW0tcmlzY3Y2NCAtTSB2aXJ0IC1iaW9zIG5vbmUgLWtl
cm5lbCBvdXRwdXQvaW1hZ2VzL0ltYWdlIC1hcHBlbmQgInJvb3R3YWl0IHJvb3Q9L2Rldi92ZGEg
cm8iIC1kcml2ZSBmaWxlPW91dHB1dC9pbWFnZXMvcm9vdGZzLmV4dDIsZm9ybWF0PXJhdyxpZD1o
ZDAgLWRldmljZSB2aXJ0aW8tYmxrLWRldmljZSxkcml2ZT1oZDAgLW5vZ3JhcGhpYyAtY3B1IHJ2
NjQsbW11PW9mZiAtbmV0ZGV2IHVzZXIsaWQ9bmV0MCAtZGV2aWNlIHZpcnRpby1uZXQtZGV2aWNl
LG5ldGRldj1uZXQwICMgcWVtdV9yaXNjdjY0X25vbW11X3ZpcnRfZGVmY29uZmlnCj4+ICsgIHFl
bXUtc3lzdGVtLXJpc2N2NjQgLU0gdmlydCAtYmlvcyBub25lIC1rZXJuZWwgb3V0cHV0L2ltYWdl
cy9JbWFnZSAtYXBwZW5kICJyb290d2FpdCByb290PS9kZXYvdmRhIHJvIiAtZHJpdmUgZmlsZT1v
dXRwdXQvaW1hZ2VzL3Jvb3Rmcy5leHQyLGZvcm1hdD1yYXcsaWQ9aGQwLGlmPW5vbmUgLWRldmlj
ZSB2aXJ0aW8tYmxrLWRldmljZSxkcml2ZT1oZDAgLW5vZ3JhcGhpYyAtY3B1IHJ2NjQsbW11PW9m
ZiAtbmV0ZGV2IHVzZXIsaWQ9bmV0MCAtZGV2aWNlIHZpcnRpby1uZXQtZGV2aWNlLG5ldGRldj1u
ZXQwICMgcWVtdV9yaXNjdjY0X25vbW11X3ZpcnRfZGVmY29uZmlnCj4+ICAKPj4gIFRoZSBsb2dp
biBwcm9tcHQgd2lsbCBhcHBlYXIgaW4gdGhlIHRlcm1pbmFsIHRoYXQgc3RhcnRlZCBRZW11Lgo+
IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRy
b290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1
aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
