Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 449E0C433EF
	for <buildroot@archiver.kernel.org>; Sun,  5 Jun 2022 14:01:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B051D40AFD;
	Sun,  5 Jun 2022 14:01:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id A8AFH_G5bfpg; Sun,  5 Jun 2022 14:01:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CEDCC405F6;
	Sun,  5 Jun 2022 14:01:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9E7421BF393
 for <buildroot@lists.busybox.net>; Sun,  5 Jun 2022 14:01:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 85E4E60D9D
 for <buildroot@lists.busybox.net>; Sun,  5 Jun 2022 14:01:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DXunNTq8Uvb7 for <buildroot@lists.busybox.net>;
 Sun,  5 Jun 2022 14:01:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0576760BC4
 for <buildroot@buildroot.org>; Sun,  5 Jun 2022 14:01:22 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id t13so16442866wrg.9
 for <buildroot@buildroot.org>; Sun, 05 Jun 2022 07:01:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=kAunRwVESmc228tFCOMGt2v6cMxzrOWRtP1AK0QOJAw=;
 b=iTeiyhLuHiRKoyZdRsQeScGufDt09oc2rBxDYXiH34yi3BUtCKDDunaNWtwiUqDjYv
 iD3zUZ/1JCFwefZiw7wV5V12Lx/WqvNyJ5vD9w/+gQbMDP3MU6LFb5DBLKTKmkHeI2RL
 waKBr+KrCGCilQ/HDsZ4Y7kPynmTsG6tvS1Lxth9zbl9OVVwkX+oMJFhAQ4aO2xEmMI5
 FrqUg83q5zPsK/eenmnHIRLxfa5cbNtRS2IpABu0AmcLe6+gun2FvaPQ9lPzQW8JWXEJ
 Z3szWkVxJoPfEL/fXgKMUHdNPF1JKWvd2Wt0PCAu3AdUJJUwoX1aOArsT3fZjwEENbS9
 ARUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=kAunRwVESmc228tFCOMGt2v6cMxzrOWRtP1AK0QOJAw=;
 b=Dlzuiq5wS1vp3AdmkR41WHGuGNJX3Iw5jEcjQ1Qdf8pSUtrutld/1G+T9tvHojM/UX
 v1J7cDDsitKaw0MkXNuEU83QwuxnBMa3kuq3pD3xsQ6cxiL5oHpaxhZf4dkgRM6LC5qC
 HQ9ujngUOMewi+SR1y5mniMZoTf7akTCZKLufo211RKXYDDJD4HOlqDIjSwMXW/4X7t6
 OmzRWcN/++y/Tv5m2p5hUyf+nUu8uGI2bIKqRmX7Cmhc3F9RWMbeEgOm9AbvfHFBfa8a
 /4cgEDhULzjuJtQtsBzEs3UrsdIIiQuDHZM71O0kFYhjKmcJ/AXaCNM7LTF83HBjMwox
 GRNw==
X-Gm-Message-State: AOAM533Ode2WMRpAeSxoDxzbHQz/ofeidz2MBW4HFb9En3aayLgpSHQa
 /1SpTDX9UQEa+J8le1Q6RPk=
X-Google-Smtp-Source: ABdhPJw0sZKFqhIy8cf6Vz2T6ZyFPvGTnTckFpN2uGqbQ34B6ChTjoK8Vbr/XDPySe889l09Njug2w==
X-Received: by 2002:a05:6000:1c0d:b0:216:c9f4:2b83 with SMTP id
 ba13-20020a0560001c0d00b00216c9f42b83mr5771866wrb.405.1654437681063; 
 Sun, 05 Jun 2022 07:01:21 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521?
 (2a01cb058f8a18003dbee9eed79eb521.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521])
 by smtp.gmail.com with ESMTPSA id
 t22-20020a05600c41d600b00397550b387bsm17275034wmh.23.2022.06.05.07.01.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 05 Jun 2022 07:01:20 -0700 (PDT)
Message-ID: <012501bd-2055-6850-f00a-40e73e5cfa25@gmail.com>
Date: Sun, 5 Jun 2022 16:01:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-US
To: Andreas Ziegler <br015@umbiko.net>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <mailman.2413.1654341347.130377.buildroot@buildroot.org>
 <190f6507af24e5ee5e8797fbfaa3b7e3@umbiko.net>
 <20220605090620.63a7375c@windsurf>
 <d6a1f4d7ec93800f240b7457984040b9@umbiko.net>
From: Romain Naour <romain.naour@gmail.com>
In-Reply-To: <d6a1f4d7ec93800f240b7457984040b9@umbiko.net>
Subject: Re: [Buildroot] ulog compilation issue with buildroot 2022.02.2
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
Cc: Herve Codina <herve.codina@bootlin.com>, Tim Hammer <Tim.Hammer@orolia.com>,
 Buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8sCgpMZSAwNS8wNi8yMDIyIMOgIDEzOjQ2LCBBbmRyZWFzIFppZWdsZXIgYSDDqWNyaXTC
oDoKPiBIaSBUaG9tYXMsCj4gCj4gT24gMjAyMi0wNi0wNSAwNzowNiwgVGhvbWFzIFBldGF6em9u
aSB3cm90ZToKPj4gSGVsbG8gQW5kcmVhcywKPj4KPj4gT24gU3VuLCAwNSBKdW4gMjAyMiAwNjow
NTowOSArMDAwMAo+PiBBbmRyZWFzIFppZWdsZXIgPGJyMDE1QHVtYmlrby5uZXQ+IHdyb3RlOgo+
Pgo+Pj4gVGhpcyBpcyB0aGUgZW52aXJvbm1lbnQgd2hlbiBhbGNoZW15IGlzIGNhbGxlZCBmcm9t
IEJ1aWxkcm9vdDoKPj4+Cj4+PiBBTENIRU1ZX1RBUkdFVF9FTlYgPSBcCj4+PiDCoMKgwqDCoCQo
VEFSR0VUX01BS0VfRU5WKSBcCj4+PiDCoMKgwqDCoEFMQ0hFTVlfSE9NRT0kKEFMQ0hFTVlfSE9N
RSkgXAo+Pj4gwqDCoMKgwqBBTENIRU1ZX1dPUktTUEFDRV9ESVI9IiQoQEQpIiBcCj4+PiDCoMKg
wqDCoEFMQ0hFTVlfVEFSR0VUX09VVD1hbGNoZW15LW91dCBcCj4+PiDCoMKgwqDCoFBLR0NPTkZJ
R19CSU49JChQS0dfQ09ORklHX0hPU1RfQklOQVJZKSBcCj4+PiDCoMKgwqDCoFRBUkdFVF9PUz1s
aW51eCBcCj4+PiDCoMKgwqDCoFRBUkdFVF9PU19GTEFWT1VSPWJ1aWxkcm9vdCBcCj4+PiDCoMKg
wqDCoFRBUkdFVF9DUk9TUz0iJChUQVJHRVRfQ1JPU1MpIiBcCj4+PiDCoMKgwqDCoFRBUkdFVF9B
UkNIPXh4eCBcCj4+PiDCoMKgwqDCoFRBUkdFVF9HTE9CQUxfQ1hYRkxBR1M9IiQoVEFSR0VUX0NY
WEZMQUdTKSIgXAo+Pj4gwqDCoMKgwqBUQVJHRVRfR0xPQkFMX0xERkxBR1M9IiQoVEFSR0VUX0xE
RkxBR1MpIiBcCj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIF4gTERGTEFHUyBhcmUgdXN1YWxseSBlbXB0eQo+Pj4gwqDCoMKgwqBUQVJHRVRf
R0xPQkFMX0ZGTEFHUz0iJChUQVJHRVRfRkNGTEFHUykiIFwKPj4+IMKgwqDCoMKgVEFSR0VUX0dM
T0JBTF9GQ0ZMQUdTPSIkKFRBUkdFVF9GQ0ZMQUdTKSIKPj4+Cj4+PiBBbGNoZW15IGFkZHMgbW9y
ZSBzZXR0aW5ncyB0byBMREZMQUdTLCB0aGlzIGlzIHRoZSBmaW5hbCBjb250ZW50Ogo+Pj4KPj4+
ICsgVEFSR0VUX0dMT0JBTF9MREZMQUdTID0gLU8yIC1XbCwtTzEKPj4+IC1MYWxjaGVteS1vdXQv
c3RhZ2luZy9saWIvYXJtLWxpbnV4LWdudWVhYmloZiAtTGFsY2hlbXktb3V0L3N0YWdpbmcvbGli
Cj4+PiAtTGFsY2hlbXktb3V0L3N0YWdpbmcvdXNyL2xpYi9hcm0tbGludXgtZ251ZWFiaWhmCj4+
PiAtTGFsY2hlbXktb3V0L3N0YWdpbmcvdXNyL2xpYgo+Pj4gLVdsLC1ycGF0aC1saW5rPWFsY2hl
bXktb3V0L3N0YWdpbmcvbGliL2FybS1saW51eC1nbnVlYWJpaGYKPj4+IC1XbCwtcnBhdGgtbGlu
az1hbGNoZW15LW91dC9zdGFnaW5nL2xpYgo+Pj4gLVdsLC1ycGF0aC1saW5rPWFsY2hlbXktb3V0
L3N0YWdpbmcvdXNyL2xpYi9hcm0tbGludXgtZ251ZWFiaWhmCj4+PiAtV2wsLXJwYXRoLWxpbms9
YWxjaGVteS1vdXQvc3RhZ2luZy91c3IvbGliCj4+Pgo+Pj4gQWRkaW5nIHRoZSBCdWlsZHJvb3Qg
c3RhZ2luZyBsaWJyYXJ5IHBhdGggdG8gTERGTEFHUyBtYWtlcyB0aGUgYnVpbGQKPj4+IHN1Y2Nl
ZWQ6Cj4+Pgo+Pj4gwqDCoMKgwqAuLi4KPj4+IMKgwqDCoMKgVEFSR0VUX0dMT0JBTF9MREZMQUdT
PSIkKFRBUkdFVF9MREZMQUdTKSAtTCQoU1RBR0lOR19ESVIpL3Vzci9saWIiIFwKPj4KPj4gVGhh
bmtzIGZvciB5b3VyIGludmVzdGlnYXRpb24hCj4+Cj4+IC1MJChTVEFHSU5HX0RJUikvdXNyL2xp
YiBzaG91bGQgbm9ybWFsbHkgbm90IGJlIG5lZWRlZCwgYmVjYXVzZQo+PiAkKFNUQUdJTkdfRElS
KS91c3IvbGliIGlzIGluIHRoZSBkZWZhdWx0IHNlYXJjaCBwYXRoIG9mIHRoZQo+PiBjcm9zcy1j
b21waWxlciwgYXMgdGhlIGNvbXBpbGVyIGhhcyAkKFNUQUdJTkdfRElSKS91c3IgYXMgaXRzIHN5
c3Jvb3QuCj4+Cj4+IFNvIGZyb20gYSBjcm9zcy1jb21waWxlciBwZXJzcGVjdGl2ZSwgLUwkKFNU
QUdJTkdfRElSKS91c3IvbGliIHNob3VsZAo+PiBub3JtYWxseSBub3QgYmUgbmVlZGVkLCBhbmQg
dGhhdCdzIHdoeSBpdCdzIG5vdCBpbiAkKFRBUkdFVF9MREZMQUdTKS4KPiAKPiBBbmQgc3lzcm9v
dCBpcyBkZXRlY3RlZCBieSBhbGNoZW15Ogo+IAo+ICsgVEFSR0VUX1RPT0xDSEFJTl9TWVNST09U
ID0KPiAvaG9tZS9kYXRhL3Rlc3QvYXV0b2J1aWxkL2hvc3QvYXJtLWJ1aWxkcm9vdC1saW51eC1n
bnVlYWJpaGYvc3lzcm9vdAoKWWVzIGJ1dCBhbGNoZW15IHRyeSB0byBjb3B5IHNvbWUgZmlsZXMg
ZnJvbSBzdGFnaW5nIGRpcmVjdG9yeSB0bwp1bG9nL2FsY2hlbXktb3V0L3N0YWdpbmcKClNlZSBf
bGliY19pbnN0YWxsZWRfZmlsZSB0YXJnZXQgaW4gb3V0cHV0L2hvc3Qvb3B0L2FsY2hlbXkvdG9v
bGNoYWlucy9saWJjLm1rLgoKSWYgd2UgaGFjayBpbnRvIF9saWJjX2luc3RhbGxlZF9maWxlIHJ1
bGUgdG8gbm90IGNvcHkgYW55IGZpbGVzIGZyb20gc3RhZ2luZywKdGhlIGJ1aWxkIHN1Y2NlZWQu
Cgo+IAo+PiBBbHNvLCB0aGVyZSBpcyBhIGN1cmlvdXMgdGhpbmcgaW4gdGhlIHJlcG9ydCBmcm9t
IE5pY29sYXM6IHRoZSBlcnJvcgo+PiBoYXBwZW5zIHdoZW4gc3lzdGVtZCBpcyBlbmFibGVkLCBi
dXQgZG9lc24ndCBoYXBwZW4gd2hlbiBzeXN0ZW1kIGlzCj4+IGRpc2FibGVkLgo+IAo+IEkgY2Fu
IGNvbmZpcm0gdGhpcy4gQWRkaW5nIEJSMl9JTklUX1NZU1RFTUQ9eSBicmVha3MgdGhlIGJ1aWxk
ICh1c2luZyBtYWtlIGNsZWFuCj4gJiYgbWFrZSB1bG9nKS4KCkkgZGlkIGEgdHJ5IHdpdGhvdXQg
c3lzdGVtZCBidXQgdGhlIGJ1aWxkIGZhaWxlZC4KCkJlc3QgcmVnYXJkcywKUm9tYWluCgoKPiAK
PiBLaW5kIHJlZ2FyZHMsCj4gQW5kcmVhcwo+IAo+PiBUaG9tYXMKPj4gLS0gCj4+IFRob21hcyBQ
ZXRhenpvbmksIGNvLW93bmVyIGFuZCBDRU8sIEJvb3RsaW4KPj4gRW1iZWRkZWQgTGludXggYW5k
IEtlcm5lbCBlbmdpbmVlcmluZyBhbmQgdHJhaW5pbmcKPj4gaHR0cHM6Ly9ib290bGluLmNvbQo+
IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gYnVpbGRy
b290IG1haWxpbmcgbGlzdAo+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4gaHR0cHM6Ly9saXN0
cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290CgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0
CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
