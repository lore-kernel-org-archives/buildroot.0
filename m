Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE17EC4332F
	for <buildroot@archiver.kernel.org>; Sat, 28 Oct 2023 18:58:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4204D42D2D;
	Sat, 28 Oct 2023 18:58:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4204D42D2D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VTMTO1OUxmfL; Sat, 28 Oct 2023 18:58:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 80F5B42D29;
	Sat, 28 Oct 2023 18:58:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 80F5B42D29
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8AB791BF362
 for <buildroot@lists.busybox.net>; Sat, 28 Oct 2023 18:58:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7065861370
 for <buildroot@lists.busybox.net>; Sat, 28 Oct 2023 18:58:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7065861370
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id I8YVGuBwK5Uw for <buildroot@lists.busybox.net>;
 Sat, 28 Oct 2023 18:58:44 +0000 (UTC)
Received: from mailgw-out1.grenoble.cnrs.fr (mailgw-out1.grenoble.cnrs.fr
 [147.173.1.68])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 610C0612BB
 for <buildroot@buildroot.org>; Sat, 28 Oct 2023 18:58:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 610C0612BB
Received: from [IPV6:2a01:e0a:947:3d0:8ddd:460c:90dd:47b9] (unknown
 [IPv6:2a01:e0a:947:3d0:8ddd:460c:90dd:47b9])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mailgw-out1.grenoble.cnrs.fr (Postfix) with ESMTPSA id A8E7BC01B8;
 Sat, 28 Oct 2023 20:58:39 +0200 (CEST)
Message-ID: <61e80819-c901-486c-afdd-1e69441821e2@grenoble.cnrs.fr>
Date: Sat, 28 Oct 2023 20:58:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?Q?=C5=81ukasz_Przenios=C5=82o?= <bremenpl@gmail.com>,
 buildroot@buildroot.org
References: <em9eec97a0-87a4-4352-9e89-03948b436830@9e2fe6c2.com>
Content-Language: en-US
From: Edgar Bonet <bonet@grenoble.cnrs.fr>
In-Reply-To: <em9eec97a0-87a4-4352-9e89-03948b436830@9e2fe6c2.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=grenoble.cnrs.fr; 
 s=202106-grenoble.cnrs.fr; t=1698519519;
 bh=p9wuc6QdOeRA9ZnR2PPT52agzuPMsCfx/McDgcXzx3c=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=TO6ATgAXUaoezXFUNu4I34A88EYqnop0GVdtJ5Iw2uOLKYc4NmxtM6olaGXtMtHkB
 5GEYzy2/MNva9ptDEdLmFoUlLotsrL/RnMKxpl3pvFnKsx8mKorIGZ5rfOQZ6s+0ta
 O4emqOxKddWDuzk4XljQYRIsCPEnQwTpGZW9dFF9AhMWBSH5TmMRuW2AiTh8E+1hdD
 YQjowjh40ResX7+kSbOklCXewWyr9FIkwb96SSXA3idZsAIL7tHNZWVpLaJm6ec/KQ
 qJxVCBmqjmeFjs64cc4GGke5SDyiNFxR/ZiQT+ol6DkoIJzWnfE3vE/6sLMexFtBTz
 q13uZRrpBW3pA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=grenoble.cnrs.fr header.i=@grenoble.cnrs.fr
 header.a=rsa-sha256 header.s=202106-grenoble.cnrs.fr header.b=TO6ATgAX
Subject: Re: [Buildroot] Help with DTO
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8hCgrFgXVrYXN6IFByemVuaW9zxYJvIHdyb3RlLCBhYm91dCB0aGUgQmVhZ2xlQm9uZToK
PiBTbyBJIGhhdmUgdGhlIEhXIGFuZCB2aXJnaW4gd29ya2luZyBCdWlsZHJvb3QgaW1hZ2UgYmFr
ZWQgdGhhbmtzIHRvCj4gdGhpcyB0dXRvcmlhbC4KPiAoaHR0cHM6Ly9ibG9nLmJpbGx2YW5sZWV1
d2VuLmNhL2NyZWF0aW5nLWEtbWluaW1hbC1saW51eC1zeXN0ZW0tZm9yLXRoZS1iZWFnbGVib25l
LWJsYWNrLXdpdGgtYnVpbGRyb290KQoKVGhpcyB0dXRvcmlhbCB3YWxrcyB5b3UgdGhyb3VnaCBh
IG1hbnVhbCBjb25maWd1cmF0aW9uLiBOb3RlIHRoYXQKQnVpbGRyb290IHNoaXBzIGEgcmVhZHkt
bWFkZSBjb25maWd1cmF0aW9uIHlvdSBjYW4gdXNlOgoKICAgIG1ha2UgYmVhZ2xlYm9uZV9kZWZj
b25maWcgICMgbG9hZCB0aGUgcmVhZHktbWFkZSBkZWZjb25maWcKICAgIG1ha2UgbWVudWNvbmZp
ZyAgICAgICAgICAgICMgaWYgeW91IHdhbnQgdG8gdHdlYWsgaXQKICAgIG1ha2UKCj4gV2hhdCBJ
IHdhbnRlZCB0byBkbyBuZXh0IGlzIHRvIGNyZWF0ZSBhIGRldmljZSB0cmVlIG92ZXJsYXkgZm9y
IGFsbAo+IHJlcXVpcmVkIEdQSU9zIHRoYXQgd291bGQgYmUgY29tcGlsZWQgYXQga2VybmVsIGJ1
aWxkIHRpbWUuCgpJIGRvIG5vdCB1bmRlcnN0YW5kIHdoeSB5b3UgbmVlZCBhIGRldmljZSB0cmVl
IG92ZXJsYXkuIFRoZSB0dXRvcmlhbApnZXRzIHlvdSBhIGtlcm5lbCB0b2dldGhlciB3aXRoIHRo
ZSBhbTMzNXgtYm9uZWJsYWNrIGRldmljZSB0cmVlLiBUaGlzCmRldmljZSB0cmVlIGFscmVhZHkg
ZGVmaW5lcyBmb3VyIEdQSU8gY2hpcHMuIENhbid0IHlvdSBzZWUgdGhlbT8gVHJ5CgogICAgbHMg
L2Rldi9ncGlvY2hpcCoKCklmIHlvdSB3YW50IHRvIHBsYXkgd2l0aCB0aGUgR1BJT3MsIEkgc3Vn
Z2VzdCB5b3UgaW5zdGFsbCB0aGUgdG9vbHMgdGhhdApjb21lIHdpdGggbGliZ3Bpb2Q6IGluIFRh
cmdldCBwYWNrYWdlcyAvIExpYnJhcmllcyAvIEhhcmR3YXJlIGhhbmRsaW5nLApzZWxlY3Qg4oCc
bGliZ3Bpb2TigJ0sIHRoZW4g4oCcaW5zdGFsbCB0b29sc+KAnS4gVGhlbiwgb24gdGhlIGJvb3Rl
ZCBzeXN0ZW0sCnR5cGUKCiAgICBncGlvZGV0ZWN0CiAgICBncGlvaW5mbwoKWW91IHNob3VsZCBz
ZWUgYWxsIHRoZSBhdmFpbGFibGUgR1BJTyBjaGlwcywgdGhlbiBhbGwgdGhlIEdQSU8gbGluZXMu
CgpSZWdhcmRzLAoKRWRnYXIuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcK
aHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
