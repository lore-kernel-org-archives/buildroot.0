Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97501C7EE2E
	for <buildroot@archiver.kernel.org>; Mon, 12 Jun 2023 16:54:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 17D4B843E2;
	Mon, 12 Jun 2023 16:54:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 17D4B843E2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Dyt3o8NBiagt; Mon, 12 Jun 2023 16:54:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6C5C983AB2;
	Mon, 12 Jun 2023 16:54:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6C5C983AB2
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 678D91BF36D
 for <buildroot@lists.busybox.net>; Mon, 12 Jun 2023 16:54:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4CA534150E
 for <buildroot@lists.busybox.net>; Mon, 12 Jun 2023 16:54:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4CA534150E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9ggboWv_x5ZC for <buildroot@lists.busybox.net>;
 Mon, 12 Jun 2023 16:54:24 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D5145414CA
Received: from smtpcmd0641.aruba.it (smtpcmd0641.aruba.it [62.149.156.41])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D5145414CA
 for <buildroot@buildroot.org>; Mon, 12 Jun 2023 16:54:23 +0000 (UTC)
Received: from [192.168.50.220] ([146.241.109.39])
 by Aruba Outgoing Smtp  with ESMTPSA
 id 8ko9qtEA9vw1N8ko9qzCos; Mon, 12 Jun 2023 18:54:21 +0200
Message-ID: <ff7312fd-f85f-373e-2b0e-3e3d003b84ad@benettiengineering.com>
Date: Mon, 12 Jun 2023 18:54:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
To: Indrek Kruusa <indrek.kruusa@gmail.com>,
 Buildroot Mailing List <buildroot@buildroot.org>
References: <CA+fTLhgfd1TXsc106CVJWzMPKiFE2BtPW6wieF8MxhoUik=Zcg@mail.gmail.com>
Content-Language: en-US
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <CA+fTLhgfd1TXsc106CVJWzMPKiFE2BtPW6wieF8MxhoUik=Zcg@mail.gmail.com>
X-CMAE-Envelope: MS4xfMIJ95aM/RnuUje1jfpQJZK9gVwqGl2Ipg0hfGGjSZucg7WzRNQvb72xWF7K96atvP9YaYTa5barYFAEwvplHsHyZDI8ddeqzsOZbI4wwBdRxNzVplpm
 C+pR6d9YFShUSK4M/bcun3+rNzaVIwdHseXb4RUlBuzhH3DBlc/FFK+T1Lzpd8uKle7/9iRrjkmIeJIzDEdoAwDrGQB5ep7yKtyRhwo9YkVP3W1ILHD0Wn2C
 cMUyVJiyWmGKUk2Ml3k0JYE2ltq2ekmEOMPThbSEywg=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1686588861; bh=EkuArhhQ+jrADKhn3ZYWxQDL47ZDF4Jj652B3PZOyC4=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=MmxoRbViZPwUtEkqw72+zLPwfJM7yniT5IowbL8HdTxYK3yVPUJrqYibSsxSCiPWO
 hWxqBkK7/CmV/B9VAFlfloytzThW5gkqwn97cVX94XQ3cPaxawA/4faS3/iY4wJIj4
 XnvfMiWD63MJvyVWHnqgi5BlgbT4zyCU+ZW71bIa8FDT3qa69Qoor0cDhEpY5VsLwg
 32YtVwQRVXtQuxEtOJHU+4d8+SQGrQtNiu7UblNBe/dCRPo8M3NpWlchcFCkFBicne
 zMLGgVUsorV007J5ldXShYRUpQc3OEoUIPlNq1aFMfhdmABv2N1icceR2tZmYQosez
 REVE1iEoWQS1w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=MmxoRbVi
Subject: Re: [Buildroot] package/rtl8189fs: question about the debug mode
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgSW5kcmVrLAoKT24gMTIvMDYvMjMgMTc6MjQsIEluZHJlayBLcnV1c2Egd3JvdGU6Cj4gSGkh
Cj4gV2hlbiBidWlsZGluZyBydGw4MTg5ZnMgZHJpdmVyIGluIGJ1aWxkcm9vdCBjdXJyZW50bHkg
dGhlbiBpdCBydW5zIGluIAo+IGRlYnVnIG1vZGUgKG9yaWdpbmFsIE1ha2VmaWxlIGxpbmUgOTE6
wqBDT05GSUdfUlRXX0RFQlVHID0geSkuIEl0J3MgCj4gcmVhbGx5IHZlcmJvc2UgKGF0IGxlYXN0
IDUgcm93cyBwZXIgc2Vjb25kKSBhbmQgYmFzaWNhbGx5wqBpdCByZW5kZXJzIHRoZSAKPiBzZXJp
YWwgY29uc29sZSB1c2VsZXNzLgo+IEkgd291bGQgbGlrZSB0byB0dXJuIG9mZiB0aGUgZGVidWcg
bW9kZSBpbiBhIG5ldyBib2FyZCBjb25maWcgKHN0aWxsIAo+IHByZXBhcmluZyBhIHBhdGNoIGZv
ciB0aGlzKS4gQnV0IHRoZW4gSSB3b25kZXIgaG93IG90aGVyIHVzZXJzIGFyZSAKPiBsaXZpbmcg
d2l0aCBpdC4gTWF5YmUgaXQgc2hvdWxkIGJlIHBhdGNoZWQgb24gcGFja2FnZSBsZXZlbCBhbmQg
bm90IG9uIAo+IGJvYXJkIGxldmVsPwoKSSB0aGluayB0aGF0IEkgY2FuIHNlbmQgYSBwYXRjaCBm
b3IgdGhpcyB0aGF0IGVuL2Rpc2FibGUKQ09ORklHX1JUV19ERUJVRyBkZXBlbmRpbmcgb24gQlIy
X0VOQUJMRV9SVU5USU1FX0RFQlVHLgoKSSBzZWUgaXQgbGlrZSBhIGNvbnNpc3RlbnQgc29sdXRp
b24gYW5kIEkndmUganVzdCBzZW50IGEgcGF0Y2ggZm9yIHRoaXM6Cmh0dHBzOi8vcGF0Y2h3b3Jr
Lm96bGFicy5vcmcvcHJvamVjdC9idWlsZHJvb3QvcGF0Y2gvMjAyMzA2MTIxNjUzNDQuMzgyOTMw
NC0xLWdpdWxpby5iZW5ldHRpQGJlbmV0dGllbmdpbmVlcmluZy5jb20vCgpCdXQgdGhlcmUgaXMg
YWxzbyBhbm90aGVyIHNvbHV0aW9uIHRvIHRoaXMgYnkgcGFzc2luZyB0byBrZXJuZWwgb3B0aW9u
cwp0aGUgbG9nIGxldmVsIG9yIGV2ZW4gYXQgcnVudGltZSwgdGFrZSBhIGxvb2sgaGVyZToKaHR0
cHM6Ly9naXRodWIuY29tL3VsbGkta3JvbGwvcnRsODgxNGF1L2Jsb2IvbWFzdGVyL0RvY3VtZW50
L0hvd190b19zZXRfZHJpdmVyX2RlYnVnX2xvZ19sZXZlbC5wZGYKCkkgaGF2ZW4ndCB0ZXN0ZWQg
aXQgYnV0IGl0IHNob3VsZCB3b3JrLgoKTGV0IG1lIGtub3cuCgpCZXN0IHJlZ2FyZHMKLS0gCkdp
dWxpbyBCZW5ldHRpCkNFTyZDVE9AQmVuZXR0aSBFbmdpbmVlcmluZyBzYXMKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlz
dApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFp
bG1hbi9saXN0aW5mby9idWlsZHJvb3QK
