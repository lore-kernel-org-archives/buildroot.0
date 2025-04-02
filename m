Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B8B0C36018
	for <buildroot@archiver.kernel.org>; Wed,  2 Apr 2025 19:26:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 04A366F7A4;
	Wed,  2 Apr 2025 19:26:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hWzv-bcBVSi3; Wed,  2 Apr 2025 19:26:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4E5056102A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4E5056102A;
	Wed,  2 Apr 2025 19:26:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 68D48123
 for <buildroot@buildroot.org>; Wed,  2 Apr 2025 19:26:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 52DD840E48
 for <buildroot@buildroot.org>; Wed,  2 Apr 2025 19:26:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gSjJP-R7UQgl for <buildroot@buildroot.org>;
 Wed,  2 Apr 2025 19:25:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4B30D40E20
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4B30D40E20
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4B30D40E20
 for <buildroot@buildroot.org>; Wed,  2 Apr 2025 19:25:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 5429D1C106E; Wed,  2 Apr 2025 21:25:57 +0200 (CEST)
Message-ID: <fbd8d037-99f7-40ac-bc1e-4e92550948a5@rnout.be>
Date: Wed, 2 Apr 2025 21:25:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Waldemar Brodkorb <wbx@openadk.org>, buildroot@buildroot.org
References: <Z7eHIpwpvMIoCk3I@waldemar-brodkorb.de>
Content-Language: en-GB
In-Reply-To: <Z7eHIpwpvMIoCk3I@waldemar-brodkorb.de>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1743621957; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=10Krlr/m/fNVddu2sTH1apufS/vLaZ2V9YT/T/G8UkI=;
 b=S1JEXqH6xgEyqtvST5HTv+wwFplqmf+JmPONIFXtLv3d/RlYY1pjKyFB732Fzsj4W6dfS3
 XNTCQOWvHteKAjZuS7F2ZPGVnel4f7kEeB8JrQ6j6BH/WEfJHFb45F+xtFrMb8ziUWnhAz
 aUcLnbiEZexde3RXrarB59o6EEi/EBqteqsf7/wlv64hQIym2o+dPk8Ony6KaaVCRvuJJG
 MaHLTSzZtfkcW/ZQmvD47AZFCh/dAsQoR59Uuv14pr5BlnoDNo55WOg2k/F+z2QJp74z9K
 BuTtkB1bR+K4SyqUuMi7FULOtxMgJDbtSy4pc7M3pkL1uul7ArJ+wjT2BWySYA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
Subject: Re: [Buildroot] [PATCH] package/libjwt: update to 3.2.0
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Ck9uIDIwLzAyLzIwMjUgMjA6NDgsIFdhbGRlbWFyIEJyb2Rrb3JiIHdyb3RlOgo+IEZvciBhIGNv
bXBsZXRlIGNoYW5nZWxvZyBzZWUgaGVyZToKPiBodHRwczovL2dpdGh1Yi5jb20vYmVubWNvbGxp
bnMvbGliand0L2NvbXBhcmUvdjEuMTcuMi4uLnYzLjIuMAo+Cj4gQ29udmVydCB0byBjbWFrZSBp
bmZyYXN0cnVjdHVyZSBhcyBhdXRvdG9vbHMgd2VyZSByZW1vdmVkCj4gdXBzdHJlYW0uCj4KPiBT
aWduZWQtb2ZmLWJ5OiBXYWxkZW1hciBCcm9ka29yYiA8d2J4QG9wZW5hZGsub3JnPgoKIMKgQXBw
bGllZCB0byBtYXN0ZXIsIHRoYW5rcy4KCltzbmlwXQo+ICAgaWZlcSAoJChCUjJfUEFDS0FHRV9P
UEVOU1NMKSx5KQo+IC1MSUJKV1RfQ09ORl9PUFRTICs9IC0td2l0aC1vcGVuc3NsCj4gK0xJQkpX
VF9DT05GX09QVFMgKz0gLURXSVRIX09QRU5TU0w9T04KPiAgIExJQkpXVF9ERVBFTkRFTkNJRVMg
Kz0gb3BlbnNzbAo+ICAgZWxzZQo+IC1MSUJKV1RfQ09ORl9PUFRTICs9IC0td2l0aG91dC1vcGVu
c3NsCj4gK0xJQkpXVF9DT05GX09QVFMgKz0gLURXSVRIX0dOVVRMUz1PTgo+ICAgTElCSldUX0RF
UEVOREVOQ0lFUyArPSBnbnV0bHMKPiAgIGVuZGlmCj4gICAKPiAtJChldmFsICQoYXV0b3Rvb2xz
LXBhY2thZ2UpKQo+ICsKCiDCoFlvdSBpbnRyb2R1Y2VkIGEgZG91YmxlIGVtcHR5IGxpbmUgaGVy
ZS4gSSBmaXhlZCB0aGF0LgoKCiDCoFJlZ2FyZHMsCiDCoEFybm91dAoKCj4gKyQoZXZhbCAkKGNt
YWtlLXBhY2thZ2UpKQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBz
Oi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
