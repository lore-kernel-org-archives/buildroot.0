Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 611C6C7618E
	for <buildroot@archiver.kernel.org>; Wed, 26 Apr 2023 20:06:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B17D383BC3;
	Wed, 26 Apr 2023 20:06:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B17D383BC3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7YNf55v0lr95; Wed, 26 Apr 2023 20:05:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 71B0883BC5;
	Wed, 26 Apr 2023 20:05:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 71B0883BC5
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2D9581BF42E
 for <buildroot@lists.busybox.net>; Wed, 26 Apr 2023 20:05:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0E4B740613
 for <buildroot@lists.busybox.net>; Wed, 26 Apr 2023 20:05:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0E4B740613
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pztAg5qg5PAV for <buildroot@lists.busybox.net>;
 Wed, 26 Apr 2023 20:05:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2E5A440327
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com
 [209.85.208.51])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2E5A440327
 for <buildroot@buildroot.org>; Wed, 26 Apr 2023 20:05:56 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id
 4fb4d7f45d1cf-504eb1155d3so1379933a12.1
 for <buildroot@buildroot.org>; Wed, 26 Apr 2023 13:05:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682539554; x=1685131554;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4gE1zZITJ6VYBUIVKr/casbEyixX4D5Gvj+M5KA2Zi4=;
 b=auOwsirm1sfvbn+fCnJTXMjIovYIczzaOfozAut6/V+L+e4Yj6LRalBhAVZ+qF8dK+
 80bXw/17xFU1w/P0K9sVMSQeMfA4WeiP53HXQ5a0b5Eu2g6kp1sPJJkNdyPr+eEV+lnC
 4Di0jD7fiZksuYl82BAhwYFvtAhvXBmyLzzdG4K0GAgApn4hIqZwIkAPvcfA3CFeyC7h
 Eanilm6jjS5OAmA4563FmcgIuPs7XQYZWzubiAF0apn+aapoiOQlntJMfeJ1SfkKTcMT
 RSlPLRah+lGwh0CWqS7Db0tiqqohcNPVeCM2uz7IKD/cUsH9Q6slA91T+kBcR7OSReGB
 I+QQ==
X-Gm-Message-State: AC+VfDz0bQsM7L1jMTbGOqp7py5WWhE1OcHFRDNJugt4UkTKjPgpMBg/
 3wnLa7q9C8rhdZNFBp5uE97d3SEP4MupZr/UCkZ96Q==
X-Google-Smtp-Source: ACHHUZ6TzEehGG0mOHtjBVE+GS2IFoT/zXQyWMvGd4vWWx8BNXGWAR8MhJVaDf88ct4Wm3KKw1v0EE+vtFoAcgoH3rY=
X-Received: by 2002:a50:fb85:0:b0:504:b45a:5f99 with SMTP id
 e5-20020a50fb85000000b00504b45a5f99mr3872021edq.19.1682539554114; Wed, 26 Apr
 2023 13:05:54 -0700 (PDT)
MIME-Version: 1.0
References: <SN4P221MB0682FB7AA70635712FC71C57A0649@SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM>
 <2fd1acce-9795-aa38-44e7-7f7cbdd1a57a@gmail.com>
In-Reply-To: <2fd1acce-9795-aa38-44e7-7f7cbdd1a57a@gmail.com>
From: James Knight <james.d.knight@live.com>
Date: Wed, 26 Apr 2023 16:05:44 -0400
Message-ID: <CALAjcgUYQ2bdGfJ_-0L6p1+HjagD0Nxg9F6dEdjt8hr_Yw-Omw@mail.gmail.com>
To: Raphael Pavlidis <raphael.pavlidis@gmail.com>
Subject: Re: [Buildroot] [PATCH] package/sway: add runtime dependency on
 xkeyboard-data
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 James Knight <james.d.knight@live.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

UmFwaGFlbCwKCk9uIFdlZCwgQXByIDI2LCAyMDIzIGF0IDE6MjHigK9QTSBSYXBoYWVsIFBhdmxp
ZGlzCjxyYXBoYWVsLnBhdmxpZGlzQGdtYWlsLmNvbT4gd3JvdGU6Cj4gSWYgdGhpcyBpcyBjYXVz
ZWQgYnkgbGlieGtiY29tbW9uLCB3b3VsZCBpdCB0aGVuIGJlIGJldHRlciB0byBhZGQgdGhpcwo+
IHJ1bnRpbWUgZGVwZW5kZW5jeSB0byB3bHJvb3RzLCBiZWNhdXNlIGxpYnhrYmNvbW1vbiBpcyBh
IGRlcGVuZGVuY3kgb2YKPiB3bHJvb3RzIG5vdCBzd2F5LiBNYXliZSwgdGhlIHNhbWUgcHJvYmxl
bSBvY2N1cnMgb24gY2FnZSAoYWxzbyBhIHdscm9vdHMKPiBiYXNlZCBjb21wb3NpdG9yKSwgdG9v
LgoKV2hpbGUgSSBjYW5ub3Qgc2F5IEkgaGF2ZSBtdWNoIGtub3dsZWRnZSBvbiB3bHJvb3RzIGFu
ZCB0aGUgcHJvZ3JhbXMKd2hpY2ggcmVseSBvbiBpdCwgZnJvbSBteSB1bmRlcnN0YW5kaW5nIGlz
IHRoYXQgZXZlbiBpZiBhIHByb2dyYW0gdXNlcwp3bHJvb3RzLCBpdCBkb2VzIG5vdCBuZWNlc3Nh
cmlseSBuZWVkIGtleWJvYXJkL2lucHV0IHN1cHBvcnQgdG8KZnVuY3Rpb24uIFRlc3RlZCBydW5u
aW5nIGNhZ2Ugd2l0aG91dCB4a2V5Ym9hcmQtY29uZmlnIGFuZCBpdCBzZWVtZWQKdG8gc29tZXdo
YXQgZnVuY3Rpb24gKGUuZy4gYGNhZ2UgZXMyZ2VhcnNfd2F5bGFuZGA7IGdyYW50ZWQsIHNvbWUg
Y2FnZQpsb2dzIGRpZCB3YXJuIGFib3V0IG5vdCBiZWluZyBhYmxlIHRvIGdlbmVyYXRlIGFuIFhL
QiBjb250ZXh0KS4gV2l0aAp0aGF0IGluIG1pbmQsIGl0IG1ha2VzIG1lIGhlc2l0YW50IHRvIHB1
c2ggdGhlIHVzZSBvZiB4a2V5Ym9hcmQtY29uZmlnCmZvciBhbGwgd2xyb290cyB1c2UgY2FzZXMs
IHNpbmNlIG1heWJlIHRoZXJlIGFyZSBlbnZpcm9ubWVudHMgb3V0CnRoZXJlIHRoYXQgZG8gbm90
IGNhcmUgYWJvdXQgaW5wdXQuIEFuZCBzaW5jZSB3ZXN0b24gYW5kIFggYXJlIChJCnN1c3BlY3Qp
IGNvbW1vbmx5IGlucHV0IGRyaXZlbiBhbmQgc2VsZWN0IHRoaXMgY29uZmlndXJhdGlvbiBpbgpC
dWlsZHJvb3Qgbm93LCB0aGlzIGlzIHdoZXJlIG15IGFzc3VtcHRpb24gbGVkIHRvIHdhbnRpbmcg
dG8gYWRkIGl0CmZvciBTd2F5LgoKSW50ZXJlc3RpbmcgZW5vdWdoLCBwbGF5aW5nIHdpdGggY29n
ICh3aGljaCB1c2VzIGxpYnhrYmNvbW1vbiBhbmQgbm90Cndscm9vdHMpLCBpdCBoYXMgYSB1bmlx
dWUgZXhwZXJpZW5jZSBhcyB3ZWxsLiBUaGUgYXBwbGljYXRpb24gY2FuCnN0YXJ0IGFuZCByZW5k
ZXIgYSBwYWdlOyBob3dldmVyLCBhbnkgaW5wdXQgaW50ZXJhY3Rpb24gd2lsbCBTRUdGTFQKY29n
LiBJIGFzc3VtZSB0aGF0IHRoaXMgaXMganVzdCBhIGNhc2Ugb2YgdGhlIGltcGxlbWVudGF0aW9u
IHdoaWNoCmRvZXMgbm90IHByb3Blcmx5IGhhbmRsZSBhIG5vLWlucHV0IHNjZW5hcmlvIChwZXJz
b25hbGx5LCBJIGZlZWwgdGhpcwppcyBhIHVzZSBjYXNlIGl0IHNob3VsZCBiZSBhYmxlIHRvIGhh
bmRsZSkuIEdpdmVuIHRoYXQgaXQgZmF1bHRzIG5vdywKSSB3b3VsZCBhbHNvIHdvbmRlciBpZiB0
aGUgYEJSMl9QQUNLQUdFX1hLRVlCT0FSRF9DT05GSUdgIGZsYWcgc2hvdWxkCmJlIHNldCBmb3Ig
dGhpcyBwYWNrYWdlLgoKQSBsb29rIGF0IHNvbWUgcG9wdWxhciBkaXN0cmlidXRpb25zIHdoaWNo
IHVzZSBsaWJ4a2Jjb21tb24gYXJlCmRpc3RyaWJ1dGVkIGluIGEgd2F5IHdoZXJlIHRoZSBkaXN0
cmlidXRpb24ncyBgeGtleWJvYXJkLWNvbmZpZ2AtbGlrZQpwYWNrYWdlIGlzIGEgZGVwZW5kZW5j
eSBvbiBsaWJ4a2Jjb21tb24gKGZyb20gd2hhdCBJIGNhbiB0ZWxsLCBib3RoCkFyY2ggYW5kIFVi
dW50dSBkbyB0aGlzKS4gTWF5YmUgaXQgd291bGQgYmUgYmVzdCB0byBoYXZlIGxpYnhrYmNvbW1v
bgppbXBseSB1c2FnZSBvbiB4a2V5Ym9hcmQtY29uZmlnLCB3aGljaCB3b3VsZCBoZWxwIGluY2x1
ZGUgYSBrZXltYXAKZGF0YSBmb3IgYWxsIHRoZXNlIHVzZSBjYXNlcy4gQW5kIGlmIGEgZGV2ZWxv
cGVyIGhhcyBhIGRlc2lyZSB0bwptYW5hZ2UgdGhlaXIgb3duIGN1c3RvbWl6ZWQga2V5bWFwIGRh
dGEsIHRoZXkgY2FuIG9wdCB0byBub3QgdXNlCnhrZXlib2FyZC1jb25maWcgYW5kIG1hbmFnZSB0
aGUgaW5jbHVzaW9uIG9mIGN1c3RvbSBrZXltYXAgZGF0YSB2aWEKdGhlaXIgQlNQL3Bvc3QtYnVp
bGQgc2NyaXB0cy4gRm9yIGV4YW1wbGU6CgogICAgIGNvbmZpZyBCUjJfUEFDS0FHRV9MSUJYS0JD
T01NT04KICAgICAgICAgIC4uLgogICAgICAgICAgaW1wbHkgQlIyX1BBQ0tBR0VfWEtFWUJPQVJE
X0NPTkZJRwoKQW5kIGRyb3AgdGhlIGV4aXN0aW5nIHNlbGVjdGlvbnMgb24gYEJSMl9QQUNLQUdF
X1dFU1RPTmAgYW5kCmBCUjJfUEFDS0FHRV9YU0VSVkVSX1hPUkdfU0VSVkVSYC4KCk9yIGlmIHdl
IGp1c3Qgd2FudCB0byBtYWtlIHRoaW5ncyBzaW1wbGUsIGZvciBhIHNlbGVjdCBvbgpgQlIyX1BB
Q0tBR0VfWEtFWUJPQVJEX0NPTkZJR2AgaW4gYEJSMl9QQUNLQUdFX0xJQlhLQkNPTU1PTmAsIGFu
ZCBhbnkKZGV2ZWxvcGVyIHdhbnRpbmcgY3VzdG9tIGtleWRhdGEgY2FuIGp1c3QgbWFuaXB1bGF0
ZSB0aGUgdGFyZ2V0J3MKYC91c3Ivc2hhcmUvWDExL3hrYmAgY29udGVudHMgdGhlbXNlbHZlcy4K
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290
IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxk
cm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
