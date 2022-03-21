Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01436C433F5
	for <buildroot@archiver.kernel.org>; Mon, 21 Mar 2022 07:47:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B3133410AF;
	Mon, 21 Mar 2022 07:47:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xXGn4MaL-QeU; Mon, 21 Mar 2022 07:47:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DB923410A8;
	Mon, 21 Mar 2022 07:47:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BFDE01BF316
 for <buildroot@lists.busybox.net>; Mon, 21 Mar 2022 07:47:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id ACA714059F
 for <buildroot@lists.busybox.net>; Mon, 21 Mar 2022 07:47:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1UVfCC1_rQOk for <buildroot@lists.busybox.net>;
 Mon, 21 Mar 2022 07:47:48 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 01482402D0
 for <buildroot@buildroot.org>; Mon, 21 Mar 2022 07:47:47 +0000 (UTC)
Received: (Authenticated sender: clement.leger@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 4D1241C000D;
 Mon, 21 Mar 2022 07:47:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1647848862;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Pcm7bPbTaMzBsIXovDjeC7/7dsqEN2IAxYWZnAyAOn8=;
 b=Tsw7rUhIlTaet9BP4YjXlhNo6EXlP6a0CbFrmSvbqyuXPaSy/dZlibZhX2/OhsHUrq9VoT
 iX7pvDdf+dWIQz2LYvn/AGC9l0fzgba1809We0Cu4D5IdDQvP+D+FDGWlS1EF3Ysm+/rKY
 o7L+p/m8ppUXoYPO8NU6wbcgxG4wPHl7fx2op5RLRIK1cu2EBz4C1Do7pOhq+6jhSPyGvQ
 aozVfyuYA36qoxf5LHO9ryL1MuGSq+9jmGEMVsGjLq1wK++/iRHeFuUbQHz+KsDXmGEMkD
 KB8tvTp/KCIkDkHGXyAZz3xhABlmu96AKogFLKwWnvgPcSwOhiKqc2Dv6KPNWg==
Date: Mon, 21 Mar 2022 08:46:22 +0100
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20220321084622.4b14b1c8@fixe.home>
In-Reply-To: <20220318224031.GV283544@scaer>
References: <20220318132427.48737-1-clement.leger@bootlin.com>
 <20220318132427.48737-5-clement.leger@bootlin.com>
 <20220318224031.GV283544@scaer>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v5 4/8] boot/optee-os: bump to version 3.16.0
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
From: =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>
Cc: Etienne Carriere <etienne.carriere@linaro.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

TGUgRnJpLCAxOCBNYXIgMjAyMiAyMzo0MDozMSArMDEwMCwKIllhbm4gRS4gTU9SSU4iIDx5YW5u
Lm1vcmluLjE5OThAZnJlZS5mcj4gYSDDqWNyaXQgOgoKPiAzLjE2LjAgbm93IG5lZWRzIHRoZSBk
ZXBlbmRlbmN5IG9uIEJSMl9QQUNLQUdFX0hPU1RfUlVTVENfQVJDSF9TVVBQT1JUUywKPiBzbyBp
ZiB0aGF0IGlzIG5vdCBtZXQsIHRoZXJlIHdpbGwgb25seSBiZSB0aGUgY3VzdG9tIGdpdCBhcyBh
IGZhbGxiYWNrLgo+IAo+IFRoaXMgaXMgbm90IHNvIG5pY2UgdGhhdCB0aGUgbGF0ZXN0IGhhcyB0
bywgd2VsbCwgYmUgdGhlIGxhdGVzdCwgYW5kCj4gdGhhdCB3ZSBkb247dCBrZWVwIDMuMTUuMCBh
cm91bmQgZm9yIHRob3NlIHRoYXQgY2FuJ3QgaGF2ZSBhIGhvc3QgcnVzdGMKPiBjb21waWxlci4K
PiAKPiBCdXQgdGhlbiwgd2hvIGFyZSB3ZSBraWRkaW5nPyBCdWlsZHMgb24gbm9uLXg4NiBhcmUg
cHJldHR5IHJhcmUgeWV0Owo+IGV2ZW4gaWYgc29tZSBwZW9wbGUgbWlnaHQgYmUgb24gUFBDIG9y
IEFBcmNoNjQsIHRoZXkgc3RpbGwgYXJlIHRvIGJlCj4gbm8gbXVjaCBtb3JlIHRoYW4gdHdvLWhh
bmRmdWwgKDEwMjMpLgo+IAo+IEFsc28sIGNoZWNrLXBhY2thZ2Ugd2hpbmVzOwo+IAo+ICAgICAk
IG1ha2UgY2hlY2stcGFja2FnZQo+ICAgICBib290L29wdGVlLW9zL0NvbmZpZy5pbjoyMjogYXR0
cmlidXRlcyBvcmRlcjogdHlwZSwgZGVmYXVsdCwgZGVwZW5kcwo+ICAgICBvbiwgc2VsZWN0LCBo
ZWxwIChodHRwOi8vbmlnaHRseS5idWlsZHJvb3Qub3JnLyNfY29uZmlnX2ZpbGVzKQoKSGkgWWFu
biwKClNvcnJ5IGZvciB0aGUgZXJyb3JzIGFuZCB0aGFua3MgZm9yIHRoZSBoaW50LCBJIHdpbGwg
dXNlIHRoYXQgbmV4dCB0aW1lCkkgc3VibWl0IGEgcGF0Y2ggZm9yIGEgcGFja2FnZS4KCj4gCj4g
QW5kIGEgaGlkZGVuIG9uZToKPiAKPiAgICAgYm9vdC9vcHRlZS1vcy9vcHRlZS1vcy5oYXNoOjQ6
IHNlcGFyYXRpb24gZG9lcyBub3QgbWF0Y2ggZXhwZWN0YXRpb24KPiAgICAgKGh0dHA6Ly9uaWdo
dGx5LmJ1aWxkcm9vdC5vcmcvI2FkZGluZy1wYWNrYWdlcy1oYXNoKQo+IAo+IEFwcGxpZWQgdG8g
bWFzdGVyIHdpdGggdGhvc2UgZml4ZWQsIHRoYW5rcy4KPiAKPiBSZWdhcmRzLAo+IFlhbm4gRS4g
TU9SSU4uCgoKLS0gCkNsw6ltZW50IEzDqWdlciwKRW1iZWRkZWQgTGludXggYW5kIEtlcm5lbCBl
bmdpbmVlciBhdCBCb290bGluCmh0dHBzOi8vYm9vdGxpbi5jb20KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWls
ZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9idWlsZHJvb3QK
