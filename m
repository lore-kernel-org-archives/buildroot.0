Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 203E3C28D13
	for <buildroot@archiver.kernel.org>; Thu, 25 Aug 2022 15:08:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 81472813A4;
	Thu, 25 Aug 2022 15:08:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 81472813A4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MkEvmI6JoL2p; Thu, 25 Aug 2022 15:08:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BDF3981343;
	Thu, 25 Aug 2022 15:08:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BDF3981343
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4137D1BF36D
 for <buildroot@lists.busybox.net>; Thu, 25 Aug 2022 15:08:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2994260E49
 for <buildroot@lists.busybox.net>; Thu, 25 Aug 2022 15:08:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2994260E49
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0uZo-BrDJ6SW for <buildroot@lists.busybox.net>;
 Thu, 25 Aug 2022 15:08:54 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4C55A60C12
Received: from mout-b-110.mailbox.org (mout-b-110.mailbox.org [195.10.208.55])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4C55A60C12
 for <buildroot@buildroot.org>; Thu, 25 Aug 2022 15:08:54 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-b-110.mailbox.org (Postfix) with ESMTPS id 4MD5vj1rlYz9sqg;
 Thu, 25 Aug 2022 17:08:49 +0200 (CEST)
Message-ID: <3df555ec-b1fb-bf32-df72-5a415b7abe71@othermo.de>
Date: Thu, 25 Aug 2022 17:08:48 +0200
MIME-Version: 1.0
To: Arnout Vandecappelle <arnout@mind.be>, buildroot@buildroot.org
References: <20220823194732.701895-1-marcus.hoffmann@othermo.de>
 <705af3ef-1388-85bf-6ac9-f24bca8d8a1c@mind.be>
 <3b3f344d-f06d-dc4a-e055-72e7b335044a@othermo.de>
 <83b6994b-1c0a-372f-80a4-78c4ce3efd67@mind.be>
Content-Language: en-US
From: Marcus Hoffmann <marcus.hoffmann@othermo.de>
In-Reply-To: <83b6994b-1c0a-372f-80a4-78c4ce3efd67@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=othermo.de; s=MBO0001; t=1661440129;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BJ4PjeQe3qWT/bluv7R5954AKSgneXQ0tObmP7MxEd4=;
 b=r2TucZNKNAg/ofok1Rp59wpeL5YXqocMXmtq1EnyzCSmJwm49/Gz0hxXyh33uEvk4xrHoj
 y7O/MjPMGUmf4Y4C/PVb3b8M8qKYaTgX/46AgZ1e4DaN2OlUtT7Pij18j3lrkg+U6XOHDN
 Ct/l9kGNVNzPcgOs6CHdHRAxNBGZtX0NR7JE3GxpoIwjYJaIkwH+Yx2vWjmUv0pnqMn0l5
 ERVqL1+tcHeeGRVmRp+rnc6AXhX56g2NSePCK+xySy378t7tMULM6VCNakUx8b6SvrMu2u
 tFa9iazzRFTwG5/MTeG9EBC5EqjNmUUaXCD6nWCLayABnb1RwgayaaEbynwyhg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=othermo.de header.i=@othermo.de
 header.a=rsa-sha256 header.s=MBO0001 header.b=r2TucZNK
Subject: Re: [Buildroot] [PATCH 1/2] package/python-paho-mqtt: bump to 1.6.1
 to fix running on python 3.10
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
Cc: Davide Viti <zinosat@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gMjUuMDguMjIgMTY6MTcsIEFybm91dCBWYW5kZWNhcHBlbGxlIHdyb3RlOgpbLi4uXQo+IAo+
IAo+ICDCoGdpdGh1YiBhdXRvZ2VuZXJhdGVkIHRhcmJhbGxzIGhhdmUgYmVlbiBzdGFibGUgZm9y
IHRoZSBsYXN0IDYgeWVhcnMgb3IgCj4gc28uIFBsZWFzZSBkbyB1c2UgdGhlIGdpdGh1YiBoZWxw
ZXIgaG93ZXZlci4KPiAKPiAgwqBJdCdzIHdlaXJkIHRoYXQgdGhlIGdpdGh1YiB0YWcgZG9lcyBo
YXZlIHRoZSBmaWxlLCBidXQgdGhlIHBpcCB1cGxvYWQgCj4gZG9lc24ndC4uLgo+IAoKSW4gc2V0
dXB0b29scyB3b3JsZCBldmVyeXRoaW5nIHRvIGJlIHBhY2thZ2VkIGludG8gdGhlIHNkaXN0ICh3
aGljaCBpcyAKdXBsb2FkZWQgdG8gcHlwaSkgbmVlZHMgdG8gYmUgbWFudWFsbHkgc3BlY2lmaWVk
OiAKaHR0cHM6Ly9naXRodWIuY29tL2VjbGlwc2UvcGFoby5tcXR0LnB5dGhvbi9ibG9iL21hc3Rl
ci9NQU5JRkVTVC5pbgoKU2VlbXMgbGlrZSBGYWJyaWNlIGFsc28gbm90aWNlZCBhbHJlYWR5OiAK
aHR0cHM6Ly9naXRodWIuY29tL2VjbGlwc2UvcGFoby5tcXR0LnB5dGhvbi9wdWxsLzYzNQoKTWFy
Y3VzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxk
cm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5i
dWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
