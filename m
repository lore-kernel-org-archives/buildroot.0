Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C889C433F5
	for <buildroot@archiver.kernel.org>; Fri, 13 May 2022 20:05:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D999783F8C;
	Fri, 13 May 2022 20:05:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id psH7LKG48ll9; Fri, 13 May 2022 20:05:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D696083F2C;
	Fri, 13 May 2022 20:05:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0E30D1BF869
 for <buildroot@lists.busybox.net>; Fri, 13 May 2022 20:05:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0AF8A4190A
 for <buildroot@lists.busybox.net>; Fri, 13 May 2022 20:05:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OZkXN2o-gkjD for <buildroot@lists.busybox.net>;
 Fri, 13 May 2022 20:05:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 94225410B8
 for <buildroot@buildroot.org>; Fri, 13 May 2022 20:05:22 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id g6so18259946ejw.1
 for <buildroot@buildroot.org>; Fri, 13 May 2022 13:05:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=NmChM4JzUZhP0wWA7KuSAnPPagxvFec6ZdAvaUJHbYU=;
 b=Xy99zhw9iUTpENQqPG35zgmXIoQS0cKPpksgqDMUl/phQ6My+gqvGSaMkkaDDjWOeE
 AdlKQgr36Ud+hUZeM4aj0yHs/47b63yZrE0tDg6URY2LYWY905EsNkjq74PFCEf0f7wa
 EJ3NMuQIFYnROtv6blsTH8+Wi5FVYH8nHipjNkgcjbauYtNDSoDB7EQlxccwYY/eVZVx
 C3VDxFSVNODOQI6a59351+bA0xRcipnmu3eWZiwtoEJngWelkXRA9SXESdoCIqH3Jxp6
 SW10GJm1VWnzlemv1AemzYCKsQWZ+S+fxbuCW6VoyZRylnY12O9CkWKKMp5li2GB1SNO
 a7/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=NmChM4JzUZhP0wWA7KuSAnPPagxvFec6ZdAvaUJHbYU=;
 b=Vci0l+Ej7vRTWsPTkTntHhiHoQ2kibxYYk2wemE55E2Pdy66TNwvLILiL+UD30w3Oz
 8UF0/9FdRShu56T5OdVW/Ogn5LHNutVqe+YNyiYfPcS6roYECwdlwvsHUv2ROYsGU3Mj
 a08+I08b8R4MwGmiTxdHAJB7iCj6EhjTtKdLbJNv6PofDLQoQZE7aByRRhiOFRof5uyZ
 C9b5zhGCLk73p3FIDDC+XQOQ1pC1vyKJP6/pWdxfIH5DBRYaxlljuJfiCRNrim2qpgPC
 oHxZjVWW1S2V/+RoMkn4R6vdwkuxrQAY/RksfP9nWlUp98uDp9tFzIRZVnz2aDhAa8Pb
 5vGQ==
X-Gm-Message-State: AOAM530H9zwE60QESJjrXzQ+uqkEWCR5QHeinkTKrqzNSNhhTl8/NyOS
 aM5dD71aNOQOHKA5PTkh38Ju/PYuY0WYcg==
X-Google-Smtp-Source: ABdhPJxG7y6ocV9oHa2G0c2CBIFIAkwDztJr8uZLwFSJ8RcqIhFObdBV8VluRTqixiHitJui5DK+Yg==
X-Received: by 2002:a17:907:d1d:b0:6fa:1f27:b39 with SMTP id
 gn29-20020a1709070d1d00b006fa1f270b39mr5491167ejc.146.1652472320444; 
 Fri, 13 May 2022 13:05:20 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 e24-20020a170906845800b006f5294986besm1045817ejy.111.2022.05.13.13.05.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 May 2022 13:05:20 -0700 (PDT)
Message-ID: <17ad1eb2-8751-2440-d2ff-50ba1a5be07c@mind.be>
Date: Fri, 13 May 2022 22:05:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-GB
To: =?UTF-8?Q?Noah_H=c3=bctter?= <noahhuetter@gmail.com>,
 Alistair Francis <alistair23@gmail.com>
References: <20220427131400.223113-1-noahhuetter@gmail.com>
 <CAKmqyKPcAFNmd5tz=JTZZVcUKKZeTpQsockEDL66pfjJM2FhKQ@mail.gmail.com>
 <04ff514d-0de7-279f-f443-0339fad4865f@gmail.com>
 <e7ca5854-27eb-a416-1783-15193b0e898b@mind.be>
 <34bf150f-42b9-1f32-e693-5cc011afc609@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <34bf150f-42b9-1f32-e693-5cc011afc609@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] boot/opensbi: introduce
 BR2_TARGET_OPENSBI_CUSTOM_MAKEOPTS
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
Cc: Alistair Francis <alistair@alistair23.me>,
 buildroot <buildroot@buildroot.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAxMy8wNS8yMDIyIDExOjQyLCBOb2FoIEjDvHR0ZXIgd3JvdGU6Cj4gCj4gCj4gT24gNS8x
Mi8yMiAyMzo1NywgQXJub3V0IFZhbmRlY2FwcGVsbGUgd3JvdGU6Cj4+Cj4+Cj4+IE9uIDEyLzA1
LzIwMjIgMDg6NTAsIE5vYWggSMO8dHRlciB3cm90ZToKCltzbmlwXQo+Pj4+PiArY29uZmlnIEJS
Ml9UQVJHRVRfT1BFTlNCSV9DVVNUT01fTUFLRU9QVFMKPj4+Pj4gK8KgwqDCoMKgwqDCoCBzdHJp
bmcgIkN1c3RvbSBtYWtlIG9wdGlvbnMiCj4+Pj4+ICvCoMKgwqDCoMKgwqAgaGVscAo+Pj4+PiAr
wqDCoMKgwqDCoMKgwqDCoCBMaXN0IG9mIGN1c3RvbSBtYWtlIG9wdGlvbnMgcGFzc2VkIGF0IGJ1
aWxkIHRpbWUuIENhbiBiZQo+Pj4+PiArwqDCoMKgwqDCoMKgwqDCoCB1c2VkIGZvciBleGFtcGxl
IHRvIHBhc3MgYSBCVUlMRF9JTkZPPSB2YWx1ZS4KPj4KPj4gwqDCoEluIHRoaXMgY2FzZSwgaXQn
cyBub3QgdHJpdmlhbCBiZWNhdXNlIHRoZSB1c2UgY2FzZSBpcyBub3QgY2xlYXIuIEFsbW9zdCAK
Pj4gZXZlcnkgcGFja2FnZSBoYXMgc29tZSByYW5kb20gbWFrZSwgY21ha2UsIG1lc29uIG9yIHdo
YXRldmVyIG9wdGlvbnMgdGhhdCB5b3UgCj4+IGNvdWxkIHBhc3MgdG8gaXQuIFdoYXQgbWFrZXMg
T3BlblNCSSBzbyBzcGVjaWFsIHRoYXQgeW91IG5lZWQgdG8gcGFzcyBhIAo+PiBmcmVlZm9ybSBs
aXN0IG9mIGFkZGl0aW9uYWwgb3B0aW9ucz8KPiAKPiBJbiBteSBzcGVjaWZpYyBjYXNlIGFzIGRl
c2NyaWJlZCBpbiB0aGUgaGVscCwgdGhlIHZhbHVlIHRvIGBCVUlMRF9JTkZPYC4gCgogIFllcywg
YnV0IHdoeSBpcyBpdCBhYnNvbHV0ZWx5IG5lY2Vzc2FyeSB0byBzZXQgQlVJTERfSU5GTz8gQXJl
IHRoZXJlIG90aGVyIAp2YXJpYWJsZXMgdGhhdCBhcmUgZ29pbmcgdG8gYmUgbmVlZCB0byBiZSBz
ZXQsIG9yIGlzIGl0IGp1c3QgdGhlIG9uZT8gSW4gdGhlIApsYXR0ZXIgY2FzZSwgaXQgd291bGQg
YmUgYmV0dGVyIHRvIGhhdmUgQlIyX1RBUkdFVF9PUEVOU0JJX0JVSUxEX0lORk8uCgoKPiBGcm9t
IAo+IGxvb2tpbmcgYXQgb3RoZXIgcGFja2FnZXMgSSBkZWR1Y2VkIHRoYXQgdGhlIF9DVVNUT01f
TUFLRU9QVFMgaXMgYSBjb21tb24gY29uZmlnIAo+IHRvIHBhY2thZ2VzIGFuZCBhZGRlZCBpdCB0
byBPcGVuU0JJLiBEaWQgSSBvdmVybG9vayBzb21ldGhpbmc/CgogIFRoZXJlJ3MganVzdCBvbmUg
dGhhdCBoYXMgdGhpcywgdWJvb3QuIEl0IHdhcyBhZGRlZCBieSB0aGlzIGNvbW1pdDoKCmNvbW1p
dCBjYzE1MWMzOTkzMDkwYTUyZDFmZWY4NTMyZjUyZDc0ZWU2ZDkyNGM5CkF1dGhvcjogVGhvbWFz
IFBldGF6em9uaSA8dGhvbWFzLnBldGF6em9uaUBib290bGluLmNvbT4KRGF0ZTogICBGcmkgQXBy
IDI2IDE3OjE5OjQ2IDIwMTkKCiAgICAgYm9vdC91Ym9vdDogYWRkIG9wdGlvbiB0byBwYXNzIGN1
c3RvbSB2YXJpYWJsZXMgdG8gVS1Cb290IGJ1aWxkCgogICAgIFUtQm9vdCBzdXBwb3J0cyBhIG51
bWJlciBvZiBlbnZpcm9ubWVudCB2YXJpYWJsZXMgdG8gcGFzcyBzcGVjaWZpYwogICAgIGluZm9y
bWF0aW9uLiBUaGUgZm9sbG93aW5nIHBhdGNoZXMgd2VyZSBzdWJtaXR0ZWQgaW4gdGhlIHBhc3Qg
dG8gb25lCiAgICAgc29tZSBzcGVjaWZpYyBDb25maWcuaW4gb3B0aW9uIHRvIHBhc3Mgc29tZSBv
ZiB0aGVzZSB2YXJpYWJsZXM6CgogICAgICAtIGh0dHA6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9w
YXRjaC84ODExOTcvIHByb3Bvc2VkIGFuIG9wdGlvbiB0bwogICAgICAgIHBhc3MgYSBjdXN0b20g
RVhUX0RUQj0gdmFyaWFibGUKCiAgICAgIC0gaHR0cDovL3BhdGNod29yay5vemxhYnMub3JnL3Bh
dGNoLzEwMTgyNDUvIHByb3Bvc2VkIGFuIG9wdGlvbiB0bwogICAgICAgIHBhc3MgYSBjdXN0b20g
REVWSUNFX1RSRUU9IHZhcmlhYmxlCgogICAgIEluc3RlYWQgb2YgYWRkaW5nIG9uZSBDb25maWcu
aW4gb3B0aW9uIGZvciBlYWNoIG9mIHRob3NlIHZhcmlhYmxlcywKICAgICBsZXQncyBwcm92aWRl
IGEgZ2VuZXJpYyBtZWNoYW5pc20gdG8gcGFzcyBhcmJpdHJhcnkgdmFyaWFibGVzIGR1cmluZwog
ICAgIFUtQm9vdCBidWlsZCBzdGVwLgoKICBJIGhhdmUgdG8gc2F5IHRoYXQgdGhhdCBjb21taXQg
bWVzc2FnZSBpc24ndCByZWFsbHkgZ29vZCBlbm91Z2ggZWl0aGVyLCBpdCAKc2hvdWxkIHJlYWxs
eSBoYXZlIGNvcGllZCB0aGUgZXhwbGFuYXRpb25zIGluIHRoZSB0d28gcmVmZXJyZWQgcGF0Y2hl
cyBhcyB0byB3aHkgCnRob3NlIHR3byB2YXJpYWJsZXMgd291bGQgbmVlZCB0byBiZSB1c2VkLiBX
aGF0IHdlJ3JlIHJlYWxseSBsb29raW5nIGZvciBpczoKCi0gQSAicHJvb2YiIHRoYXQgdGhpcyBp
cyBmb3IgYSByZWxldmFudCB1c2UgY2FzZSBhbmQgbm90IGp1c3Qgc29tZSBjb3JuZXIgY2FzZSAK
dGhhdCBub2JvZHkgb3RoZXIgdGhhbiB5b3Vyc2VsZiBpcyBldmVyIGdvaW5nIHRvIG5lZWQuCgot
IEEgImRlc2lnbiBkb2N1bWVudCIgdGhhdCB0aGlzIGlzIHJlYWxseSB0aGUgd2F5IHRvIGltcGxl
bWVudCB0aGlzIGZlYXR1cmUsIAp0aGF0IG90aGVyIGFsdGVybmF0aXZlcyBhcmUgbGVzcyBhcHBy
b3ByaWF0ZSAoY2ZyLiB0aGUgIkluc3RlYWQgb2YgLi4uIGxldCdzIAouLi4iIHNlbnRlbmNlIGFi
b3ZlKS4KCi0gQW5kIGFsbCB0aGlzIGRvY3VtZW50ZWQgaW4gdGhlIGNvbW1pdCBtZXNzYWdlLCBz
byBhIGZldyB5ZWFycyBkb3duIHRoZSBsaW5lIGlmIApzb21lb25lIGNoYW5nZXMgaXQsIHdlIHJl
bWVtYmVyIHRoZSByZWFzb25zIHdoeSB3ZSBtYWRlIHRob3NlIGNob2ljZXMuCgogIE5vdGUgdGhh
dCBpdCBkb2Vzbid0IGhhdmUgdG8gYmUgdmVyeSB3b3JkeSwgaXQncyBwb3NzaWJsZSB0byBjb3Zl
ciB0aG9zZSBiYXNlcyAKaW4ganVzdCBhIGZldyB3b3Jkcy4gQnV0IHRoZSBnaXN0IG9mIGl0IG5l
ZWRzIHRvIGJlIHRoZXJlLgoKICBSZWdhcmRzLAogIEFybm91dAoKCgoKPiAKPiBCZXN0LAo+IE5v
YWgKPiAKPj4+Pj4gKwo+Pj4+PiDCoCBlbmRpZgo+Pj4+PiBkaWZmIC0tZ2l0IGEvYm9vdC9vcGVu
c2JpL29wZW5zYmkubWsgYi9ib290L29wZW5zYmkvb3BlbnNiaS5tawo+Pj4+PiBpbmRleCA4ZTA1
NTYzM2E4Li5kMDA3YWUxMjk5IDEwMDY0NAo+Pj4+PiAtLS0gYS9ib290L29wZW5zYmkvb3BlbnNi
aS5tawo+Pj4+PiArKysgYi9ib290L29wZW5zYmkvb3BlbnNiaS5tawo+Pj4+PiBAQCAtMzEsNyAr
MzEsOCBAQCBCUl9OT19DSEVDS19IQVNIX0ZPUiArPSAkKE9QRU5TQklfU09VUkNFKQo+Pj4+PiDC
oCBlbmRpZgo+Pj4+Pgo+Pj4+PiDCoCBPUEVOU0JJX01BS0VfRU5WID0gXAo+Pj4+PiAtwqDCoMKg
wqDCoMKgIENST1NTX0NPTVBJTEU9JChUQVJHRVRfQ1JPU1MpCj4+Pj4+ICvCoMKgwqDCoMKgwqAg
Q1JPU1NfQ09NUElMRT0kKFRBUkdFVF9DUk9TUykgXAo+Pj4+PiArwqDCoMKgwqDCoMKgICQoY2Fs
bCBxc3RyaXAsJChCUjJfVEFSR0VUX09QRU5TQklfQ1VTVE9NX01BS0VPUFRTKSkKPj4+Pj4KPj4+
Pj4gwqAgT1BFTlNCSV9QTEFUID0gJChjYWxsIHFzdHJpcCwkKEJSMl9UQVJHRVRfT1BFTlNCSV9Q
TEFUKSkKPj4+Pj4gwqAgaWZuZXEgKCQoT1BFTlNCSV9QTEFUKSwpCj4+Pj4+IC0tIAo+Pj4+PiAy
LjM1LjEKPj4+Pj4KPj4+Pj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KPj4+Pj4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+Pj4+PiBidWlsZHJvb3RAYnVp
bGRyb290Lm9yZwo+Pj4+PiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0
aW5mby9idWlsZHJvb3QKPj4+Cj4+Pgo+Pj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KPj4+IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKPj4+IGJ1aWxkcm9v
dEBidWlsZHJvb3Qub3JnCj4+PiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9idWlsZHJvb3QKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpo
dHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
