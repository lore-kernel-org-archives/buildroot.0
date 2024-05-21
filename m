Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC261C25B74
	for <buildroot@archiver.kernel.org>; Tue, 21 May 2024 09:28:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 904BC80E13;
	Tue, 21 May 2024 09:28:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id emrW_rFYSkKV; Tue, 21 May 2024 09:28:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8A3C480E2A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8A3C480E2A;
	Tue, 21 May 2024 09:28:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 66AAD1C50A9
 for <buildroot@lists.busybox.net>; Tue, 21 May 2024 09:28:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 53B6780E13
 for <buildroot@lists.busybox.net>; Tue, 21 May 2024 09:28:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TVQMGKxGYrPL for <buildroot@lists.busybox.net>;
 Tue, 21 May 2024 09:28:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::631; helo=mail-ej1-x631.google.com;
 envelope-from=michael@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0073580DC7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0073580DC7
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0073580DC7
 for <buildroot@buildroot.org>; Tue, 21 May 2024 09:28:55 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-a5a4bc9578cso789231066b.2
 for <buildroot@buildroot.org>; Tue, 21 May 2024 02:28:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716283734; x=1716888534;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pe+fKjuy8PmUdQZtnZnHDQyAQCJETsEAunjjzPuTkWE=;
 b=o5tu3gCI8WB0j+N5Yf7JfQQbQkP1JKtGuSQyydNDz5b41AaB72YTq8or3/VxBXW1D9
 GEA9Zsv3wK8PkwhdMIStswx19AK0ZI7Wxm/K6KlaMqfAP+ynZWdpglx1mr4JneVSzB3T
 d3ukBqid1fNlh7k3KDQAW3fCwqD3Hf0QyA+nFTlUF55Np0ng7kKVZf5ve/zVztONflG6
 sh86+bljwQ1bF9+X6Sxin1aDpCgeqFj+Nc71x0XAS+5c248N63kGZn4uHu3Hcr09p7Ow
 5qip2H3RzBUGx0IieLj7VD4xXS3cP5bIsUq6eYpNmbRXv+aGVdk+o0OZnR6F3Tpgh6m1
 EziA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUawufWe6RgPztjWjhNOs1/GyeC1BKGDEoqXWr2BBLHiFG9LbiM+bBsXyqaQDrZBVWKXxabQnlKzmDIX3bV9GLhpUzLtH66bg==
X-Gm-Message-State: AOJu0YzSNcGicduHTVqwJV5rwyNoRCE8YPwFtbyC2PWW6zpKvmdamEif
 GAVS8Mm1jGuPKgTHUp9GccauzDF/nI85wLIEph6StpISCKVZXaBAex167SP/cZpnNr/gJtCZJxo
 W8cuaE1iVyXXqZ55i3sW5IdaMvdaUaEebrB6HwA==
X-Google-Smtp-Source: AGHT+IHoKTHb0d8n5jPb+DNpx5uj/1xAAW+CTRabvD8ptqddey9IMBtpHvfmAH3r1Sdr0yRO1pHpt0cqRui4OjmR/Oc=
X-Received: by 2002:a17:906:2309:b0:a59:bbf0:88f0 with SMTP id
 a640c23a62f3a-a5a2d55eec2mr3053725266b.18.1716283733835; Tue, 21 May 2024
 02:28:53 -0700 (PDT)
MIME-Version: 1.0
References: <20240421095353.208034-1-dario.binacchi@amarulasolutions.com>
 <20240421095353.208034-2-dario.binacchi@amarulasolutions.com>
 <20240510215442.3475120a@windsurf>
 <CAOf5uwkDmcxhWJUFhxjw_GJTiTEO5oEexb0Xjh6aNJx+K_9dXA@mail.gmail.com>
 <ZkwwN1NKZ2o1xMba@landeda>
In-Reply-To: <ZkwwN1NKZ2o1xMba@landeda>
From: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Date: Tue, 21 May 2024 11:28:42 +0200
Message-ID: <CAOf5uwnVbowN6GCYUxFL0xh2YV9AvG2JTkuyQR6rk+56J=3DLQ@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1716283734; x=1716888534;
 darn=buildroot.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pe+fKjuy8PmUdQZtnZnHDQyAQCJETsEAunjjzPuTkWE=;
 b=ZojfZWZpBwAP2oXZ38/Dem0i8X90M8WtPK51UacyJGqIOdrRa1Dj7Jos7pKZDsxtcL
 oUgOyId9r4ULScmAUplKt9fsYVtI/XueOETOOHB/asQr+EPlFfTwFDzqQRmWX71pppph
 FbIZ5z9vYCj9OJKAfX+819C2c78eRaoOH9Kgo=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=ZojfZWZp
Subject: Re: [Buildroot] [RFC PATCH 1/2] support/scripts/genimage.sh:
 support creating a bmap image
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
Cc: Xuanhao Shi <X15000177@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 Romain Naour <romain.naour@smile.fr>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com, Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

WWFubiwgYWxsCgpPbiBUdWUsIE1heSAyMSwgMjAyNCBhdCA3OjI14oCvQU0gWWFubiBFLiBNT1JJ
TiA8eWFubi5tb3Jpbi4xOTk4QGZyZWUuZnI+IHdyb3RlOgo+Cj4gTWljaGFlbCwgQWxsLAo+Cj4g
T24gMjAyNC0wNS0xMCAyMjoxNyArMDIwMCwgTWljaGFlbCBOYXp6YXJlbm8gVHJpbWFyY2hpIHNw
YWtlIHRodXNseToKPiA+IE9uIEZyaSwgTWF5IDEwLCAyMDI0IGF0IDk6NTTigK9QTSBUaG9tYXMg
UGV0YXp6b25pCj4gPiA8dGhvbWFzLnBldGF6em9uaUBib290bGluLmNvbT4gd3JvdGU6Cj4gPiA+
IE9uIFN1biwgMjEgQXByIDIwMjQgMTE6NTM6NTIgKzAyMDAKPiA+ID4gRGFyaW8gQmluYWNjaGkg
PGRhcmlvLmJpbmFjY2hpQGFtYXJ1bGFzb2x1dGlvbnMuY29tPiB3cm90ZToKPiA+ID4gPiBUaGUg
cGF0Y2ggYWRkcyBhbiBvcHRpb24gdG8gY3JlYXRlLCBpbiBhZGRpdGlvbiB0byB0aGUgdXN1YWwg
aW1hZ2UsIGFuCj4gPiA+ID4gaW1hZ2Ugb2YgdHlwZSBibWFwIHRoYXQgZHJhc3RpY2FsbHkgcmVk
dWNlcyB0aGUgYW1vdW50IG9mIGRhdGEgdGhhdAo+ID4gPiA+IG5lZWRzIHRvIGJlIHdyaXR0ZW4g
dG8gYW4gU0QgY2FyZCwgcmVzdWx0aW5nIGluIHRpbWUgc2F2aW5ncy4KPiBbLS1TTklQLS1dCj4g
PiA+IEFub3RoZXIgcXVlc3Rpb24sIHBlcmhhcHMgZm9yIERhcmlvLCBvciBvdGhlciBwZW9wbGUg
ZmFtaWxpYXIgd2l0aAo+ID4gPiBnZW5pbWFnZTogaWYgdGhlIHJvb3Rmcy5leHQ0IGdlbmVyYXRl
ZCBieSBCdWlsZHJvb3QgaXMgc3BhcnNlLCBpcwo+ID4gPiBnZW5pbWFnZSBhYmxlIHRvIHByZXNl
cnZlIHRoZSAiaG9sZXMiIHdoZW4gZ2VuZXJhdGluZyB0aGUgc2RjYXJkLmltZwo+ID4gPiB0aGF0
IGluY2x1ZGVzIHRoZSByb290ZnMuZXh0NCA/Cj4KPiA+IEFybm91dCwgWWFubiwgUGV0ZXIsIFJv
bWFpbiwgd2hhdCBkbyB5b3UgdGhpbms/IERvIHlvdSBzZWUgb3RoZXIKPiA+IGFwcHJvYWNoZXMg
dG8gZWFzaWx5IGFsbG93IGdlbmVyYXRpbmcgYm1hcC1jb21wYXRpYmxlIGltYWdlcz8KPgo+IEkg
d29uZGVyIGlmIHdlIHNob3VsZCByZWFsbHkgZG8gdGhhdCwgaW4gZmFjdC4KPgo+IEkgYmVsaWV2
ZSBpdCBpcyBpbi1zY29wZSB0aGF0IHdlIGRvIGdlbmVyYXRlIGRpc2sgaW1hZ2VzLCB3aGljaCB3
ZSBkbwo+IHdpdGggZ2VuaW1hZ2UuIEhvd2V2ZXIsIHRyYW5zZmVycmluZywgZGlzdHJpYnV0aW5n
LCB3cml0aW5nLCBldGMuLiB0aGUKPiBnZW5lcmF0ZWQgaW1hZ2VzIEkgdGhpbmsgaXMgb3V0IG9m
IHNjb3BlLiBXZSBtYXkgcHJvdmlkZSB0b29scyB0byBoZWxwCj4gd2l0aCB0aGF0LCB0aG91Z2gs
IGFuZCB3ZSBkbyBieSBwcm92aWRpbmcge2hvc3QtLH1ibWFwLXRvb2xzLgo+Cj4gPiBJZiB5b3Ug
Y29uc2lkZXIgc3BhcnNlIHRoZSB3YXkgdGhhdCBmYXN0Ym9vdCBoYW5kbGUgaXQsIHNvIEkgaGF2
ZQo+ID4gcXVpY2sgdGVzdGVkIGFuZCBzZWVtcwo+ID4gZ2VuaW1hZ2UgY2FuIGNyZWF0ZSBzZGNh
cmQuaW1nIGFuZCBzZGNhcmQtc3BhcnNlLmltZyB1c2luZyBhIHNwZWNpZmljIGdlbmNvbmZpZwo+
Cj4gSSB0aGluayB0aGUgcXVlc3Rpb24gYnkgVGhvbWFzIHdhcyB3aGV0aGVyLCBnaXZlbiBhbiBp
bnB1dCBzcGFyc2UgZmlsZSwKPiBnZW5pbWFnZSB3aWxsIGtlZXAgdGhlIGdlbmVyYXRlZCBpbWFn
ZSBzcGFyc2UgaW4gdGhlIHNhbWUgcGxhY2VzIHRoZQo+IGlucHV0IGZpbGUgd2FzIChvbmx5IHNo
aWZ0ZWQgYnkgdGhlIG9mZnNldCB0aGF0IGlucHV0IGZpbGUgd2FzIGNvcGllZAo+IGF0IGluIHRo
ZSBpbWFnZSkuCj4KPiBGb3IgZXhhbXBsZSwgbWtmcy5leHQgY2FuIGNyZWF0ZSBzcGFyc2UgZmls
ZXMsIGFuZCBzdWNoIGEgZmlsZSBjYW4gYmUKPiBmZWQgdG8gZ2VuaW1hZ2UsIHRvIGNyZWF0ZSBh
IGRpc2sgaW1hZ2UuIFdlIHdhbnQgdGhlIGdlbmVyYXRlZCBkaXNrCj4gaW1hZ2UgdG8gYmUgc3Bh
cnNlZCBpbiB0aGUgc2FtZSBwb3NpdGlvbnMgdGhlIGV4dDIgaW1hZ2Ugd2FzLCBlLmcuIHdpdGgK
PiAnWCcgYXMgbm8taG9sZSBibG9ja3MsICcuJyBhcyBob2xlcywgYW5kICdCJyBhcyB0aGUgYm9v
dGxvYWRlcjoKPgo+ICAgcm9vdGZzLmV4dDIgICAgICAgIFhYWFhYLi4uLi4uLi5YWFguLi5YWFhY
Li4uLlhYWFhYLi4uLi4uLi5YLi4uLgo+ICAgZGlzay5pbWcgICAgICAgQkJCQlhYWFhYLi4uLi4u
Li5YWFguLi5YWFhYLi4uLlhYWFhYLi4uLi4uLi5YLi4uLgo+Cj4gTm90ZSB0aGF0IHNvbWUgWCBi
bG9jayBjYW4gYmUgYWxsLXplcm9lcywgYmVjYXVzZSB0aGV5IGFyZSB0aGUgYml0bWFwIG9mCj4g
dGhlIGZpbGVzeXN0ZW07IHRob3NlIG11c3Qgbm90IGJlIHNraXBwZWQgd2hlbiB3cml0aW5nIHRv
IHRoZSBmaW5hbAo+IHN0b3JhZ2UsIG90aGVyd2lzZSB0aGUgZmlsZXN5c3RlbSB3b3VsZCBiZSBj
b3JydXB0ZWQuIElmIGdlbmltYWdlCj4gZGVjaWRlcyB0aGF0IGFsbC16ZXJvZXMgYmxvY2sgYXJl
IHNwYXJzZWQsIHRoZW4gdGhpcyBpcyBicm9rZW4uCj4KPiBJIHRoaW5rIHRoYXQgd2FzIHRoZSBx
dWVzdGlvbiByYWlzZWQgYnkgVGhvbWFzLCBhbmQgSSBkb24ndCB1bmRlcnN0YW5kCj4gaG93IHlv
dXIgcmVwbHkgYW5zd2VycyB0aGF0LCBzbyBtYXliZSBJIG1pc3NlZCBzb21ldGhpbmcuLi4KPgoK
U2VlbXMgSSBkaWQgbm90IHVuZGVyc3RhbmQgdGhlIHF1ZXN0aW9uLiBNeSBpZGVhIG9uIHRoZSB0
b3BpYyBpcyBob3cKd2UgY2FuIGdlbmVyYXRlCmltYWdlcyB0aGF0IHdlIGNhbiBlYXNpbHkgZmxh
c2guIE5vdyBJIHVuZGVyc3RhbmQgdGhlIHF1ZXN0aW9uIG9mClRob21hcyBhbmQgdGhhbmsgeW91
LgoKWWFubiBjYW4gSSBhc2sgaG93IHdlIGNhbiB1c2UgYW4gaW1hZ2UgZ2VuZXJhdGVkIGFzIHlv
dSBkZXNjcmliZSBiZWZvcmU/CgpNaWNoYWVsCgo+IFJlZ2FyZHMsCj4gWWFubiBFLiBNT1JJTi4K
Pgo+IC0tCj4gLi0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0t
LS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4KPiB8ICBZYW5uIEUuIE1PUklOICB8IFJl
YWwtVGltZSBFbWJlZGRlZCB8IC8iXCBBU0NJSSBSSUJCT04gfCBFcmljcycgY29uc3BpcmFjeTog
fAo+IHwgKzMzIDY2MiAzNzYgMDU2IHwgU29mdHdhcmUgIERlc2lnbmVyIHwgXCAvIENBTVBBSUdO
ICAgICB8ICBfX18gICAgICAgICAgICAgICB8Cj4gfCArMzMgNTYxIDA5OSA0MjcgYC0tLS0tLS0t
LS0tLS4tLS0tLS0tOiAgWCAgQUdBSU5TVCAgICAgIHwgIFxlLyAgVGhlcmUgaXMgbm8gIHwKPiB8
IGh0dHA6Ly95bW9yaW4uaXMtYS1nZWVrLm9yZy8gfCBfLypcXyB8IC8gXCBIVE1MIE1BSUwgICAg
fCAgIHYgICBjb25zcGlyYWN5LiAgfAo+ICctLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS1e
LS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0tLS0nCgoKCi0tIApN
aWNoYWVsIE5henphcmVubyBUcmltYXJjaGkKQ28tRm91bmRlciAmIENoaWVmIEV4ZWN1dGl2ZSBP
ZmZpY2VyCk0uICszOSAzNDcgOTEzIDIxNzAKbWljaGFlbEBhbWFydWxhc29sdXRpb25zLmNvbQpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCgpBbWFydWxhIFNvbHV0aW9ucyBCVgpK
b29wIEdlZXNpbmt3ZWcgMTI1LCAxMTE0IEFCLCBBbXN0ZXJkYW0sIE5MClQuICszMSAoMCk4NSAx
MTEgOTE3MgppbmZvQGFtYXJ1bGFzb2x1dGlvbnMuY29tCnd3dy5hbWFydWxhc29sdXRpb25zLmNv
bQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJv
b3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVp
bGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
