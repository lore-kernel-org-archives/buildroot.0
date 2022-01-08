Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB828C433F5
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 17:39:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6293660784;
	Sat,  8 Jan 2022 17:39:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mESkpE2KSl4D; Sat,  8 Jan 2022 17:39:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 95BE5607F2;
	Sat,  8 Jan 2022 17:39:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 959211BF2C6
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 17:39:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 83884607F2
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 17:39:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1W6Djd5NuHg5 for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 17:39:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A375F60784
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 17:39:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1641663560;
 bh=3+6eA47uMbt4kyU4KOQTxadr/gtv68OgJShCkQNOxhw=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=QOzRx4bu995VMbSoCbwi0bN5X9ICvfihB+JO7amgy7XJIJOjrbI2zbiSwtZxKbyhw
 fzPtnpv0jtseQ7j3dkvnDa9LSaknAx8mwg1A/qu8cJyY7GpfCOHQZuIALzP+wq9WP+
 TXTfC6vlI0mZXQrAfwgVe00YL2USiJYAZNZlqG30=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost ([62.216.209.8]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MdebB-1mWdx30gaX-00ZgBN; Sat, 08
 Jan 2022 18:39:20 +0100
Date: Sat, 8 Jan 2022 18:39:19 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220108183919.238c1885@gmx.net>
In-Reply-To: <CAPi7W82_k_toe+-1DdZv8wr2ArKjeZfb9qdarm5oewv52vsh4g@mail.gmail.com>
References: <20220104205455.3632671-1-fontaine.fabrice@gmail.com>
 <20220108115140.760e195f@windsurf>
 <CAPi7W82_k_toe+-1DdZv8wr2ArKjeZfb9qdarm5oewv52vsh4g@mail.gmail.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Provags-ID: V03:K1:xgKfHxFQ2GMpVx3hJ99C2PMgxKIfDAV5XzRrTh4XbnbQDLMXkmj
 g776+1j5/EAvGmvx8k0KkeFMkVrcRG7gHori2yVIOO2l6hoet808mX5teI0jga1H22MAlKn
 gsd3Euet3NZnkr6EpEGF9N8NzOPky0TiwEKA63KK3gFxFhGdITqb4jVkrodsfkPlkuaOxys
 9KDKcQl+Y7MDpQFy+SK1g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:BGk5HflKQXw=:DlrzusbJY/pkBSml3RKPNM
 wKqBat+UpqIBjkmM0IypS2hlIbovpi8RfcwR43V2YiskNUB9DLMk71TiTFK8I6hkkFBexiqWW
 VG1ddMMHQIrNwuoEOs6yeEqQFurHJM2Sj+e9/dJV7/5DSVUPRnpIZs/DZVRpibe0Yf2vppupT
 EM5lMQRF6rB2uh0m5Qyox8PWmnHsKaQadkhAt/It0gtQsH4eR9JTL9aE7yjlZa69tOwvh6O2C
 /49pqVCGd3wfjzJ0fTQyNMcVVsu4u9u2We3SCSwh0abGcsjiUDvGrbTnPIlLWRni/qe7usJpB
 QfRH2t+u8J+O2y5dzJB6jOwRa1tMDmGx2QA+iA9FLJdwnzGfVDY/t5LjFZcCfIFHVlfObO/00
 3jwmQEddOnvDh+Q22ZiL7g/e6N9T+Fyhe/EOIsdXU5qtvLMQ3D0FPreXDlacXiKaRQbz78kpf
 c+rvClIlIW/KuPCpuGZcII777FE3bVw94jiQS3wLkVZUL5K6ld5TmOlLZFUDlk4rbkqyved+F
 epRvf5RPTGodMpZHGI1l1f2IbijdhLRa/v7OIO55Oe6VUR/pFAPUDM+AnweSU+0zmOWLzj4jf
 rAtOrS+l5vX7fMTVpVarbzmJk+j/1u4bfoEZ6482Lj6vvHz8jlf6V5ARYPJkVQ5irPn0iJ8nK
 A5a+gl9xyHyH0brYR4Ydpi4qQHnJfDFZZz0ZT1v1cv87lrmhOgZzcFXw8U9cgQWzafzntGPVr
 y83/QdD0h4tU0wZNFltxWm5TRGarpSi6lplR0RxcX42Vb9dkvr9J2ybfi+Sw6eTIyi5Qsg5iM
 /tAa9LGUdS6w5H2YA3EtEVROLxw0MyaPBl6kql7HK9qyGgiCCIGde3BanpXfzAAMV29WjWY7r
 bBhnJ7zz3ROJh1rAuOiX7qRKs/2YVL+MMLWit2MjZpqE4y5zwHSJyAJhxIQmZscE6Zzr1lzJ1
 1n9kjcwEAH0vH4hS25M352Sj+t0+ke9KgKMmqjD6BwHj8LTR8E/UoFnj8x1wbEL/RaAG3k8cP
 nJN5M+SrISCs/5sKCrAZ3Ha+sgfGJWFNhgUc/+NaGSaBGMvtHyabIY7+1DrPPYz/T5nO33Xlx
 wQiC60tMuJqh3c=
Subject: Re: [Buildroot] [PATCH v2, 1/1] package/file: fix build with gcc 4.8
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gRmFicmljZSwgKiwKCk9uIFNhdCwgOCBKYW4gMjAyMiAxNzoxMzo0NyArMDEwMCwgRmFi
cmljZSBGb250YWluZSA8Zm9udGFpbmUuZmFicmljZUBnbWFpbC5jb20+IHdyb3RlOgoKPiBIaSwK
PiAKPiBMZSBzYW0uIDggamFudi4gMjAyMiDDoCAxMTo1MSwgVGhvbWFzIFBldGF6em9uaQo+IDx0
aG9tYXMucGV0YXp6b25pQGJvb3RsaW4uY29tPiBhIMOpY3JpdCA6Cj4gPgo+ID4gT24gVHVlLCAg
NCBKYW4gMjAyMiAyMTo1NDo1NSArMDEwMAo+ID4gRmFicmljZSBGb250YWluZSA8Zm9udGFpbmUu
ZmFicmljZUBnbWFpbC5jb20+IHdyb3RlOgo+ID4gIAo+ID4gPiBGaXggdGhlIGZvbGxvd2luZyBi
dWlsZCBmYWlsdXJlIHJhaXNlZCBzaW5jZSBidW1wIHRvIHZlcnNpb24gNS40MSBpbgo+ID4gPiBj
b21taXQgZDM4YjcyYmNkNzUzOTJhODhiNTEwMDgzOWFjNDEwODU5ZDBhNmE3OToKPiA+ID4KPiA+
ID4gcmVhZGVsZi5jOiBJbiBmdW5jdGlvbiAnZG9fYXV4dl9ub3RlJzoKPiA+ID4gcmVhZGVsZi5j
OjEwNDY6MjogZXJyb3I6ICdmb3InIGxvb3AgaW5pdGlhbCBkZWNsYXJhdGlvbnMgYXJlIG9ubHkg
YWxsb3dlZCBpbiBDOTkgbW9kZQo+ID4gPiAgIGZvciAoc2l6ZV90IG9mZiA9IDA7IG9mZiArIGVs
c2l6ZSA8PSBkZXNjc3o7IG9mZiArPSBlbHNpemUpIHsKPiA+ID4gICBeCj4gPiA+Cj4gPiA+IEZp
eGVzOgo+ID4gPiAgLSBodHRwOi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5vcmcvcmVzdWx0cy8zMWNi
YzMxM2ZjZWI4NGMwY2JiMTk2OWZjYTVhYzQ0MjQ0ODcxZGJjCj4gPiA+Cj4gPiA+IFNpZ25lZC1v
ZmYtYnk6IEZhYnJpY2UgRm9udGFpbmUgPGZvbnRhaW5lLmZhYnJpY2VAZ21haWwuY29tPiAgCj4g
Pgo+ID4gSSBhbSBhZnJhaWQgaXQgc2VlbXMgbGlrZSB0aGlzIGRpZG4ndCBmaXggdGhlIHByb2Js
ZW0sIHNlZToKPiA+Cj4gPiAgIGh0dHA6Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm5ldC9yZXN1bHRz
Lzk1Ny85NTczZThiMDFkOGYyMWNkODlhNjc0NzVkYWFiZGVlZjUzM2QzMWQ3L2J1aWxkLWVuZC5s
b2cKPiA+Cj4gPiBhY19jdl9wcm9nX2NjX2M5OT0nLXN0ZD1nbnU5OScgaXMgcHJvcGVybHkgcGFz
c2VkIHRvIHRoZSBjb25maWd1cmUKPiA+IHNjcmlwdCwgYnV0IGl0IHN0aWxsIGZhaWxzLiAgCj4g
SW5kZWVkLCBJIHN1Z2dlc3QgdG8gcmV2ZXJ0IHRoaXMgY29tbWl0IGFuZCBhcHBseSB0aGUgdmVy
c2lvbiAxIG9mCj4gdGhpcyBwYXRjaCBpbnN0ZWFkIG9mIHRyeWluZyB0byB1bmRlcnN0YW5kIHdo
YXQgaXMgImJyb2tlbiIgaW4gdGhlCj4gY29uZmlndXJlIHNjcmlwdC4KClRoZSBkaWZmZXJlbmNl
IHNlZW1zIHRvIGJlOgoKCSQgZGlmZiAtcnUgZmlsZS01LjM4L2NvbmZpZ3VyZS5hYyBmaWxlLTUu
NDEvY29uZmlndXJlLmFjClsuLi5dCkBAIC04OCw3ICs4OCw3IEBACiBBQ19TVUJTVChXQVJOSU5H
UykKIAogZG5sIENoZWNrcyBmb3IgcHJvZ3JhbXMuCi1BQ19QUk9HX0NDX1NUREMKK0FDX1BST0df
Q0MKIEFDX1VTRV9TWVNURU1fRVhURU5TSU9OUwogQU1fUFJPR19DQ19DX08KIEFDX0NfQklHRU5E
SUFOClsuLi5dCgpBY2NvcmRpbmcgdG8gWzFdIEFDX1BST0dfQ0MgY2hlY2tzL2VuYWJsZXMgYzg5
IGFuZCBBQ19QUk9HX0NDX1NUREMgY2hlY2tzL2VuYWJscyBDOTkgKG9yCnVzZSBBQ19QUk9HX0ND
X0M5OSB0byBiZSBtb3JlIGV4cGxpY2l0KS4uLiwgbm90ZSB0aGF0IHdpdGggQUNfUFJPR19DQyB0
aGUgYWNfY3ZfcHJvZ19jY19jOTkKZmVhdHVyZSBpcyBnb25lIChzdGlsbCB1c2VkIGZvciB0YXJn
ZXQvaG9zdCBpbiBwYWNrYWdlL2ZpbGUvZmlsZS5taykuLi4KClJlZ2FyZHMsClBldGVyCQoKWzFd
IGh0dHBzOi8vd3d3LmdudS5vcmcvc29mdHdhcmUvYXV0b2NvbmYvbWFudWFsL2F1dG9jb25mLTIu
NjkvaHRtbF9ub2RlL0MtQ29tcGlsZXIuaHRtbAoKPiA+Cj4gPiBUaG9tYXMKPiA+IC0tCj4gPiBU
aG9tYXMgUGV0YXp6b25pLCBjby1vd25lciBhbmQgQ0VPLCBCb290bGluCj4gPiBFbWJlZGRlZCBM
aW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nIGFuZCB0cmFpbmluZwo+ID4gaHR0cHM6Ly9ib290
bGluLmNvbSAgCj4gQmVzdCBSZWdhcmRzLAo+IAo+IEZhYnJpY2UKPiBfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QK
PiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRy
b290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWls
ZHJvb3QK
