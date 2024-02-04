Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAC5EC4828F
	for <buildroot@archiver.kernel.org>; Sun,  4 Feb 2024 06:26:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 129AB400F1;
	Sun,  4 Feb 2024 06:26:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 129AB400F1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DmhkWR7uFHhb; Sun,  4 Feb 2024 06:26:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6E05A40461;
	Sun,  4 Feb 2024 06:26:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6E05A40461
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1B3F31BF288
 for <buildroot@lists.busybox.net>; Sun,  4 Feb 2024 06:26:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DFBD785471
 for <buildroot@lists.busybox.net>; Sun,  4 Feb 2024 06:26:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DFBD785471
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id D20GuFgcf-jv for <buildroot@lists.busybox.net>;
 Sun,  4 Feb 2024 06:26:52 +0000 (UTC)
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com
 [IPv6:2607:f8b0:4864:20::231])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D58B78544F
 for <buildroot@buildroot.org>; Sun,  4 Feb 2024 06:26:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D58B78544F
Received: by mail-oi1-x231.google.com with SMTP id
 5614622812f47-3be9e11ee59so2090764b6e.1
 for <buildroot@buildroot.org>; Sat, 03 Feb 2024 22:26:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707028011; x=1707632811;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=J0dyu1xNsGsDmXBS+mVYV3a8/g7I+Hz/1YSADFyyb5c=;
 b=EVxFNxx+NJWo10AGZ5RTA6s8x0LRyowIB7TgGIMeUa5ZeZm7tOqKeBmigJv9WgU9P5
 JHSqvisL9XKUF0mmaYpS8wJrq2f0HTQpcwarJow7W9P6QMbIyWfyASVMZTqz8XWUlfsl
 qBLDFjp57wRkrCjURQceEBvHwMJcPRfE9zTT+mhJXk/HenptdUFwi7A1Hm7GolIC+rdq
 3b53cEyxeCypSHF3+d7pZ1X7sWK4Yt+BravSJOwJLuGDbfTjdm9bPq3MBmHHNktKBr//
 4lpFHz7tY7Zvq/XkN9nG2Gn/BZWkdBbJVBTh/TXMQ3e2zAWJ1Efn4pGyJTo4xhEd2yoc
 93qQ==
X-Gm-Message-State: AOJu0YyezPhhJsWQln/DxkrlWuogt6KSt6PhCrDjSBnpSxw8riMqAWIm
 V/64Qk8Ug/e0VgYCqiRvAYS/Te5IVF9CKF4d5h9pUASG4sA8yGENmnv3EOE2
X-Google-Smtp-Source: AGHT+IGOUz4irFQ8RCLOiXJfLb/btifx9RfOEtLwHKrZvzVDDBrRFcq1VioR2uW/62YiYlLd5mIYAQ==
X-Received: by 2002:a05:6808:4495:b0:3be:c154:7276 with SMTP id
 eq21-20020a056808449500b003bec1547276mr13719774oib.5.1707028010727; 
 Sat, 03 Feb 2024 22:26:50 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCVb0h+P+T7ne09Lighw3QoJWsYhXnMiyDECY6u+egnEEFhIhaJKvAaw5RjqkAk4uMoBbMHfH5x32tVRQdji/WksuVE=
Received: from thinkpad.lan ([2600:1700:3eca:ac1f:a11a:f043:3678:9ceb])
 by smtp.gmail.com with ESMTPSA id
 q8-20020a25bfc8000000b00db41482d349sm1240756ybm.57.2024.02.03.22.26.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Feb 2024 22:26:50 -0800 (PST)
From: Abilio Marques <abiliojr@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  3 Feb 2024 22:26:41 -0800
Message-ID: <20240204062645.3616072-1-abiliojr@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707028011; x=1707632811; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=J0dyu1xNsGsDmXBS+mVYV3a8/g7I+Hz/1YSADFyyb5c=;
 b=MgjkkjeIdrJEDUkn04h5pf6NiYDGEKCgt9aESmuyrYcUr1C8iQ7TnH372VX7XNn5d9
 s+CWQsiDC0t45qI0NzkWAZDuSudgqdKq94dcPYpjMvrcgdcKmjr3FfwaYzMB5a0Mqx7B
 4YV9Ch8QGnOgjSsoqsi1glixT421Dm5QHLjF+1AsFIovp9Y6686CmeM5dNn8ABhNIpdF
 JF50R4mkb57IWraIPw0//Yo7i0BbZzSnOCpoh7gtMB4T2jvR7L9OdT1RclOOYI8XEP2v
 al7LMe+fn3Z5sLbe8Pz28Xo7xPguihGnQvMEGVLtip+1hk4itfNpnjyG9gwJ4TJae2Xe
 Lg4g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=MgjkkjeI
Subject: [Buildroot] [PATCH] package/micropython: add support for
 manifest.py in the configuration
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
Cc: Chris Packham <judge.packham@gmail.com>,
 Abilio Marques <abiliojr@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

TWljcm9weXRob24gY2FuIGVtYmVkIHBhY2thZ2VzIGFuIG1vZHVsZXMgYXMgZnJvemVuIGJ5dGVj
b2RlLiBXaGF0IGNvZGUKZ2V0cyBidWlsdCB0aGlzIHdheSBjYW4gYmUgZGVmaW5lZCBieSBtZWFu
cyBvZiBhICJtYW5pZmVzdC5weSIgZmlsZS4KClRoaXMgY29tbWl0IGV4cG9zZXMgdGhlIHZhcmlh
YmxlIEZST1pFTl9NQU5JRkVTVCB0byBCdWlsZHJvb3QgdXNlcnMKdGhyb3VnaCBhIG5ldyB2YXJp
YWJsZSBjYWxsZWQgQlIyX1BBQ0tBR0VfTUlDUk9QWVRIT05fTUFOSUZFU1QuCgpQbGVhc2UgY2hl
Y2sgTWljcm9weXRob24ncyBkb2N1bWVudGF0aW9uIGZvciBtb3JlIGluZm9ybWF0aW9uOgpodHRw
czovL2RvY3MubWljcm9weXRob24ub3JnL2VuL2xhdGVzdC9yZWZlcmVuY2UvbWFuaWZlc3QuaHRt
bAoKU2lnbmVkLW9mZi1ieTogQWJpbGlvIE1hcnF1ZXMgPGFiaWxpb2pyQGdtYWlsLmNvbT4KLS0t
CiBwYWNrYWdlL21pY3JvcHl0aG9uL0NvbmZpZy5pbiAgICAgIHwgOCArKysrKysrKwogcGFja2Fn
ZS9taWNyb3B5dGhvbi9taWNyb3B5dGhvbi5tayB8IDUgKysrKysKIDIgZmlsZXMgY2hhbmdlZCwg
MTMgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL3BhY2thZ2UvbWljcm9weXRob24vQ29uZmln
LmluIGIvcGFja2FnZS9taWNyb3B5dGhvbi9Db25maWcuaW4KaW5kZXggMjZhMDBiYWFiMC4uNTI3
MTdkODE1YSAxMDA2NDQKLS0tIGEvcGFja2FnZS9taWNyb3B5dGhvbi9Db25maWcuaW4KKysrIGIv
cGFja2FnZS9taWNyb3B5dGhvbi9Db25maWcuaW4KQEAgLTE3LDYgKzE3LDE0IEBAIGNvbmZpZyBC
UjJfUEFDS0FHRV9NSUNST1BZVEhPTl9MSUIKIAloZWxwCiAJICBDb3JlIFB5dGhvbiBsaWJyYXJp
ZXMgcG9ydGVkIHRvIE1pY3JvUHl0aG9uLgogCitjb25maWcgQlIyX1BBQ0tBR0VfTUlDUk9QWVRI
T05fTUFOSUZFU1QKKwlzdHJpbmcgIlBhdGggdG8gYSBtYW5pZmVzdC5weSBmaWxlIgorCWhlbHAK
KwkgIE1pY3JvUHl0aG9uIGFsbG93cyBQeXRob24gY29kZSB0byBiZSDigJxmcm96ZW7igJ0gYXMg
Ynl0ZWNvZGUKKwkgIGludG8gaXRzIGJpbmFyeSwgYXMgYW4gYWx0ZXJuYXRpdmUgdG8gbG9hZGlu
ZyBjb2RlIGZyb20KKwkgIHRoZSBmaWxlc3lzdGVtLiBTZWUgTWljcm9QeXRob24ncyBkb2N1bWVu
dGF0aW9uIGZvciBtb3JlCisJICBpbmZvcm1hdGlvbi4KKwogZW5kaWYgIyBCUjJfUEFDS0FHRV9N
SUNST1BZVEhPTgogCiBjb21tZW50ICJtaWNyb3B5dGhvbiBuZWVkcyBhIHRvb2xjaGFpbiB3LyB0
aHJlYWRzLCBkeW5hbWljIGxpYnJhcnkiCmRpZmYgLS1naXQgYS9wYWNrYWdlL21pY3JvcHl0aG9u
L21pY3JvcHl0aG9uLm1rIGIvcGFja2FnZS9taWNyb3B5dGhvbi9taWNyb3B5dGhvbi5tawppbmRl
eCAxMjVhMGVkY2ZiLi41YTJjMTM2NTQ3IDEwMDY0NAotLS0gYS9wYWNrYWdlL21pY3JvcHl0aG9u
L21pY3JvcHl0aG9uLm1rCisrKyBiL3BhY2thZ2UvbWljcm9weXRob24vbWljcm9weXRob24ubWsK
QEAgLTQzLDYgKzQzLDExIEBAIGVsc2UKIE1JQ1JPUFlUSE9OX01BS0VfT1BUUyArPSBNSUNST1BZ
X1BZX0ZGST0wCiBlbmRpZgogCitpZm5lcSAoJChCUjJfUEFDS0FHRV9NSUNST1BZVEhPTl9NQU5J
RkVTVCksIiIpCitNSUNST1BZVEhPTl9NQUtFX09QVFMgKz0gXAorCUZST1pFTl9NQU5JRkVTVD0k
KEJSMl9QQUNLQUdFX01JQ1JPUFlUSE9OX01BTklGRVNUKQorZW5kaWYKKwogZGVmaW5lIE1JQ1JP
UFlUSE9OX0JVSUxEX0NNRFMKIAkkKFRBUkdFVF9NQUtFX0VOVikgJChNQUtFKSAtQyAkKEBEKS9t
cHktY3Jvc3MKIAkkKFRBUkdFVF9NQUtFX0VOVikgJChNQUtFKSAtQyAkKEBEKS9wb3J0cy91bml4
IFwKLS0gCjIuNDMuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRw
czovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
