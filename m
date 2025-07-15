Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7296C83F22
	for <buildroot@archiver.kernel.org>; Tue, 15 Jul 2025 18:07:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8C24D611B2;
	Tue, 15 Jul 2025 18:07:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gqTz32j-TkKp; Tue, 15 Jul 2025 18:07:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D29B7611A0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D29B7611A0;
	Tue, 15 Jul 2025 18:07:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 65C1B11AA
 for <buildroot@buildroot.org>; Tue, 15 Jul 2025 18:07:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 61B76400F4
 for <buildroot@buildroot.org>; Tue, 15 Jul 2025 18:07:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0vsfIbu6sgAn for <buildroot@buildroot.org>;
 Tue, 15 Jul 2025 18:07:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 967CA4008A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 967CA4008A
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 967CA4008A
 for <buildroot@buildroot.org>; Tue, 15 Jul 2025 18:07:27 +0000 (UTC)
Received: from [192.168.178.42] (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 009592C83425;
 Tue, 15 Jul 2025 20:07:24 +0200 (CEST)
Message-ID: <e744f6c0-845a-4642-a48d-5d2500acfdc7@bubu1.eu>
Date: Tue, 15 Jul 2025 20:07:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?Q?Gero_Schw=C3=A4ricke?= <gero.schwaericke@sevenlab.de>,
 buildroot@buildroot.org
References: <20250715160149.2886803-1-gero.schwaericke@sevenlab.de>
 <d0473d32-8362-4c92-be5e-1cb82c370c4e@bubu1.eu>
Content-Language: en-US
In-Reply-To: <d0473d32-8362-4c92-be5e-1cb82c370c4e@bubu1.eu>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1752602845; bh=6cXRTYmUBMMlDVIQsq/s2j0GiX9ogcB7Y3cYjkmDQQs=;
 h=Date:Subject:From:To:References:In-Reply-To;
 b=C65QqMcLF8qM9KeHQ0a7eDPf3CBCjKzrXlk7v3kcEtPJqwQXwTSoQZDaRFhG+8lBa
 D2w7mvse57vpig9kg+mK+4cBhHkfxZ0Po9ilWvqFfHobczcZMmuRR/au+8/+gsffJo
 uF+S80D75sQgokqrPZNkfFucZtf96bQi4p63q95vqkJlh8+hufoi2QgXRrAmICUBZb
 3U/V2Bind55W46MEjDqTLQInTg6bAVV1MH4feqLtKwDx8nOpBCxenwkJu+/9b3JEEk
 dPJgK2DI0ifCzbqnO4Ok2ixW99s3R39UOmSPVqXU7syL/2x6RBzS0jmhMjG2YSdeO8
 e8WxQ99phnwRQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=C65QqMcL
Subject: Re: [Buildroot] [PATCH] package/rauc-hawkbit-updater: fix missing
 user
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAxNS4wNy4yNSAyMDowMiwgTWFyY3VzIEhvZmZtYW5uIHdyb3RlOgo+IEhpIEdlcm8sCj4g
ClsuLi5dCj4gCj4gT3RoZXIgX1VTRVJTIGRlZmluaXRpb25zIGluIGJ1aWxkcm9vdCBhbGwgdXNl
ICogaW5zdGVhZCBvZiAhIGZvciB0aGUgCj4gcGFzc3dvcmQgZmllbGQuIE5vdCBzdXJlIGlmIHRo
YXQgbWFrZXMgYW55IGRpZmZlcmVuY2UgaW4gcGFzc3dvcmQgYnV0IAoKSSBtZWFudCAiYW55IGRp
ZmZlcmVuY2UgKmluIHByYWN0aWNlKiIgOkQKCj4gKGZyb20gc2hhZG93KDUpKSB0aGUgY29udmVu
dGlvbiBzZWVtcyB0byBiZSB0aGF0IHRoZSAnIScgcHJlZml4IGlzIAo+IHNwZWNpZmljYWxseSBm
b3IgbG9ja2VkIGFjY291bnRzLgo+IAo+PiArZW5kZWYKPj4gwqAgZWxzZQo+PiDCoCBSQVVDX0hB
V0tCSVRfVVBEQVRFUl9DT05GX09QVFMgKz0gLURzeXN0ZW1kPWRpc2FibGVkCj4+IMKgIGVuZGlm
Cj4gCj4gQmVzdCwKPiBNYXJjdXMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5v
cmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290
Cg==
