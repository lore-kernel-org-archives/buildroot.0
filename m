Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68C2DEB64D7
	for <buildroot@archiver.kernel.org>; Fri, 16 Jun 2023 12:59:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E0DC94086F;
	Fri, 16 Jun 2023 12:59:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E0DC94086F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NOtuj_Vh4TWH; Fri, 16 Jun 2023 12:59:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C73D240317;
	Fri, 16 Jun 2023 12:59:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C73D240317
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 900BD1BF286
 for <buildroot@lists.busybox.net>; Fri, 16 Jun 2023 12:59:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 705E1614A1
 for <buildroot@lists.busybox.net>; Fri, 16 Jun 2023 12:59:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 705E1614A1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id De3nU_21wyqA for <buildroot@lists.busybox.net>;
 Fri, 16 Jun 2023 12:59:27 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 629B2605E8
Received: from smtpcmd0986.aruba.it (smtpcmd0986.aruba.it [62.149.156.86])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 629B2605E8
 for <buildroot@buildroot.org>; Fri, 16 Jun 2023 12:59:27 +0000 (UTC)
Received: from [172.25.4.220] ([151.79.164.54])
 by Aruba Outgoing Smtp  with ESMTPSA
 id A92yqZXGLqkZoA92yqNM0a; Fri, 16 Jun 2023 14:59:24 +0200
Message-ID: <93efdad2-72f1-6001-82d7-ea4e8b980ce5@benettiengineering.com>
Date: Fri, 16 Jun 2023 14:59:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US, it
To: bignesh lenka <bigneshlenka20@gmail.com>, buildroot@buildroot.org
References: <CA+XYDRsCC9oXebc15HH5HT9=A5f0yj7cUr=TT_sdaBEr9qG_Eg@mail.gmail.com>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <CA+XYDRsCC9oXebc15HH5HT9=A5f0yj7cUr=TT_sdaBEr9qG_Eg@mail.gmail.com>
X-CMAE-Envelope: MS4xfLa2nnMLSezpOkEvznqHEyE7ypWeD2kRn6ZUSR5b4dEoK4bERrxuiIVMtl5GL3+tGHc8aEhIFhFQlCWsPmkqS2UlQgogzF7j+uOTZNqLHiyKY9grNamK
 4gTgUIOIe7btM+0F7qQowkanailjrWq4S7W7UvKmv0nIcOnUlWPYNJmRoqGbd4dkK2WaWabYqX7N5z25hpeuUBnZipKvLocAxVFJUdgNPrLtcmEzLNs6fU5w
 0m9B4cRDmEw8lX66PYeo6w==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1686920364; bh=xDHhvB73LPy1Q2iXsq6rCctJkamSj4+JzoLE1iJZeUc=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=J3/ogbfC8yUDFNkTqYxhafMXqnpALUbPkSqB+RRZi60s5g/gMOjSGPsJ930SAV0xX
 a9Vz5iXh5XmUva0VUjoFx7mSzQY4zE16OuIdch+YkryXgmn5KFWGMbWSdYr0bnefDU
 CMLviQbp1WGtkh/AgZq9oRZqoE7nEa1fumSQQCysiSj77j0S2BEIppczRl9ZSOU3sJ
 VjrHAQKfVc1oaktHgaOBAVN7lq0fl12pS8LUmNjp9qAiIi50J4LunjgSjekigffC+8
 vHIBK/K8VjDfc1RoWqtd1/ZsUZrIafSH+Nli7jbD/eHzJaWbA0Bxqhk8PUuciUMAgC
 nsy+EWjcbGBwA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=J3/ogbfC
Subject: Re: [Buildroot] Request for information
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

SGkgQmlnbmVzaCwKCk9uIDE2LzA2LzIzIDE0OjQ2LCBiaWduZXNoIGxlbmthIHdyb3RlOgo+IFJl
c3BlY3RlZCBzaXIvbWFkYW0sCj4gCj4gSSBhbSBzb2Z0d2FyZSBlbmdpbmVlciwgd29ya2luZyBm
b3IgYSBzdGFydHVwIGNhbGxlZCBiZXNxdWFyZSAKPiB0ZWNobm9sb2dpZXMuIEhlcmUgd2UgYXJl
IHVzaW5nIGJ1aWxkcm9vdMKgZm9yIGxlYXJuaW5nIGFzIHdlbGwgYXMgCj4gZGV2ZWxvcGluZyBu
ZXcgYXBwbGljYXRpb25zLgo+IAo+IEkgYXMgYW4gZW50aHVzaWFzdMKgd2FudGVkIHRvIGtub3cg
d2hlbiB3ZSBidWlsZCBhbiBlbnZpcm9ubWVudMKgZm9yIGEgCj4gc3BlY2lmaWMgaGFyZHdhcmUg
ZnJvbSB3aGVyZSBhbmQgaG93IHRoZSBrZXJuZWwgaXMgZ2V0dGluZyBkb3dubG9hZGVkIHRvIAo+
IHRoZSBvdXRwdXQgZGlyZWN0b3J5LgoKSSB0aGluayB0aGVzZSBzbGlkZXMgY2FuIGhlbHAgeW91
IHVuZGVyc3RhbmRpbmcgQnVpbGRyb290IGluIGdlbmVyYWw6Cmh0dHBzOi8vYm9vdGxpbi5jb20v
ZG9jL3RyYWluaW5nL2J1aWxkcm9vdC9idWlsZHJvb3Qtc2xpZGVzLnBkZgoKYW5kIEkgc3VnZ2Vz
dCB5b3UgdG8gdHJ5IHRvIGJ1aWxkIG9uZSBvZiB0aGUgYm9hcmQgdW5kZXIgCmJ1aWxkcm9vdC9j
b25maWdzLyBmb2xkZXIuIFRoYXQgd2F5IHlvdSBzaG91bGQgYmUgYWJsZSB0byBzZWUgdGhlCnZh
cmlvdXMgc3RlcHMgY292ZXJlZCwgaW5jbHVkaW5nIExpbnV4IGJ1aWxkaW5nLiBCeSByZWFkaW5n
IHRoZSBsb2cKeW91IHNob3VsZCBiZSBhYmxlIHRvIHVuZGVyc3RhbmQgaG93IEJ1aWxkcm9vdCBk
b3dubG9hZHMsIGV4dHJhY3QsCnBhdGNoLCBjb25maWd1cmUsIGJ1aWxkIGFuZCBpbnN0YWxsIExp
bnV4IGFzIHdlbGwgYXMgYW55IG90aGVyIHBhY2thZ2UuCgpJZiB5b3UgdGFrZSBhIHF1aWNrIGxv
b2sgYXQgYW55IF9kZWZjb25maWcgZmlsZSB5b3Ugc2hvdWxkIHNlZSBob3cgTGludXgKdmVyc2lv
biBhbmQgcG9zc2libGUgVVJMIGFyZSB1c2VkLCBhcyBhbnkga2luZCBvZiBvcHRpb24uCgo+IEhv
cGUgeW91IHJlcGx5IHRvIG15IHF1ZXJ5IGFzwqBzb29uIGFzIHBvc3NpYmxlCgpXaGVuZXZlciBw
ZW9wbGUgaGF2ZSB0aW1lIHRvIGFuc3dlci4gVGhpcyBpcyBvcGVuIHNvdXJjZSwgc28gdGhlcmUg
aXMgbm8KImFzYXAiLgoKQmVzdCByZWdhcmRzCi0tIApDRU8vQ1RPQEJlbmV0dGkgRW5naW5lZXJp
bmcgc2FzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1
aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0
cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
