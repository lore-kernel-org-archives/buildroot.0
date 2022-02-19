Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6894C433EF
	for <buildroot@archiver.kernel.org>; Sat, 19 Feb 2022 16:43:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 48D89400B8;
	Sat, 19 Feb 2022 16:43:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id w1UwtyTr6P7v; Sat, 19 Feb 2022 16:43:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0730A40111;
	Sat, 19 Feb 2022 16:43:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8808D1BF588
 for <buildroot@lists.busybox.net>; Sat, 19 Feb 2022 16:43:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 83342605BA
 for <buildroot@lists.busybox.net>; Sat, 19 Feb 2022 16:43:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jlkTkAsNeFNH for <buildroot@lists.busybox.net>;
 Sat, 19 Feb 2022 16:43:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 71A4E605A6
 for <buildroot@buildroot.org>; Sat, 19 Feb 2022 16:43:52 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id f3so19496602wrh.7
 for <buildroot@buildroot.org>; Sat, 19 Feb 2022 08:43:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=rXocVkVWml2E+mAY2Mm/WgQQTxGpeMlHEql6ImZ8UHs=;
 b=TOnZLq8XdzTlcbqSO7T4XkpfYsmO8HnxVsyZYooJJz7+Fi0h/h1W82xvc10+eYMCmt
 1xAPyMNtgmI/5Vh2601WD2bkBvcvqy8fOB/wt9OoBrifEATLjB4zYxAsX6VfrbDns6sk
 yfsptC8BKzlKjewwVnaGkzOzQk3/nPKx0hGr8jGi01KdD06bmb2ZGBzQlZWMejPvqWYg
 cl3NSIZF3svvJM2rX7BKReSaC7+kvATmaJ0DfO/WIXQvL7LJG4yW58XThQKi9C9DM2uf
 JbjuqfZBNdViw1GnKinbIvhQfCZyPZK4O4NVGS2d49V46xGfniEjZKSe0etjXtG9dy0w
 r8ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=rXocVkVWml2E+mAY2Mm/WgQQTxGpeMlHEql6ImZ8UHs=;
 b=J91XS4DZYQAPjFwHIcSfYr9elZ1qD/3ZtvAyhUTz+eNTlaWCSR4rq+4Y+eefxWhXon
 Ftmtu8XFpehv3lpDVUgJ1nAlLoEKP3a9YUybfU2S+rCKKv6pmCeSocJxSGtWZaT4OPay
 Gwgcn39H5mZdIHcwZg3dRuOLN78sg15GfNwLOxA0txFFx1/i8LUQKB2dWs/DaYa2/9/O
 eD73YaGUg0lR4ku2iOR4DwhiLbvug3urmoABWZPoui6IdDXvT1m4swK461I2nT4WuLkH
 8UY6QW3pFs3VxcQx5TVnFH8YM6w9hdw1n8AOtNVEHChOkHMTfdK6ZOxWiC9jX0PTArDW
 9syg==
X-Gm-Message-State: AOAM533FJbhNtK31u5aijVMpS/7+mFE/GQxdk9aNY3PaPchTc1NlQ5tL
 CPb7hmGC99rDgrBQpZBuy3Y=
X-Google-Smtp-Source: ABdhPJyCVu8UO2sLSl2w8Ovy9vZu8thgUcTz0QVtH30Eg2OsQDpmYpZ74hIHzi1aZwPPU3MriBKFfA==
X-Received: by 2002:a5d:59a6:0:b0:1e8:580f:9f5b with SMTP id
 p6-20020a5d59a6000000b001e8580f9f5bmr9809963wrr.64.1645289030400; 
 Sat, 19 Feb 2022 08:43:50 -0800 (PST)
Received: from ?IPV6:2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521?
 (2a01cb058f8a18003dbee9eed79eb521.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521])
 by smtp.gmail.com with ESMTPSA id n6sm26799575wru.114.2022.02.19.08.43.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 19 Feb 2022 08:43:49 -0800 (PST)
Message-ID: <4429b2e9-f78b-30e6-849a-c1567ea83e12@gmail.com>
Date: Sat, 19 Feb 2022 17:43:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20220101225906.2341845-1-fontaine.fabrice@gmail.com>
 <87bl0t1a9o.fsf@gmail.com> <114f25cd-b392-fbde-ce20-eef87447f1c0@gmail.com>
 <e9fbdbb9-5ba3-cae6-7492-4a287c3ba2fd@gmail.com>
 <CAPi7W83+xLBCC=U2gdtcQW2+LK3kjrxB+6Z-toM+f5qD6grTXQ@mail.gmail.com>
From: Romain Naour <romain.naour@gmail.com>
In-Reply-To: <CAPi7W83+xLBCC=U2gdtcQW2+LK3kjrxB+6Z-toM+f5qD6grTXQ@mail.gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/lxc: bump to version 4.0.11
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
Cc: Joachim Wiberg <troglobit@gmail.com>,
 =?UTF-8?B?SsOpcsO0bWUgUG91aWxsZXI=?= <jezz@sysmic.org>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gRmFicmljZSwKCkxlIDE5LzAyLzIwMjIgw6AgMTY6MjAsIEZhYnJpY2UgRm9udGFpbmUg
YSDDqWNyaXTCoDoKPiBIZWxsbywKPiAKPiBMZSBzYW0uIDE5IGbDqXZyLiAyMDIyIMOgIDEwOjIw
LCBSb21haW4gTmFvdXIgPHJvbWFpbi5uYW91ckBnbWFpbC5jb20+IGEgw6ljcml0IDoKPj4KPj4g
SGVsbG8sCj4+Cj4+IExlIDMwLzAxLzIwMjIgw6AgMTc6MzYsIFJvbWFpbiBOYW91ciBhIMOpY3Jp
dCA6Cj4+PiBIZWxsbyBGYWJyaWNlLCBKb2FjaGltLCBBbGwsCj4+Pgo+Pj4gTGUgMDMvMDEvMjAy
MiDDoCAwOTo0MSwgSm9hY2hpbSBXaWJlcmcgYSDDqWNyaXQgOgo+Pj4+IE9uIFNhdCwgSmFuIDAx
LCAyMDIyIGF0IDIzOjU5LCBGYWJyaWNlIEZvbnRhaW5lIDxmb250YWluZS5mYWJyaWNlQGdtYWls
LmNvbT4gd3JvdGU6Cj4+Pj4+IFRoZSBMWEMgNC4wIGJyYW5jaCBpcyBzdXBwb3J0ZWQgdW50aWwg
SnVuZSAyMDI1Lgo+Pj4+PiBPbmx5IGJ1Z2ZpeGVzIGFuZCBzZWN1cml0aXkgaXNzdWVzIGdldCBp
bmNsdWRlZCBpbnRvIHRoZSBzdGFibGUgYnVnZml4Cj4+Pj4+IHJlbGVhc2VzLCBzbyBpdCdzIGFs
d2F5cyBzYWZlIGFuZCByZWNvbW1lbmRlZCB0byBrZWVwIHVwIGFuZCBydW4gdGhlCj4+Pj4+IGxh
dGVzdCBidWdmaXggcmVsZWFzZS4KPj4+Cj4+PiBXZWxsIGl0IGFsc28gaW5jbHVkZXMgbmV3IGZl
YXR1cmVzIHNpbmNlIHRoaXMgdmVyc2lvbiBidW1wIGJyZWFrIGx4YyB3aXRoIGFsbAo+Pj4ga2Vy
bmVsIDwgNS42IGR1ZSB0byB0aGUgYnJva2VuIGZhbGwgYmFjayB3aGVuIHRoZSBuZXcgbW91bnQg
QVBJIGlzIG5vdCBzdXBwb3J0ZWQuCj4+Pgo+Pj4gV2UgaGF2ZSBhIHRlc3QgZm9yIGx4YyB1c2lu
ZyBhIGtlcm5lbCA0LjE5IHRoYXQgdHJpZ2dlciB0aGlzIGlzc3VlIFsxXS4KPj4+Cj4+PiBTZWUg
bHhjLmxvZzoKPj4+Cj4+PiAoa2VybmVsIDUuNSkKPj4+IERFQlVHIGNvbmYgLSBjb25mLmM6bHhj
X3NldHVwX2RldnB0c19jaGlsZDoxNjgyIC0gTm8gbmV3IGRldnB0cyBpbnN0YW5jZSB3aWxsIGJl
Cj4+PiBtb3VudGVkIHNpbmNlIG5vIHB0cyBkZXZpY2VzIGFyZSByZXF1aXJlZAo+Pj4gbHhjLXN0
YXJ0IGx4Y19pcGVyZjMgIERFQlVHIGNvbmYgLSBjb25mLmM6bHhjX3NldHVwX2Rldl9jb25zb2xl
OjE5NjYgLSBDbGVhcmVkCj4+PiBhbGwgKDApIG1vdW50cyBmcm9tICIvZGV2L2NvbnNvbGUiCj4+
PiBseGMtc3RhcnQgbHhjX2lwZXJmMyAgRVJST1IgbW91bnRfdXRpbHMgLSBtb3VudF91dGlscy5j
Om1vdW50X2F0OjY2MSAtIE5vIHN1Y2gKPj4+IGZpbGUgb3IgZGlyZWN0b3J5IC0gRmFpbGVkIHRv
IG1vdW50ICIvcHJvYy9zZWxmL2ZkLzQ0IiB0byAiL3Byb2Mvc2VsZi9mZC80MyIKPj4+IGx4Yy1z
dGFydCBseGNfaXBlcmYzICBFUlJPUiBjb25mIC0gY29uZi5jOmx4Y19zZXR1cF9kZXZfY29uc29s
ZToxOTg4IC0gTm8gc3VjaAo+Pj4gZmlsZSBvciBkaXJlY3RvcnkgLSBGYWlsZWQgdG8gbW91bnQg
IjEwKC9kZXYvcHRzLzApIiBvbiAiNDMiCj4+PiBseGMtc3RhcnQgbHhjX2lwZXJmMyAgRVJST1Ig
Y29uZiAtIGNvbmYuYzpseGNfc2V0dXBfY29uc29sZToyMTQzIC0gTm8gc3VjaCBmaWxlCj4+PiBv
ciBkaXJlY3RvcnkgLSBGYWlsZWQgdG8gc2V0dXAgY29uc29sZQo+Pj4KPj4+IChrZXJuZWwgNS42
KQo+Pj4gbHhjLXN0YXJ0IGx4Y19pcGVyZjMgIFRSQUNFIG1vdW50X3V0aWxzIC0gbW91bnRfdXRp
bHMuYzpjYW5fdXNlX21vdW50X2FwaTo1ODIgLQo+Pj4gS2VybmVsIHN1cHBvcnRzIG1vdW50IGFw
aQo+Pj4gbHhjLXN0YXJ0IGx4Y19pcGVyZjMgIFRSQUNFIG1vdW50X3V0aWxzIC0gbW91bnRfdXRp
bHMuYzptb3ZlX2RldGFjaGVkX21vdW50OjMyOAo+Pj4gLSBBdHRhY2ggZGV0YWNoZWQgbW91bnQg
NDUgdG8gZmlsZXN5c3RlbSBhdCA0Mwo+Pj4gbHhjLXN0YXJ0IGx4Y19pcGVyZjMgIFRSQUNFIGNv
bmYgLSBjb25mLmM6bHhjX3NldHVwX2Rldl9jb25zb2xlOjE5OTAgLSBTZXR1cAo+Pj4gY29uc29s
ZSAiL2Rldi9wdHMvMCIKPj4+Cj4+PiBbMV0gaHR0cHM6Ly9naXRsYWIuY29tL2J1aWxkcm9vdC5v
cmcvYnVpbGRyb290Ly0vam9icy8yMDA2Nzk4OTk4Cj4+Pgo+Pj4gVGhpcyBpc3N1ZSBpcyBub3Qg
eWV0IGZpeGVkIGluIGx4YyBzdGFibGUtNC4wIGJyYW5jaC4KPj4+Cj4+PiBDYW4geW91IGhhdmUg
YSBsb29rPwo+Pgo+PiBwaW5nLgo+IEhvdyBjYW4gSSByZXByb2R1Y2UgdGhlIHByb2JsZW0gbG9j
YWxseSBzbyBJIGNhbiBvcGVuIGEgYnVnIG9uCj4gaHR0cHM6Ly9naXRodWIuY29tL2x4Yy9seGMv
aXNzdWVzPwo+IEkgdHJpZWQgdG8gbGF1bmNoIHJ1bi10ZXN0cyBmcm9tIGN1cnJlbnQgbWFzdGVy
IGJ1dCBpdCBpcyAic3R1Y2siIGluCj4gIkJ1aWxkaW5nIGRvbmUiOgo+IAo+IC4vc3VwcG9ydC90
ZXN0aW5nL3J1bi10ZXN0cyAtbyB0ZXN0LW91dHB1dC8gLWQgdGVzdC1kbC8gLWsKPiAtLXRpbWVv
dXQtbXVsdGlwbGllciAxMCB0ZXN0cy5wYWNrYWdlLnRlc3RfbHhjLlRlc3RMeGMKPiAxNTozNjoz
NSBUZXN0THhjICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFN0YXJ0aW5nCj4gMTU6
MzY6MzUgVGVzdEx4YyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBCdWlsZGluZwo+
IDE1OjUxOjA0IFRlc3RMeGMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgQnVpbGRp
bmcgZG9uZQo+IAo+IFNvIEkgb3BlbmVkIHRlc3Qtb3V0cHV0L1Rlc3RMeGMtcnVuLmxvZyBhbmQg
Zm91bmQgb3V0IGEga2VybmVsIHBhbmljOgo+IAo+IEtlcm5lbCBwYW5pYyAtIG5vdCBzeW5jaW5n
OiBObyB3b3JraW5nIGluaXQgZm91bmQuICBUcnkgcGFzc2luZyBpbml0PQo+IG9wdGlvbiB0byBr
ZXJuZWwuIFNlZSBMaW51eCBEb2N1bWVudGF0aW9uL2FkbWluLWd1aWRlL2luaXQucnN0IGZvcgo+
IGd1aWRhbmNlCj4gCj4gSSBhc3N1bWUgdGhhdCBxZW11IGlzIG5vdCBhYmxlIHRvIHN0YXJ0IHRo
ZSBrZXJuZWwuCj4gRG8geW91IGhhdmUgc29tZSBhZHZpY2Ugb24gd2hhdCBjb3VsZCBnbyB3cm9u
Zz8KCldlaXJkLCBjYW4geW91IGNoZWNrIHlvdXIgcWVtdSB2ZXJzaW9uID8KCkknbSB1c2luZyBx
ZW11IDYuMS4wIGZyb20gRmVkb3JhIDM1IGFuZCBhbHNvIHRlc3RlZCBxZW11IDUuMi4wIGZyb20g
RGViaWFuIDExLgoKSWYgaXQgc3RpbGwgbm90IHdvcmtpbmcsIHlvdSBzaG91bGQgYmUgYWJsZSB0
byByZXByb2R1Y2UgdXNpbmcgdGhlIERvY2tlciBpbWFnZQp1c2VkIGluIGdpdGxhYi1jaS4gU2Vl
IHV0aWxzL2RvY2tlci1ydW4uCgpCZXN0IHJlZ2FyZHMsClJvbWFpbgoKCj4+Cj4+IEJlc3QgcmVn
YXJkcywKPj4gUm9tYWluCj4+Cj4+Pgo+Pj4gQmVzdCByZWdhcmRzLAo+Pj4gUm9tYWluCj4+Pgo+
Pj4KPj4+Pj4KPj4+Pj4gaHR0cHM6Ly9kaXNjdXNzLmxpbnV4Y29udGFpbmVycy5vcmcvdC9seGMt
NC0wLTExLWhhcy1iZWVuLXJlbGVhc2VkLzEyNDI3Cj4+Pj4+Cj4+Pj4+IFNpZ25lZC1vZmYtYnk6
IEZhYnJpY2UgRm9udGFpbmUgPGZvbnRhaW5lLmZhYnJpY2VAZ21haWwuY29tPgo+Pj4+Cj4+Pj4g
UmV2aWV3ZWQtYnk6IEpvYWNoaW0gV2liZXJnIDx0cm9nbG9iaXRAZ21haWwuY29tPgo+Pj4+IF9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4+Pj4gYnVpbGRy
b290IG1haWxpbmcgbGlzdAo+Pj4+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4+Pj4gaHR0cHM6
Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cj4+Pj4KPj4+
Cj4+Cj4gQmVzdCBSZWdhcmRzLAo+IAo+IEZhYnJpY2UKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290
QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8vYnVpbGRyb290Cg==
