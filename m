Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC199C433F5
	for <buildroot@archiver.kernel.org>; Sun,  9 Jan 2022 21:43:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7FEBC81410;
	Sun,  9 Jan 2022 21:43:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5-RsjIl9Pz9t; Sun,  9 Jan 2022 21:43:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B4D83813F4;
	Sun,  9 Jan 2022 21:42:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CD8E71BF3C0
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 21:42:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BB781813F4
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 21:42:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LAspFaQS5Ytn for <buildroot@lists.busybox.net>;
 Sun,  9 Jan 2022 21:42:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 648CB813D2
 for <buildroot@buildroot.org>; Sun,  9 Jan 2022 21:42:56 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id r9so21454722wrg.0
 for <buildroot@buildroot.org>; Sun, 09 Jan 2022 13:42:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=ETkp5M/wNwZBhS9kzHkuGCQU7xteSVawvirnI2KdLZ8=;
 b=jniC6m5SIU3m8kN91QBVJbVrYHRhujJgIFk+M+0Reuz1f1lnQ2a4kM9udMdxLGi6+C
 EXW9337R/+YBZ5QvDZOyW4HpHreuPFye9qDNJY0wsic7OKPZhwUNbVlvGZ1YDLQHRvzd
 O1LtERo3Xf4Ke/JFdK3hY4896zDOc/s3gG+JZ0RK8gFxQpwQIjzWqZ7D48+QsNwpZ/ZJ
 fIxJwdAk1VUf7RY+CD010JxH2fRdubrsAGS52AZjYpCb6j2DJPfLFE3FVyTDtHW/NyYf
 rOAonrwADDJgXrjb2Xk3TTKrBoIOWquiZNvId6BrmWT8AUKfXlxOb1Sca80bSkxH7qGc
 iRJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ETkp5M/wNwZBhS9kzHkuGCQU7xteSVawvirnI2KdLZ8=;
 b=Q2jfsLWow37xX08u4no2vmj818FoLcVrRo28p0l2hcIDBToGGd3Kpa7YRYt/G69MTd
 O6KUV9woRBEnEGo+ZnOADY4lhZWEWMdySwdn+r0s649Hi7wpil84a3pFcJ3mp2ua+Fl3
 zTPTYcq1LulNMybcZdqQGo+oAwcrxAX06bg83soITTsWaCz3RCwlw1TnIeMIPGZrPA6G
 XXoO+7/tJ+HE2vex77ZYWNx9M8UWKoOQfNJ2T9rvuOKdQnvsZ87EPc+YIaT99o9ghuN+
 /i4k36ZZH0mgiIVoYWVCmyMjfh/ZEI5O7Wgv+eaxF79fYSJrhrLV7sDaFuUaPffLqESP
 8Kkg==
X-Gm-Message-State: AOAM531lTvN5Nx13uiRy94LdePgBYAwY067/h3781vJhzQF4s+5HsOYL
 PPFu+ujtrOf61mn8EzssxGyrJg==
X-Google-Smtp-Source: ABdhPJxGdovFtF0yL978iHzXBv59RcEexsqvgZR3BXKuQxAbe0EUtTfFcVVZdXpZeVdmdYz+pmEpjQ==
X-Received: by 2002:adf:fc47:: with SMTP id e7mr2933462wrs.77.1641764574520;
 Sun, 09 Jan 2022 13:42:54 -0800 (PST)
Received: from ?IPV6:2a01:cb05:8f8a:1800:1c97:b8d1:b477:d53f?
 (2a01cb058f8a18001c97b8d1b477d53f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:1c97:b8d1:b477:d53f])
 by smtp.gmail.com with ESMTPSA id l6sm6716054wry.18.2022.01.09.13.42.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 09 Jan 2022 13:42:54 -0800 (PST)
Message-ID: <7c25f4d7-309c-6eb1-00de-552242a64a97@smile.fr>
Date: Sun, 9 Jan 2022 22:42:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-US
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20220109151414.1908259-1-romain.naour@smile.fr>
 <20220109200806.GD1477939@scaer>
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <20220109200806.GD1477939@scaer>
Subject: Re: [Buildroot] [PATCHv2 1/2] package/pkg-golang.mk: set GOPROXY to
 proxy.golang.org
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gWWFubiwgQWxsLAoKTGUgMDkvMDEvMjAyMiDDoCAyMTowOCwgWWFubiBFLiBNT1JJTiBh
IMOpY3JpdMKgOgo+IFJvbWFpbiwgQWxsLAo+IAo+IE9uIDIwMjItMDEtMDkgMTY6MTQgKzAxMDAs
IFJvbWFpbiBOYW91ciBzcGFrZSB0aHVzbHk6Cj4+IFdoaWxlIHBhY2thZ2luZyB0ZWxlZ3JhZiBb
MV0gdGhlIGRvd25sb2FkIHN0ZXAgZmFpbGVkIGR1ZSB0byBhIGNoZWNrc3VtCj4+IG1pc21hdGNo
Ogo+Pgo+PiAgICAgZ286IGRvd25sb2FkaW5nIGNvbGxlY3RkLm9yZyB2MC41LjAKPj4gICAgIGdl
dCAiY29sbGVjdGQub3JnIjogZm91bmQgbWV0YSB0YWcgdmNzLm1ldGFJbXBvcnR7UHJlZml4OiJj
b2xsZWN0ZC5vcmciLCBWQ1M6ImdpdCIsIFJlcG9Sb290OiJodHRwczovL2dpdGh1Yi5jb20vY29s
bGVjdGQvZ28tY29sbGVjdGQifSBhdCAvL2NvbGxlY3RkLm9yZy8/Z28tZ2V0PTEKPj4gICAgIHZl
cmlmeWluZyBjb2xsZWN0ZC5vcmdAdjAuNS4wOiBjaGVja3N1bSBtaXNtYXRjaAo+PiAgICAgICAg
IGRvd25sb2FkZWQ6IGgxOm1SVExkbGp2eEpOWFBNTU85UlN4ZjBQQU5EQXF1L1R6K0k2RHQ2T2pC
Mjg9Cj4+ICAgICAgICAgZ28uc3VtOiAgICAgaDE6eTR1RlNBdU9tZVZoRzNHQ1JhMy9vSCt5c2VQ
Zk8vK2VHSk5mZDBRYTNkOD0KPj4KPj4gICAgIFNFQ1VSSVRZIEVSUk9SCj4+ICAgICBUaGlzIGRv
d25sb2FkIGRvZXMgTk9UIG1hdGNoIGFuIGVhcmxpZXIgZG93bmxvYWQgcmVjb3JkZWQgaW4gZ28u
c3VtLgo+PiAgICAgVGhlIGJpdHMgbWF5IGhhdmUgYmVlbiByZXBsYWNlZCBvbiB0aGUgb3JpZ2lu
IHNlcnZlciwgb3IgYW4gYXR0YWNrZXIgbWF5Cj4+ICAgICBoYXZlIGludGVyY2VwdGVkIHRoZSBk
b3dubG9hZCBhdHRlbXB0Lgo+Pgo+PiAgICAgRm9yIG1vcmUgaW5mb3JtYXRpb24sIHNlZSAnZ28g
aGVscCBtb2R1bGUtYXV0aCcuCj4+Cj4+IGdvLWNvbGxlY3RkIHdhcyBidW1wZWQgaW4gdGVsZWdy
YWYgc2luY2Ugc2V2ZXJhbCByZWxlYXNlcyAoc2luY2UgdjEuMTkuMCkgd2l0aG91dAo+PiBhbnkg
Y2hhbmdlcyByZWdhcmRpbmcgdGhlIGdvLWNvbGxlY3RkIGhhc2guCj4+Cj4+IFNvbWUgdXNlcnMg
cmVwb3J0ZWQgYW4gaXNzdWUgWzNdIHdoZW4gdXNpbmcgIkdPUFJPWFk9ZGlyZWN0IiBhbmQgdXNl
ZAo+PiAiR09QUk9YWT1wcm94eS5nb2xhbmcub3JnIiBhcyBhIHdvcmthcm91bmQuCj4gCj4gSSds
bCBwdXQgZG93biB3aGF0IHdlIGRpc2N1c3NlZCBvbiBJUkM6Cj4gCj4gVW5mb3J0dW5hdGVseSwg
dGhlcmUgYXJlIGNhc2VzIHRoZSBvdGhlciB3YXkgYXJvdW5kOiB1c2luZyBhIHByb3h5IGJyb2tl
Cj4gdGhlIHZlbmRvcmluZywgd2hpbGUgYSBkaXJlY3QgY29ubmVjdGlvbiBzb2x2ZWQgaXQuIFNv
IHdlIHdvbid0IGJlIGFibGUKPiB0byBzYXRpc2Z5IGJvdGggY2FzZXMuCgpTdXJlLCBhdCBsZWFz
dCBJIHBvc3RlZCB0aGUgd29ya2Fyb3VuZCBvbiB0aGUgbWwuCgo+IAo+IEZ1cnRoZXJtb3JlLCBy
ZWx5aW5nIG9uIGEgcHJveHkgaGF2aW5nIGEgY2FjaGVkIGFyY2hpdmUgcmlza3MgYnJlYWtpbmcK
PiBpbiB0aGUgZnV0dXJlIGFueXdheSwgYXMgdGhhdCBhcmNoaXZlZCBtYXkgZ2V0IGV2ZW50dWFs
bHkgZ2V0IGV2aWN0ZWQKPiBvdXQgb2YgdGhlIGNhY2hlIG9mIHRoZSBwcm94eS4gT3IgdGhlIHBy
b3h5IG1heSBkaXNhcGVhciBpbiB0aGUgZnV0dXJlLAo+IG9yIHdoYXRldmVyLgo+IAo+IEluIGFu
eSBjYXNlLCBhIGJhZCBoYXNoIGlzIG1vc3QgcHJvYmFibHkgZHVlIHRvIG9uZSBvZiB0aGUgZm9s
bG93aW5nCj4gaXNzdWVzOgo+IAo+ICAgLSB1cHN0cmVhbSBtZXNzZWQgdXAgd2hlbiBhZGRpbmcg
dGhlIGRlcGVuZGVuY3kgYW5kIGluY29ycmVjdGx5IGNvcGllZAo+ICAgICB0aGUgaGFzaCAoYnV0
IHRoYXQgc2hvdWxkIG5vdCBoYXBwZW4gYXMgYWRkaW5nIGEgZGVwZW5kZW5jeSBpcwo+ICAgICBz
dXBwb3NlZCB0byBiZSBkb25lIHdpdGggZ28gdG9vbHMgYWxyZWFkeSksCj4gCj4gICAtIHRoZSB1
cHN0cmVhbSBvZiB0aGUgZGVwZW5kZW5jeSBjaGFuZ2VkIHRoZWlyIHJlbGVhc2UgKGkuZS4gdGhl
eQo+ICAgICByZS10YWdnZWQgYSByZWxlYXNlKQo+IAo+ICAgLSB0aGUgZ28gcHJveHkgaXMgY2Fj
aGluZyBhbiBpbmNvcnJlY3QgYXJjaGl2ZSAoZS5nLiBhIHBhcnRpYWwKPiAgICAgZG93bmxvYWQs
IG9yIGFuIG9sZGVyIGFyY2hpdmUsIG9yIGlzIG1hbGljaW91cywgb3Igd2hhdGV2ZXIpLgo+IAo+
IEluIGFueSBjYXNlLCB3ZSBjYW4ndCBkbyBhbnl0aGluZyBhYm91dCBpdCwgYW5kIHRoZSB1cHN0
cmVhbSBvZiB0aGUKPiBwcm9qZWN0IGhhcyB0byBmaXggdGhlIG1lc3MuCj4gCj4gU28sIGZyb20g
bXkgcG9pbnQgb2YgdmlldywgdGhpcyBpcyBhIE5BQ0sgb24gdGhpcyBwYXRjaC4KCkkgY3JlYXRl
ZCBhbiBpc3N1ZSBvbiBUZWxlZ3JhZiBnaXRodWI6Cmh0dHBzOi8vZ2l0aHViLmNvbS9pbmZsdXhk
YXRhL3RlbGVncmFmL2lzc3Vlcy8xMDQwOAoKQmVzdCByZWdhcmRzLApSb21haW4KCgo+IAo+IFJl
Z2FyZHMsCj4gWWFubiBFLiBNT1JJTi4KPiAKPj4gWzFdIGh0dHBzOi8vZ2l0aHViLmNvbS9pbmZs
dXhkYXRhL3RlbGVncmFmLwo+PiBbMl0gaHR0cHM6Ly9naXRodWIuY29tL2luZmx1eGRhdGEvdGVs
ZWdyYWYvY29tbWl0L2Q0YjA1MWVkYzI0N2ExM2Q3ZmJkYWE0OWQ5NWZlNmU5MzUwNWQxNGUKPj4g
WzNdIGh0dHBzOi8vZ2l0aHViLmNvbS9nb29nbGUvZmxhdGJ1ZmZlcnMvaXNzdWVzLzY0NjYjaXNz
dWVjb21tZW50LTc4MTk1NDc0Mgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBSb21haW4gTmFvdXIgPHJv
bWFpbi5uYW91ckBzbWlsZS5mcj4KPj4gQ2M6IFRob21hcyBQZXRhenpvbmkgPHRob21hcy5wZXRh
enpvbmlAYm9vdGxpbi5jb20+Cj4+IC0tLQo+PiAgcGFja2FnZS9wa2ctZ29sYW5nLm1rIHwgMiAr
LQo+PiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4+Cj4+
IGRpZmYgLS1naXQgYS9wYWNrYWdlL3BrZy1nb2xhbmcubWsgYi9wYWNrYWdlL3BrZy1nb2xhbmcu
bWsKPj4gaW5kZXggMzViY2IxNjczYi4uZTIzNzc4ZDk2YSAxMDA2NDQKPj4gLS0tIGEvcGFja2Fn
ZS9wa2ctZ29sYW5nLm1rCj4+ICsrKyBiL3BhY2thZ2UvcGtnLWdvbGFuZy5tawo+PiBAQCAtODUs
NyArODUsNyBAQCAkKDIpX1BPU1RfUEFUQ0hfSE9PS1MgKz0gJCgyKV9HRU5fR09NT0QKPj4gICQo
MilfRE9XTkxPQURfUE9TVF9QUk9DRVNTID0gZ28KPj4gICQoMilfRExfRU5WID0gXAo+PiAgCSQo
SE9TVF9HT19DT01NT05fRU5WKSBcCj4+IC0JR09QUk9YWT1kaXJlY3QgXAo+PiArCUdPUFJPWFk9
cHJveHkuZ29sYW5nLm9yZyBcCj4+ICAJQlJfR09NT0Q9JCQoJCgyKV9HT01PRCkKPj4gIAo+PiAg
IyBEdWUgdG8gdmVuZG9yaW5nLCBpdCBpcyBwcmV0dHkgbGlrZWx5IHRoYXQgbm90IGFsbCBsaWNl
bnNlcyBhcmUKPj4gLS0gCj4+IDIuMzEuMQo+Pgo+PiBfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwo+PiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4+IGJ1aWxk
cm9vdEBidWlsZHJvb3Qub3JnCj4+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2J1aWxkcm9vdAo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290
Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJv
b3QK
