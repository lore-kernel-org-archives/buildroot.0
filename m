Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52D62C433F5
	for <buildroot@archiver.kernel.org>; Wed, 22 Dec 2021 20:24:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A686C400CE;
	Wed, 22 Dec 2021 20:24:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1Axa2rqsJfUc; Wed, 22 Dec 2021 20:24:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9DE71405A2;
	Wed, 22 Dec 2021 20:24:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 624751BF861
 for <buildroot@lists.busybox.net>; Wed, 22 Dec 2021 20:24:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5154A60AD8
 for <buildroot@lists.busybox.net>; Wed, 22 Dec 2021 20:24:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id r0WRQf_itNrz for <buildroot@lists.busybox.net>;
 Wed, 22 Dec 2021 20:24:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D39C960AD7
 for <buildroot@buildroot.org>; Wed, 22 Dec 2021 20:24:30 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id b13so13022073edd.8
 for <buildroot@buildroot.org>; Wed, 22 Dec 2021 12:24:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=8YfrJFF6QuwbgkTINRAlOIMRTIJYDQRYjVHebOWjBHg=;
 b=ePY/5MWaUToSgysoC4zdqkIeeTgaGHtO46WbAMtjTBOHlx79gjxELKHXpuzLU/X6Io
 d1H7GJUgE5teeVATvpHhAGechtIgGNR/eNgI9bkuA9qFGoVFyux700aLljl2Ytkqfkyj
 DKbVv3MeOvLlfLsG6A/FWYVPSfWSNDYB42yv8YTO3FB09DF4AMysZ8TdgDR13Qfjr/x6
 Br5W64OwvDxvi832HSlKnfE1/bcuHbgjNk4ncoH6U+EdCRXTJxLCqG51i2IsHS3oGn0r
 K0yUCVu6WC+e2/FHbJV+fSyY62Ev2wR8TFMXbCDR7XDu3Ui2v1jrcRKkc8SpLfeAOWOY
 e3RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=8YfrJFF6QuwbgkTINRAlOIMRTIJYDQRYjVHebOWjBHg=;
 b=xmbb8I2yrSbQukQu7pDINDabdaRqVyxWatUszj0f9jzymgonJSMTA8dBTMGVjPQl7k
 zQu3xTGrqPApTkIVnzvFPD1kJD6RrEIiuW2n2gvg4jCa7J4fp9ECdqDVajgenuuP43eS
 ohCw8HUORcDN5r5kVhGbxDzwRqEf0+LPoqAAsmK55gpnw/6/oxfux+HO6BK32X8/22Mn
 j+FDkEiBHyAlYdV7BOLUMFWZSXDvP/7o6AMk4gmNqJ0Sx7Cml6a/6fmAu01fHg3kv5cm
 rpPsqMhbSwFz2EM0siyIQxWHDGsTAQW0VvShr8plmyKNwEqJduohrqHKzknevvqwgNM5
 V7XA==
X-Gm-Message-State: AOAM531N2Kh54Q9PX6k+at9HJT//XoFIRp0x4ED1QneNSKX9Mdwopj1S
 redVIFvLa6QzIqzaNc4QvNV8iw==
X-Google-Smtp-Source: ABdhPJzxfOgRZ1lPyrcKa4N3G2DBV7kzGIaTj9+G36yP+5pY0aRHNEkmMJZOzncX72Vb/shLTXFWcg==
X-Received: by 2002:a17:906:7e03:: with SMTP id
 e3mr3620097ejr.675.1640204668845; 
 Wed, 22 Dec 2021 12:24:28 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id cs12sm1058457ejc.15.2021.12.22.12.24.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Dec 2021 12:24:28 -0800 (PST)
Message-ID: <3d0ea2c6-5d00-c4cf-7008-88aac6ecd788@mind.be>
Date: Wed, 22 Dec 2021 21:24:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Joachim Wiberg <troglobit@gmail.com>, buildroot@buildroot.org
References: <20211222083515.1150267-1-troglobit@gmail.com>
 <20211222083515.1150267-3-troglobit@gmail.com>
 <dc4b99fa-1893-d022-ba29-db80c2fc05ba@mind.be>
 <7592df87-e875-5016-db4f-57e5988dfbc4@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <7592df87-e875-5016-db4f-57e5988dfbc4@gmail.com>
Subject: Re: [Buildroot] [PATCH v2 2/2] package/makedevs: coding style and
 whitespace cleanup
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
Cc: Matt Weber <matthew.weber@collins.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAyMi8xMi8yMDIxIDIwOjMyLCBKb2FjaGltIFdpYmVyZyB3cm90ZToKPiBPbiAxMi8yMi8y
MSAzOjEyIFBNLCBBcm5vdXQgVmFuZGVjYXBwZWxsZSB3cm90ZToKPj4gT24gMjIvMTIvMjAyMSAw
OTozNSwgSm9hY2hpbSBXaWJlcmcgd3JvdGU6Cj4+PiBUaGlzIHBhdGNoIGlzIGEgbW9kZXN0IGF0
dGVtcHQgdG8gY2xlYW4gdXAgdGhlIGNvZGluZyBzdHlsZSBhbmQgZml4Cj4+PiBzb21lIHdoaXRl
c3BhY2UgaXNzdWVzLsKgIFNvbWUgY2hhbmdlcywgZS5nLiwgY29tbWVudHMgYXJlIGZvcgo+Pj4g
Y29uc2lzdGVuY3kgd2l0aCB0aGUgcmVzdCBmb3IgdGhlIHByb2dyYW0uCj4+ICDCoEFsdGhvdWdo
IEknbSBPSyB3aXRoIHRoZSBjaGFuZ2VzIHBlciBzZSwgSSBnZW5lcmFsIEkgZG9uJ3QgYmVsaWV2
ZSBtdWNoCj4+IGluIG1hbnVhbGx5IG1haW50YWluZWQgY29kaW5nIHN0eWxlLiBTbyBJJ2QgcHJv
cG9zZSB0byBhdCBsZWFzdCBpbmNsdWRlCj4+IGEgLmNsYW5nLWZvcm1hdCBmaWxlIGluIHRoZSB0
b3AgbGV2ZWwgZGlyZWN0b3J5IHRoYXQgZGVmaW5lcyBvdXIgY29kaW5nCj4+IHN0eWxlLiBXZSB3
b3VsZG4ndCBlbmZvcmNlIGl0IHdpdGggQ0kgb3IgYW55dGhpbmcgKGF0IGxlYXN0LCBub3QgZm9y
IHRoZQo+PiB0aW1lIGJlaW5nKSwgYnV0IGF0IGxlYXN0IGl0IG1ha2VzIGl0IGVhc3kgdG8gYXBw
bHkgdGhlIGNvZGluZyBzdHlsZSBhbmQKPj4gdG8ga25vdyB0aGF0IGl0J3MgY29ycmVjdC4KPiAK
PiBPSywgdGhhdCdzIGEgbGl0dGxlIGJpdCBtb3JlIHRoYW4gSSBiYXJnYWluZWQgZm9yLiAgSnVz
dCB3YW50ZWQgdG8gY2xlYW4KPiBpdCB1cCBhIGJpdCB3aGlsZSBJIHdhcyBpbiB0aGF0IHBhcnQg
b2YgdGhlIHRyZWUuICBCdXQgSSdsbCBnaXZlIGl0IGEKPiBnbywgaXQncyBDaHJpc3RtYXMgKGFu
ZCBERUMgMjIhISkgYWZ0ZXIgYWxsIDotKQo+IAo+IFdlIGRvbid0IHNlZW0gdG8gaGF2ZSBhbnkg
LmNsYW5nLWZvcm1hdCBmaWxlIGF0IHRoZSBtb21lbnQsIHNvIGlmIEkgY29weQo+IHRoZSBsYXRl
c3QgdmVyc2lvbiBmcm9tIGtlcm5lbC5vcmcsIHdoZXJlIGluIHRoZSB0cmVlIHNob3VsZCBpdCBs
aXZlPwoKICBBdCB0aGUgdG9wIGxldmVsLCBzbyBjbGFuZy1mb3JtYXQgYW5kIGVkaXRvcnMgZmlu
ZCBpdCBvdXQgb2YgdGhlIGJveC4KCiAgUmVnYXJkcywKICBBcm5vdXQKCj4gSSdtIHRoaW5raW5n
IHdlIG1pZ2h0IHdhbnQgdG8gcmV1c2UgaXQgZm9yIG90aGVyIGluLXRyZWUgdG9vbHMsIG1heWJl
Cj4gc3VwcG9ydC9taXNjLywgb3IgcGVyaGFwcyBlYWNoIHBhY2thZ2Ugc2hvdWxkIHN1cHBseSBp
dHMgb3duPwo+IAo+PiBBcyB0byB3aGljaCBjb2Rpbmcgc3R5bGU6IHNvbWV0aGluZyBjbG9zZSB0
byBrZXJuZWwgaXMgcHJlZmVycmVkLgo+IAo+IFN1c3BlY3RlZCBhcyBtdWNoLCB0aGFua3MhCj4g
Cj4gQmVzdCByZWdhcmRzCj4gICAvSm9hY2hpbQo+IApfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBi
dWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2J1aWxkcm9vdAo=
