Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F57FC4828D
	for <buildroot@archiver.kernel.org>; Wed,  7 Feb 2024 10:04:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2C47A400B9;
	Wed,  7 Feb 2024 10:04:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gNXave7SVcmB; Wed,  7 Feb 2024 10:04:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C433F400C1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C433F400C1;
	Wed,  7 Feb 2024 10:04:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DF0FF1BF831
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 10:04:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C8DEB613B9
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 10:04:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rFeON0lEQuK3 for <buildroot@lists.busybox.net>;
 Wed,  7 Feb 2024 10:04:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42b; helo=mail-wr1-x42b.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 73E83613B8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 73E83613B8
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 73E83613B8
 for <buildroot@buildroot.org>; Wed,  7 Feb 2024 10:04:29 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-33b401fd72bso376198f8f.3
 for <buildroot@buildroot.org>; Wed, 07 Feb 2024 02:04:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707300267; x=1707905067;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=apFyoNOhDoReQ3hXIgH6v2JOt1WzIuqXaN8iYa4d9jQ=;
 b=nv+FXVTurC3bkOKHmvC/Jm/iAEJCwb5T3CoYYWmwolUdTLPgi24rhB54yb16jN7c+b
 9N0UHmE2NZoyMvZpOsaX6jTUvPICqAhLGOG5roeHe7n2+zNR01SPCzDCMefi92mj3ZGV
 V0lUXf5JIYJfoy3Ox8OtV7zsYFbKT3aNuMYD5oFrS9wvwKbYHBjsiAHfn0p/bzA7un9J
 6yaR1p4gaN7CGne96r/1zX0gJKpHmwp4mEjMhM4hyFoGNXIFwVL4BT+jLtJGMuuNKFjC
 vYfJp7HiYq00mcajYJ9MdaAVLcuh8NUVCCjwRZh4TmiHpaKSVIcuBNE8+8bGK1irA+RO
 VWWQ==
X-Gm-Message-State: AOJu0YwbpYVO2omcvv1QMj7H3ntkq/CycY7O7RL0GVxkUOQIvcc9SQvH
 +HRGZ3fk4ga3TPnVjnJpZ7cFM9jzrpfT/APWAUDxV34K3kwWeO/IpH6NwRfd8sc=
X-Google-Smtp-Source: AGHT+IFzbQUEITyRCukgCEwzI9GdOore2gZAICdH+VEaaolHmitUss5Rhti5I4Pd31ktc1927peSsw==
X-Received: by 2002:adf:f28c:0:b0:337:c5f2:e843 with SMTP id
 k12-20020adff28c000000b00337c5f2e843mr3227159wro.57.1707300267304; 
 Wed, 07 Feb 2024 02:04:27 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCXLfw7y3kC7ISaZJcLavNgVc208jOoGt7PQpjsyOLOhFmXqsmkLFnBnGQqplaqtGNniBDRl8TRoFKLaYi0oK2Z0CQAF8+Vw4YEYqO3NvCkN4G7Y1yRFDVtxwOocg8Ejs6qJYDmzKpkAauZwWDwSF6GoA2IGLCgY1ZF1CXsxsElIq3L4ypEg++EHza/0UNfFOHCtXJiE5AoOsViLuac41SdwtvggGlGgEIqwZU7Sn55H66UltKDnzsepCA8Uz/sLvVzV43ElACw5at264rHPZzWMq8ht7lKcHf0JHiRrqtWoYZjS6Gw1wJLFYXdRKk2KMLlaz9s=
Received: from [192.168.17.126] ([85.119.216.19])
 by smtp.gmail.com with ESMTPSA id
 g9-20020a5d5549000000b0033b41af645asm1094011wrw.108.2024.02.07.02.04.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Feb 2024 02:04:26 -0800 (PST)
Message-ID: <3d674bd1-a53f-4f82-93c1-58cbe14ab1db@smile.fr>
Date: Wed, 7 Feb 2024 11:04:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: Romain Naour <romain.naour@smile.fr>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 buildroot@buildroot.org
References: <20231218081958.506691-1-dario.binacchi@amarulasolutions.com>
 <20231218081958.506691-3-dario.binacchi@amarulasolutions.com>
 <bfe1b04f-2f7c-4e3f-b6ce-d96d84905160@smile.fr>
In-Reply-To: <bfe1b04f-2f7c-4e3f-b6ce-d96d84905160@smile.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1707300267; x=1707905067;
 darn=buildroot.org; 
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=apFyoNOhDoReQ3hXIgH6v2JOt1WzIuqXaN8iYa4d9jQ=;
 b=MNL1zCg6feEItNFg06vet4Lo1RgRGNhtR/9oiD5Umcn2O/tuxUPcjR9RmuELB6rYv3
 6tgjpL5sDzUpHYjlhDax8hkZCL7+PirngF6DO/WVsPE+fM9sJIibBZEI0NfANqdz7ut8
 1/4YX/JgQ1ev/D/FJsWxpJ2PZx9QrwK98M6cvCaZtKnjI+059PzVSewam0JBgbO61kP5
 BrHy2BtJHfvfXsH470GYAMUasWNCRjM6DRLaBoViG5fUUfjSYQLj6fi8bM0T5AEqvHiy
 lLDhs1AUjwEjPcVVj+txPJaGbsw81uAGV4h0rTGUYip1YSfj7gfnknQZXCw76dgkengs
 XiPA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=MNL1zCg6
Subject: Re: [Buildroot] [PATCH v3 02/11] boot/ti-k3-image-gen: manage HS
 hardware
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
Cc: Asaf Kahlon <asafka7@gmail.com>, Xuanhao Shi <X15000177@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, michael@amarulasolutions.com,
 linux-amarula@amarulasolutions.com, bryce@redpinelabs.com,
 Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gRGFyaW8sIEFsbCwKCkxlIDA2LzAyLzIwMjQgw6AgMTg6NTAsIFJvbWFpbiBOYW91ciBh
IMOpY3JpdMKgOgo+IEhlbGxvIERhcmlvLAo+IAo+IExlIDE4LzEyLzIwMjMgw6AgMDk6MTksIERh
cmlvIEJpbmFjY2hpIGEgw6ljcml0wqA6Cj4+IFRoZSBwYXRjaCBzZXRzIHRoZSBjb25maWd1cmF0
aW9ucyByZXF1aXJlZCBieSBUSSBIUyBzeXN0ZW1zLiBTb21lIG9mIHRoZXNlCj4+IGNvbmZpZ3Vy
YXRpb25zIChpLiBlLiBIUyBTWVNGVyBpbWFnZSBzaWduaW5nIGtleSwgSFMgU29mdHdhcmUgUmV2
aXNpb24pCj4+IGFyZSBwcm92aWRlZCBieSB0aGUgdGktazMtY29yZS1zZWNkZXYgcGFja2FnZSBp
biB0aGUgYmluYXJpZXMgZGlyZWN0b3J5Lgo+IAo+IEFGQUlLIHRoZSB0aS1rMy1pbWFnZS1nZW4g
dG9vbCBpcyBkZXByZWNhdGVkIGFuZCBtdXN0IGJlIHJlcGxhY2VkIGJ5IGJpbm1hbiB0b29sCj4g
cHJvdmlkZWQgYnkgdXBzdHJlYW0gdS1ib290Lgo+IAo+IElzIGFsbCBrMyBTb0MgbWlncmF0ZWQg
dG8gYmlubWFuIGluIHRoZSBsYXRlc3QgdS1ib290IHJlbGVhc2UgMjAyNC4wMT8KPiAKPiBTZWUg
dGhlIEZPU0RFTSB0YWxrOgo+IAo+IGh0dHBzOi8vZm9zZGVtLm9yZy8yMDI0L2V2ZW50cy9hdHRh
Y2htZW50cy9mb3NkZW0tMjAyNC0zMDY3LXN0YW5kYXJkaXppbmctdGhlLWdlbmVyYXRpb24tYW5k
LXNpZ25pbmctb2YtYm9vdC1pbWFnZXMvc2xpZGVzLzIxOTE5L0ZPU0RFTTI0X1NwZWFrZXJfU2xp
ZGVzX3k3RnNJS00ucGRmCj4gCj4gQmVzdCByZWdhcmRzLAo+IFJvbWFpbgo+IAo+IAo+Pgo+PiBT
aWduZWQtb2ZmLWJ5OiBEYXJpbyBCaW5hY2NoaSA8ZGFyaW8uYmluYWNjaGlAYW1hcnVsYXNvbHV0
aW9ucy5jb20+Cj4+IC0tLQo+PiAgYm9vdC90aS1rMy1pbWFnZS1nZW4vQ29uZmlnLmluICAgICAg
ICAgIHwgIDEgKwo+PiAgYm9vdC90aS1rMy1pbWFnZS1nZW4vdGktazMtaW1hZ2UtZ2VuLm1rIHwg
MTYgKysrKysrKysrKysrKystLQo+PiAgMiBmaWxlcyBjaGFuZ2VkLCAxNSBpbnNlcnRpb25zKCsp
LCAyIGRlbGV0aW9ucygtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvYm9vdC90aS1rMy1pbWFnZS1nZW4v
Q29uZmlnLmluIGIvYm9vdC90aS1rMy1pbWFnZS1nZW4vQ29uZmlnLmluCj4+IGluZGV4IGQ3NmNl
ZjgyZTkxMS4uMzhkMTU5OGQ5ZmMwIDEwMDY0NAo+PiAtLS0gYS9ib290L3RpLWszLWltYWdlLWdl
bi9Db25maWcuaW4KPj4gKysrIGIvYm9vdC90aS1rMy1pbWFnZS1nZW4vQ29uZmlnLmluCj4+IEBA
IC0yLDYgKzIsNyBAQCBjb25maWcgQlIyX1RBUkdFVF9USV9LM19JTUFHRV9HRU4KPj4gIAlib29s
ICJ0aS1rMy1pbWFnZS1nZW4iCj4+ICAJZGVwZW5kcyBvbiBCUjJfVEFSR0VUX1RJX0szX1I1X0xP
QURFUgo+PiAgCXNlbGVjdCBCUjJfVEFSR0VUX1RJX0szX0JPT1RfRklSTVdBUkUKPj4gKwlzZWxl
Y3QgQlIyX1RBUkdFVF9USV9LM19DT1JFX1NFQ0RFViBpZiBCUjJfVEFSR0VUX1RJX0szX0lNQUdF
X0dFTl9TRUNUWVBFX0hTX0ZTIHx8IEJSMl9UQVJHRVRfVElfSzNfSU1BR0VfR0VOX1NFQ1RZUEVf
SFMKCkRvZXMgaXQgbWVhbnMgdGhhdCBjdXJyZW50bHkgVEkgSFMgY29uZmlndXJhdGlvbiBhcmUg
bWlzc2luZyB0aGUKdGktazMtY29yZS1zZWNkZXYgdG9vbCB0byBidWlsZCBwcm9wZXJseT8KCkl0
IHNlZW1zIHRoaXMgcGF0Y2ggc2hvdWxkIGZpeGVzIHRoZW0uCgpCZXN0IHJlZ2FyZHMsClJvbWFp
bgoKPj4gIAkjIFdlIG5lZWQgRklUIHN1cHBvcnQgaW4gdWJvb3QtdG9vbHMsIHdoaWNoIGlzIHdo
eSB3ZSBzZWxlY3QgYQo+PiAgCSMgaG9zdCBwYWNrYWdlCj4+ICAJc2VsZWN0IEJSMl9QQUNLQUdF
X0hPU1RfVUJPT1RfVE9PTFMKPj4gZGlmZiAtLWdpdCBhL2Jvb3QvdGktazMtaW1hZ2UtZ2VuL3Rp
LWszLWltYWdlLWdlbi5tayBiL2Jvb3QvdGktazMtaW1hZ2UtZ2VuL3RpLWszLWltYWdlLWdlbi5t
awo+PiBpbmRleCA2NGJlOWExOGYyYzQuLjkxYWVkNjNiYWI4NCAxMDA2NDQKPj4gLS0tIGEvYm9v
dC90aS1rMy1pbWFnZS1nZW4vdGktazMtaW1hZ2UtZ2VuLm1rCj4+ICsrKyBiL2Jvb3QvdGktazMt
aW1hZ2UtZ2VuL3RpLWszLWltYWdlLWdlbi5tawo+PiBAQCAtMjksMTAgKzI5LDIxIEBAIFRJX0sz
X0lNQUdFX0dFTl9GV19UWVBFID0gJChjYWxsIHFzdHJpcCwkKEJSMl9UQVJHRVRfVElfSzNfSU1B
R0VfR0VOX0ZXX1RZUEUpKQo+PiAgVElfSzNfSU1BR0VfR0VOX1NPQyA9ICQoY2FsbCBxc3RyaXAs
JChCUjJfVEFSR0VUX1RJX0szX0lNQUdFX0dFTl9TT0MpKQo+PiAgVElfSzNfSU1BR0VfR0VOX1NF
Q1RZUEUgPSAkKGNhbGwgcXN0cmlwLCQoQlIyX1RBUkdFVF9USV9LM19JTUFHRV9HRU5fU0VDVFlQ
RSkpCj4+ICAKPj4gLVRJX0szX0lNQUdFX0dFTl9TWVNGVyA9ICQoVElfSzNfSU1BR0VfR0VOX0ZX
X1RZUEUpLWZpcm13YXJlLSQoVElfSzNfSU1BR0VfR0VOX1NPQyktJChUSV9LM19JTUFHRV9HRU5f
U0VDVFlQRSkuYmluCj4+ICtpZmVxICgkKEJSMl9UQVJHRVRfVElfSzNfSU1BR0VfR0VOX1NFQ1RZ
UEVfR1ApLHkpCj4+ICtUSV9LM19JTUFHRV9HRU5fU1lTRlcgPSBcCj4+ICsJJChUSV9LM19JTUFH
RV9HRU5fRldfVFlQRSktZmlybXdhcmUtJChUSV9LM19JTUFHRV9HRU5fU09DKS0kKFRJX0szX0lN
QUdFX0dFTl9TRUNUWVBFKS5iaW4KPj4gK2Vsc2UKPj4gK1RJX0szX0lNQUdFX0dFTl9ERVBFTkRF
TkNJRVMgKz0gdGktazMtY29yZS1zZWNkZXYKPj4gKwo+PiArVElfSzNfSU1BR0VfR0VOX1NZU0ZX
ID0gXAo+PiArCSQoVElfSzNfSU1BR0VfR0VOX0ZXX1RZUEUpLWZpcm13YXJlLSQoVElfSzNfSU1B
R0VfR0VOX1NPQyktJChUSV9LM19JTUFHRV9HRU5fU0VDVFlQRSktZW5jLmJpbiBcCj4+ICsJJChU
SV9LM19JTUFHRV9HRU5fRldfVFlQRSktZmlybXdhcmUtJChUSV9LM19JTUFHRV9HRU5fU09DKS0k
KFRJX0szX0lNQUdFX0dFTl9TRUNUWVBFKS1jZXJ0LmJpbgo+PiArZW5kaWYKPj4gIAo+PiAgZGVm
aW5lIFRJX0szX0lNQUdFX0dFTl9DT05GSUdVUkVfQ01EUwo+PiAtCWNwICQoQklOQVJJRVNfRElS
KS90aS1zeXNmdy8kKFRJX0szX0lNQUdFX0dFTl9TWVNGVykgJChARCkKPj4gKwkkKGZvcmVhY2gg
dCwkKFRJX0szX0lNQUdFX0dFTl9TWVNGVyksXAo+PiArCQljcCAkKEJJTkFSSUVTX0RJUikvdGkt
c3lzZncvJCh0KSAkKEBEKS8KPj4gKwkpCj4+ICBlbmRlZgo+PiAgCj4+ICBkZWZpbmUgVElfSzNf
SU1BR0VfR0VOX0JVSUxEX0NNRFMKPj4gQEAgLTQwLDYgKzUxLDcgQEAgZGVmaW5lIFRJX0szX0lN
QUdFX0dFTl9CVUlMRF9DTURTCj4+ICAJJChCUjJfTUFLRSkgLUMgJChARCkgXAo+PiAgCQlTT0M9
JChUSV9LM19JTUFHRV9HRU5fU09DKSBcCj4+ICAJCVNPQ19UWVBFPSQoVElfSzNfSU1BR0VfR0VO
X1NFQ1RZUEUpIFwKPj4gKwkJVElfU0VDVVJFX0RFVl9QS0c9JChCSU5BUklFU19ESVIpIFwKPj4g
IAkJQ09ORklHPWV2bSBcCj4+ICAJCUNST1NTX0NPTVBJTEU9JChIT1NUX0RJUikvYmluL2FybS1u
b25lLWVhYmktIFwKPj4gIAkJU0JMPSQoQklOQVJJRVNfRElSKS9yNS11LWJvb3Qtc3BsLmJpbiBc
Cj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWls
ZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMu
YnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
