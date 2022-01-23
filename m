Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77C5DC433F5
	for <buildroot@archiver.kernel.org>; Sun, 23 Jan 2022 19:13:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 42FEB812AF;
	Sun, 23 Jan 2022 19:13:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UC-eKMKCAEBc; Sun, 23 Jan 2022 19:13:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 66480812A8;
	Sun, 23 Jan 2022 19:13:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7AD7E1BF406
 for <buildroot@lists.busybox.net>; Sun, 23 Jan 2022 19:12:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 67B084014C
 for <buildroot@lists.busybox.net>; Sun, 23 Jan 2022 19:12:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id O7VHRCNH5YgD for <buildroot@lists.busybox.net>;
 Sun, 23 Jan 2022 19:12:29 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd0871.aruba.it (smtpcmd0871.aruba.it [62.149.156.71])
 by smtp2.osuosl.org (Postfix) with ESMTP id 99D4240106
 for <buildroot@buildroot.org>; Sun, 23 Jan 2022 19:12:28 +0000 (UTC)
Received: from smtpclient.apple ([146.241.178.108])
 by Aruba Outgoing Smtp  with ESMTPA
 id BiHqn2q9vc6LXBiHqnxd8Q; Sun, 23 Jan 2022 20:12:26 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1642965146; bh=hhoE01CRjQPdSYfqZpZdES+d6qtXL79bCRqIGxP1dsw=;
 h=Content-Type:From:Mime-Version:Subject:Date:To;
 b=HJNp9avSiBkIxhDGJIdSCRO+9Ty0vMjY9ojmJtZWXHR815UwCin2Gsc6jEjzw2szZ
 WNmVizd7wmdHjYxfl+2cNTBC2WK3m+MpDNBrSlIggF8irc7NCquumPVCEbq4rFts3p
 26BlrrRJoyhTpqFUm12GHFj36sKul/qpdzy2L+PdX7jhoPIji4GtPljeNS5Mok1dsy
 YYRFiwB48eDrWV29kQ7D7Xg3kc9UkfSBAR/2LZ1r/rVPbJ9D4ohkoCMpHI9CijtGUy
 24hHgXdteqAJsr+UGoYf/QKCkIJgvSOk2P4v+kS+41+4lNfTn0+2/XGIRec7WJxFnk
 NUo9Eoy9WgpMw==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Mime-Version: 1.0 (1.0)
Date: Sun, 23 Jan 2022 20:12:25 +0100
Message-Id: <83218573-DFC3-4AA3-B21E-F5C32DBADC1B@benettiengineering.com>
References: <9c9b7005-6f85-f812-21b5-fa029136477b@gmail.com>
In-Reply-To: <9c9b7005-6f85-f812-21b5-fa029136477b@gmail.com>
To: Sergey Kuzminov <kuzminov.sergey81@gmail.com>
X-Mailer: iPhone Mail (19C63)
X-CMAE-Envelope: MS4wfOd4EQ9ljQfmTHrRwX8lpMbMGcuHP1sR54Nkit8N3b7D3Kv+GxK/pr4WZ0Fe3PSfpMAYwA4P11C96kz3w12EjYvE+3v4azkiSftbL061jemDvC2sjMEt
 0toFoSsE2wwMw0QEBKLsHodfiRv3PmdcHRiDVdXIf+y5F41qO7IAcmSPT6IhBZBpLO7X2Y65ntT2FB7v2zNms4G3r2YbGkylBUrAaWiNZSR72VDpYA3IB8RJ
 mJFsqrOyBD580uEwRyRhxQ==
Subject: Re: [Buildroot] [PATCH 25/28] configs/orangepi_zero_defconfig:
 enable NEON/VFPV4 FPU strategy
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

SGkgU2VyZ2V5LAoKdGhhbmsgeW91IGZvciB0aGUgVGVzdGVkLWJ5LCBidXQgeW91IHNob3VsZCBw
dXQgaXTigKYKCj4gSWwgZ2lvcm5vIDIzIGdlbiAyMDIyLCBhbGxlIG9yZSAxOTowOCwgU2VyZ2V5
IEt1em1pbm92IDxrdXptaW5vdi5zZXJnZXk4MUBnbWFpbC5jb20+IGhhIHNjcml0dG86Cj4gCj4g
77u/MTguMDEuMjAyMiAxMzo0MywgR2l1bGlvIEJlbmV0dGk6Cj4+IFRoaXMgYm9hcmQgaGFzIEFs
bHdpbm5lciBIMisoY29tcGF0aWJsZSB3aXRoIEgzKSB0aGF0IGlzIGEgY29ydGV4LUE3IGFuZAo+
PiBzdXBwb3J0cyBORU9OL1ZGUFY0IEZQVSBzdHJhdGVneSwgc28gbGV0J3MgZW5hYmxlIGl0IGlu
c3RlYWQgb2Ygb25seSBWRlBWNC4KPj4gU2lnbmVkLW9mZi1ieTogR2l1bGlvIEJlbmV0dGkgPGdp
dWxpby5iZW5ldHRpQGJlbmV0dGllbmdpbmVlcmluZy5jb20+CgrigKZoZXJlLCBhZnRlciBteSBT
b0IuCgpBbmQgd2hlbiBhbnN3ZXJpbmcgdG8gTWFpbGluZyBMaXN0KE1MKSwgYWx3YXlzIHVzZSDi
gJxSZXBseSB0byBBbGzigJ0uCgpIb25lc3RseSBpdOKAmXMgc2luY2UgeWVhcnMgSSBhbHdheXMg
dXNlIOKAnFJlcGx5IHRvIEFsbOKAnSBiZWNhdXNlIGl0IHdvcmtzIGJvdGggZm9yIG11bHRpcGxl
IHJlY2lwaWVudHMgYW5kIGZvciBzaW5nbGUgcmVjaXBpZW50IHRvby4KClRoaXMgd2F5IEkgZG9u
4oCZdCBmb3JnZXQgdG8gZG8gaXQuCgpCZXN0IHJlZ2FyZHMhCkdpdWxpbwoKPj4gLS0tCj4+ICBj
b25maWdzL29yYW5nZXBpX3plcm9fZGVmY29uZmlnIHwgMiArLQo+PiAgMSBmaWxlIGNoYW5nZWQs
IDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4+IGRpZmYgLS1naXQgYS9jb25maWdzL29y
YW5nZXBpX3plcm9fZGVmY29uZmlnIGIvY29uZmlncy9vcmFuZ2VwaV96ZXJvX2RlZmNvbmZpZwo+
PiBpbmRleCAxYzEwN2IxMGU2Li5hMGFmODA5ZTkyIDEwMDY0NAo+PiAtLS0gYS9jb25maWdzL29y
YW5nZXBpX3plcm9fZGVmY29uZmlnCj4+ICsrKyBiL2NvbmZpZ3Mvb3JhbmdlcGlfemVyb19kZWZj
b25maWcKPj4gQEAgLTEsNiArMSw2IEBACj4+ICBCUjJfYXJtPXkKPj4gIEJSMl9jb3J0ZXhfYTc9
eQo+PiAtQlIyX0FSTV9GUFVfVkZQVjQ9eQo+PiArQlIyX0FSTV9GUFVfTkVPTl9WRlBWND15Cj4+
ICBCUjJfR0xPQkFMX1BBVENIX0RJUj0iYm9hcmQvb3JhbmdlcGkvb3JhbmdlcGktemVyby9wYXRj
aGVzIgo+PiAgQlIyX1JPT1RGU19ERVZJQ0VfQ1JFQVRJT05fRFlOQU1JQ19NREVWPXkKPj4gIEJS
Ml9QQUNLQUdFX0hPU1RfTElOVVhfSEVBREVSU19DVVNUT01fNV8xMj15Cj4gCj4gVGVzdGVkLWJ5
OiBTZXJnZXkgS3V6bWlub3YgPGt1em1pbm92LnNlcmdleTgxQGdtYWlsLmNvbT4KPiBfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGJ1aWxkcm9vdCBtYWls
aW5nIGxpc3QKPiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+IGh0dHBzOi8vbGlzdHMuYnVpbGRy
b290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJv
b3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0
aW5mby9idWlsZHJvb3QK
