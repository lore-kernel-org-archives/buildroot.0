Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC139C4332F
	for <buildroot@archiver.kernel.org>; Mon, 28 Feb 2022 21:29:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 80B6960E7D;
	Mon, 28 Feb 2022 21:29:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jCyomzxWqmWM; Mon, 28 Feb 2022 21:29:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C0A7F60E75;
	Mon, 28 Feb 2022 21:29:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F06181BF2FF
 for <buildroot@lists.busybox.net>; Mon, 28 Feb 2022 21:29:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DEEE181678
 for <buildroot@lists.busybox.net>; Mon, 28 Feb 2022 21:29:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id S24InSZoIYV7 for <buildroot@lists.busybox.net>;
 Mon, 28 Feb 2022 21:29:28 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd15177.aruba.it (smtpcmd15177.aruba.it [62.149.156.177])
 by smtp1.osuosl.org (Postfix) with ESMTP id 611198175A
 for <buildroot@buildroot.org>; Mon, 28 Feb 2022 21:29:28 +0000 (UTC)
Received: from smtpclient.apple ([146.241.7.124])
 by Aruba Outgoing Smtp  with ESMTPA
 id OnaAnNgwdINkEOnaBn1nRv; Mon, 28 Feb 2022 22:29:27 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1646083767; bh=z9UZGzNI2N8Z92oyoTc4bEfato1T/XuL3lYC/YleTqI=;
 h=Content-Type:From:Mime-Version:Subject:Date:To;
 b=XACYv7j0iVHX9OlGMbj9tAHZb0u2FcuMasuymzsveDoJYXGVjFZzNU1/4h4SnocAP
 AbJZ0raSD+C2mWz0BcTCtWM1/CSEgbKRX8f31B+CMbYxWfIOcBgjn3dgbkfm3stD0H
 xgU2CkdFGsInQc/INKSbJKG0yfzJdXZKC8SQJl3dX0NQVoShakuzluHaYf6W6EUHnN
 8KzlemoK3nqIo2IN4JQc9DpCXU8cTFFDFj1a6vIxsY4h2IoPRXY/vRmOF0IopVTBgB
 oCh9UUh7gGhNyuKYZN3EgfKp1JubTShvtArKcRvsquj/yGt29NYHwr8rF3P+M207Oo
 MJScIMetO5wyg==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Mime-Version: 1.0 (1.0)
Date: Mon, 28 Feb 2022 22:29:26 +0100
Message-Id: <3C088CA7-EE28-4D60-8DDD-68492CE9D73D@benettiengineering.com>
References: <87y21uy9hg.fsf@dell.be.48ers.dk>
In-Reply-To: <87y21uy9hg.fsf@dell.be.48ers.dk>
To: Peter Korsgaard <peter@korsgaard.com>
X-Mailer: iPhone Mail (19D52)
X-CMAE-Envelope: MS4xfN8RhKg9IghkHb/iK5byz6JOV07jIM5sonvl7DLYYNWuxzhYdfoOz+rcfuU1RDetwEDaIzSPTZ5Ul59QvK6qEndyX9pSS8cxNArgIRao3de6nNhdFYf9
 P5dtBDbzmvIiVJMDczAlepgB/JISqe9Ug8/g9jC/ZrPpejsb0dNp6yYymgmX0HVB1USQns0t3jJtRu1aFdxPH08E4DGMVq1YwBUrNYmfdABk5biBPRiat8v8
 /dMyo1Mo/818ytybkrlMKA==
Subject: Re: [Buildroot] [PATCH] package/at: bump version to 3.2.5
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

SGkgUGV0ZXIsCgo+IElsIGdpb3JubyAyOCBmZWIgMjAyMiwgYWxsZSBvcmUgMjI6MjAsIFBldGVy
IEtvcnNnYWFyZCA8cGV0ZXJAa29yc2dhYXJkLmNvbT4gaGEgc2NyaXR0bzoKPiAKPiDvu78KPj4g
Cj4+Pj4+PiAiR2l1bGlvIiA9PSBHaXVsaW8gQmVuZXR0aSA8Z2l1bGlvLmJlbmV0dGlAYmVuZXR0
aWVuZ2luZWVyaW5nLmNvbT4gd3JpdGVzOgo+IAo+PiBTaWduZWQtb2ZmLWJ5OiBHaXVsaW8gQmVu
ZXR0aSA8Z2l1bGlvLmJlbmV0dGlAYmVuZXR0aWVuZ2luZWVyaW5nLmNvbT4KPiAKPiBBbnkgc3Bl
Y2lmaWMgcmVhc29uIHRoaXMgc2hvdWxkIGdvIHRvIG1hc3RlciBhbmQgbm90IG5leHQ/CgpTb3Jy
eSwgSeKAmXZlIGZvcmdvdHRlbiB0byBhZGQg4oCcbmV4dOKAnSwgdGhpcyBpcyBmb3IgbmV4dCBi
cmFuY2guCgpCZXN0IHJlZ2FyZHMK4oCULQpHaXVsaW8gQmVuZXR0aQpCZW5ldHRpIEVuZ2luZWVy
aW5nIHNhcwoKPiAKPiAtLSAKPiBCeWUsIFBldGVyIEtvcnNnYWFyZAo+IF9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gYnVpbGRyb290IG1haWxpbmcgbGlz
dAo+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3Jn
L21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWls
ZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1
aWxkcm9vdAo=
