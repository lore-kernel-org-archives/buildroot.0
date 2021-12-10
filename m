Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED763C433F5
	for <buildroot@archiver.kernel.org>; Fri, 10 Dec 2021 14:13:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 929DB42073;
	Fri, 10 Dec 2021 14:13:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CmXxfijjdCrX; Fri, 10 Dec 2021 14:13:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7A3E94203C;
	Fri, 10 Dec 2021 14:13:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A6C791BF4DB
 for <buildroot@lists.busybox.net>; Fri, 10 Dec 2021 14:12:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 962CF425C2
 for <buildroot@lists.busybox.net>; Fri, 10 Dec 2021 14:12:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id g9e4nSh8BvZ6 for <buildroot@lists.busybox.net>;
 Fri, 10 Dec 2021 14:12:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 893204241B
 for <buildroot@buildroot.org>; Fri, 10 Dec 2021 14:12:24 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id i5so15165395wrb.2
 for <buildroot@buildroot.org>; Fri, 10 Dec 2021 06:12:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=unikie-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kZHEgr36Kn4JnxaAY775ITZQ4CoqxUu8bru7IPBRlt0=;
 b=NDjZTRmuuYmQ6CuYoCkc791I1LXjvumY+A0Km5VRqu2pHTmjXy66UrA+Lo7G3wTvky
 wis3EYnBoWfQGsiQzPSvQuWpH2PVXds8Z5PAiEaJcykOPjd+R6DwCihaGhHjrngDzpUH
 eRRhXkwjjcYXExW0YQ2Uuc9IUKtZ1vd1qXleJ0pU0xXlbSd9AeghKpeENcqJ8W4WWjKl
 Erei+W4XPg7zc/xcANlvaiOrMuf5CKi3JfNoLNJdU6ks5Too5iE7c8q5z8i/GktRvysJ
 Lp5e6INrPymuCb12V+f0cduQbJMhywBfpgVuP4nrwlSodkfnwB20mW88aZn0XGqRAvSk
 yU2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kZHEgr36Kn4JnxaAY775ITZQ4CoqxUu8bru7IPBRlt0=;
 b=vRoM3/3urLMpnWNtqhybFH44xXUDOQTHjCofT1RrW5n0U8FSZstTpdP4NEShhlUBMh
 yQjsxp8GDNMQvqzqaviMync0qE0P1d5oUdZ1u227if5duXqdUveMS0RRKQmghfP06soO
 gXNtz9N0U9krRdpM5KC0hfjTrHrc+UkxgLluF3mjlcOzHgaTlhXhczdbVjBGsf/MLQee
 ynuwHPhk5+X0go/qBFO+rZoGzeUmaCIierrdiQXwsZx/5wLoWpDPbk8Jf2vJaJaW1h3I
 pzo1DMCq5DFAF5x+p3FTZs/HoSz1kN2OjgEAxYQukizu9Im9l3dw/2j3i6LjbEmVQhtC
 KILQ==
X-Gm-Message-State: AOAM530rnA3JlDB1IrPVNIKhDALAp7+vEdg0atBHVS6GxOxmmzt+SJAj
 dxSYsZ32cJrLlqOibUmofl2hJ5QOAoFbPSwKuj+Exw==
X-Google-Smtp-Source: ABdhPJyguZ+OzIJ6fvVG427d0058vTz7NXAhBTQPeMkuGozwIvPUp6akf373GMb7o0dG1xdpr26wAQ==
X-Received: by 2002:adf:f88f:: with SMTP id u15mr14545265wrp.18.1639145542470; 
 Fri, 10 Dec 2021 06:12:22 -0800 (PST)
Received: from woodpecker.madriguera.foxhound.fi
 (88-113-104-240.elisa-laajakaista.fi. [88.113.104.240])
 by smtp.gmail.com with ESMTPSA id r11sm2623459wrw.5.2021.12.10.06.12.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Dec 2021 06:12:22 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Pekkarinen?= <jose.pekkarinen@unikie.com>
To: buildroot@buildroot.org
Date: Fri, 10 Dec 2021 16:12:08 +0200
Message-Id: <20211210141209.1812043-6-jose.pekkarinen@unikie.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211210141209.1812043-1-jose.pekkarinen@unikie.com>
References: <20211210141209.1812043-1-jose.pekkarinen@unikie.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 6/7] package/avocado: new package
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

VGhpcyBwYXRjaCBhZGRzIGEgYmFzaWMgcGFja2FnZSBmb3IKYXZvY2FkbyBmcmFtZXdvcmsuCgpT
aWduZWQtb2ZmLWJ5OiBKb3PDqSBQZWtrYXJpbmVuIDxqb3NlLnBla2thcmluZW5AdW5pa2llLmNv
bT4KLS0tCiBERVZFTE9QRVJTICAgICAgICAgICAgICAgICAgIHwgIDEgKwogcGFja2FnZS9Db25m
aWcuaW4gICAgICAgICAgICB8ICAxICsKIHBhY2thZ2UvYXZvY2Fkby9Db25maWcuaW4gICAgfCAx
MyArKysrKysrKysrKysrCiBwYWNrYWdlL2F2b2NhZG8vYXZvY2Fkby5oYXNoIHwgIDQgKysrKwog
cGFja2FnZS9hdm9jYWRvL2F2b2NhZG8ubWsgICB8IDE0ICsrKysrKysrKysrKysrCiA1IGZpbGVz
IGNoYW5nZWQsIDMzIGluc2VydGlvbnMoKykKIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL2F2
b2NhZG8vQ29uZmlnLmluCiBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9hdm9jYWRvL2F2b2Nh
ZG8uaGFzaAogY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvYXZvY2Fkby9hdm9jYWRvLm1rCgpk
aWZmIC0tZ2l0IGEvREVWRUxPUEVSUyBiL0RFVkVMT1BFUlMKaW5kZXggYjgwOTc1NTZmOC4uM2Zm
NmFiYjJhZiAxMDA2NDQKLS0tIGEvREVWRUxPUEVSUworKysgYi9ERVZFTE9QRVJTCkBAIC0xNDY2
LDYgKzE0NjYsNyBAQCBGOglzdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0X3pmcy5w
eQogTjoJSm9zw6kgUGVra2FyaW5lbiA8am9zZS5wZWtrYXJpbmVuQHVuaWtpZS5jb20+CiBGOglw
YWNrYWdlL2FleHBlY3QvCiBGOglwYWNrYWdlL2FsZnJlZC8KK0Y6CXBhY2thZ2UvYXZvY2Fkby8K
IEY6CXBhY2thZ2UvYm14Ny8KIEY6CXBhY2thZ2UvbWluaWphaWwvCiBGOglwYWNrYWdlL29wZW5z
Yy8KZGlmZiAtLWdpdCBhL3BhY2thZ2UvQ29uZmlnLmluIGIvcGFja2FnZS9Db25maWcuaW4KaW5k
ZXggNTM5NWQ4ZGQ0OS4uYzVkMjcwYTdmZCAxMDA2NDQKLS0tIGEvcGFja2FnZS9Db25maWcuaW4K
KysrIGIvcGFja2FnZS9Db25maWcuaW4KQEAgLTE1NSw2ICsxNTUsNyBAQCBlbmRtZW51CiAKIG1l
bnUgIkRldmVsb3BtZW50IHRvb2xzIgogCXNvdXJjZSAicGFja2FnZS9hZXhwZWN0L0NvbmZpZy5p
biIKKwlzb3VyY2UgInBhY2thZ2UvYXZvY2Fkby9Db25maWcuaW4iCiAJc291cmNlICJwYWNrYWdl
L2JhdHMtY29yZS9Db25maWcuaW4iCiAJc291cmNlICJwYWNrYWdlL2JpbnV0aWxzL0NvbmZpZy5p
biIKIAlzb3VyY2UgInBhY2thZ2UvYml0d2lzZS9Db25maWcuaW4iCmRpZmYgLS1naXQgYS9wYWNr
YWdlL2F2b2NhZG8vQ29uZmlnLmluIGIvcGFja2FnZS9hdm9jYWRvL0NvbmZpZy5pbgpuZXcgZmls
ZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwLi40MDJhNjM5OTY5Ci0tLSAvZGV2L251bGwK
KysrIGIvcGFja2FnZS9hdm9jYWRvL0NvbmZpZy5pbgpAQCAtMCwwICsxLDEzIEBACitjb25maWcg
QlIyX1BBQ0tBR0VfQVZPQ0FETworCWJvb2wgImF2b2NhZG8iCisJZGVwZW5kcyBvbiAhQlIyX1NU
QVRJQ19MSUJTICMgZGxvcGVuKCkKKwlzZWxlY3QgQlIyX1BBQ0tBR0VfTElCRkZJCisJc2VsZWN0
IEJSMl9QQUNLQUdFX1BZVEhPTjMKKwloZWxwCisJICBBdm9jYWRvIGlzIGFuIGF1dG9tYXRlZCB0
ZXN0aW5nIHN1aXRlIGNvbnRhaW5pbmcKKwkgIHRlc3RzIGZvciB2YXJpb3VzIHN1YnN5c3RlbXMu
CisKKwkgIGh0dHBzOi8vYXZvY2Fkby1mcmFtZXdvcmsucmVhZHRoZWRvY3MuaW8vCisKK2NvbW1l
bnQgImF2b2NhZG8gbmVlZHMgYSB0b29sY2hhaW4gd2l0aCBkeW5hbWljIGxpYnJhcnkgc3VwcG9y
dCIKKwlkZXBlbmRzIG9uIEJSMl9TVEFUSUNfTElCUwpkaWZmIC0tZ2l0IGEvcGFja2FnZS9hdm9j
YWRvL2F2b2NhZG8uaGFzaCBiL3BhY2thZ2UvYXZvY2Fkby9hdm9jYWRvLmhhc2gKbmV3IGZpbGUg
bW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMC4uMjU3ZWU1ZDVhZQotLS0gL2Rldi9udWxsCisr
KyBiL3BhY2thZ2UvYXZvY2Fkby9hdm9jYWRvLmhhc2gKQEAgLTAsMCArMSw0IEBACisjIEZyb20g
aHR0cHM6Ly9naXRodWIuY29tL2F2b2NhZG8tZnJhbWV3b3JrL2F2b2NhZG8vYXJjaGl2ZS9yZWZz
L3RhZ3MKK3NoYTI1NiAgYjdhMzU1NTJjZDBmMGQ4ZTRiM2FhNGJiNzAwOWNlOWU0NzRhNDBjMWNk
MTExNjk4ZWQwM2RhOTBkNzFhMmY0YiAgOTMuMC50YXIuZ3oKKyMgTG9jYWxseSBjb21wdXRlZAor
c2hhMjU2ICA2ODBjZTU2ZTljNDA0MzgyNmYwZjE0MjA5MzVkMjQ1M2VhM2RkYWNkMTU4MmNiNmYx
Y2VmMjZjMTA3N2ZjYzkzICBMSUNFTlNFCmRpZmYgLS1naXQgYS9wYWNrYWdlL2F2b2NhZG8vYXZv
Y2Fkby5tayBiL3BhY2thZ2UvYXZvY2Fkby9hdm9jYWRvLm1rCm5ldyBmaWxlIG1vZGUgMTAwNjQ0
CmluZGV4IDAwMDAwMDAwMDAuLjg0NzRmYTQ4YzgKLS0tIC9kZXYvbnVsbAorKysgYi9wYWNrYWdl
L2F2b2NhZG8vYXZvY2Fkby5tawpAQCAtMCwwICsxLDE0IEBACisjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIworIworIyBhdm9jYWRvLWZyYW1ld29yaworIworIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMK
KworQVZPQ0FET19WRVJTSU9OID0gOTMuMAorQVZPQ0FET19TT1VSQ0UgPSAkKEFWT0NBRE9fVkVS
U0lPTikudGFyLmd6CitBVk9DQURPX1NJVEUgPSBodHRwczovL2dpdGh1Yi5jb20vYXZvY2Fkby1m
cmFtZXdvcmsvYXZvY2Fkby9hcmNoaXZlL3JlZnMvdGFncworQVZPQ0FET19TRVRVUF9UWVBFID0g
c2V0dXB0b29scworQVZPQ0FET19MSUNFTlNFID0gQXBhY2hlLTIuMAorQVZPQ0FET19MSUNFTlNF
X0ZJTEVTID0gTElDRU5TRQorCiskKGV2YWwgJChweXRob24tcGFja2FnZSkpCi0tIAoyLjMwLjIK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9v
dCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWls
ZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
