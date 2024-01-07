Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75BC5C47074
	for <buildroot@archiver.kernel.org>; Sun,  7 Jan 2024 16:11:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 10946400D0;
	Sun,  7 Jan 2024 16:11:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 10946400D0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OywghTD6pqsL; Sun,  7 Jan 2024 16:11:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C568440191;
	Sun,  7 Jan 2024 16:11:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C568440191
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9F5DD1BF38B
 for <buildroot@lists.busybox.net>; Sun,  7 Jan 2024 16:11:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7468141526
 for <buildroot@lists.busybox.net>; Sun,  7 Jan 2024 16:11:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7468141526
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nebBxSJKpsKt for <buildroot@lists.busybox.net>;
 Sun,  7 Jan 2024 16:11:44 +0000 (UTC)
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 59D9241521
 for <buildroot@buildroot.org>; Sun,  7 Jan 2024 16:11:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 59D9241521
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2cc9fa5e8e1so10928071fa.3
 for <buildroot@buildroot.org>; Sun, 07 Jan 2024 08:11:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704643902; x=1705248702;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gL+DUxIeTQw2luIGktXw7/gyhte589Quc4eZ5U/swec=;
 b=N/T6eOiiFXOS0FgjKHoYeYuPU0+3a4YhhdUpyVrRcNQ3vTBQrMrLo6jS4U5xbQmu8G
 KHYUvY7IAQ2+feZfNcM7UThbl5NJNA/oJFoe7s9YndIraJDyUt8X4vD1uJmPjpRCZuql
 ipOEz3FL+E8zywwzGc4fohI4/F6xLriEYlTQA3l7+w0qQ9uTt9bBuYfmCpkJ4TMRySFp
 5m23B5UA9bye4sM++ArZlRlgc1vOQDXSCqw5Y2Nb8ZLsUmXi5WCSIK4rMI73dNqGnRw9
 /AHAzY0T2uZqaqHSoAecFV/My74VYuHuk8liDeNrm9Yr88j245OAeiPRyVnE87lFmDe6
 ileA==
X-Gm-Message-State: AOJu0YxklWtJLhPYmsko/6n5i5U8962/dWzksuN5UyYQjpdAqHHzYEqF
 wfpsxW8eOb6HgYq8o8IaWrnw7bZ8wlPgD5ntWTvKsM4p0Jk=
X-Google-Smtp-Source: AGHT+IFv7wrL9dxMQPlfAeYNW7eKmkMyY3om5jsqbCrSqAJkuGOIZETBUIRqfS4kURXA+PGkF37H/WXe7k6W6WyGFLw=
X-Received: by 2002:a2e:310a:0:b0:2cc:9866:a9aa with SMTP id
 x10-20020a2e310a000000b002cc9866a9aamr916025ljx.40.1704643901920; Sun, 07 Jan
 2024 08:11:41 -0800 (PST)
MIME-Version: 1.0
References: <20240107132346.3161192-1-fontaine.fabrice@gmail.com>
 <ZZrHtio9hrWSwB16@landeda>
In-Reply-To: <ZZrHtio9hrWSwB16@landeda>
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 7 Jan 2024 17:11:30 +0100
Message-ID: <CAPi7W82KB5bmo_+2C87CdS1kBy76UmMm0S1e0A2dg77ce1f1JQ@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704643902; x=1705248702; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gL+DUxIeTQw2luIGktXw7/gyhte589Quc4eZ5U/swec=;
 b=iNxljjNRQNvyRsAyI8PFnfNwx0qDF3Jf2fLjR+IYB/2CJnT5hOcezZrK4N62wTGb+8
 1wqNqfZajsAUv/MA4Efm78jQHi7JJRp6aeJMvm0YB0A3DkmvdJfmApgj0IaUc9PJp5DU
 BF5DRHNsVc6VJU7dg5dGDEIwMDW8D7gJygyevmTRPQ8leSdghMr8xOV98lQopPBy43v6
 bOVrq2iomIqJ4P/ha8N4dA4oihH7VsVZZ/n0mvt9RKiXZhW1P1jxhGHWSLZRTqde9oip
 tDydLOq2Rh0hNvL15Y6JriK1zznVlALx5hSh+Gngdsz4oo7mstDRsEN3KluCyfjwYje8
 gjVw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=iNxljjNR
Subject: Re: [Buildroot] [PATCH 1/1] package/liquid-dsp: fix build without
 neon
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
Cc: Guillaume William Brs <guillaume.bressaix@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gWWFubiwKCkxlIGRpbS4gNyBqYW52LiAyMDI0IMOgIDE2OjQ4LCBZYW5uIEUuIE1PUklO
IDx5YW5uLm1vcmluLjE5OThAZnJlZS5mcj4gYSDDqWNyaXQgOgo+Cj4gRmFicmljZSwgQWxsLAo+
Cj4gT24gMjAyNC0wMS0wNyAxNDoyMyArMDEwMCwgRmFicmljZSBGb250YWluZSBzcGFrZSB0aHVz
bHk6Cj4gPiBGaXggdGhlIGZvbGxvd2luZyBidWlsZCBmYWlsdXJlIHdpdGhvdXQgbmVvbiByYWlz
ZWQgc2luY2UgYnVtcCB0bwo+ID4gdmVyc2lvbiAxLjQuMCBpbiBjb21taXQgMmY3ZjhmMzgxMzk0
MjA3YmZiMDI5ZWMzOTVmNWNlZDU2OTVhMGEyZSBhbmQKPiA+IGh0dHBzOi8vZ2l0aHViLmNvbS9q
Z2FlZGRlcnQvbGlxdWlkLWRzcC9jb21taXQvYzgyMTE4N2RkOWFmMjc1OGM4ZTNjODJlOTVlYWYw
NDFiOGFjODFhMDoKPiA+Cj4gPiAvaG9tZS9wZWtvL2F1dG9idWlsZC9pbnN0YW5jZS0wL291dHB1
dC0xL2hvc3QvYmluL2FybS1ub25lLWxpbnV4LWdudWVhYmktZ2NjIC1zdGQ9Z251MTEgLURfTEFS
R0VGSUxFX1NPVVJDRSAtRF9MQVJHRUZJTEU2NF9TT1VSQ0UgLURfRklMRV9PRkZTRVRfQklUUz02
NCAgLU8yIC1nMCAtRF9GT1JUSUZZX1NPVVJDRT0yICAtZmZhc3QtbWF0aCAtbWNwdT1jb3J0ZXgt
YTcgLW1mbG9hdC1hYmk9aGFyZCAtbWZwdT1uZW9uLXZmcHY0ICAtV2FsbCAtZlBJQyAtV25vLWRl
cHJlY2F0ZWQgLURfTEFSR0VGSUxFX1NPVVJDRSAtRF9MQVJHRUZJTEU2NF9TT1VSQ0UgLURfRklM
RV9PRkZTRVRfQklUUz02NCAtSS4gLUlpbmNsdWRlICAtYyAtbyBzcmMvYXVkaW8vc3JjL2N2c2Qu
byBzcmMvYXVkaW8vc3JjL2N2c2QuYwo+ID4gSW4gZmlsZSBpbmNsdWRlZCBmcm9tIC9ob21lL3Bl
a28vYXV0b2J1aWxkL2luc3RhbmNlLTAvb3V0cHV0LTEvaG9zdC9hcm0tYnVpbGRyb290LWxpbnV4
LWdudWVhYmkvc3lzcm9vdC91c3IvaW5jbHVkZS9mZWF0dXJlcy5oOjM4ODowLAo+ID4gICAgICAg
ICAgICAgICAgICBmcm9tIC9ob21lL3Bla28vYXV0b2J1aWxkL2luc3RhbmNlLTAvb3V0cHV0LTEv
aG9zdC9hcm0tYnVpbGRyb290LWxpbnV4LWdudWVhYmkvc3lzcm9vdC91c3IvaW5jbHVkZS9zdGRs
aWIuaDoyNCwKPiA+ICAgICAgICAgICAgICAgICAgZnJvbSBzcmMvbGlibGlxdWlkLmM6MjU6Cj4g
PiAvaG9tZS9wZWtvL2F1dG9idWlsZC9pbnN0YW5jZS0wL291dHB1dC0xL2hvc3QvYXJtLWJ1aWxk
cm9vdC1saW51eC1nbnVlYWJpL3N5c3Jvb3QvdXNyL2luY2x1ZGUvZ251L3N0dWJzLmg6MTA6Mjk6
IGZhdGFsIGVycm9yOiBnbnUvc3R1YnMtaGFyZC5oOiBObyBzdWNoIGZpbGUgb3IgZGlyZWN0b3J5
Cj4gPiAgIyBpbmNsdWRlIDxnbnUvc3R1YnMtaGFyZC5oPgo+ID4gICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBeCj4gPgo+ID4gRml4ZXM6Cj4gPiAgLSBodHRwOi8vYXV0b2J1aWxkLmJ1aWxk
cm9vdC5vcmcvcmVzdWx0cy8zNmIzYzIyMjBjNDYyZTdhMjAyNjJmZDFiOTA2NGQ5YWViNmM5ZWM0
Cj4gPiAgLSBodHRwOi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5vcmcvcmVzdWx0cy84ODE4MjZiNGI2
YzE0MWU1OWEwZGEyZDdkMWFkNTVkMzcwOWZkYjk1Cj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogRmFi
cmljZSBGb250YWluZSA8Zm9udGFpbmUuZmFicmljZUBnbWFpbC5jb20+Cj4gPiAtLS0KPiA+ICBw
YWNrYWdlL2xpcXVpZC1kc3AvbGlxdWlkLWRzcC5tayB8IDQgKysrKwo+ID4gIDEgZmlsZSBjaGFu
Z2VkLCA0IGluc2VydGlvbnMoKykKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9saXF1aWQt
ZHNwL2xpcXVpZC1kc3AubWsgYi9wYWNrYWdlL2xpcXVpZC1kc3AvbGlxdWlkLWRzcC5tawo+ID4g
aW5kZXggZTk3ODhlYjE0NC4uYTk2ZDRjYWI3OSAxMDA2NDQKPiA+IC0tLSBhL3BhY2thZ2UvbGlx
dWlkLWRzcC9saXF1aWQtZHNwLm1rCj4gPiArKysgYi9wYWNrYWdlL2xpcXVpZC1kc3AvbGlxdWlk
LWRzcC5tawo+ID4gQEAgLTQwLDYgKzQwLDEwIEBAIGlmZXEgKCQoQlIyX3Bvd2VycGMpJChCUjJf
cG93ZXJwYzY0KSQoQlIyX3Bvd2VycGM2NGxlKSx5KQo+ID4gIExJUVVJRF9EU1BfQ09ORl9PUFRT
ICs9IC0tZW5hYmxlLXNpbWRvdmVycmlkZQo+ID4gIGVuZGlmCj4gPgo+ID4gK2lmZXEgKCQoQlIy
X2FybSk6JChCUjJfQVJNX0ZQVV9ORU9OKSx5OikKPiA+ICtMSVFVSURfRFNQX0NPTkZfT1BUUyAr
PSAtLWVuYWJsZS1zaW1kb3ZlcnJpZGUKPgo+IFVzdWFsbHksIHdlIGFkZCBhbiBleHBsaWNpdCAt
LWRpc2FibGUuIEFueSByZWFzb24gd2h5IGl0IHdhcyBub3QgYWRkZWQKPiBoZXJlPwoKQmVjYXVz
ZSAtLWRpc2FibGUtc2ltZG92ZXJyaWRlIGlzIG5vdCBzdXBwb3J0ZWQsIHdvcnN0LAotLWRpc2Fi
bGUtc2ltZG92ZXJyaWRlIGhhcyB0aGUgc2FtZSBlZmZlY3QgdGhhbiAtLWVuYWJsZS1zaW1kb3Zl
cnJpZGUsCmJlY2F1c2UgdXBzdHJlYW0gZG9lc24ndCBjaGVjayB0aGUgdmFsdWUgcHJvdmlkZWQg
YnkgdGhlIHVzZXI6Cmh0dHBzOi8vZ2l0aHViLmNvbS9qZ2FlZGRlcnQvbGlxdWlkLWRzcC9ibG9i
LzU0MzJlMzE3ZTNjMzFmMDY5ZTgyMjNkMTg1YzI4MDc4ZmM0MWM4Y2MvY29uZmlndXJlLmFjI0w2
NAoKPgo+IFJlZ2FyZHMsCj4gWWFubiBFLiBNT1JJTi4KPgo+ID4gK2VuZGlmCj4gPiArCj4gPiAg
TElRVUlEX0RTUF9DT05GX09QVFMgKz0gXAo+ID4gICAgICAgQ0ZMQUdTPSIkKExJUVVJRF9EU1Bf
Q0ZMQUdTKSIgXAo+ID4gICAgICAgTERGTEFHUz0iJChMSVFVSURfRFNQX0xERkxBR1MpIgo+ID4g
LS0KPiA+IDIuNDMuMAo+ID4KPiA+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCj4gPiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4gPiBidWlsZHJvb3RAYnVp
bGRyb290Lm9yZwo+ID4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8vYnVpbGRyb290Cj4KPiAtLQo+IC4tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0t
LS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uCj4gfCAgWWFubiBF
LiBNT1JJTiAgfCBSZWFsLVRpbWUgRW1iZWRkZWQgfCAvIlwgQVNDSUkgUklCQk9OIHwgRXJpY3Mn
IGNvbnNwaXJhY3k6IHwKPiB8ICszMyA2NjIgMzc2IDA1NiB8IFNvZnR3YXJlICBEZXNpZ25lciB8
IFwgLyBDQU1QQUlHTiAgICAgfCAgX19fICAgICAgICAgICAgICAgfAo+IHwgKzMzIDU2MSAwOTkg
NDI3IGAtLS0tLS0tLS0tLS0uLS0tLS0tLTogIFggIEFHQUlOU1QgICAgICB8ICBcZS8gIFRoZXJl
IGlzIG5vICB8Cj4gfCBodHRwOi8veW1vcmluLmlzLWEtZ2Vlay5vcmcvIHwgXy8qXF8gfCAvIFwg
SFRNTCBNQUlMICAgIHwgICB2ICAgY29uc3BpcmFjeS4gIHwKPiAnLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tXi0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0t
LS0tJwoKQmVzdCBSZWdhcmRzLAoKRmFicmljZQpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWls
ZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1
aWxkcm9vdAo=
