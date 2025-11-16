Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21593CCD19A
	for <buildroot@archiver.kernel.org>; Sun, 16 Nov 2025 20:24:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3272B60BB4;
	Sun, 16 Nov 2025 20:24:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jhF52oDVFfeL; Sun, 16 Nov 2025 20:24:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D6B7960BA1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D6B7960BA1;
	Sun, 16 Nov 2025 20:24:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0853A158
 for <buildroot@buildroot.org>; Sun, 16 Nov 2025 20:24:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EE52160BA1
 for <buildroot@buildroot.org>; Sun, 16 Nov 2025 20:24:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aauCALjOiu8D for <buildroot@buildroot.org>;
 Sun, 16 Nov 2025 20:24:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.15;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 95AAE60B8D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 95AAE60B8D
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 95AAE60B8D
 for <buildroot@buildroot.org>; Sun, 16 Nov 2025 20:24:50 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.7.2] ([85.22.18.38]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MTAFh-1vjnVn2QwB-00HwUn; Sun, 16
 Nov 2025 21:24:48 +0100
Message-ID: <786a4283-8fa7-429b-ac0c-380cbe3d2f08@gmx.de>
Date: Sun, 16 Nov 2025 21:24:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Kory Maincent <kory.maincent@bootlin.com>
References: <20251107120844.582160-1-fiona.klute@gmx.de>
 <41c0b0993629efcf11988f0f4e34699e@free.fr>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <41c0b0993629efcf11988f0f4e34699e@free.fr>
X-Provags-ID: V03:K1:tOb6yQlnwMrQYdhqghdCt96mKQ909e+v2+jYp/kFmxfK9g2yz0v
 I/lTrB+ndk8Nzk89GWvLKKIo/Cs1I+14pCGEgFmyuUVQOtmvPeQ/rwjLcyc9Zk+x2UY7oV/
 8t5ZNPTZ6gBxxIO4nAZwJTq6afYnFPFPO/TAm4+eVsHqYPsDboI6q8bV9y+fhylHv7KA3Ez
 QNYeKsKqI+ZFy2PMAEbqw==
UI-OutboundReport: notjunk:1;M01:P0:7KKLow/x6so=;bSWnIT+L0rv0b8CHBF9OoJMC5Lm
 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
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1763324688; x=1763929488; i=fiona.klute@gmx.de;
 bh=ZE8d/Dd3NbzqqyuxdvhBoOSDLiPRIlrZwwlla/UCDog=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=EXHSHhbrBP5+3i9Wt/0ImkHtVaasIb6REhXZzTC23tOyUuLKt9GIMJvYECkHdC9l
 3kQT+DIhmf6HwfUOgp/yNtRxMVWs2v7rLwNIzCpb3O80bpaVXoMzLgoBtEALMPw7h
 Vl6JqQeSNwJrECbVBSqxTdgKGMVJ/2bMEwRUCumprG0AFgEpNQGDSm+11le8Wz1aJ
 sL/1mIn57k/XRVvUa0nGBjdpwrVRGXUFPS+CsYDGcfbSdMHgnuCokMvkCY0zimtQM
 G358z2Ky3wMBmps95Q28zlfAkrK7hrWydSzabGEZw0MgekLy+1HvUyWk/iVLvCj9A
 tZ8vf4N8ncblJugVNg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=EXHSHhbr
Subject: Re: [Buildroot] [PATCH 1/1] package/uboot-tools: enable all hash
 algorithms if FIT support is enabled
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgSnVsaWVuIQoKQW0gMDguMTEuMjUgdW0gMTI6MTMgc2NocmllYiBKdWxpZW4gT2xpdmFpbjoK
PiBIaSBGaW9uYSwKPiAKPiBPbiAwNy8xMS8yMDI1IDEzOjA4LCBGaW9uYSBLbHV0ZSB2aWEgYnVp
bGRyb290IHdyb3RlOgo+PiBUaGlzIGFsbG93cyB1c2luZyBhbnkgb2YgdGhlIGhhc2ggYWxnb3Jp
dGhtcyBzdXBwb3J0ZWQgYnkgVS1Cb290IGZvcgo+PiBjaGVja3N1bSAoaGFzaC1OKSBub2RlcyB3
aGVuIGJ1aWxkaW5nIGEgRklUIGltYWdlLCBpbnN0ZWFkIG9mIG9ubHkKPj4gU0hBLTEgb3IgU0hB
LTI1Ni4KPj4KPj4gRml4ZXM6IDE0YTAxNjk3MTRjZDVjMzViZTQwZmFhZGMwNjY0MTJmMTQ0YmMx
YTYgInBhY2thZ2UvdWJvb3QtdG9vbHM6Cj4+IEJ1bXAgdG8gdmVyc2lvbiAyMDI1LjEwIgo+Pgo+
PiBTaWduZWQtb2ZmLWJ5OiBGaW9uYSBLbHV0ZSA8ZmlvbmEua2x1dGVAZ214LmRlPgo+IAo+IEkg
YXBwbGllZCB0aGlzIHBhdGNoIHRvIG1hc3RlciwgdGhhbmtzLgo+IAo+IEkgcHJvYmFibHkgbWlz
c2VkIHRob3NlIGhhc2ggYW5kIGNoZWNrc3VtIGFsZ29zIGJlY2F1c2Ugd2Ugb25seSBoYXZlCj4g
c2hhMSBhbmQgc2hhMjU2IGluIHRoZSBCdWlsZHJvb3QgZGVmY29uZmlncy4KPiBTZWUgdGhlIG91
dHB1dCBvZiAiZ2l0IGdyZXAgLUYgJ2FsZ28gPSAnIGJvYXJkLyIuCj4gCj4gVGhvbWFzIHJlY2Vu
dGx5IGV4dGVuZGVkIHRoZSB0ZXN0aW5nIGluZnJhIHRvIGNvdmVyIGhvc3QgcGFja2FnZXMuCj4g
U28gbWF5YmUgd2UgY291bGQgYWRkIGEgc21hbGwgdGVzdCBjaGVja2luZyB0aGF0IHRoaXMgc2V0
IG9mIGVuYWJsZWQKPiBhbGdvcyBhcmUgd29ya2luZy7CoCBTZWUgZm9yIGV4YW1wbGU6Cj4gaHR0
cHM6Ly9naXRsYWIuY29tL2J1aWxkcm9vdC5vcmcvYnVpbGRyb290Ly0vIAo+IGNvbW1pdC85NDY4
ZjFjMDk5MjIxNDYxYWJhZjVhYjE1Mjc4OGU2OTIxMTliOGRkCj4gaHR0cHM6Ly9naXRsYWIuY29t
L2J1aWxkcm9vdC5vcmcvYnVpbGRyb290Ly0vY29tbWl0LyAKPiBiZjRlMWVjMTlmNzcxNGIwMzI0
M2FmYWEyOWIxNWY4YjI5YmE4ZmVhCj4gCj4gV2UgY291bGQgYWxzbyBkbyB0aGUgc2FtZSBmb3Ig
dGhlIHRhcmdldCBwYWNrYWdlLsKgIFdoYXQgZG8geW91IHRoaW5rPwpJJ3ZlIGp1c3Qgc2VudCBh
IHBhdGNoIHNlcmllcyB0aGF0IGFkZHMgc3VjaCBhIHRlc3QgZm9yIGhvc3QgJiB0YXJnZXQgCihh
ZnRlciBhbm90aGVyIG1pc3NpbmcgVS1Cb290IGNvbmZpZyBvcHRpb24gcmVxdWlyZWQgdG8gcnVu
IHRoZSB0ZXN0KS4gClBsZWFzZSB0YWtlIGEgbG9vazoKaHR0cHM6Ly9wYXRjaHdvcmsub3psYWJz
Lm9yZy9wcm9qZWN0L2J1aWxkcm9vdC9saXN0Lz9zZXJpZXM9NDgyMjk3CgpCZXN0IHJlZ2FyZHMs
CkZpb25hCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpi
dWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlz
dHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
