Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6448EC433EF
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 11:55:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D872760AF7;
	Sat,  8 Jan 2022 11:55:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZyvtyleyvPne; Sat,  8 Jan 2022 11:55:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 13D9C60AB7;
	Sat,  8 Jan 2022 11:55:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 398511BF34E
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 11:55:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1C8448176F
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 11:55:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=smile-fr.20210112.gappssmtp.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BXdtU9XrmKCA for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 11:55:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A6E3A81417
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 11:55:42 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id q8so16280459wra.12
 for <buildroot@buildroot.org>; Sat, 08 Jan 2022 03:55:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=1UJnzY63R9+3J2X0AAJpf6B2HZodOIowy5ngU11cMuU=;
 b=6yr1QIQrphvsqM6E392BA9+BKuvNrDeKA4yclkpRFJ6K7KrYYew6HjGQNyYQe9a+UY
 U4zei6f2j8SgtFw44pDtDuDTJVkjfuqosdHUbtfJhD3Z/jCk0nm2ihAT9/oWCz3j+p8M
 IXM1m651QjxrD7s6ku0EN2x187b+3Ku8Sb1vxbFuYH8C9tedxG8CZkA4CHqJW3EEvhdP
 fcH53vKdgH9s2OARHzQkv5NDorzAO769Sk+1R0GOaSV8cQLKYoVDf2EzKdxqXIS2cZ2l
 AP9Cz5VeiA20DushvBmeeAkrWlp4Sq8AHArQ+plYY8PygH0vEBDE+uhZtGQhEQdEs057
 tC2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=1UJnzY63R9+3J2X0AAJpf6B2HZodOIowy5ngU11cMuU=;
 b=ZBpcBJwJFwyaXQ3LWQ/ykdzF3qnrjnxJ2AIOtiYW86Yb/VAwIqfwFAmZGZuTV86oW1
 vFTue1eISYCDHgg688xSb0Dxx2DAyZIz5c8u4kyupE9u4TnLqpsM3b2GLN2t3Z3mT/Qz
 VWvQc8ApwGr3B+40b04zjavM9/dSTj4pDUXS9FVbxnnRrEyYSGzl9MO59Kc1KwsIaPlZ
 SQPervS/mIUEb9UvGYpPUXdIpKASu16OHq85jXDR8VildC/NkhzaFWlhgGHUvhThy/3a
 H2/9nLNrnDOQ6DrLaXoBFOE84XpFC/DcESI2ccLnhedar68ZEq+aJ74RcVB1GEpo/FFq
 lrGQ==
X-Gm-Message-State: AOAM53042zN5QtbvXCRpfiDW6YOVaFSHsyym4AEi9SSbppKlf4/lZwis
 Yki2K9IV8TkQ8puRM25NMGo+xGfoVAePfg==
X-Google-Smtp-Source: ABdhPJwRDx1uJ6Zw94EIR5nyY4aieScD6O+kuH7msqq+CoMUu3r50Ei8xTxrWBwbAFzTMu5qq4qqtw==
X-Received: by 2002:a5d:4d09:: with SMTP id z9mr58862627wrt.641.1641642940610; 
 Sat, 08 Jan 2022 03:55:40 -0800 (PST)
Received: from ?IPV6:2a01:cb05:8f8a:1800:1c97:b8d1:b477:d53f?
 (2a01cb058f8a18001c97b8d1b477d53f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:1c97:b8d1:b477:d53f])
 by smtp.gmail.com with ESMTPSA id y17sm881005wrr.84.2022.01.08.03.55.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 08 Jan 2022 03:55:39 -0800 (PST)
Message-ID: <06dd49b7-5abc-7a18-2d56-3f69e624e8b7@smile.fr>
Date: Sat, 8 Jan 2022 12:55:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: fr
To: Norbert Lange <nolange79@gmail.com>, buildroot@buildroot.org
References: <20201126144745.502228-1-nolange79@gmail.com>
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <20201126144745.502228-1-nolange79@gmail.com>
Subject: Re: [Buildroot] [PATCH v3 1/1] package/systemd: add support for
 creating journal catalog DB
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gTm9yYmVydCwKCkxlIDI2LzExLzIwMjAgw6AgMTU6NDcsIE5vcmJlcnQgTGFuZ2UgYSDD
qWNyaXTCoDoKPiBqb3VybmFsZCBzdXBwb3J0cyBjYXRhbG9nIGZpbGVzLCBvciByYXRoZXIgYSBi
aW5hcnkgZGF0YWJhc2Ugb2YKPiB0aG9zZS4KPiBGdW5jdGlvbmFsaXR5IGFkZGVkIGluY2x1ZGVz
Ogo+IAo+IC0gICBBIGNvbmZpZyBvcHRpb24gYWxsb3dzIGVuYWJsaW5nIHRoZSBiaW5hcnkgZGF0
YWJhc2UuCj4gCj4gLSAgIGlmIHRoZSBvcHRpb24gaXMgZW5hYmxlZCwgdGhlIGRhdGFiYXNlIGlz
IGJ1aWx0IGFuZCBtb3ZlZCB0bwo+ICAgICAvdXNyL3NoYXJlL2ZhY3RvcnkuIEEgc3ltbGluayBp
cyBjcmVhdGVkIGluIC92YXIgcG9pbnRpbmcgdG8KPiAgICAgdGhhdCBmaWxlLgo+ICAgICBJZiBC
UjJfRU5BQkxFX0xPQ0FMRV9QVVJHRSBpcyBlbmFibGVkLCB0aGUgY2F0YWxvZ3Mgbm90IGluIHRo
ZQo+ICAgICBsYW5ndWFnZSB3aGl0ZWxpc3QgYXJlIGRlbGV0ZWQgZmlyc3QuCj4gCj4gLSAgIHRo
ZSBzZXJ2aWNlIG5vcm1hbGx5IHVzZWQgZm9yIGNyZWF0aW5nIHRoZSBEQiBkdXJpbmcgYm9vdCwK
PiAgICAgYW5kIHRoZSBjYXRhbG9nIHNvdXJjZSBmaWxlcyB1c2VkIGFzIGlucHV0IGFyZSBkZWxl
dGVkLgo+IAo+IFRoZSBtb3ZlIHRvIC91c3Ivc2hhcmUvZmFjdG9yeSBpcyBoZWxwZnVsIGZvciBo
YXZpbmcgL3VzciBhcyB3aG9sZQo+IHN5c3RlbSBkaXN0cmlidXRpb24uCj4gCj4gU2lnbmVkLW9m
Zi1ieTogTm9yYmVydCBMYW5nZSA8bm9sYW5nZTc5QGdtYWlsLmNvbT4KPiAtLS0KPiB2MS0+djI6
Cj4gLSAgIE1vdmVkIGFsbCBsb2dpYyBpbnRvIHN5c3RlbWQubWsKPiAtICAgc29sdmVkIHRoZSBM
T0NBTEVfUFVSR0Ugb3JkZXIgdGhhdCB3YXkKPiAtICAgdXNlIHRoZSBmYWN0b3J5IHRvIHN0b3Jl
IHRoZSBmaWxlCj4gLSAgIG9wdGlvbiB0byBlbmFibGUgdGhlIERCIChzaW1pbGFyIHRvIHVkZXYg
SFdEQikKPiAtICAgY2FudCBiZSBhbmFibGVkIHdpdGggIVJPT1RGU19SVywgdG9ucyBvZgo+ICAg
ICBpc3N1ZXMgd2l0aCB0aGF0IG9uZQo+IHYyLT52MzoKPiAtICAgdXNlIGJhY2t0aWNrcyBpbnN0
ZWFkIG9mICQkKCkKPiAtICAgYmUgbW9yZSBleHBsaWNpdCBhYm91dCB3aGF0IGhhcHBlbnMgaW4K
PiAgICAgU1lTVEVNRF9MT0NBTEVfUFVSR0VfQ0FUQUxPR1MKPiAKPiBTaWduZWQtb2ZmLWJ5OiBO
b3JiZXJ0IExhbmdlIDxub2xhbmdlNzlAZ21haWwuY29tPgo+IC0tLQo+ICBwYWNrYWdlL3N5c3Rl
bWQvQ29uZmlnLmluICB8IDE0ICsrKysrKysrKysrKysKPiAgcGFja2FnZS9zeXN0ZW1kL3N5c3Rl
bWQubWsgfCA0MSArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+ICAyIGZp
bGVzIGNoYW5nZWQsIDU1IGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9z
eXN0ZW1kL0NvbmZpZy5pbiBiL3BhY2thZ2Uvc3lzdGVtZC9Db25maWcuaW4KPiBpbmRleCBlYzM0
NDc4ZTNkLi5kNTc2ZTYwMzViIDEwMDY0NAo+IC0tLSBhL3BhY2thZ2Uvc3lzdGVtZC9Db25maWcu
aW4KPiArKysgYi9wYWNrYWdlL3N5c3RlbWQvQ29uZmlnLmluCj4gQEAgLTI2OSw2ICsyNjksMjAg
QEAgY29uZmlnIEJSMl9QQUNLQUdFX1NZU1RFTURfSU1QT1JURAo+ICAKPiAgCSAgaHR0cDovL3d3
dy5mcmVlZGVza3RvcC5vcmcvc29mdHdhcmUvc3lzdGVtZC9tYW4vbWFjaGluZWN0bC5odG1sI0lt
YWdlJTIwVHJhbnNmZXIlMjBDb21tYW5kcwo+ICAKPiArY29uZmlnIEJSMl9QQUNLQUdFX1NZU1RF
TURfQ0FUQUxPR0RCCj4gKwlib29sICJlbmFibGUgam91cm5hbCBjYXRhbG9nIGRhdGFiYXNlIGlu
c3RhbGxhdGlvbiIKPiArCWRlcGVuZHMgb24gQlIyX1RBUkdFVF9HRU5FUklDX1JFTU9VTlRfUk9P
VEZTX1JXICMgY29uZmxpY3RpbmcgdG1wZmlsZXMgbWFnaWMKPiArCWhlbHAKPiArCSAgQnVpbGQg
YW5kIGluc3RhbGwgdGhlIGpvdXJuYWwgY2F0YWxvZyBkYXRhYmFzZS4KPiArCj4gKwkgIGNhdGFs
b2cgZmlsZXMgYXJlIHVzZWQgdG8gcHJvdmlkZSBleHRlbmRlZCBhbmQgcG90ZW50aWFsbHkgbG9j
YWxpemVkCj4gKwkgIG1lc3NhZ2VzIGZvciB0aGUgam91cm5hbC4KPiArCj4gKwkgIFRoZSBvcmln
aW5hbCBjYXRhbG9nIGZpbGVzIHdpbGwgYmUgYnVpbHQgaW50byBhIERCIGF0Cj4gKwkgIC91c3Iv
c2hhcmUvZmFjdG9yeS92YXIvbGliL3N5c3RlbWQvY2F0YWxvZy9kYXRhYmFzZS4KPiArCj4gKwkg
IGh0dHBzOi8vd3d3LmZyZWVkZXNrdG9wLm9yZy93aWtpL1NvZnR3YXJlL3N5c3RlbWQvY2F0YWxv
Zy8KPiArCj4gIGNvbmZpZyBCUjJfUEFDS0FHRV9TWVNURU1EX0xPQ0FMRUQKPiAgCWJvb2wgImVu
YWJsZSBsb2NhbGUgZGFlbW9uIgo+ICAJaGVscAo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3N5c3Rl
bWQvc3lzdGVtZC5tayBiL3BhY2thZ2Uvc3lzdGVtZC9zeXN0ZW1kLm1rCj4gaW5kZXggY2IxMmY2
NjdkNi4uYWU5OWMwMmFiZiAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL3N5c3RlbWQvc3lzdGVtZC5t
awo+ICsrKyBiL3BhY2thZ2Uvc3lzdGVtZC9zeXN0ZW1kLm1rCj4gQEAgLTYxMyw2ICs2MTMsNDcg
QEAgZGVmaW5lIFNZU1RFTURfSU5TVEFMTF9JTklUX1NZU1RFTUQKPiAgCSQoU1lTVEVNRF9JTlNU
QUxMX05FVFdPUktfQ09ORlMpCj4gIGVuZGVmCj4gIAo+ICtpZmVxICgkKEJSMl9FTkFCTEVfTE9D
QUxFX1BVUkdFKSx5KQo+ICtkZWZpbmUgU1lTVEVNRF9MT0NBTEVfUFVSR0VfQ0FUQUxPR1MKPiAr
CSMgZ28gdGhyb3VnaCBhbGwgZmlsZXMgd2l0aCBzY2hlbWUgPGJhc2VuYW1lPi48bGFuZ2V4dD4u
Y2F0YWxvZwo+ICsJIyBhbmQgcmVtb3ZlIHRob3NlIHdoZXJlIDxsYW5nZXh0PiBpcyBub3QgaW4g
TE9DQUxFX05PUFVSR0UKPiArCWZvciBjZmlsZSBpbiBgZmluZCAkKFRBUkdFVF9ESVIpL3Vzci9s
aWIvc3lzdGVtZC9jYXRhbG9nIC1uYW1lICcqLiouY2F0YWxvZydgOyBcCgpXaHkgbm90ICJzeXN0
ZW1kLiouY2F0YWxvZyIgPwoKT24gbXkgc3lzdGVtLCBhbGwgY2F0YWxvZyBmaWxlcyB3aXRoIDxs
YW5nZXh0PiBhcmUgbmFtbWVkIHN0YXJ0aW5nIHdpdGggInN5c3RlbWQuIgoKPiArCWRvIFwKPiAr
CQliYXNlbmFtZT0kJHtjZmlsZSMjKi99OyBcCj4gKwkJYmFzZW5hbWU9JCR7YmFzZW5hbWUlLmNh
dGFsb2d9OyBcCj4gKwkJbGFuZ2V4dD0kJHtiYXNlbmFtZSMqLn07IFwKPiArCQlbICIkJGxhbmdl
eHQiID0gIiQke2Jhc2VuYW1lfSIgXSAmJiBjb250aW51ZTsgXAo+ICsJCWV4cHIgJyQoTE9DQUxF
X05PUFVSR0UpJyA6ICIuKlxiJCR7bGFuZ2V4dH1cYiIgPi9kZXYvbnVsbCAmJiBjb250aW51ZTsg
XAo+ICsJCXJtIC1mICIkJGNmaWxlIjsgXAo+ICsJZG9uZQo+ICtlbmRlZgo+ICsKPiArU1lTVEVN
RF9ST09URlNfUFJFX0NNRF9IT09LUyArPSBTWVNURU1EX0xPQ0FMRV9QVVJHRV9DQVRBTE9HUwo+
ICtlbmRpZgo+ICsKPiAraWZlcSAoJChCUjJfUEFDS0FHRV9TWVNURU1EX0NBVEFMT0dEQikseSkK
PiArZGVmaW5lIFNZU1RFTURfVVBEQVRFX0NBVEFMT0dTCj4gKwkkKEhPU1RfRElSKS9iaW4vam91
cm5hbGN0bCAtLXJvb3Q9JChUQVJHRVRfRElSKSAtLXVwZGF0ZS1jYXRhbG9nCj4gKwlpbnN0YWxs
IC1EICQoVEFSR0VUX0RJUikvdmFyL2xpYi9zeXN0ZW1kL2NhdGFsb2cvZGF0YWJhc2UgXAo+ICsJ
CSQoVEFSR0VUX0RJUikvdXNyL3NoYXJlL2ZhY3RvcnkvdmFyL2xpYi9zeXN0ZW1kL2NhdGFsb2cv
ZGF0YWJhc2UKPiArCXJtICQoVEFSR0VUX0RJUikvdmFyL2xpYi9zeXN0ZW1kL2NhdGFsb2cvZGF0
YWJhc2UKPiArCWxuIC1zZiAvdXNyL3NoYXJlL2ZhY3RvcnkvdmFyL2xpYi9zeXN0ZW1kL2NhdGFs
b2cvZGF0YWJhc2UgXAo+ICsJCSQoVEFSR0VUX0RJUikvdmFyL2xpYi9zeXN0ZW1kL2NhdGFsb2cv
ZGF0YWJhc2UKPiArCWdyZXAgLXEgJ15MIC92YXIvbGliL3N5c3RlbWQvY2F0YWxvZy9kYXRhYmFz
ZScgJChUQVJHRVRfRElSKS91c3IvbGliL3RtcGZpbGVzLmQvdmFyLmNvbmYgfHwgXAo+ICsJCXBy
aW50ZiAiXG5MIC92YXIvbGliL3N5c3RlbWQvY2F0YWxvZy9kYXRhYmFzZVxuIiA+PiAkKFRBUkdF
VF9ESVIpL3Vzci9saWIvdG1wZmlsZXMuZC92YXIuY29uZgo+ICtlbmRlZgo+ICsKPiArU1lTVEVN
RF9ST09URlNfUFJFX0NNRF9IT09LUyArPSBTWVNURU1EX1VQREFURV9DQVRBTE9HUwo+ICtlbmRp
Zgo+ICsKPiArZGVmaW5lIFNZU1RFTURfUk1fQ0FUQUxPR19VUERBVEVfU0VSVklDRQo+ICsJcm0g
LXJmICQoVEFSR0VUX0RJUikvdXNyL2xpYi9zeXN0ZW1kL2NhdGFsb2cgXAoKU28gd2UgcmVtb3Zl
IHRoaXMgZGlyZWN0b3J5LgoKV2h5IGFkZGluZyBTWVNURU1EX0xPQ0FMRV9QVVJHRV9DQVRBTE9H
UyB0aGVuID8KCkJlc3QgcmVnYXJkcywKUm9tYWluCgoKPiArCQkkKFRBUkdFVF9ESVIpL3Vzci9s
aWIvc3lzdGVtZC9zeXN0ZW0vc3lzdGVtZC1qb3VybmFsLWNhdGFsb2ctdXBkYXRlLnNlcnZpY2Ug
XAo+ICsJCSQoVEFSR0VUX0RJUikvdXNyL2xpYi9zeXN0ZW1kL3N5c3RlbS8qL3N5c3RlbWQtam91
cm5hbC1jYXRhbG9nLXVwZGF0ZS5zZXJ2aWNlCj4gK2VuZGVmCj4gKwo+ICtTWVNURU1EX1JPT1RG
U19QUkVfQ01EX0hPT0tTICs9IFNZU1RFTURfUk1fQ0FUQUxPR19VUERBVEVfU0VSVklDRQo+ICsK
PiAgZGVmaW5lIFNZU1RFTURfUFJFU0VUX0FMTAo+ICAJJChIT1NUX0RJUikvYmluL3N5c3RlbWN0
bCAtLXJvb3Q9JChUQVJHRVRfRElSKSBwcmVzZXQtYWxsCj4gIGVuZGVmCj4gCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBs
aXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
