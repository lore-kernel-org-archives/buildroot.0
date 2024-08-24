Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7173EC52D6F
	for <buildroot@archiver.kernel.org>; Sat, 24 Aug 2024 04:10:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CBA32810F7;
	Sat, 24 Aug 2024 04:10:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JhHb8OmGyjCB; Sat, 24 Aug 2024 04:10:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 16F11810E3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 16F11810E3;
	Sat, 24 Aug 2024 04:10:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6D1861BF302
 for <buildroot@lists.busybox.net>; Sat, 24 Aug 2024 04:10:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6874740386
 for <buildroot@lists.busybox.net>; Sat, 24 Aug 2024 04:10:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WKZp19qWW9CK for <buildroot@lists.busybox.net>;
 Sat, 24 Aug 2024 04:10:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.238.66.15;
 helo=helium.openadk.org; envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7C00340364
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7C00340364
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7C00340364
 for <buildroot@buildroot.org>; Sat, 24 Aug 2024 04:10:13 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 333CE3536962; Sat, 24 Aug 2024 06:10:11 +0200 (CEST)
Date: Sat, 24 Aug 2024 06:10:11 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Message-ID: <ZsldI5FtO96kz4v8@waldemar-brodkorb.de>
References: <20240803155517.3499273-1-dario.binacchi@amarulasolutions.com>
 <Zq7PpfDy10IdabJK@waldemar-brodkorb.de>
 <CABGWkvpHLJm+MOrWtoAFVtR-NZM-Q0vjq4nXGEgJY4Mwbc4zwQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CABGWkvpHLJm+MOrWtoAFVtR-NZM-Q0vjq4nXGEgJY4Mwbc4zwQ@mail.gmail.com>
X-Operating-System: Linux 5.10.0-31-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1724472611; bh=IJw+q3DlT7pYTuFp3L5ODknk0K5rJ23SAZyqZiIcJ9A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Ke5Nx7tvwZKotrt1/xNbJE36b/CU8TuvS1b5k8I0nwMwmLp8Wbwwa7t/zFM5INWgP
 ICog0naGaLSIy2xcbNKeUXD836adI+GfCzf1T7RkFVQZdUryP7ZCDWCPmUAxcFOpnq
 ZnSsy7/A2eVarY/9glYc7Qzs148ViYkcQzJ2w+5ys2dta7wQS+o3YGy1WQF7ipmJe4
 fERWm4OpsUVTGxy1FwjN8gLrh49+HJRZZjtTC8KXeEZIm3QTgXNCK9/492n3LD3Yx3
 YHUyVdSqTYFxvzkb7AAZnFUIXcIpxF5mhDbcCvjkYb+xNqw8AqHnBh0MuOIIscKB2e
 Ice2h51lZczMw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256
 header.s=2022 header.b=Ke5Nx7tv
Subject: Re: [Buildroot] [PATCH 0/3] tinit and stm32f746_disco_sd_defconfig
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
Cc: Damien Le Moal <dlemoal@kernel.org>, linux-amarula@amarulasolutions.com,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgRGFyaW8sCkRhcmlvIEJpbmFjY2hpIHdyb3RlLAoKPiBIZWxsbyBXYWxkZW1hciwKPiAKPiBJ
IGFwb2xvZ2l6ZSBmb3IgdGhlIGRlbGF5ZWQgcmVzcG9uc2UuCj4gCj4gT24gU3VuLCBBdWcgNCwg
MjAyNCBhdCAyOjQ34oCvQU0gV2FsZGVtYXIgQnJvZGtvcmIgPHdieEBvcGVuYWRrLm9yZz4gd3Jv
dGU6Cj4gPgo+ID4gSGkgRGFyaW8sCj4gPiBEYXJpbyBCaW5hY2NoaSB3cm90ZSwKPiA+Cj4gPiA+
IFRoaXMgc2VyaWVzIGlzIGluc3BpcmVkIGJ5IHJlYWRpbmcgdGhlIGZvbGxvd2luZyB0b3BpYzoK
PiA+ID4KPiA+ID4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYnVpbGRyb290LzIwMjMwMjA2MjMw
MjAzLjcwZTJkYmQ4QHdpbmRzdXJmL1QKPiA+ID4KPiA+ID4gU3RhcnRpbmcgZnJvbSB0aGF0IHBh
dGNoLCBhbmQgZm9sbG93aW5nIFRob21hcyBQZXRhenpvbmkncyBzdWdnZXN0aW9ucwo+ID4gPiBy
ZWdhcmRpbmcgdGhlIHBvc3NpYmlsaXR5IG9mIHVzaW5nIGEgc2luZ2xlIG1pbmltYWwgc2NyaXB0
IHdpdGhvdXQKPiA+ID4gZHVwbGljYXRpbmcgaXQgd2l0aGluIEJ1aWxkcm9vdCwgSSBkZXZlbG9w
ZWQgdGhlc2UgdGhyZWUgcGF0Y2hlcy4KPiA+ID4gTWVhbndoaWxlLCB0aGUgY29uZmlndXJhdGlv
biBmb3IgdGhlIHN0bTMyZjc0Nl9kaXNjbyBib2FyZCB3YXMgdXNlZnVsCj4gPiA+IGZvciBkZXZl
bG9waW5nIHRoZSBkaXNwbGF5IHN1cHBvcnQgZm9yIHRoZSBib2FyZCwgd2hpY2ggd2FzIGxhdGVy
Cj4gPiA+IG1lcmdlZCBpbnRvIExpbnV4Lgo+ID4gPgo+ID4gPiBEYXJpbyBCaW5hY2NoaSAoMyk6
Cj4gPiA+ICAgcGFja2FnZS90aW5pdDogbmV3IHBhY2thZ2UKPiA+ID4gICBjb25maWdzL3N0bTMy
Zjc0Nl9kaXNjb19zZF9kZWZjb25maWc6IG5ldyBkZWZjb25maWcKPiA+ID4gICBib2FyZC9jYW5h
YW4vazIxMC1zb2M6IHVzZSB0aW5pdCBhcyBMaW51eCBpbml0IHByb2Nlc3MKPiA+Cj4gPiBZb3Ug
Y2FuIGFkZCBhCj4gPiBUZXN0ZWQtYnk6IFdhbGRlbWFyIEJyb2Rrb3JiIDx3YnhAb3BlbmFkay5v
cmc+Cj4gPiBmb3IgeW91ciBuZXh0IHBhdGNoIHN1Ym1pc3Npb24uCj4gPiBJIGJ1aWxkIGFuZCBy
dW50aW1lIHRlc3RlZCB0aGUgc3RtMzJmNzQ2IGNvbmZpZy4KPiAKPiBUaGFuayB5b3UgZm9yIHRo
ZSB0ZXN0Lgo+IAo+ID4KPiA+IEluIHdoaWNoIHZlcnNpb24gd2Ugd2lsbCBoYXZlIGRpc3BsYXkg
c3VwcG9ydCBmb3IgdGhlIGJvYXJkPwo+IAo+IFNvbWUgcGF0Y2hlcyBoYXZlIGJlZW4gbWVyZ2Vk
IGluIHZlcnNpb24gNi41Ogo+IDEzY2RkMTJhOWY5MzQxICgiZHJtL3BhbmVsOiBzaW1wbGU6IGFk
ZCBzdXBwb3J0IGZvciBSb2NrdGVjaCBSSzA0M0ZONDhIIHBhbmVsIikKPiBidXQgdGhlIGRpc3Bs
YXkgaXMgYWN0dWFsbHkgc3VwcG9ydGVkIGluIHZlcnNpb24gNi42Ogo+IDEwYTk3MGJjM2ViZmEg
KCJBUk06IGR0czogc3RtMzI6IHN1cHBvcnQgZGlzcGxheSBvbiBzdG0zMmY3NDYtZGlzY28gYm9h
cmQiKS4KPiAKPiA+IEFyZSB5b3UgYWxzbyB3b3JraW5nIG9uIHRoZSBtaXNzaW5nIGV0aGVybmV0
IHBhcnQ/Cj4gTm8sIGJ1dCB3aG8ga25vd3MsIG1heWJlIGluIHRoZSBmdXR1cmUuCj4gVGhhbmtz
IGZvciB0aGUgc3VnZ2VzdGlvbgo+IAo+ID4KPiA+IFRoYW5rcyBmb3IgdGhlIGdvb2Qgd29yay4K
PiA+Cj4gPiBUaGlzIGJvYXJkIGlzIHVzZWQgdG8gdGVzdCB1Q2xpYmMtbmcgQVJNIEZEUElDIHN1
cHBvcnQuCj4gPiBTYWRseSBGRFBJQyBzdXBwb3J0IGluIGJ1aWxkcm9vdCBuZXZlciBtYWRlIGl0
IHVwc3RyZWFtLiAoaGludCA6PSkgKQo+IAo+IERvIHlvdSBoYXZlIGFueSBkb2N1bWVudHMvbGlu
a3MgdG8gc3VnZ2VzdCBvbiB0aGlzIHRvcGljPwoKU2VlIGhlcmU6Cmh0dHBzOi8vbG9yZS5rZXJu
ZWwub3JnL2J1aWxkcm9vdC8yMDIzMDkzMDIyMzYyMi4wNmUzMmYzY0B3aW5kc3VyZi9ULwoKSSBr
bm93IEVtY3JhZnQgaXMgdXNpbmcgdGhlc2UgcGF0Y2hlcyBmb3IgdGhlaXIgcHJvZHVjdHM6Cmh0
dHBzOi8vZ2l0aHViLmNvbS9FbWNyYWZ0U3lzdGVtcy9idWlsZHJvb3QKCkl0IHdvcmtzIHJlYWxs
eSBtb3JlIHN0YWJsZSB0aGVuIEJGTEFULCBiZWNhdXNlIG9mIGxlc3MgbWVtb3J5CmZyYWdtZW50
YXRpb24uIFdpdGggQkZMQVQgaSBjYW4gbm90IGV4ZWN1dGUgbW9yZSB0aGVuIDQgb3IgNQpjb21t
YW5kcyBiZWZvcmUgSSBnZXQgYSBtZW1vcnkgcHJvYmxlbSBvbiB0aGUgZGV2aWNlLgoKYmVzdCBy
ZWdhcmRzCiBXYWxkZW1hcgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0
dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
