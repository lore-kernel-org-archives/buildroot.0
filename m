Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A310FCD1284
	for <buildroot@archiver.kernel.org>; Tue,  9 Apr 2024 11:35:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5BCA3402E5;
	Tue,  9 Apr 2024 11:35:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Vmu1LsKDnEvU; Tue,  9 Apr 2024 11:35:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5CB0E40972
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5CB0E40972;
	Tue,  9 Apr 2024 11:35:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 31CB01BF3BB
 for <buildroot@lists.busybox.net>; Tue,  9 Apr 2024 11:35:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1E77140972
 for <buildroot@lists.busybox.net>; Tue,  9 Apr 2024 11:35:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UB4mVpktlAL7 for <buildroot@lists.busybox.net>;
 Tue,  9 Apr 2024 11:35:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6BBB3402E5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6BBB3402E5
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6BBB3402E5
 for <buildroot@buildroot.org>; Tue,  9 Apr 2024 11:35:34 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-416b66163a9so2351365e9.2
 for <buildroot@buildroot.org>; Tue, 09 Apr 2024 04:35:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712662532; x=1713267332;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QduXvVRMvx4RV10pTT6cTw/X7bO+s1QkbnkNt6Sjfyo=;
 b=W6G2jMWI7mumOkLhsTD3V08s6S+H6ErYeaRY/yGhYmosz0phFbMn1uff06yuHSCOR/
 NyaRCLrsqK/JmvmVJZ8g0a39DlWnUIC2mZiUMLaDUd+tvwzwDIVs7lsakoqU3Bqd6YUh
 SQDo0PTik2XBT/Ovv7jgKSutzDR4zgLutkTHmZ68x06H8AcmiWdLPzlIQ4xLzg0dtouy
 BEiqe0ueioTXU/evC6Fd0cGgW9Al65jaJOVmVToSlf7LIp22CHMiFIweX836tALuxIXB
 SDr5o1OUl9HLrhk0/dnBQNsvkIF6sqJNRg3eOEWABb+9Xl3zvl9un2t7qAHl9fcmrKcZ
 tUNg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUKN/s5bdvUjm+5Puu4yjs9Yg6hiYpfVO5sFpYtztCbKWpiwNVXa0DH/c/Xu0mLsBEyUKSd3nUEk85Ui/JqBL5YSl/L+ejh4A==
X-Gm-Message-State: AOJu0Yx3KJFvVHt/CZWFtjZSXLHcbVQoxXhKwm0clO1+k+so+tnbVrH8
 BGoM3jIuH6QrlxRXbFFlKFUvqbLvdbZULOYNZS7NFdykYERMrV/lyseXc8zLeGo=
X-Google-Smtp-Source: AGHT+IHHnayxwngbt5yjhCxPfjrpFPFbLCcrd+P3ibVqWQZYdk15mGDFQ7lsrok3TTXkY5eOdnnnmg==
X-Received: by 2002:a05:600c:4685:b0:415:45ea:9904 with SMTP id
 p5-20020a05600c468500b0041545ea9904mr11650450wmo.21.1712662531997; 
 Tue, 09 Apr 2024 04:35:31 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:e3ef:2d7a:4131:71f?
 (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
 by smtp.gmail.com with ESMTPSA id
 j15-20020a05600c190f00b004162b7af645sm19461961wmq.10.2024.04.09.04.35.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Apr 2024 04:35:31 -0700 (PDT)
Message-ID: <ffc978d5-ec02-4fd1-b40a-ae80e3adacb3@smile.fr>
Date: Tue, 9 Apr 2024 13:35:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Arnout Vandecappelle <arnout@mind.be>, buildroot@buildroot.org
References: <20240407103512.1112712-1-romain.naour@smile.fr>
 <20240407103512.1112712-3-romain.naour@smile.fr>
 <10f6eb6e-fc38-457f-980b-a299716485b0@mind.be>
Content-Language: fr, en-US
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <10f6eb6e-fc38-457f-980b-a299716485b0@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1712662532; x=1713267332;
 darn=buildroot.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=QduXvVRMvx4RV10pTT6cTw/X7bO+s1QkbnkNt6Sjfyo=;
 b=fZjeFmT5R8UjywKMPRQStpxnmGSmmSKBuf57+e59njFWkQSoKIVOa6yt3QMa2oaslT
 e+Snv9aWUGGsm9GHj8D9AX92OeOAA5PPveq5YB539+kj8GPPmH+ukwRQFRHlyRsXihjn
 vvxDeiO5Ci6ZEIOAaTdEWwoRVMYKXj0Mde6oDMfErcuz3O+u1oc5u+GfjN4F6MwPa64y
 Q+YIVFNwzu/gpegQ360bPwtkR/ROxplQRXuD5yXHKGg40xwOxms6+umUKsutV3ulUwUa
 Ib+jjAoD7J4Xd2wIzILVgQQXCVZwO0nLsM1ekhCo8ktkz0cp2mYPqdASyZ4Wz/Aza7oR
 PLnA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=fZjeFmT5
Subject: Re: [Buildroot] [PATCH v12 02/16] board/ti/am6{2,
 4}x-sk: add arm-trusted-firmware v2.7 hash
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

SGVsbG8gQXJub3V0LAoKTGUgMDcvMDQvMjAyNCDDoCAyMTo1MywgQXJub3V0IFZhbmRlY2FwcGVs
bGUgYSDDqWNyaXTCoDoKPiAKPiAKPiBPbiAwNy8wNC8yMDI0IDEyOjM0LCBSb21haW4gTmFvdXIg
d3JvdGU6Cj4+IFdlIGFyZSBnb2luZyB0byBlbmFibGUgQlIyX0RPV05MT0FEX0ZPUkNFX0NIRUNL
X0hBU0hFUyBieSBkZWZhdWx0Cj4+IHRvIGVuZm9yY2UgZG93bmxvYWRzIHRvIGhhdmUgYXQgbGVh
c3Qgb25lIHZhbGlkIGhhc2ggaW5jbHVkaW5nCj4+IHRob3NlIHRoYXQgdXNlIGEgY3VzdG9tIHZl
cnNpb24uCj4gCj4gwqBJZiB3ZSBzd2l0Y2ggdG8gQlIyX1RBUkdFVF9BUk1fVFJVU1RFRF9GSVJN
V0FSRV9MQVRFU1RfTFRTXzJfOF9WRVJTSU9OIHRoZW4KPiB0aGlzIGN1c3RvbSBoYXNoIGlzbid0
IG5lZWRlZCBhbnkgbW9yZS4KCkluZGVlZCwgYnV0IHdpdGggdGhlIHVwY29taW5nIG5ldyBUSSBL
MyBTb0Mgc3VwcG9ydCB0aGUgYXRmIHYyLjggbWF5IGFscmVhZHkgdG9vCm9sZC4gSSB3b3VsZCBz
dWdnZXN0IHRvIHN5bmMgdGhlIEFURiB2ZXJzaW9uIHdpdGggdGhlIG9uZSB1c2VkIGJ5IG1ldGEt
dGkKKGN1cnJlbnRseSB2Mi4xMCkgYXMgbXVjaCBhcyBwb3NzaWJsZS4KCkFURiBpcyB1c2luZyB0
aGUgVEktU0NJIChUSSBTeXN0ZW0gQ29udHJvbGxlciBJbnRlcmZhY2UpIHRvIGNvbW11bmljYXRl
IHdpdGggU29DCmZpcm13YXJlLgoKaHR0cHM6Ly9zb2Z0d2FyZS1kbC50aS5jb20vdGlzY2kvZXNk
L2xhdGVzdC8xX2ludHJvL1RJU0NJLmh0bWwKCkJlc3QgcmVnYXJkcywKUm9tYWluCgoKPiAKPiDC
oFJlZ2FyZHMsCj4gwqBBcm5vdXQKPiAKPj4KPj4gU2lnbmVkLW9mZi1ieTogUm9tYWluIE5hb3Vy
IDxyb21haW4ubmFvdXJAc21pbGUuZnI+Cj4+IC0tLQo+PiDCoCAuLi4vcGF0Y2hlcy9hcm0tdHJ1
c3RlZC1maXJtd2FyZS9hcm0tdHJ1c3RlZC1maXJtd2FyZS5oYXNowqDCoMKgwqDCoCB8IDIgKysK
Pj4gwqAgLi4uL3BhdGNoZXMvYXJtLXRydXN0ZWQtZmlybXdhcmUvYXJtLXRydXN0ZWQtZmlybXdh
cmUuaGFzaMKgwqDCoMKgwqAgfCAyICsrCj4+IMKgIDIgZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRp
b25zKCspCj4+IMKgIGNyZWF0ZSBtb2RlIDEwMDY0NAo+PiBib2FyZC90aS9hbTYyeC1zay9wYXRj
aGVzL2FybS10cnVzdGVkLWZpcm13YXJlL2FybS10cnVzdGVkLWZpcm13YXJlLmhhc2gKPj4gwqAg
Y3JlYXRlIG1vZGUgMTAwNjQ0Cj4+IGJvYXJkL3RpL2FtNjR4LXNrL3BhdGNoZXMvYXJtLXRydXN0
ZWQtZmlybXdhcmUvYXJtLXRydXN0ZWQtZmlybXdhcmUuaGFzaAo+Pgo+PiBkaWZmIC0tZ2l0Cj4+
IGEvYm9hcmQvdGkvYW02Mngtc2svcGF0Y2hlcy9hcm0tdHJ1c3RlZC1maXJtd2FyZS9hcm0tdHJ1
c3RlZC1maXJtd2FyZS5oYXNoCj4+IGIvYm9hcmQvdGkvYW02Mngtc2svcGF0Y2hlcy9hcm0tdHJ1
c3RlZC1maXJtd2FyZS9hcm0tdHJ1c3RlZC1maXJtd2FyZS5oYXNoCj4+IG5ldyBmaWxlIG1vZGUg
MTAwNjQ0Cj4+IGluZGV4IDAwMDAwMDAwMDAuLjc0ZmUzNWM5YmMKPj4gLS0tIC9kZXYvbnVsbAo+
PiArKysgYi9ib2FyZC90aS9hbTYyeC1zay9wYXRjaGVzL2FybS10cnVzdGVkLWZpcm13YXJlL2Fy
bS10cnVzdGVkLWZpcm13YXJlLmhhc2gKPj4gQEAgLTAsMCArMSwyIEBACj4+ICsjIExvY2FsbHkg
Y29tcHV0ZWQ6Cj4+ICtzaGEyNTbCoCAzMjdjNjViMWJjMjMxNjA4YTdhODA4YjA2OGIwMGMxYTIy
MzEwZTlmYzg2MTU4ODEzY2QxMGE5NzExZDU3MjVlwqAKPj4gYXJtLXRydXN0ZWQtZmlybXdhcmUt
djIuNy50YXIuZ3oKPj4gZGlmZiAtLWdpdAo+PiBhL2JvYXJkL3RpL2FtNjR4LXNrL3BhdGNoZXMv
YXJtLXRydXN0ZWQtZmlybXdhcmUvYXJtLXRydXN0ZWQtZmlybXdhcmUuaGFzaAo+PiBiL2JvYXJk
L3RpL2FtNjR4LXNrL3BhdGNoZXMvYXJtLXRydXN0ZWQtZmlybXdhcmUvYXJtLXRydXN0ZWQtZmly
bXdhcmUuaGFzaAo+PiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+PiBpbmRleCAwMDAwMDAwMDAwLi43
NGZlMzVjOWJjCj4+IC0tLSAvZGV2L251bGwKPj4gKysrIGIvYm9hcmQvdGkvYW02NHgtc2svcGF0
Y2hlcy9hcm0tdHJ1c3RlZC1maXJtd2FyZS9hcm0tdHJ1c3RlZC1maXJtd2FyZS5oYXNoCj4+IEBA
IC0wLDAgKzEsMiBAQAo+PiArIyBMb2NhbGx5IGNvbXB1dGVkOgo+PiArc2hhMjU2wqAgMzI3YzY1
YjFiYzIzMTYwOGE3YTgwOGIwNjhiMDBjMWEyMjMxMGU5ZmM4NjE1ODgxM2NkMTBhOTcxMWQ1NzI1
ZcKgCj4+IGFybS10cnVzdGVkLWZpcm13YXJlLXYyLjcudGFyLmd6CgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1
aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2J1aWxkcm9vdAo=
