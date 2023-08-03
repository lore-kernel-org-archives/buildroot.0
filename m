Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 747D5C04A6A
	for <buildroot@archiver.kernel.org>; Thu,  3 Aug 2023 21:39:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F100040BF5;
	Thu,  3 Aug 2023 21:39:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F100040BF5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rRpSNvncJwVi; Thu,  3 Aug 2023 21:39:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 35CF340BC9;
	Thu,  3 Aug 2023 21:39:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 35CF340BC9
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0FE081BF304
 for <buildroot@lists.busybox.net>; Thu,  3 Aug 2023 21:39:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 531578125B
 for <buildroot@lists.busybox.net>; Thu,  3 Aug 2023 21:38:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 531578125B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bixpl_EqiFon for <buildroot@lists.busybox.net>;
 Thu,  3 Aug 2023 21:38:20 +0000 (UTC)
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 433F580024
 for <buildroot@buildroot.org>; Thu,  3 Aug 2023 21:38:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 433F580024
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-31783d02093so1305578f8f.0
 for <buildroot@buildroot.org>; Thu, 03 Aug 2023 14:38:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691098698; x=1691703498;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gbtuwe3Gze5nQXH9AOBOxSx2Vp9d2YRPXCKBzWlKRkw=;
 b=A6shsHRizyeyhA/8lbWHIsiykbNpF7PYiz1X61tuqlXRxKUC8EdDOe1K0wjOPfCKxf
 zOwMNt4Z+dkg695qgbZq/xLYE5lVYAOh37N8tCIu7T45w0AOAv8jSrn5rp5wWa0FkbRi
 LrPN9AveSe3YZ6Ob9roWT2un+Xcg1KfD2I4U6rxbdyyXDFKKJcs05PGh/f8pZGwh05Sz
 mB/u9FByg5GzDUmpssmtSnw3JSKw79NfwzyFk6XplpiXZHJG3/X3F/rtZ0dNo7R7W9Jq
 311VaoHURY48VBYshmxhI5xIGzj3S7NFSM96LWhqlB7h+Rt1NvX5eIp5brxVyd70TFgS
 VROw==
X-Gm-Message-State: ABy/qLZlL6Xtu0z0rnUDI9mPHrYPKTRykOBLjcPH4ktsp7k7faeyObxh
 jji2F/rGKfoE+SC/SvA26ttZrNUgzDA=
X-Google-Smtp-Source: APBJJlHAA/sJCOdzaDL9vvhKB8eaDHxqZOYvnxw1bB9q0Iym1A/4pfK0ETbMnxSwR3SSbzSEpr9uCQ==
X-Received: by 2002:a5d:4388:0:b0:317:6513:da7e with SMTP id
 i8-20020a5d4388000000b003176513da7emr8509569wrq.36.1691098698101; 
 Thu, 03 Aug 2023 14:38:18 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb05945b7e00eeca726b991c1980.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:eeca:726b:991c:1980])
 by smtp.gmail.com with ESMTPSA id
 y16-20020adff150000000b0031762e89f94sm800022wro.117.2023.08.03.14.38.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Aug 2023 14:38:17 -0700 (PDT)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  3 Aug 2023 23:38:14 +0200
Message-ID: <20230803213814.1282751-1-romain.naour@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691098698; x=1691703498;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=gbtuwe3Gze5nQXH9AOBOxSx2Vp9d2YRPXCKBzWlKRkw=;
 b=LVcsO1XDspF/aG3aBerv9t+m+U6CGT/VvHaM3Y8ossxg6Dw+xIKsJeB3NtDvbSy30A
 QryiTYBWCiO7hbFqsP3nrX/qyoePOzOjQKrIoIEgNTq3KY3jDehJjv+lGRAK3c82gftl
 KApuQ6HHFn+iozmOuPsAMzKmoVy5JQNrhYf3J8xwlquIZe1maMzNmq8KsU0F1ENOMnMJ
 wK9+RDhyngtutvWP83ULSy+5Ub3ap3aJwriWnUGjtavWQ46y04Qbl7rDtkGIn05RLi24
 F5S2XkADLKxk0dAXRTzjZJTp3WFRUg2NwQBRbqsmf1f2Gk8F/zCSxehf/fAaYzfM2G3g
 ciyg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=LVcsO1XD
Subject: [Buildroot] [PATCH] configs/qemu_ppc64*: remove binutils version
 from defconfigs
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
Cc: Romain Naour <romain.naour@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Joel Stanley <joel@jms.id.au>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QnVpbGRyb290IDIwMjIuMDUgdXNlIGJpbnV0aWxzIDIuMzcgYnkgZGVmYXVsdCwgYnV0IHRoZSBi
aW51dGlscwp2ZXJzaW9uIHdhcyBkb3duZ3JhZGVkIHRvIHRoZSBwcmV2aW91cyBiaW51dGlscyB2
ZXJzaW9uIGluIHFlbXVfcHBjNjQqCmRlZmNvbmZpZ3MgZHVlIHRvIGEgYnVnIGluIGJpbnV0aWxz
IDIuMzcgWzFdLgoKTGF0ZXIgd2hlbiBiaW51dGlscyAyLjM2IGhhcyBiZWVuIHJlbW92ZWQgdGhl
IGJpbnV0aWxzIHZlcnNpb24gaGFzCmJlZW4gdXBkYXRlZCB0byAyLjM4IChldmVuIHRob3VnaCBp
dCB3YXMgYWxyZWFkeSB0aGUgZGVmYXVsdCB2ZXJzaW9uCnNlbGVjdGVkIGJ5IEJ1aWxkcm9vdCBh
dCB0aGF0IHRpbWUpIFsyXS4KClNpbmNlIHRoZW4sIHNldmVyYWwgYmludXRpbHMgcmVsZWFzZSBo
YXMgYmVlbiBhZGRlZCBhbmQgdGhlIGJpbnV0aWxzCnZlcnNpb24gMi4zOCBoYXMgYmVlbiByZW1v
dmVkIHJlY2VudGx5IFszXS4KClNpbmNlIHRoZSBpbml0aWFsIGJ1ZyBpcyBnb25lIHdpdGggdGhl
IHJlbW92YWwgb2YgYmludXRpbHMgMi4zNywKd2UgY2FuIHNhZmVseSByZW1vdmUgdGhlIGJpbnV0
aWxzIHZlcnNpb24gZnJvbSBxZW11X3BwYzY0IGRlZmNvbmZpZ3MuCgpbMV0gMWUyZmU4NjBmM2Ey
NjFmYzg3NzU5MWMwNTY4MDhkNmZiMzBlMjVkNApbMl0gZTQ2MWM5YWRjODJhODg5ZGViNmUyNTlj
ZTgxMTE5M2NiOGQwMGYzNgpbM10gMTM5MWM5OWQ2MjdkMjdjNTViZWM5OTA3MmIzYWU0ZDc4YmUw
MmM3NAoKRml4ZXM6Cmh0dHBzOi8vZ2l0bGFiLmNvbS9idWlsZHJvb3Qub3JnL3Rvb2xjaGFpbnMt
YnVpbGRlci8tL2pvYnMvNDc5ODA0NzM3MwoKU2lnbmVkLW9mZi1ieTogUm9tYWluIE5hb3VyIDxy
b21haW4ubmFvdXJAZ21haWwuY29tPgpDYzogQ8OpZHJpYyBMZSBHb2F0ZXIgPGNsZ0BrYW9kLm9y
Zz4KQ2M6IEpvZWwgU3RhbmxleSA8am9lbEBqbXMuaWQuYXU+Ci0tLQogY29uZmlncy9xZW11X3Bw
YzY0X2U1NTAwX2RlZmNvbmZpZyAgICAgIHwgMSAtCiBjb25maWdzL3FlbXVfcHBjNjRfcHNlcmll
c19kZWZjb25maWcgICAgfCAxIC0KIGNvbmZpZ3MvcWVtdV9wcGM2NGxlX3Bvd2VybnY4X2RlZmNv
bmZpZyB8IDEgLQogY29uZmlncy9xZW11X3BwYzY0bGVfcHNlcmllc19kZWZjb25maWcgIHwgMSAt
CiA0IGZpbGVzIGNoYW5nZWQsIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvY29uZmlncy9x
ZW11X3BwYzY0X2U1NTAwX2RlZmNvbmZpZyBiL2NvbmZpZ3MvcWVtdV9wcGM2NF9lNTUwMF9kZWZj
b25maWcKaW5kZXggMGFiN2U4ZTc2Zi4uNjgzOWYyZjBiYSAxMDA2NDQKLS0tIGEvY29uZmlncy9x
ZW11X3BwYzY0X2U1NTAwX2RlZmNvbmZpZworKysgYi9jb25maWdzL3FlbXVfcHBjNjRfZTU1MDBf
ZGVmY29uZmlnCkBAIC0zLDcgKzMsNiBAQCBCUjJfcG93ZXJwYzY0PXkKIEJSMl9wb3dlcnBjX2U1
NTAwPXkKIAogIyBTeXN0ZW0KLUJSMl9CSU5VVElMU19WRVJTSU9OXzJfMzhfWD15CiBCUjJfU1lT
VEVNX0RIQ1A9ImV0aDAiCiBCUjJfVEFSR0VUX0dFTkVSSUNfR0VUVFlfUE9SVD0idHR5UzAiCiAK
ZGlmZiAtLWdpdCBhL2NvbmZpZ3MvcWVtdV9wcGM2NF9wc2VyaWVzX2RlZmNvbmZpZyBiL2NvbmZp
Z3MvcWVtdV9wcGM2NF9wc2VyaWVzX2RlZmNvbmZpZwppbmRleCA5MmZlM2ExMWY2Li44OTZkMjA5
Njc1IDEwMDY0NAotLS0gYS9jb25maWdzL3FlbXVfcHBjNjRfcHNlcmllc19kZWZjb25maWcKKysr
IGIvY29uZmlncy9xZW11X3BwYzY0X3BzZXJpZXNfZGVmY29uZmlnCkBAIC0zLDcgKzMsNiBAQCBC
UjJfcG93ZXJwYzY0PXkKIEJSMl9wb3dlcnBjX3Bvd2VyNz15CiAKICMgU3lzdGVtCi1CUjJfQklO
VVRJTFNfVkVSU0lPTl8yXzM4X1g9eQogQlIyX1NZU1RFTV9ESENQPSJldGgwIgogQlIyX1RBUkdF
VF9HRU5FUklDX0dFVFRZX1BPUlQ9Imh2YzAiCiAKZGlmZiAtLWdpdCBhL2NvbmZpZ3MvcWVtdV9w
cGM2NGxlX3Bvd2VybnY4X2RlZmNvbmZpZyBiL2NvbmZpZ3MvcWVtdV9wcGM2NGxlX3Bvd2VybnY4
X2RlZmNvbmZpZwppbmRleCBjYjA4NmJhMjQ4Li5lMjNmY2Q0Njk1IDEwMDY0NAotLS0gYS9jb25m
aWdzL3FlbXVfcHBjNjRsZV9wb3dlcm52OF9kZWZjb25maWcKKysrIGIvY29uZmlncy9xZW11X3Bw
YzY0bGVfcG93ZXJudjhfZGVmY29uZmlnCkBAIC0zLDcgKzMsNiBAQCBCUjJfcG93ZXJwYzY0bGU9
eQogQlIyX3Bvd2VycGNfcG93ZXI4PXkKIAogIyBTeXN0ZW0KLUJSMl9CSU5VVElMU19WRVJTSU9O
XzJfMzhfWD15CiBCUjJfVEFSR0VUX0dFTkVSSUNfR0VUVFlfUE9SVD0iaHZjMCIKIEJSMl9TWVNU
RU1fREhDUD0iZXRoMCIKIApkaWZmIC0tZ2l0IGEvY29uZmlncy9xZW11X3BwYzY0bGVfcHNlcmll
c19kZWZjb25maWcgYi9jb25maWdzL3FlbXVfcHBjNjRsZV9wc2VyaWVzX2RlZmNvbmZpZwppbmRl
eCAwMDFkNjE0YzNiLi5mYThlMmEwOWQzIDEwMDY0NAotLS0gYS9jb25maWdzL3FlbXVfcHBjNjRs
ZV9wc2VyaWVzX2RlZmNvbmZpZworKysgYi9jb25maWdzL3FlbXVfcHBjNjRsZV9wc2VyaWVzX2Rl
ZmNvbmZpZwpAQCAtMyw3ICszLDYgQEAgQlIyX3Bvd2VycGM2NGxlPXkKIEJSMl9wb3dlcnBjX3Bv
d2VyOD15CiAKICMgU3lzdGVtCi1CUjJfQklOVVRJTFNfVkVSU0lPTl8yXzM4X1g9eQogQlIyX1RB
UkdFVF9HRU5FUklDX0dFVFRZX1BPUlQ9Imh2YzAiCiBCUjJfU1lTVEVNX0RIQ1A9ImV0aDAiCiAK
LS0gCjIuNDEuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczov
L2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
