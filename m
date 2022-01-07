Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC892C433EF
	for <buildroot@archiver.kernel.org>; Fri,  7 Jan 2022 00:14:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4998983367;
	Fri,  7 Jan 2022 00:14:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oDCxdiyC9eHg; Fri,  7 Jan 2022 00:14:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9120A8336D;
	Fri,  7 Jan 2022 00:14:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9F0A41C115D
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 00:14:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8EDC66FC05
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 00:14:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=smile-fr.20210112.gappssmtp.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Bni6-vp_pX8i for <buildroot@lists.busybox.net>;
 Fri,  7 Jan 2022 00:14:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp3.osuosl.org (Postfix) with ESMTPS id ECFD460D79
 for <buildroot@buildroot.org>; Fri,  7 Jan 2022 00:14:07 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 2-20020a05600c02c200b003470f96e778so1826199wmn.5
 for <buildroot@buildroot.org>; Thu, 06 Jan 2022 16:14:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=VhCwh8trrU/l5rpqliwPZ2AgnvXqeslD7shzDClPXH4=;
 b=aifv/nmBqZZHDuDL3a1A0j+erzdontyDNZRzbHpFvl5/dVcIHlafMFvFsiXgfEC7wx
 HsIOTRKXysW4r/caL3q+hvPFYHw6G+iSo7i0cIgdWo9ADQT03n6rrNY0ECJD8FxEFs90
 0ZkPaf81BPySQubAmJBpDYkpUvHh6G2pq8p1/0wrM1zckEjV6F0FncNNgTRkjsGxGZm/
 QfpmJA6Pv/qR7pRXvakf0ZV7e2Jumpw4RDWtqSRavhr3DQc6heAg/Qlh9yOkHkREp9JW
 mVj4AjqZARRqNzjAKFMQMEnVqQUFOD7QNqq0hAK1RqldfMGPcOlu0AxZUMyJYpQZ5uwu
 uacQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=VhCwh8trrU/l5rpqliwPZ2AgnvXqeslD7shzDClPXH4=;
 b=ww0q9+6Vq7p70MBRHZqIgfdR2a9+F/gcwfcqiUfqo2dSA1CIORMHB7VOyf1wMvXbaP
 cLmrFQfd/BJI82u0WZbC9YiZ/Uvl0qxB1+50XdyCQAfjXYtIkTZz3uleymO2noALODg6
 Bw3t5uVefJHafwcL+S9BuS4H7WcLMDYGZym8C9yQSbTm4CW8SVTGeOMq1Acw+k38Yes6
 IPtmY9a5RZPrrHV2LAahOWeyB/mcdVmD0uUTtd9qxJxTVq4ZBKaodGGwqUhff8wW9T4y
 QG06vGgZZODFHwtF1dc7WuQYrTRP9ZFsBITFSfba489tm2ovjH7aq7pnSpHsdx6Cfahx
 PgTg==
X-Gm-Message-State: AOAM5335rgOD1VlRJXKwWXSQmbUz2aXFZP0O/gtLFL1NG2njDkXBBmNu
 lityyTZuZzjgDGS5wuBAzpsrzw==
X-Google-Smtp-Source: ABdhPJzbDGvOmt3yK7PmLW/wHi0gWFsipAlVFfAWNSr7YauF81Xlg+VQ0gKSvQC5pmRnB7Etu/cOOg==
X-Received: by 2002:a7b:c159:: with SMTP id z25mr8991806wmi.36.1641514445924; 
 Thu, 06 Jan 2022 16:14:05 -0800 (PST)
Received: from ?IPV6:2a01:cb05:8f8a:1800:1c97:b8d1:b477:d53f?
 (2a01cb058f8a18001c97b8d1b477d53f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:1c97:b8d1:b477:d53f])
 by smtp.gmail.com with ESMTPSA id l10sm3092250wmq.7.2022.01.06.16.14.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Jan 2022 16:14:05 -0800 (PST)
Message-ID: <fc0c0136-3723-a3e0-24e8-b41ec5da91fd@smile.fr>
Date: Fri, 7 Jan 2022 01:14:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-US
To: Derrick Pallas <derrick@meter.com>, Peter Seiderer <ps.report@gmx.net>
References: <20201023061251.29900-1-derrick@meter.com>
 <20201024203231.36f8b4a5@gmx.net>
 <f7739bed-eba2-8c5e-837e-d66e9b7940e8@meter.com>
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <f7739bed-eba2-8c5e-837e-d66e9b7940e8@meter.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/meson: fix blank entry in
 cross-compilation.conf
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gRGVycmljaywKCkxlIDI0LzEwLzIwMjAgw6AgMjE6MDIsIERlcnJpY2sgUGFsbGFzIGEg
w6ljcml0wqA6Cj4gVGhhbmtzIGZvciBsb29raW5nIFBldGVyLgo+IAo+IE9uIDEwLzI0LzIwIDEx
OjMyIEFNLCBQZXRlciBTZWlkZXJlciB3cm90ZToKPj4gT24gbXkgc3lzdGVtIChmb3IgYSBSUGk0
IGNvbmZpZ3VyYXRpb24pIGFscmVhZHkgd2l0aG91dCB5b3VyIHBhdGNoOgo+Pgo+PiDCoMKgwqDC
oCQgZ3JlcCBjcHUgaG9zdC9ldGMvbWVzb24vY3Jvc3MtY29tcGlsYXRpb24uY29uZgo+PiBjcHVf
ZmFtaWx5ID0nYWFyY2g2NCcKPj4gY3B1ID0gJ2NvcnRleC1hNzInCj4+Cj4+IEdDQ19UQVJHRVRf
Q1BVIGNvbWVzIGZyb20gYXJjaC9hcmNoLm1rOgo+Pgo+PiBHQ0NfVEFSR0VUX0NQVSA6PSAkKGNh
bGwgcXN0cmlwLCQoQlIyX0dDQ19UQVJHRVRfQ1BVKSkKPj4KPj4gQW55dGhpbmcgc3BlY2lhbCB3
aXRoIHlvdXIgY29uZmlndXJhdGlvbi9idWlsZCBlbnZpcm9ubWVudCAod2hpY2gKPj4gYnVpbGRy
b290IHZlcnNpb24pPyBXaGF0IGlzIHRoZSBCUjJfR0NDX1RBUkdFVF9DUFUgZW50cnkgaW4KPj4g
eW91ciAuY29uZmlnIGZpbGU/Cj4gCj4gSSd2ZSB0cmllZCB0aGlzIG9uIGJvdGggdGhlIGRldmVs
b3BtZW50IGJyYW5jaCBhbmQgb24gMjAyMC4wOC4xIGFuZCBJIGdldCB0aGUKPiBzYW1lIHJlc3Vs
dHMuIFRoZSB0YXJnZXQgaXMgYW4geDg2XzY0L3NpbHZlcm1vbnQuIEFmdGVyIHRha2luZyBhIHNl
Y29uZCBsb29rLAo+IHRoZSBwcm9ibGVtIHNlZW1zIHRvIGJlIHRoYXQgYXJjaC9Db25maWcuaW4u
eDg2IGRvZXMgbm90IGFjdHVhbGx5IHNldAo+IEJSMl9HQ0NfVEFSR0VUX0NQVTsgaW5zdGVhZCwg
aXQgc2V0cyBCUjJfR0NDX1RBUkdFVF9BUkNIIHdpdGggYSB2YWx1ZSB0aGF0IG1pZ2h0Cj4gYmV0
dGVyIGRlc2NyaWJlZCBhcyBCUjJfR0NDX1RBUkdFVF9DUFUuIFRodXMsIG15IGNvbmZpZyBoYXMK
PiAKPiDCoMKgwqDCoEJSMl9BUkNIID0geDg2XzY0ICMgYmVjYXVzZSBCUjJfeDg2XzY0Cj4gwqDC
oMKgwqBCUjJfR0NDX1RBUkdFVF9BUkNIID0gc2lsdmVybW9udCAjIGJlY2F1c2UgQlIyX3g4Nl9z
aWx2ZXJtb250Cj4gCj4gSXMgdGhlIGNvbmZpZyB2YXJpYWJsZSBtaXNuYW1lZCBmb3IgeDg2PyBB
ZGRpbmcgVGhvbWFzIFBldGF6em9uaSwgc2luY2UgaXQgbG9va3MKPiBsaWtlIGhlIGRpZCB0aGUg
b3JpZ2luYWwgYnJlYWtvdXQgb2YgQlIyX0dDQ19UQVJHRVRfQVJDSCBhbmQgdGhlbiBsYXRlciBy
ZW1vdmVkCj4gaXQgZnJvbSBzZXZlcmFsIGFyY2hzIChlLmcuIGFybSkgaW4gZmF2b3Igb2YgY3B1
Lgo+IAo+IE9yIHNob3VsZCB0aGVyZSBiZSBhIGZhbGxiYWNrIGZyb20gQlIyX0dDQ19UQVJHRVRf
Q1BVIHRvIEJSMl9HQ0NfVEFSR0VUX0FSQ0ggaWYKPiB0aGUgZm9ybWVyIGRvZXMgbm90IGV4aXN0
PwoKSSBkb24ndCBzZWUgYW55IGNoYW5nZSB3aXRoIHRoaXMgcGF0Y2ggYXBwbGllZC4KCkluZGVl
ZCwgY3B1IGlzIGVtcHR5IG9uIHg4Nl82NCBhcmNoaXRlY3R1cmU6CgpbaG9zdF9tYWNoaW5lXQpz
eXN0ZW0gPSAnbGludXgnCmNwdV9mYW1pbHkgPSAneDg2XzY0JwpjcHUgPSAnJwplbmRpYW4gPSAn
bGl0dGxlJwoKT24gYWFjaDY0OgoKW2hvc3RfbWFjaGluZV0Kc3lzdGVtID0gJ2xpbnV4JwpjcHVf
ZmFtaWx5ID0gJ2FhcmNoNjQnCmNwdSA9ICdjb3J0ZXgtYTUzJwplbmRpYW4gPSAnbGl0dGxlJwoK
U2VlIG1lc29uIGRvY3VtZW50YXRpb24gYWJvdXQgY3B1X2ZhbWlseSB2cyBjcHU6Cmh0dHBzOi8v
bWVzb25idWlsZC5jb20vQ3Jvc3MtY29tcGlsYXRpb24uaHRtbCNtYWNoaW5lLWVudHJpZXMKCllv
Y3RvIHVzZSBUQVJHRVRfQVJDSCBhcyBjcHUgdmFsdWU6CgpodHRwczovL2dpdGh1Yi5jb20vb3Bl
bmVtYmVkZGVkL29wZW5lbWJlZGRlZC1jb3JlL2Jsb2IvZHVuZmVsbC9tZXRhL2NsYXNzZXMvbWVz
b24uYmJjbGFzcyNMMTE5CgpEaWQgeW91IHRyeSB0byB1c2UgQlIyX0dDQ19UQVJHRVRfQVJDSCBh
cyBjcHUgdmFsdWUgPwpEaWQgeW91IG5vdGljZSBhbnkgY2hhbmdlL2ltcHJvdmVtZW50ID8KCkkg
bm90IHN1cmUgaXQncyByZWFsbHkgYW5ub3lpbmcgc2luY2UgQnVpbGRyb290IHVzZSBhIHRvb2xj
aGFpbiB3cmFwcGVyIHRoYXQKcHJvdmlkZSAtbWNwdT0gb3IgLW1hcmNoPSBmbGFnIG9uIHRoZSBn
Y2MgY29tbWFuZCBsaW5lLgoKQmVzdCByZWdhcmRzLApSb21haW4KCgo+IAo+IFRoYW5rcywgfkRl
cnJpY2sKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+
IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKPiBidWlsZHJvb3RAYnVzeWJveC5uZXQKPiBodHRwOi8v
bGlzdHMuYnVzeWJveC5uZXQvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxp
c3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21h
aWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
