Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB2D5C433F5
	for <buildroot@archiver.kernel.org>; Fri, 11 Feb 2022 14:32:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5F85A416C8;
	Fri, 11 Feb 2022 14:32:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wAO04k3muYi9; Fri, 11 Feb 2022 14:32:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 98702416C7;
	Fri, 11 Feb 2022 14:32:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 48BA61BF255
 for <buildroot@lists.busybox.net>; Fri, 11 Feb 2022 14:31:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3797641655
 for <buildroot@lists.busybox.net>; Fri, 11 Feb 2022 14:31:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id s_WIwsQAOI37 for <buildroot@lists.busybox.net>;
 Fri, 11 Feb 2022 14:31:58 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd0986.aruba.it (smtpcmd0986.aruba.it [62.149.156.86])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9DB99416C7
 for <buildroot@buildroot.org>; Fri, 11 Feb 2022 14:31:57 +0000 (UTC)
Received: from smtpclient.apple ([151.34.57.47])
 by Aruba Outgoing Smtp  with ESMTPA
 id IWxmnOdKSks1JIWxmngm2x; Fri, 11 Feb 2022 15:31:55 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1644589915; bh=jVjSUUeoo5nXGBnlNDZ9GZhjzQdZndAkFyfEu0V1RMI=;
 h=Content-Type:From:Mime-Version:Subject:Date:To;
 b=cnzFIbL5emWo604xBHr8IGM3oakaStBW9eHLNEgpWPuNNzMvcLNwke7ZINuY5KKsr
 ozZCCDwTxxAj5z8SKwAzBz2neT3zBHanBz/C2efkwGruSOTinP373sJ0Yhp0jmF11C
 4dMxGi3MOyJSZQ7woKJE8FMSAsyaTYjr0avSDx4XAw46VKH6JYIPOMh2d8lOwfmAZy
 qmXcTTDEKQsBCecG1Ro8TPjUX2GEtt3rmWer95h+pi8EduMV0YQ+pcojeluf/1jnzq
 hZqvw2d9C2lfPmzKTc45vLRAL53AF86bMF/7OVr27k0ypioeh86KKpHOONkiZkYUl5
 C34gM8r3tKG3Q==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Mime-Version: 1.0 (1.0)
Date: Fri, 11 Feb 2022 15:31:53 +0100
Message-Id: <C7BBE4CB-5D29-40AC-830D-C4A78198CE02@benettiengineering.com>
References: <20220211140855.917229-1-eugen.hristev@microchip.com>
In-Reply-To: <20220211140855.917229-1-eugen.hristev@microchip.com>
To: Eugen Hristev <eugen.hristev@microchip.com>
X-Mailer: iPhone Mail (19C63)
X-CMAE-Envelope: MS4wfNV5PBCsrLJYHpssTru9ozA8fFO6HYJS7kyCZPmB1EYyFzroT+xXXzbIFAJ/ipPOPiW4KBD9ZpvqsyQiVqaYwKnqVj6xYeFdjqdi87j6UeuTvxR+6RzM
 el6vTPUhQIK5NPSdLsleGBqGv5MbqaeKa3afwE4ApiqThliJPV/KzGXi4CBV10ILP681wx/PPGmU+bUpaOoU4NXKOTc5doiLEU08XcAOaFEE9ZdYt0goTRkQ
 Sk8MyqOsZ2oDEhlSuxG/Dg==
Subject: Re: [Buildroot] [PATCH]
 configs/microchip_sama7g5ek_mmc_dev_defconfig: add rng tools
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgRW5naW4sIEFsbCwKCnNvcnJ5IGZvciBodG1sIGJ1dCBJ4oCZbSBvbiBtb2JpbGUsCgo+IEls
IGdpb3JubyAxMSBmZWIgMjAyMiwgYWxsZSBvcmUgMTU6MDksIEV1Z2VuIEhyaXN0ZXYgdmlhIGJ1
aWxkcm9vdCA8YnVpbGRyb290QGJ1aWxkcm9vdC5vcmc+IGhhIHNjcml0dG86Cj4gCj4g77u/QWRk
IHJuZyB0b29scy4gV2l0aG91dCB0aGlzLCB3aGVuIGJvb3RpbmcsIHByb21wdCB3aWxsIG5vdAo+
IGFwcGVhciB1bnRpbCAncmFuZG9tOiBjcm5nIGluaXQgZG9uZScgYXBwZWFycy4KPiBBdm9pZCB0
aGlzIGJ5IHVzaW5nIHJuZyB0b29scyB3aXRob3V0IHRoZSBsaWJqaXR0ZXJlbnRyb3B5Lgo+IExp
YmppdHRlcmVudHJvcHkgaXMgYSBqaXR0ZXIgc291cmNlIG9mIGVudHJvcHkgd2hpY2ggZG9lcwo+
IG5vdCBoZWxwIGZvciBBVDkxIGNwdXMgYXMgdGhlIGppdHRlciBkb2VzIG5vdCBoYXZlCj4gZW5v
dWdoIHZhcmlhbmNlIHRvIGdlbmVyYXRlIGZhc3QgZW5vdWdoIGVudHJvcHkuCj4gCj4gU2lnbmVk
LW9mZi1ieTogRXVnZW4gSHJpc3RldiA8ZXVnZW4uaHJpc3RldkBtaWNyb2NoaXAuY29tPgo+IC0t
LQo+IEhpLAo+IAo+IFRoaXMgc2hvdWxkIGdvIGZvciAyMDIyLjAyIGluIG15IG9waW5pb24uCj4g
Cj4gVGhhbmtzLAoKSGVyZSB5b3Ugc2hvdWxkIGFkZCBvdGhlciAzIGRhc2hlcyBtb3JlLgoKVGhh
bmsgeW91IGZvciBwcm92aWRpbmcgc3VjaCBmaXguIFVuZm9ydHVuYXRlbHkgSSBkaWRu4oCZdCBo
YXZlIHRoZSBoYXJkd2FyZSB0byB0ZXN0IGFuZCBmaXggaXQuCgpSZXZpZXdlZC1ieTogR2l1bGlv
IEJlbmV0dGkgPGdpdWxpby5iZW5ldHRpQGJlbmV0dGllbmdpbmVlcmluZy5jb20+CgpCZXN0IHJl
Z2FyZHMK4oCULQpHaXVsaW8gQmVuZXR0aQpCZW5ldHRpIEVuZ2luZWVyaW5nIHNhcwoKPiAKPiBj
b25maWdzL21pY3JvY2hpcF9zYW1hN2c1ZWtfbW1jX2Rldl9kZWZjb25maWcgfCAyICsrCj4gMSBm
aWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9jb25maWdzL21p
Y3JvY2hpcF9zYW1hN2c1ZWtfbW1jX2Rldl9kZWZjb25maWcgYi9jb25maWdzL21pY3JvY2hpcF9z
YW1hN2c1ZWtfbW1jX2Rldl9kZWZjb25maWcKPiBpbmRleCAzMjUzYmNlNDAxLi44OTVlNjNlZGNk
IDEwMDY0NAo+IC0tLSBhL2NvbmZpZ3MvbWljcm9jaGlwX3NhbWE3ZzVla19tbWNfZGV2X2RlZmNv
bmZpZwo+ICsrKyBiL2NvbmZpZ3MvbWljcm9jaGlwX3NhbWE3ZzVla19tbWNfZGV2X2RlZmNvbmZp
Zwo+IEBAIC0yNyw2ICsyNyw4IEBAIEJSMl9QQUNLQUdFX01NQ19VVElMUz15Cj4gQlIyX1BBQ0tB
R0VfTVREPXkKPiBCUjJfUEFDS0FHRV9XSUxDMTAwMF9GSVJNV0FSRT15Cj4gQlIyX1BBQ0tBR0Vf
RVZURVNUPXkKPiArQlIyX1BBQ0tBR0VfUk5HX1RPT0xTPXkKPiArIyBCUjJfUEFDS0FHRV9STkdf
VE9PTFNfSklUVEVSRU5UUk9QWV9MSUJSQVJZIGlzIG5vdCBzZXQKPiBCUjJfUEFDS0FHRV9TRVRT
RVJJQUw9eQo+IEJSMl9QQUNLQUdFX1NQSV9UT09MUz15Cj4gQlIyX1BBQ0tBR0VfVVNCVVRJTFM9
eQo+IC0tIAo+IDIuMzMuMAo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCj4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+IGJ1aWxkcm9vdEBidWlsZHJv
b3Qub3JnCj4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVp
bGRyb290CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpi
dWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlz
dHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
