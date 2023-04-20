Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72E47C77B73
	for <buildroot@archiver.kernel.org>; Thu, 20 Apr 2023 14:45:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C392960FE7;
	Thu, 20 Apr 2023 14:45:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C392960FE7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id L3MCrbNfKj2H; Thu, 20 Apr 2023 14:45:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E82C160BC0;
	Thu, 20 Apr 2023 14:45:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E82C160BC0
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E4BE21BF836
 for <buildroot@lists.busybox.net>; Thu, 20 Apr 2023 14:45:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CA23A60BC0
 for <buildroot@lists.busybox.net>; Thu, 20 Apr 2023 14:45:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CA23A60BC0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UnCr2Fpbdrbi for <buildroot@lists.busybox.net>;
 Thu, 20 Apr 2023 14:45:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2B8EC60B57
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2B8EC60B57
 for <buildroot@buildroot.org>; Thu, 20 Apr 2023 14:45:50 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-2f917585b26so648175f8f.0
 for <buildroot@buildroot.org>; Thu, 20 Apr 2023 07:45:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682001949; x=1684593949;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ECQTFLDE6Okce0r60niN/mN+q8v9/bn4J9y3GvI+dsw=;
 b=k4uUQFJXrrjgCMyMNVuix1/d0/VibSBkuKzVvjmL2dUMr0YMP1n4t6VqaQF18+TfVd
 mcYGY+fl0eVaVpeLoqL7jQR7s8H2KWTWr1sVxxHMi8QIYawY1hckQbU3CsYlhW8fx4TA
 l/x+uQfucxP54gvVRmKmIyTJVnSe47rPpUE9NB21WmGjOS6p2znnCsVuXI+2IvEbEoe6
 xq87NmVldk/ger3ticHqkBWM3s1NYOvycd7bp4nGEziFn7BSQOz73OqbTNHS4CR+PUnG
 i6nwg5cC8fSjBaoVb0aLb6z+qJkZGznqqRa3DyOYBMzl1R0bPE+YclOI2N5YEMg8h+rt
 jQvQ==
X-Gm-Message-State: AAQBX9cR/lRJB3fcKOuLx2E3VTUzH7xkJISbPwFg43M6tEZa+WDUiABR
 Pj4FxrtQlo3M9l/AgvWm6oUu7LOtLf7Cqd8Ns9ohhSaQ
X-Google-Smtp-Source: AKy350ZUMmq/McjRFdN/H9z0jXFA6VABsiW3O0e7cjqos4JQm5bEJNxstT5CrnQ12uY88JpWDkNR0w==
X-Received: by 2002:a5d:4fcd:0:b0:2d7:d4b:b33 with SMTP id
 h13-20020a5d4fcd000000b002d70d4b0b33mr1529150wrw.21.1682001948948; 
 Thu, 20 Apr 2023 07:45:48 -0700 (PDT)
Received: from junian.fritz.box (94.105.100.233.dyn.edpnet.net.
 [94.105.100.233]) by smtp.gmail.com with ESMTPSA id
 g13-20020adfe40d000000b002f8d402b191sm2105135wrm.112.2023.04.20.07.45.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Apr 2023 07:45:48 -0700 (PDT)
From: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
To: buildroot@buildroot.org
Date: Thu, 20 Apr 2023 16:45:35 +0200
Message-Id: <20230420144537.2660650-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1682001949; x=1684593949;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ECQTFLDE6Okce0r60niN/mN+q8v9/bn4J9y3GvI+dsw=;
 b=MQCRrf+oMu9wjbBmZ0J80SfV8tByjlVyUB9jKH+SO19uh0nY4uSjvKvheA7ktZh2Cv
 h0jjOCC10BMnG8/rVM2liJ+RoaIa2r78CgcRw+iV7lcZgYJfsLe8wOJ1SbLg1fhyUEbp
 n+VEdYfbNbdOdA75faOg+KKJ5SlhI2LvkoH7PZtRWYumBR+ZghQK4tXP5FEGig7Qjp3C
 rw3KMDWgo+Qyri9xuDC4L5GiFE4jgw268VHr1rITR/tnlMvweZkFz1jBBzECcoe04qiP
 rzgRd5v9zmQraxK3BxtD46QY6R5ZmXyPadNySyFssu3HuOFL//TMpfMJayJ3KbKtraG5
 Mcbw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=MQCRrf+o
Subject: [Buildroot] [PATCH 1/1] package/python-pymupdf: add missing host
 swig dependency
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
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SXQgYXBwZWFycyB0aGF0IHB5dGhvbi1weW11cGRmIG5lZWRzIHN3aWcgd2hlbiBidWlsZGluZyBz
aW5jZSBtdXBkZgp3YXMgYnVtcGVkIHRvIDEuMTguMCBpbiBjb21taXQKZjAwZGE3MTRhMjBhNzgy
NmRkYTY3ZDY2ZjJhNmI2ZWY4NThlZjNlMy4gVGhpcyB3YXMgbm90IG5vdGljZWQgYmVmb3JlCmJl
Y2F1c2Ugd2hlbiBidWlsZGluZyBvbiBhIG1hY2hpbmUgd2hlcmUgc3dpZyBpcyBhbHJlYWR5IGF2
YWlsYWJsZQpvdXRzaWRlIGJ1aWxkcm9vdCwgaXQgaXMgdXNlZCBhbmQgdGhlIGJ1aWxkIHN1Y2Nl
ZWRzLgoKVGhpcyBmaXhlcyB0aGUgZm9sbG93aW5nIGJ1aWxkIGZhaWx1cmU6Cgpzd2lnZ2luZyBm
aXR6L2ZpdHouaSB0byBmaXR6L2ZpdHpfd3JhcC5jCnN3aWcgLXB5dGhvbiAtdzUwOSAtbyBmaXR6
L2ZpdHpfd3JhcC5jIGZpdHovZml0ei5pCmVycm9yOiBjb21tYW5kICdzd2lnJyBmYWlsZWQ6IE5v
IHN1Y2ggZmlsZSBvciBkaXJlY3RvcnkKbWFrZTogKioqIFtwYWNrYWdlL3BrZy1nZW5lcmljLm1r
OjI5MzoKL2hvbWUvYnVpbGRyb290L2F1dG9idWlsZC9pbnN0YW5jZS0yL291dHB1dC0xL2J1aWxk
L3B5dGhvbi1weW11cGRmLTEuMjEuMS8uc3RhbXBfYnVpbHRdCkVycm9yIDEKCkZpeGVzOgotIGh0
dHA6Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm5ldC9yZXN1bHRzL2M2ODlhMzg1ZDk4NGI4N2I2M2Yz
ZjJmZjMwMzM4MDQ5Nzc0YjFiZjIKLSBodHRwOi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5uZXQvcmVz
dWx0cy9jZjI2OGQzNjMxMzMwYTgyODhmYjhhZDJhZjAwOWFiYjdmMWNhNmIwCgpTaWduZWQtb2Zm
LWJ5OiBSYXBoYcOrbCBNw6lsb3R0ZSA8cmFwaGFlbC5tZWxvdHRlQG1pbmQuYmU+Ci0tLQogcGFj
a2FnZS9weXRob24tcHltdXBkZi9Db25maWcuaW4gICAgICAgICB8IDEgKwogcGFja2FnZS9weXRo
b24tcHltdXBkZi9weXRob24tcHltdXBkZi5tayB8IDIgKy0KIDIgZmlsZXMgY2hhbmdlZCwgMiBp
bnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9weXRob24t
cHltdXBkZi9Db25maWcuaW4gYi9wYWNrYWdlL3B5dGhvbi1weW11cGRmL0NvbmZpZy5pbgppbmRl
eCBiM2Y5NTY1MjM4Li5lY2FhNTQ5NmI1IDEwMDY0NAotLS0gYS9wYWNrYWdlL3B5dGhvbi1weW11
cGRmL0NvbmZpZy5pbgorKysgYi9wYWNrYWdlL3B5dGhvbi1weW11cGRmL0NvbmZpZy5pbgpAQCAt
NCw2ICs0LDcgQEAgY29uZmlnIEJSMl9QQUNLQUdFX1BZVEhPTl9QWU1VUERGCiAJZGVwZW5kcyBv
biBCUjJfVE9PTENIQUlOX0hBU19TWU5DXzQgIyBtdXBkZiAtPiBoYXJmYnV6egogCWRlcGVuZHMg
b24gQlIyX1RPT0xDSEFJTl9HQ0NfQVRfTEVBU1RfNF85ICMgbXVwZGYgLT4gaGFyZmJ1enoKIAlk
ZXBlbmRzIG9uIEJSMl9QQUNLQUdFX1hPUkc3CisJc2VsZWN0IEJSMl9QQUNLQUdFX0hPU1RfU1dJ
RwogCXNlbGVjdCBCUjJfUEFDS0FHRV9GUkVFVFlQRQogCXNlbGVjdCBCUjJfUEFDS0FHRV9NVVBE
RgogCXNlbGVjdCBCUjJfUEFDS0FHRV9aTElCCmRpZmYgLS1naXQgYS9wYWNrYWdlL3B5dGhvbi1w
eW11cGRmL3B5dGhvbi1weW11cGRmLm1rIGIvcGFja2FnZS9weXRob24tcHltdXBkZi9weXRob24t
cHltdXBkZi5tawppbmRleCA3MDQ0OGU4ZDkwLi4wM2ZjOGJjNGZiIDEwMDY0NAotLS0gYS9wYWNr
YWdlL3B5dGhvbi1weW11cGRmL3B5dGhvbi1weW11cGRmLm1rCisrKyBiL3BhY2thZ2UvcHl0aG9u
LXB5bXVwZGYvcHl0aG9uLXB5bXVwZGYubWsKQEAgLTEyLDcgKzEyLDcgQEAgUFlUSE9OX1BZTVVQ
REZfU0VUVVBfVFlQRSA9IHNldHVwdG9vbHMKIFBZVEhPTl9QWU1VUERGX0xJQ0VOU0UgPSBBR1BM
LTMuMCsKIFBZVEhPTl9QWU1VUERGX0xJQ0VOU0VfRklMRVMgPSBDT1BZSU5HCiAjIE5vIGxpY2Vu
c2UgZmlsZSBpbmNsdWRlZCBpbiBwaXAsIGJ1dCBpdCdzIHByZXNlbnQgb24gZ2l0aHViCi1QWVRI
T05fUFlNVVBERl9ERVBFTkRFTkNJRVMgPSBmcmVldHlwZSBtdXBkZiB6bGliCitQWVRIT05fUFlN
VVBERl9ERVBFTkRFTkNJRVMgPSBmcmVldHlwZSBob3N0LXN3aWcgbXVwZGYgemxpYgogCiBQWVRI
T05fUFlNVVBERl9FTlYgPSBDRkxBR1M9Ii1JJChTVEFHSU5HX0RJUikvdXNyL2luY2x1ZGUvbXVw
ZGYgLUkkKFNUQUdJTkdfRElSKS91c3IvaW5jbHVkZS9mcmVldHlwZTIiCiAKLS0gCjIuMzcuMwoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290
IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxk
cm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
