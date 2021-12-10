Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E162C433EF
	for <buildroot@archiver.kernel.org>; Fri, 10 Dec 2021 14:13:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3D49B41CDC;
	Fri, 10 Dec 2021 14:13:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id w3pJ1pMsbQta; Fri, 10 Dec 2021 14:13:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7ABD741C16;
	Fri, 10 Dec 2021 14:13:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2C84E1C1162
 for <buildroot@lists.busybox.net>; Fri, 10 Dec 2021 14:12:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1C40E852F2
 for <buildroot@lists.busybox.net>; Fri, 10 Dec 2021 14:12:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=unikie-com.20210112.gappssmtp.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uDDi3yAZAnez for <buildroot@lists.busybox.net>;
 Fri, 10 Dec 2021 14:12:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2A692852BA
 for <buildroot@buildroot.org>; Fri, 10 Dec 2021 14:12:23 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 r9-20020a7bc089000000b00332f4abf43fso7262848wmh.0
 for <buildroot@buildroot.org>; Fri, 10 Dec 2021 06:12:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=unikie-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6abaQ1HPdZZojPJFAiE8q8Y4wjlr9r7pA0pz+isjr3I=;
 b=B8WHuPJ9jijFq/yoweBTbW4UqjrZDB+/kwDmQsVvjZqVeuFfzVAE99Ib48amrtdP2Y
 j8v6uCLZjxChPq1e8atSX/spubzKDFUzSB0Re+yoJIsBeAEPe0uP9RPCmHEJuMlcysy8
 L3TL354ro2/gifnxlZuV/AV3/KE6WTO4o5c0js/lUfeCsQa6ywLIzd7I97sYkNOGp9Fv
 7JdQfkI1VPjUqRdKTakcqDKz1+RK9d7BdMCPfEXFQqmA7rlYv3nhErcjq0JKzKHU1OFi
 pl6QeV384RGKCV3lHjdwF+OK//v+NdV/PUCNRBDltpdW8CFyTejYrXUj7swOy75xQH2q
 HV/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6abaQ1HPdZZojPJFAiE8q8Y4wjlr9r7pA0pz+isjr3I=;
 b=TIJy+AtGULgbDr76MWxiaVZDSjkzGRMvykSY2ucmw4ORcPe1zViSBjsEPfqDgAHiDa
 C+DTbgL0tW67h470xEp/dLMqT00bvsBeTAdpKPatYVh26gbhaVG5vdk5U1jjmJWEqkpi
 f+c2Tr4k9Vvrt4cw9+W5pxsKwU1pCDjDYAPWbmHFCBCJ7ayVTens6alVfCZS6IJbNMJ/
 f7j5i9wczaUik9srKxNO+Gi7ycf9SNgYJjI+hGpNinGSxfaEv1x+rgXyuwJ97Cyc+T+I
 FzHvBmB17/b0FZ1LTPv6VTHhtXMkOVHE0r8/pcpAiZ6pzKQ9qlFKoGiwMBgJx8PlO0v6
 iExA==
X-Gm-Message-State: AOAM5333pZufU3W27UmF7GeTxvVrXZNFMS37g+p7fH9QB4yW1HaYcwvf
 NomBfjgkuqPGZPmHRz5544HLjB2VONfQZgT7R/SLSQ==
X-Google-Smtp-Source: ABdhPJyLHFhtR72wniJ4dEocMf1VvaC2ZjWAoY1KOxffHkFTkUwYl6Eqe1uz8KLAnhN0Is4UT/xRqA==
X-Received: by 2002:a05:600c:2308:: with SMTP id
 8mr16205473wmo.179.1639145541272; 
 Fri, 10 Dec 2021 06:12:21 -0800 (PST)
Received: from woodpecker.madriguera.foxhound.fi
 (88-113-104-240.elisa-laajakaista.fi. [88.113.104.240])
 by smtp.gmail.com with ESMTPSA id r11sm2623459wrw.5.2021.12.10.06.12.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Dec 2021 06:12:20 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Pekkarinen?= <jose.pekkarinen@unikie.com>
To: buildroot@buildroot.org
Date: Fri, 10 Dec 2021 16:12:07 +0200
Message-Id: <20211210141209.1812043-5-jose.pekkarinen@unikie.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211210141209.1812043-1-jose.pekkarinen@unikie.com>
References: <20211210141209.1812043-1-jose.pekkarinen@unikie.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 5/7] package/aexpect: new package
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
Cc: =?UTF-8?q?Jos=C3=A9=20Pekkarinen?= <jose.pekkarinen@unikie.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QWRkIHBhY2thZ2UgdG8gYXZvY2FkbyBmcmFtZXdvcmsncyBhZXhwZWN0LgoKU2lnbmVkLW9mZi1i
eTogSm9zw6kgUGVra2FyaW5lbiA8am9zZS5wZWtrYXJpbmVuQHVuaWtpZS5jb20+Ci0tLQogREVW
RUxPUEVSUyAgICAgICAgICAgICAgICAgICB8ICAxICsKIHBhY2thZ2UvQ29uZmlnLmluICAgICAg
ICAgICAgfCAgMSArCiBwYWNrYWdlL2FleHBlY3QvQ29uZmlnLmluICAgIHwgMTIgKysrKysrKysr
KysrCiBwYWNrYWdlL2FleHBlY3QvYWV4cGVjdC5oYXNoIHwgIDQgKysrKwogcGFja2FnZS9hZXhw
ZWN0L2FleHBlY3QubWsgICB8IDEzICsrKysrKysrKysrKysKIDUgZmlsZXMgY2hhbmdlZCwgMzEg
aW5zZXJ0aW9ucygrKQogY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvYWV4cGVjdC9Db25maWcu
aW4KIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL2FleHBlY3QvYWV4cGVjdC5oYXNoCiBjcmVh
dGUgbW9kZSAxMDA2NDQgcGFja2FnZS9hZXhwZWN0L2FleHBlY3QubWsKCmRpZmYgLS1naXQgYS9E
RVZFTE9QRVJTIGIvREVWRUxPUEVSUwppbmRleCAwZTRkYjgzNWQzLi5iODA5NzU1NmY4IDEwMDY0
NAotLS0gYS9ERVZFTE9QRVJTCisrKyBiL0RFVkVMT1BFUlMKQEAgLTE0NjQsNiArMTQ2NCw3IEBA
IEY6CXBhY2thZ2UvemZzLwogRjoJc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2UvdGVzdF96
ZnMucHkKIAogTjoJSm9zw6kgUGVra2FyaW5lbiA8am9zZS5wZWtrYXJpbmVuQHVuaWtpZS5jb20+
CitGOglwYWNrYWdlL2FleHBlY3QvCiBGOglwYWNrYWdlL2FsZnJlZC8KIEY6CXBhY2thZ2UvYm14
Ny8KIEY6CXBhY2thZ2UvbWluaWphaWwvCmRpZmYgLS1naXQgYS9wYWNrYWdlL0NvbmZpZy5pbiBi
L3BhY2thZ2UvQ29uZmlnLmluCmluZGV4IGI4NTdlMTg5NzYuLjUzOTVkOGRkNDkgMTAwNjQ0Ci0t
LSBhL3BhY2thZ2UvQ29uZmlnLmluCisrKyBiL3BhY2thZ2UvQ29uZmlnLmluCkBAIC0xNTQsNiAr
MTU0LDcgQEAgbWVudSAiRGVidWdnaW5nLCBwcm9maWxpbmcgYW5kIGJlbmNobWFyayIKIGVuZG1l
bnUKIAogbWVudSAiRGV2ZWxvcG1lbnQgdG9vbHMiCisJc291cmNlICJwYWNrYWdlL2FleHBlY3Qv
Q29uZmlnLmluIgogCXNvdXJjZSAicGFja2FnZS9iYXRzLWNvcmUvQ29uZmlnLmluIgogCXNvdXJj
ZSAicGFja2FnZS9iaW51dGlscy9Db25maWcuaW4iCiAJc291cmNlICJwYWNrYWdlL2JpdHdpc2Uv
Q29uZmlnLmluIgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9hZXhwZWN0L0NvbmZpZy5pbiBiL3BhY2th
Z2UvYWV4cGVjdC9Db25maWcuaW4KbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAw
MC4uZWZhMmJlOGI5MQotLS0gL2Rldi9udWxsCisrKyBiL3BhY2thZ2UvYWV4cGVjdC9Db25maWcu
aW4KQEAgLTAsMCArMSwxMiBAQAorY29uZmlnIEJSMl9QQUNLQUdFX0FFWFBFQ1QKKwlib29sICJh
ZXhwZWN0IgorCWRlcGVuZHMgb24gIUJSMl9TVEFUSUNfTElCUyAjIGRsb3BlbigpCisJc2VsZWN0
IEJSMl9QQUNLQUdFX1BZVEhPTgorCWhlbHAKKwkgIFRoaXMgbW9kdWxlIHByb3ZpZGVzIHNlcnZp
Y2VzIHNpbWlsYXIgdG8KKwkgIHRoZSBwZXhwZWN0IHB5dGhvbiBsaWJyYXJ5LCBzbyB0byBzcGVh
aywKKwkgIHNwYXduIGFuZCBjb250cm9sIGludGVyYWN0aXZlIGFwcGxpY2F0aW9ucywKKwkgIHN1
Y2ggYXMgc3NoLCBzZnRwIGFuZCBvdGhlcnMuCisKK2NvbW1lbnQgImFleHBlY3QgbmVlZHMgYSB0
b29sY2hhaW4gd2l0aCBkeW5hbWljIGxpYnJhcnkgc3VwcG9ydCIKKwlkZXBlbmRzIG9uIEJSMl9T
VEFUSUNfTElCUwpkaWZmIC0tZ2l0IGEvcGFja2FnZS9hZXhwZWN0L2FleHBlY3QuaGFzaCBiL3Bh
Y2thZ2UvYWV4cGVjdC9hZXhwZWN0Lmhhc2gKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAw
MDAwMDAwMC4uNGE0N2RhNDEyMQotLS0gL2Rldi9udWxsCisrKyBiL3BhY2thZ2UvYWV4cGVjdC9h
ZXhwZWN0Lmhhc2gKQEAgLTAsMCArMSw0IEBACisjIEZyb20gaHR0cHM6Ly9maWxlcy5weXRob25o
b3N0ZWQub3JnL3BhY2thZ2VzL2QwL2ZhLzViYTE2Y2ExN2E3MDk4MGM3YzA5ZWExYzhkNzQ4YWFj
ZTFlZTg3NzJkMDMyYzQ4M2FkZDBlMTdkMGNmNgorc2hhMjU2ICA1NGFiYWUzMWU3ZDNiN2FmYmZi
N2EwMTk3NTY5MDdhODFkNDBiZTQ0MjI3ODhiY2NmMjBkMmU4MmFkNmVmOGM4ICBhZXhwZWN0LTEu
Ni4zLnRhci5negorIyBMb2NhbGx5IGNvbXB1dGVkCitzaGEyNTYgIDdiZTI2YWJmMzVlNTMxYTIy
NmRjNzQyZDIzNzlkNDJkMzcyY2I2MWYwMjdhNmUyNjQ3N2MwZTJmMWEwM2JmY2IgIExJQ0VOU0UK
ZGlmZiAtLWdpdCBhL3BhY2thZ2UvYWV4cGVjdC9hZXhwZWN0Lm1rIGIvcGFja2FnZS9hZXhwZWN0
L2FleHBlY3QubWsKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMC4uY2EyMDk3
MzI4YQotLS0gL2Rldi9udWxsCisrKyBiL3BhY2thZ2UvYWV4cGVjdC9hZXhwZWN0Lm1rCkBAIC0w
LDAgKzEsMTMgQEAKKyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCisjCisjIGFleHBlY3QKKyMKKyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjCisKK0FFWFBFQ1RfVkVSU0lPTiA9IDEuNi4zCitBRVhQRUNU
X1NJVEUgPSBodHRwczovL2ZpbGVzLnB5dGhvbmhvc3RlZC5vcmcvcGFja2FnZXMvZDAvZmEvNWJh
MTZjYTE3YTcwOTgwYzdjMDllYTFjOGQ3NDhhYWNlMWVlODc3MmQwMzJjNDgzYWRkMGUxN2QwY2Y2
CitBRVhQRUNUX1NFVFVQX1RZUEUgPSBzZXR1cHRvb2xzCitBRVhQRUNUX0xJQ0VOU0UgPSBHUEwt
Mi4wCitBRVhQRUNUX0xJQ0VOU0VfRklMRVMgPSBMSUNFTlNFCisKKyQoZXZhbCAkKHB5dGhvbi1w
YWNrYWdlKSkKLS0gCjIuMzAuMgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9y
ZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
