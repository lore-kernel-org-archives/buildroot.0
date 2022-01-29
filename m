Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCC9EC433EF
	for <buildroot@archiver.kernel.org>; Sat, 29 Jan 2022 11:17:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5774E401A3;
	Sat, 29 Jan 2022 11:17:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id V9qenlagTO4G; Sat, 29 Jan 2022 11:17:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6F11A40170;
	Sat, 29 Jan 2022 11:17:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id F40161BF82C
 for <buildroot@lists.busybox.net>; Sat, 29 Jan 2022 11:17:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F101360AF6
 for <buildroot@lists.busybox.net>; Sat, 29 Jan 2022 11:17:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id chUaJFqvu8EK for <buildroot@lists.busybox.net>;
 Sat, 29 Jan 2022 11:17:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F3FA260AEC
 for <buildroot@buildroot.org>; Sat, 29 Jan 2022 11:17:40 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id e2so15868896wra.2
 for <buildroot@buildroot.org>; Sat, 29 Jan 2022 03:17:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=U/p2utEzg3Fy7XhynzMrjxhuvHF4UYMBn6FL9U8WLTI=;
 b=fW+jgv4gRo6zXSo9VlFmbdGJwMYvnXpWV4lcNIKsGL0kaJPE1YRU1xN/uDuR1fKVBU
 yHFdTMrLB+dksi4vIGTQCnRC9nYfpsrz5JHjI21RMbv/7C7cGX9z/fMHbJkB2RFerdfM
 oFotd0DJ4Qd4JKEJ4rP+VdCfFJLS0KxYlLYwSCzWFsC+lt0FEZopPEoHr2T/uUoZoB/1
 obq89oEVJ817Ayn7+n9WbHqwc79037urJvHdWn+NRx92J3/XgBthIkClA7Swm4FbgVRl
 fKwg6zn7LaSOyXdQOsLnFMg2Ebsi6seQP2tW/Fjuzf2yftZTPqXj2BZ8+BWDZObLd1jn
 6YFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=U/p2utEzg3Fy7XhynzMrjxhuvHF4UYMBn6FL9U8WLTI=;
 b=qKy2PHw5hQRgDdJQSbF3xZ+7Q3DntKsdFWZSNoyI6C33RiXs3JHflrwWe9fTSycjJs
 kQOEczCuZyFpFX3vsQHb7eprbb9IMWX5+A7VhVnzAaaPgxpHX3me3jUkPM/kIOrndENT
 Ebpl01XlI5pLGtrltkgXz89J8QpE/rkQEuXa3vgZfxZoeEK4WQ4vNHv+peBiE1EmSDld
 VS6LLsoHkFHaZFfiAjYlKN7WEv9DZ1AyhJolcCsPvo4H1hcvG7tvDeJCwWsXefAbTewi
 J4eHwZ4+3VPc9is5dfG85LoDW7Brt3VbrwX8pHKPzf02cIMkfw4p71XY9Wiu6j9wEwwj
 bEBQ==
X-Gm-Message-State: AOAM53119PYG041CJJrzzWsk3NORXoXPWCeEy4hYHOYzpKvLtNFmfICl
 nVJFNCsvXPqZHoPxVvbVFzpQLz2zqMA=
X-Google-Smtp-Source: ABdhPJxHXdc+Z7U5PC70ZVNVwZqxQnClF+c8bJAas2Be9x7w+R7s/IjkrB5l6A4SAIHVh9MRRRqYVw==
X-Received: by 2002:adf:d1ef:: with SMTP id g15mr10323642wrd.418.1643455058765; 
 Sat, 29 Jan 2022 03:17:38 -0800 (PST)
Received: from Clement-Blade14.home
 (2a01cb0003ba9b005c3703e14046740e.ipv6.abo.wanadoo.fr.
 [2a01:cb00:3ba:9b00:5c37:3e1:4046:740e])
 by smtp.gmail.com with ESMTPSA id 1sm8204742wry.52.2022.01.29.03.17.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 Jan 2022 03:17:38 -0800 (PST)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 29 Jan 2022 12:17:31 +0100
Message-Id: <20220129111731.736265-2-peron.clem@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220129111731.736265-1-peron.clem@gmail.com>
References: <20220129111731.736265-1-peron.clem@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 2/2] configs/beelink_gs1: bump to linux 5.15,
 atf 2.5 and u-boot 2021.10
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
Cc: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VS1ib290IGxpYmZkdCBmYWlscyB0byBjb21waWxlIG9uIENJLgovdXNyL2Jpbi9sZDogc2NyaXB0
cy9kdGMvZHRjLXBhcnNlci50YWIubzooLmJzcysweDEwKTogbXVsdGlwbGUgZGVmaW5pdGlvbiBv
ZiBgeXlsbG9jJzsgc2NyaXB0cy9kdGMvZHRjLWxleGVyLmxleC5vOiguYnNzKzB4MCk6IGZpcnN0
IGRlZmluZWQgaGVyZQpjb2xsZWN0MjogZXJyb3I6IGxkIHJldHVybmVkIDEgZXhpdCBzdGF0dXMK
Cmh0dHBzOi8vZ2l0bGFiLmNvbS9idWlsZHJvb3Qub3JnL2J1aWxkcm9vdC8tL2pvYnMvMjAyMTQ3
ODIwOAoKQXMgdGhpcyBmaXggaGFzIGJlZW4gYWxyZWFkeSB1cHN0cmVhbWVkIGp1c3QgYnVtcCBV
LWJvb3QgcGFja2FnZS4KCkxldCdzIGFsc28gYnVtcCBLZXJuZWwgYW5kIEFURiBhcyB0aGUgYm9h
cmQgaXMgcHJvcGVybHkgc3VwcG9ydGVkIHVwc3RyZWFtLgoKU2lnbmVkLW9mZi1ieTogQ2zDqW1l
bnQgUMOpcm9uIDxwZXJvbi5jbGVtQGdtYWlsLmNvbT4KLS0tCiBjb25maWdzL2JlZWxpbmtfZ3Mx
X2RlZmNvbmZpZyB8IDEwICsrKysrLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMo
KyksIDUgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvY29uZmlncy9iZWVsaW5rX2dzMV9kZWZj
b25maWcgYi9jb25maWdzL2JlZWxpbmtfZ3MxX2RlZmNvbmZpZwppbmRleCAxODcyYWFiZGYwLi5j
YTk1M2RmM2VhIDEwMDY0NAotLS0gYS9jb25maWdzL2JlZWxpbmtfZ3MxX2RlZmNvbmZpZworKysg
Yi9jb25maWdzL2JlZWxpbmtfZ3MxX2RlZmNvbmZpZwpAQCAtMTEsMTEgKzExLDExIEBAIEJSMl9S
T09URlNfUE9TVF9CVUlMRF9TQ1JJUFQ9ImJvYXJkL2JlZWxpbmsvZ3MxL3Bvc3QtYnVpbGQuc2gi
CiBCUjJfUk9PVEZTX1BPU1RfSU1BR0VfU0NSSVBUPSJzdXBwb3J0L3NjcmlwdHMvZ2VuaW1hZ2Uu
c2giCiBCUjJfUk9PVEZTX1BPU1RfU0NSSVBUX0FSR1M9Ii1jIGJvYXJkL2JlZWxpbmsvZ3MxL2dl
bmltYWdlLmNmZyIKIAotIyBLZXJuZWwgTGludXggaGVhZGVycyBzYW1lIGFzIGtlcm5lbCwgYSA1
LjUgc2VyaWVzCi1CUjJfUEFDS0FHRV9IT1NUX0xJTlVYX0hFQURFUlNfQ1VTVE9NXzVfNT15Cisj
IEtlcm5lbCBMaW51eCBoZWFkZXJzIHNhbWUgYXMga2VybmVsLCA1LjE1IHNlcmllcworQlIyX1BB
Q0tBR0VfSE9TVF9MSU5VWF9IRUFERVJTX0NVU1RPTV81XzE1PXkKIEJSMl9MSU5VWF9LRVJORUw9
eQogQlIyX0xJTlVYX0tFUk5FTF9DVVNUT01fVkVSU0lPTj15Ci1CUjJfTElOVVhfS0VSTkVMX0NV
U1RPTV9WRVJTSU9OX1ZBTFVFPSI1LjUuNCIKK0JSMl9MSU5VWF9LRVJORUxfQ1VTVE9NX1ZFUlNJ
T05fVkFMVUU9IjUuMTUiCiBCUjJfTElOVVhfS0VSTkVMX1VTRV9BUkNIX0RFRkFVTFRfQ09ORklH
PXkKIEJSMl9MSU5VWF9LRVJORUxfRFRTX1NVUFBPUlQ9eQogQlIyX0xJTlVYX0tFUk5FTF9JTlRS
RUVfRFRTX05BTUU9ImFsbHdpbm5lci9zdW41MGktaDYtYmVlbGluay1nczEiCkBAIC0yOSwxNCAr
MjksMTQgQEAgQlIyX1RBUkdFVF9ST09URlNfRVhUMl9TSVpFPSIxMjBNIgogIyBGaXJtd2FyZQog
QlIyX1RBUkdFVF9BUk1fVFJVU1RFRF9GSVJNV0FSRT15CiBCUjJfVEFSR0VUX0FSTV9UUlVTVEVE
X0ZJUk1XQVJFX0NVU1RPTV9WRVJTSU9OPXkKLUJSMl9UQVJHRVRfQVJNX1RSVVNURURfRklSTVdB
UkVfQ1VTVE9NX1ZFUlNJT05fVkFMVUU9InYyLjIiCitCUjJfVEFSR0VUX0FSTV9UUlVTVEVEX0ZJ
Uk1XQVJFX0NVU1RPTV9WRVJTSU9OX1ZBTFVFPSJ2Mi41IgogQlIyX1RBUkdFVF9BUk1fVFJVU1RF
RF9GSVJNV0FSRV9QTEFURk9STT0ic3VuNTBpX2g2IgogCiAjIEJvb3Rsb2FkZXIKIEJSMl9UQVJH
RVRfVUJPT1Q9eQogQlIyX1RBUkdFVF9VQk9PVF9CVUlMRF9TWVNURU1fS0NPTkZJRz15CiBCUjJf
VEFSR0VUX1VCT09UX0NVU1RPTV9WRVJTSU9OPXkKLUJSMl9UQVJHRVRfVUJPT1RfQ1VTVE9NX1ZF
UlNJT05fVkFMVUU9IjIwMjAuMDEiCitCUjJfVEFSR0VUX1VCT09UX0NVU1RPTV9WRVJTSU9OX1ZB
TFVFPSIyMDIxLjEwIgogQlIyX1RBUkdFVF9VQk9PVF9CT0FSRF9ERUZDT05GSUc9ImJlZWxpbmtf
Z3MxIgogQlIyX1RBUkdFVF9VQk9PVF9ORUVEU19EVEM9eQogQlIyX1RBUkdFVF9VQk9PVF9ORUVE
U19QWVRIT04zPXkKLS0gCjIuMzIuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290
Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJv
b3QK
