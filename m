Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECA5EC433EF
	for <buildroot@archiver.kernel.org>; Mon,  7 Mar 2022 22:09:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 95008408C9;
	Mon,  7 Mar 2022 22:09:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tE-zJJjq5eSh; Mon,  7 Mar 2022 22:09:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 79615408AF;
	Mon,  7 Mar 2022 22:09:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 083221BF39D
 for <buildroot@lists.busybox.net>; Mon,  7 Mar 2022 22:09:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E7AF6404F3
 for <buildroot@lists.busybox.net>; Mon,  7 Mar 2022 22:09:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id o6twnNm8BGyz for <buildroot@lists.busybox.net>;
 Mon,  7 Mar 2022 22:09:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 05088408CB
 for <buildroot@buildroot.org>; Mon,  7 Mar 2022 22:09:04 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id s10so712598edd.0
 for <buildroot@buildroot.org>; Mon, 07 Mar 2022 14:09:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=3s3miSnuZRWHhZ686w6PzCxlO7200QEwH40gcRKFCdw=;
 b=canYKr9qm+Py6kiKXuEMQgA1d8kVkhhBI6y+wUYO0N5ggA2gy7WWW0jMGT6bup+2VT
 xNRRhpjN/FlSDEumOIkDf/4PsuAJ0IDeFp3O+ZDeeg72NOaYHuCXjWNDbx3OtMwGWO2E
 NyhXG2M5gBJI1qo7OCkFqFrY0e2MMlw0j5uqC3H7GLQE3cnLhljztUWF7pZn8F5FvlGs
 P6BbaTQx2hrzyjWSofEe/6CqatkgVGEjDwrAxDutnw9PMzj7vOuYI5qAmNRmQ/cCkfmY
 1xStdfYDvSoiMMnPXtwqE4AfU7vpdzryLbhqqk5eyBhH/VrG4HX2su1XwP4/Je0tENyT
 ioug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=3s3miSnuZRWHhZ686w6PzCxlO7200QEwH40gcRKFCdw=;
 b=jt0zvDqkylKY1a6/eiTgRJtIK1XDhu3gr39n6BlPa1RdeUojPiQp7jClhykua26IAd
 CU5LvQlwYImbrUMVrkNnn72d8G/2GXnT21wANkW9QcBcarM9l3ACcBIXrSTr1PKnX3U5
 p4gweM0Gz2dNwwjWN6pz5W030ovA3zTLRB1WPZk2Wlx09sDIGBEhj1x7vqE9eqL6rDbU
 2lwf95ZcHF+kN4oRT0LZJTNB4+uX9M5qy+WueHh45o8PJ2dnpXG/F5kKWEMC+NG4uac2
 g3+Fvs5fM8gHlbyAVWa3jPdyuSphi8/7FET+jPZwW3L9zwkmtFvC1KS4GTz/qvGylFfS
 EqZw==
X-Gm-Message-State: AOAM533pYx+GArjxwIVdfiYHdK5brGLgV1HeLmRwrAliA55jQEaCFY0j
 O6EAlEPp+v+7LYeF+GjtpaMFOQ==
X-Google-Smtp-Source: ABdhPJwwwX0x/aS+G6LPqZEpSJ4pa0LlvN7/jufcr94zkarvcFHBoNv2idV0v1lG65WcdcKmb2wR0w==
X-Received: by 2002:a05:6402:37a:b0:415:9501:e112 with SMTP id
 s26-20020a056402037a00b004159501e112mr13334259edw.402.1646690943171; 
 Mon, 07 Mar 2022 14:09:03 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 f26-20020a50ee9a000000b004160c295356sm4998044edr.5.2022.03.07.14.09.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Mar 2022 14:09:02 -0800 (PST)
Message-ID: <9dd7ff0e-ad7b-6407-e569-dc12a8f55e6d@mind.be>
Date: Mon, 7 Mar 2022 23:09:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-GB
To: Alexey Brodkin <Alexey.Brodkin@synopsys.com>, buildroot@buildroot.org
References: <20220222210024.6013-1-abrodkin@synopsys.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220222210024.6013-1-abrodkin@synopsys.com>
Subject: Re: [Buildroot] [PATCH v2] package/qt5/qt5webkit: needs OpenSSL
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Peter Seiderer <ps.report@gmx.net>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAyMi8wMi8yMDIyIDIyOjAwLCBBbGV4ZXkgQnJvZGtpbiB2aWEgYnVpbGRyb290IHdyb3Rl
Ogo+IFcvbyBPcGVuU1NMIFFUNVdlYmtpdCBmYWlscyB0byBidWlsZCB0aGF0IHdheToKPiAtLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLT44LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0KPiAuLi4vYnVpbGQvcXQ1d2Via2l0LTUuMjEyLjAtYWxwaGE0L1NvdXJjZS9XZWJDb3JlL3Bs
YXRmb3JtL25ldHdvcmsvcXQvUmVzb3VyY2VSZXF1ZXN0UXQuY3BwOiBJbiBzdGF0aWMgbWVtYmVy
IGZ1bmN0aW9uIOKAmHN0YXRpYyBib29sIFdlYkNvcmU6OlJlc291cmNlUmVxdWVzdDo6YWxwbklz
U3VwcG9ydGVkKCnigJk6Cj4gLi4uL2J1aWxkL3F0NXdlYmtpdC01LjIxMi4wLWFscGhhNC9Tb3Vy
Y2UvV2ViQ29yZS9wbGF0Zm9ybS9uZXR3b3JrL3F0L1Jlc291cmNlUmVxdWVzdFF0LmNwcDo2ODox
MjogZXJyb3I6IOKAmFFTc2xTb2NrZXTigJkgaGFzIG5vdCBiZWVuIGRlY2xhcmVkCj4gICAgIDY4
IHwgICAgIHJldHVybiBRU3NsU29ja2V0Ojpzc2xMaWJyYXJ5VmVyc2lvbk51bWJlcigpID4gMHgx
MDAwMjAwMEwgJiYKPiAgICAgICAgfCAgICAgICAgICAgIF5+fn5+fn5+fn4KPiAuLi4vYnVpbGQv
cXQ1d2Via2l0LTUuMjEyLjAtYWxwaGE0L1NvdXJjZS9XZWJDb3JlL3BsYXRmb3JtL25ldHdvcmsv
cXQvUmVzb3VyY2VSZXF1ZXN0UXQuY3BwOjY5Ojk6IGVycm9yOiDigJhRU3NsU29ja2V04oCZIGhh
cyBub3QgYmVlbiBkZWNsYXJlZAo+ICAgICA2OSB8ICAgICAgICAgUVNzbFNvY2tldDo6c3NsTGli
cmFyeVZlcnNpb25TdHJpbmcoKS5zdGFydHNXaXRoKFFMYXRpbjFTdHJpbmcoIk9wZW5TU0wiKSk7
Cj4gICAgICAgIHwgICAgICAgICBefn5+fn5+fn5+Cj4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0+OC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gCj4gU2lnbmVkLW9mZi1i
eTogQWxleGV5IEJyb2RraW4gPGFicm9ka2luQHN5bm9wc3lzLmNvbT4KPiBDYzogRmFicmljZSBG
b250YWluZSA8Zm9udGFpbmUuZmFicmljZUBnbWFpbC5jb20+Cj4gQ2M6IEphbWVzIEhpbGxpYXJk
IDxqYW1lcy5oaWxsaWFyZDFAZ21haWwuY29tPgo+IENjOiBQZXRlciBTZWlkZXJlciA8cHMucmVw
b3J0QGdteC5uZXQ+Cj4gQ2M6IFlhbm4gRS4gTU9SSU4gPHlhbm4ubW9yaW4uMTk5OEBmcmVlLmZy
PgoKICBBcHBsaWVkIHRvIG1hc3RlciwgdGhhbmtzLgoKICBSZWdhcmRzLAogIEFybm91dAoKPiAt
LS0KPiAKPiBDaGFuZ2VzIHYxIC0+IHYyOgo+IAo+ICAgKiBBZGRlZCAib3BlbnNzbCIgdG8gUVQ1
V0VCS0lUX0RFUEVOREVOQ0lFUywgdGhhbmtzIFlhbm4gZm9yCj4gICAgIHNwb3R0aW5nIHRoaXMg
b25lLgo+IAo+IE5vdGUgdGhhdCBJIGludGVybnRpb25hbGx5IGFkZGVkICJvcGVuc3NsIiBub3Qg
Zm9sbG93aW5nCj4gYWxwaGFiZXRpYyBvcmRlciBiZWNhdXNlOgo+IAo+ICAgMS4gRXhpc3Rpbmcg
ZGVwZW5kZW5jaWVzIGFyZSBhbHJlYWR5IGEgYml0IHNodWZmZmxlZAo+ICAgMi4gSSB3YW50ZWQg
dG8ga2VlcCB0aGlzIGRpZmYgYXMgc21hbGwgYXMgcG9zc2libGUsIHcvbwo+ICAgICAgcmUtc2h1
ZmZsaW5nIG11bHRpcGxlIGxpbmVzLiBJZiByZWFsbHkgbmVlZGVkIHdlIG1heSBkbwo+ICAgICAg
cmVvcmRlcmluZyBpbiBhIHNlcGFyYXRlIHBhdGNoLgo+IAo+IC0tLQo+ICAgcGFja2FnZS9xdDUv
cXQ1d2Via2l0L0NvbmZpZy5pbiAgICB8IDEgKwo+ICAgcGFja2FnZS9xdDUvcXQ1d2Via2l0L3F0
NXdlYmtpdC5tayB8IDIgKy0KPiAgIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAx
IGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvcXQ1L3F0NXdlYmtpdC9Db25m
aWcuaW4gYi9wYWNrYWdlL3F0NS9xdDV3ZWJraXQvQ29uZmlnLmluCj4gaW5kZXggZWQ4N2VmY2E5
NS4uMjZjMzg5N2QxZCAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL3F0NS9xdDV3ZWJraXQvQ29uZmln
LmluCj4gKysrIGIvcGFja2FnZS9xdDUvcXQ1d2Via2l0L0NvbmZpZy5pbgo+IEBAIC0xNSw2ICsx
NSw3IEBAIGNvbmZpZyBCUjJfUEFDS0FHRV9RVDVXRUJLSVQKPiAgIAlzZWxlY3QgQlIyX1BBQ0tB
R0VfSlBFRwo+ICAgCXNlbGVjdCBCUjJfUEFDS0FHRV9MRVZFTERCCj4gICAJc2VsZWN0IEJSMl9Q
QUNLQUdFX0xJQlBORwo+ICsJc2VsZWN0IEJSMl9QQUNLQUdFX09QRU5TU0wKPiAgIAlzZWxlY3Qg
QlIyX1BBQ0tBR0VfUVQ1QkFTRV9JQ1UKPiAgIAlzZWxlY3QgQlIyX1BBQ0tBR0VfUVQ1QkFTRV9H
VUkKPiAgIAlzZWxlY3QgQlIyX1BBQ0tBR0VfUVQ1QkFTRV9XSURHRVRTCj4gZGlmZiAtLWdpdCBh
L3BhY2thZ2UvcXQ1L3F0NXdlYmtpdC9xdDV3ZWJraXQubWsgYi9wYWNrYWdlL3F0NS9xdDV3ZWJr
aXQvcXQ1d2Via2l0Lm1rCj4gaW5kZXggMmU5NmFjYzAwZi4uYzliMzU0ZTcyNSAxMDA2NDQKPiAt
LS0gYS9wYWNrYWdlL3F0NS9xdDV3ZWJraXQvcXQ1d2Via2l0Lm1rCj4gKysrIGIvcGFja2FnZS9x
dDUvcXQ1d2Via2l0L3F0NXdlYmtpdC5tawo+IEBAIC0xMCw3ICsxMCw3IEBAIFFUNVdFQktJVF9T
T1VSQ0UgPSBxdHdlYmtpdC0kKFFUNVdFQktJVF9WRVJTSU9OKS50YXIueHoKPiAgIFFUNVdFQktJ
VF9ERVBFTkRFTkNJRVMgPSBcCj4gICAJaG9zdC1iaXNvbiBob3N0LWZsZXggaG9zdC1ncGVyZiBo
b3N0LXB5dGhvbjMgaG9zdC1ydWJ5IGdzdHJlYW1lcjEgXAo+ICAgCWdzdDEtcGx1Z2lucy1iYXNl
IGljdSBsZXZlbGRiIGpwZWcgbGlicG5nIGxpYnhtbDIgbGlieHNsdCBxdDVsb2NhdGlvbiBcCj4g
LQlxdDVzZW5zb3JzIHF0NXdlYmNoYW5uZWwgc3FsaXRlIHdlYnAgd29mZjIKPiArCW9wZW5zc2wg
cXQ1c2Vuc29ycyBxdDV3ZWJjaGFubmVsIHNxbGl0ZSB3ZWJwIHdvZmYyCj4gICBRVDVXRUJLSVRf
SU5TVEFMTF9TVEFHSU5HID0gWUVTCj4gICAKPiAgIFFUNVdFQktJVF9MSUNFTlNFX0ZJTEVTID0g
U291cmNlL1dlYkNvcmUvTElDRU5TRS1MR1BMLTIgU291cmNlL1dlYkNvcmUvTElDRU5TRS1MR1BM
LTIuMQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWls
ZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMu
YnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
