Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1634C30653
	for <buildroot@archiver.kernel.org>; Mon,  1 Jul 2024 20:45:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5AF3040147;
	Mon,  1 Jul 2024 20:45:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SFnJ113eS4Wq; Mon,  1 Jul 2024 20:45:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1BF3C4019A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1BF3C4019A;
	Mon,  1 Jul 2024 20:45:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2C59D1BF361
 for <buildroot@lists.busybox.net>; Mon,  1 Jul 2024 20:45:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 157DD4019A
 for <buildroot@lists.busybox.net>; Mon,  1 Jul 2024 20:45:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lX3JaKxG3Z6L for <buildroot@lists.busybox.net>;
 Mon,  1 Jul 2024 20:45:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3871D40147
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3871D40147
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3871D40147
 for <buildroot@buildroot.org>; Mon,  1 Jul 2024 20:45:21 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-424ad991c1cso30916805e9.1
 for <buildroot@buildroot.org>; Mon, 01 Jul 2024 13:45:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719866719; x=1720471519;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=G1n9hvL/uN4S6FKjSympH1WHGag7Vkv7oYib1p/uqUk=;
 b=CUEAZhUjVaQIE2gsipf8X4ChLRywD0gY65beVpCdAUj5um+ZtEdGyxngE57+n06Ltq
 YbLszynbRP3fKjEWql+kfmXSglnxwjy5/4k17XTsSuhzJm8KSMtYqX3gKQtU3tqiUo5C
 SxKOGjlXMIWKkO9PTf26aujdCpsrfzJQrsRwO97s32XMiORZ160ka13fWjmrHOGJCdvg
 N08HsQO8/AF3WKMHHaS87m2nYrKIWPDIkEq7wXuZPx9TGqPy/9HIGrMV7Cm/JUZnlagf
 VHvIfoftloLh0YbqlxLRNop7uHqejPvVIUd9solz6E0JsBof/t42BhfBSrSUaNaSnyA9
 7YXA==
X-Gm-Message-State: AOJu0YwDsB4uevr7RM+lmrlNw1Z1SXx4uA6yKP+pbq6DYl9KkZk1GoZg
 hVTtAxbrtNFvR4MAAeJBIq2quppg4Shaf74eBBMjSvJnW4aCFFTO55c8mQ==
X-Google-Smtp-Source: AGHT+IELruRdSnFWsUlNrzS+aULF349EVicpTnsdK7KE+LZTBbdtl46k3kVKKbF9DTXcOo7tTuS0Qg==
X-Received: by 2002:a05:600c:33a8:b0:425:6976:f5d6 with SMTP id
 5b1f17b1804b1-4257a026ed4mr54466925e9.33.1719866718752; 
 Mon, 01 Jul 2024 13:45:18 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4256b098426sm166926375e9.32.2024.07.01.13.45.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Jul 2024 13:45:18 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon,  1 Jul 2024 22:45:18 +0200
Message-ID: <20240701204518.1815241-1-yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719866719; x=1720471519; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=G1n9hvL/uN4S6FKjSympH1WHGag7Vkv7oYib1p/uqUk=;
 b=Hir0Td2WHC7JVVEC2bFey5eIon5lY/2XeTuDUJgxjzuNu3iwj0pGR7VleGd5xc/9FT
 aAQOQqbVNVgbRs1AiYXclL5F85LfwAs1OOzJYDfIgo7YZNxCPftXfjK6S1PY6gAyiwhp
 iXfr2GtS02dF7MfgQnB4M7nblmfyUfQ/uzlfUda2qV0OyNRh/VsiyL8E2Fp89flOu7QR
 OeTfgEjsd2jSAjcCq8wxQfLAbnxemYQm1/D2674qYQoF0IBfoeNL4YkLw/XQgi75TIiK
 P7dRMWOJxCmpnhjeCc3QxVQ/UfzrLEaYphqdtX1YBileW+S4DVRcSf1srUoZcKd/540g
 RTzQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Hir0Td2W
Subject: [Buildroot] [PATCH] gitlab: add default issue template
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhpcyBpbnRyb2R1Y2VzIHRoZSBkZWZhdWx0IGlzc3VlIHRlbXBsYXRlLCB0byBoZWxwIHVzZXJz
IHByb3ZpZGUgaXNzdWVzCnRoYXQgYXJlIG1lYW5pbmdmdWwsIGFuZCB0aGF0IHdpbGwgaGVscCBy
ZXByb2R1Y2UgdGhlIGlzc3VlLgoKSWYgbmVlZGVkLCB3ZSBjYW4gYWRkIG1vciBldGVtcGxhdGVz
IGluIHRoZSBmdXR1cmUuCgpTaWduZWQtb2ZmLWJ5OiBZYW5uIEUuIE1PUklOIDx5YW5uLm1vcmlu
LjE5OThAZnJlZS5mcj4KLS0tCiAuZ2l0bGFiL2lzc3VlX3RlbXBsYXRlcy9kZWZhdWx0Lm1kIHwg
NTQgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgNTQgaW5z
ZXJ0aW9ucygrKQogY3JlYXRlIG1vZGUgMTAwNjQ0IC5naXRsYWIvaXNzdWVfdGVtcGxhdGVzL2Rl
ZmF1bHQubWQKCmRpZmYgLS1naXQgYS8uZ2l0bGFiL2lzc3VlX3RlbXBsYXRlcy9kZWZhdWx0Lm1k
IGIvLmdpdGxhYi9pc3N1ZV90ZW1wbGF0ZXMvZGVmYXVsdC5tZApuZXcgZmlsZSBtb2RlIDEwMDY0
NAppbmRleCAwMDAwMDAwMDAwLi43MDkxNDA0NmJlCi0tLSAvZGV2L251bGwKKysrIGIvLmdpdGxh
Yi9pc3N1ZV90ZW1wbGF0ZXMvZGVmYXVsdC5tZApAQCAtMCwwICsxLDU0IEBACitUaGFuayB5b3Ug
Zm9yIG9wZW5pbmcgYSBuZXcgaXNzdWUuIFRvIGhlbHAgc29sdmUgaXQgZmFzdGUgcmFuZCBtb3Jl
IGVhc2lseSwKK3BsZWFzZSByZXZpZXcgdGhpcyBjaGVjay1saXN0LCBhbmQgZmlsbCBpbiB0aGUg
c2VjdGlvbnMgYmVsb3cuIEFkYXB0IGFzCituZWVkZWQuCisKK0RvIG5vdCBvcGVuIGFuIGlzc3Vl
IHRvIHJlcXVlc3QgYSBuZXcgZmVhdHVyZTsgaW5zdGVhZCwgcG9zdCBhIG1lc3NhZ2UgdG8KK3Ro
ZSBtYWlsaW5nIGxpc3QuCisKK19Ob3RlOiBpc3N1ZXMgbWlzc2luZyBhbnkgaW5mb3JtYXRpb24g
bWF5IGdldCBjbG9zZWQgd2l0aG91dCBmdXJ0aGVyIGFkby5fCisKKy0tLQorIyMjIENoZWNrLWxp
c3QKKworLSBbIF0gSSBkaWQgbm90IGZpbmQgdGhlIGlzc3VlIGluIHRoZSBleGlzdGluZyBpc3N1
ZXMKKy0gWyBdIEkgY2FuIHJlcHJvZHVjZSB0aGUgZXJyb3IgdXNpbmcgdGhlIHByaXN0aW5lIEJ1
aWxkcm9vdCBpbiB0aGlzCisgICAgICByZXBvc2l0b3J5LCBub3QgZnJvbSBhIGNsb25lIHNvbWV3
aGVyZSBlbHNlCistIFsgXSBJIGNhbiByZXByb2R1Y2Ugd2l0aG91dCBhbnkgbG9jYWwgY2hhbmdl
cworLSBbIF0gSSBhdHRhY2hlZCB0aGUgZnVsbCBidWlsZCBsb2cgZmlsZSAoZS5nLiBgbWFrZSAy
PiYxIHx0ZWUgYnVpbGQubG9nYCkKKy0gWyBdIEkgYXR0YWNoZWQgYSAqKm1pbmltYWwqKiBkZWZj
b25maWcgZmlsZSB0aGF0IGNhbiByZXByb2R1Y2UgdGhlCisgICAgICBpc3N1ZSAoYG1ha2UgQlIy
X0RFRkNPTkZJRz0kKHB3ZCkvaXNzdWVfZGVmY29uZmlnIHNhdmVkZWZjb25maWdgKQorLSBbIF0g
SSBhbHNvIGF0dGFjaGVkIHRoZSBjb25maWd1cmFpdG9uIGZvciBrY29uZmlnLWJhc2VkIHBhY2th
Z2VzIHRoYXQKKyAgICAgIGFyZSBlbmFibGVkLCBtb3N0IG5vdGFibHk6CisgICAgLSBbIF0gYnVz
eWJveAorICAgIC0gWyBdIGxpbnV4CisgICAgLSBbIF0gdWNsaWJjCisgICAgLSBbIF0gdWJvb3QK
KyAgICAtIFsgXSDigKYKKworLS0tCisjIyMgV2hhdCBJIGRpZAorCitfSGVyZSwgZGVzY3JpYmUg
d2hhdCB5b3UgZGlkOl8KKy0gX3RoZSB2ZXJzaW9uIG9mIEJ1aWxkcm9vdCB5b3UgYXJlIHVzaW5n
OiBbLi4uXV8KKy0gX3RoZSBkaXN0cmlidXRpb24geW91IGFyZSBydW5uaW5nIG9uOiBbLi4uXV8K
Ky0gX2FueSBzcGVjaWFsIGVudmlyb25tZW50IHZhcmlhYmxlczogQ0MsIENYWCwgVEFSR0VULCBD
Uk9TU19DT01QSUxFLCBldGPigKZfCistIF90aGUgY29tbWFuZHMgeW91IHJhbjpfCisgICAgYGBg
c2gKKyAgICAkIG1ha2UgWy4uLl0KKyAgICBgYGAKKy0gX2FueXRoaW5nIGVsc2UgdGhhdCB5b3Ug
bWlnaHQgdGhpbmsgaXMgaW1wb3J0YW504oCmXworCistLS0KKyMjIyBXaGF0IGhhcHBlbnMKKwor
X0hlcmUsIGRlc2NyaWJlIHdoYXQgaGFwcGVucyB0aGF0IHlvdSBiZWxpZXZlIHdhcyBpbmNvcnJl
Y3QuXworCistLS0KKyMjIyBXaGF0IHdhcyBleHBlY3RlZAorCitfSGVyZSwgZGVzY3JpYmUgdGhl
IGJlaGF2aW91ciB5b3UgZXhwZWN0ZWQuXworCistLS0KKyMjIyBFeHRyYSBpbmZvcm1hdGlvbgor
CitfSGVyZSwgeW91IG1heSB3cml0ZSBhZGRpdGlvbmFsIGluZm9ybWF0aW9uIHRoYXQgZG9lcyBu
b3QgZml0IGFib3ZlXwotLSAKMi40NS4yCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJv
b3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxk
cm9vdAo=
