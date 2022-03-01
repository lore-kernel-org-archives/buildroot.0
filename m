Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71C53C433F5
	for <buildroot@archiver.kernel.org>; Tue,  1 Mar 2022 23:21:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F091241513;
	Tue,  1 Mar 2022 23:21:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id T0t1H4-TPq2t; Tue,  1 Mar 2022 23:21:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1C59B4032C;
	Tue,  1 Mar 2022 23:21:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1742D1BF580
 for <buildroot@lists.busybox.net>; Tue,  1 Mar 2022 23:21:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1241D81854
 for <buildroot@lists.busybox.net>; Tue,  1 Mar 2022 23:21:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id D3xQiHuq7IUH for <buildroot@lists.busybox.net>;
 Tue,  1 Mar 2022 23:21:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0AD8881842
 for <buildroot@buildroot.org>; Tue,  1 Mar 2022 23:21:41 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 r187-20020a1c2bc4000000b003810e6b192aso218252wmr.1
 for <buildroot@buildroot.org>; Tue, 01 Mar 2022 15:21:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XNIx5KaghjzRPT3Xnp/oaR/QJ3TuuAS/YDAsmpY1el0=;
 b=VMS1hfGuMHjG7wMlOvaYsAfaX+Ey2PLqqEV0HXaUPkj3IamirWsbaDJhbY+rQIrCP8
 JDGAXqWEV783jizy+RYsZIkH7CDKyzg+nkLG1buEPK6TFhb1IGmgg3CO8Lgh8qm5f17d
 7gL8GKh0oiifzKuK6Vg4yGa7+/ZaZpBcAB1hUwJK28kRABFELSf+h+kyBxAJoU73OdWM
 nSAc+8GicAci5CGTOf/MvC+z3zqVQmE6xeTQH2IivPbMIU2elFTWjvlRWLFKnShZ0g/s
 lGh38qdc0iGAiG+9+3LHYtesYFqKh7F7GI525awrKvSr2IOypiz1yc635S3pr4fR0Cwe
 HxnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XNIx5KaghjzRPT3Xnp/oaR/QJ3TuuAS/YDAsmpY1el0=;
 b=3tuJwJ2oOZxyWw6bceskFNveVAb6Df0nSZX5bX0Ss1dC8UsM9hUdiAZfRe6tD/FfGp
 OBTgPRANk/3HMkJzBRmMUCXuv6Sh+GaieRrs9gZQcZNruHPN+909R4B5t59HI+VhLaW8
 oy2z39R3va85TblUv3QQTBg1uF5H1wOGi+PBXBVz0PiskcxQaNfXAbgbyePGbBeqWZKI
 yeoNaE9RAcfIpCSc5D8zk9pHuY8tbGJSGKAqiDgntcXuJ++WEPoa0+rsWTAxXH1RKOM7
 cs4ES8WquGJuMJc7Ohwnyp18JmFeM+efc5L+ZvzmFQ7zzZquUSgBVnYGGoN86t8jbsHQ
 xW0g==
X-Gm-Message-State: AOAM532X9/5sjqRAjIZYvKr6kjOtQcWPcMDSUOMTim0AHsUFqZEBNqrD
 hVZ/oyOzeQt9jypSYfBfa2u3Kgt0TWs=
X-Google-Smtp-Source: ABdhPJzQOad+jiW9+HyMjpSmGb5jHHBvJDC+VJOfw75/JICx0Ls0gsTeQ1hSB+gXTvekryynlhZumQ==
X-Received: by 2002:a05:600c:2f8f:b0:381:2009:f5bb with SMTP id
 t15-20020a05600c2f8f00b003812009f5bbmr18829429wmn.163.1646176899877; 
 Tue, 01 Mar 2022 15:21:39 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 az11-20020a05600c600b00b003820f5c48e9sm2848894wmb.38.2022.03.01.15.21.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Mar 2022 15:21:39 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  2 Mar 2022 00:21:11 +0100
Message-Id: <20220301232111.1092975-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH/next 1/1] package/libscrypt: bump to version 1.22
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 =?UTF-8?q?Stefan=20S=C3=B8rensen?= <stefan.sorensen@spectralink.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

LSBEcm9wIHBhdGNoIGFuZCB1c2Uge0MsTER9RkxBR1NfRVhUUkEgd2hpY2ggYXJlIGF2YWlsYWJs
ZSBzaW5jZQogIGh0dHBzOi8vZ2l0aHViLmNvbS90ZWNobmlvbi9saWJzY3J5cHQvY29tbWl0L2Jk
ZmVjMjY3NDQxMjJlOGY1MmE1OGJjMDg2Yzg5YjI3ZmFhZjU4ODgKLSBXaGlsZSBhdCBpdCwgYWxz
byBtb3ZlIFBSRUZJWCB0byBMSUJTQ1JZUFRfTUFLRV9PUFRTIGFzIGFkdm9jYXRlZCBieQogIEFy
bm91dCBpbgogIGh0dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvcHJvamVjdC9idWlsZHJvb3Qv
cGF0Y2gvMjAyMjAyMjExNzI5MDAuMTkzNzg1Ni0xLWZvbnRhaW5lLmZhYnJpY2VAZ21haWwuY29t
LwotIFVwZGF0ZSBpbmRlbnRhdGlvbiBpbiBoYXNoIGZpbGUgKHR3byBzcGFjZXMpCgpodHRwczov
L2dpdGh1Yi5jb20vdGVjaG5pb24vbGlic2NyeXB0L2NvbXBhcmUvdjEuMjEuLi52MS4yMgoKU2ln
bmVkLW9mZi1ieTogRmFicmljZSBGb250YWluZSA8Zm9udGFpbmUuZmFicmljZUBnbWFpbC5jb20+
Ci0tLQogLi4uaW9ucy10by1DRkxBR1MtYW5kLUxERkxBR1MtdmFyaWFibGVzLnBhdGNoIHwgMzQg
LS0tLS0tLS0tLS0tLS0tLS0tLQogcGFja2FnZS9saWJzY3J5cHQvbGlic2NyeXB0Lmhhc2ggICAg
ICAgICAgICAgIHwgIDQgKy0tCiBwYWNrYWdlL2xpYnNjcnlwdC9saWJzY3J5cHQubWsgICAgICAg
ICAgICAgICAgfCAxNCArKysrKy0tLQogMyBmaWxlcyBjaGFuZ2VkLCAxMiBpbnNlcnRpb25zKCsp
LCA0MCBkZWxldGlvbnMoLSkKIGRlbGV0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL2xpYnNjcnlwdC8w
MDAxLUFsbG93LWFkZGluZy1vcHRpb25zLXRvLUNGTEFHUy1hbmQtTERGTEFHUy12YXJpYWJsZXMu
cGF0Y2gKCmRpZmYgLS1naXQgYS9wYWNrYWdlL2xpYnNjcnlwdC8wMDAxLUFsbG93LWFkZGluZy1v
cHRpb25zLXRvLUNGTEFHUy1hbmQtTERGTEFHUy12YXJpYWJsZXMucGF0Y2ggYi9wYWNrYWdlL2xp
YnNjcnlwdC8wMDAxLUFsbG93LWFkZGluZy1vcHRpb25zLXRvLUNGTEFHUy1hbmQtTERGTEFHUy12
YXJpYWJsZXMucGF0Y2gKZGVsZXRlZCBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IGEwMjNhNmZlMWMu
LjAwMDAwMDAwMDAKLS0tIGEvcGFja2FnZS9saWJzY3J5cHQvMDAwMS1BbGxvdy1hZGRpbmctb3B0
aW9ucy10by1DRkxBR1MtYW5kLUxERkxBR1MtdmFyaWFibGVzLnBhdGNoCisrKyAvZGV2L251bGwK
QEAgLTEsMzQgKzAsMCBAQAotRnJvbSAwOTdjNWQ5MjQ4ZjRhZmQzNGM3M2RlNWFiYTAxYTE0M2Vm
Nzg0MjU3IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQotRnJvbTogPT9VVEYtOD9xP1N0ZWZhbj0y
MFM9QzM9QjhyZW5zZW4/PSA8c3RlZmFuLnNvcmVuc2VuQHNwZWN0cmFsaW5rLmNvbT4KLURhdGU6
IFR1ZSwgMTQgTWFyIDIwMTcgMDk6MjM6NTEgKzAxMDAKLVN1YmplY3Q6IFtQQVRDSF0gQWxsb3cg
YWRkaW5nIG9wdGlvbnMgdG8gQ0ZMQUdTIGFuZCBMREZMQUdTIHZhcmlhYmxlcwotTUlNRS1WZXJz
aW9uOiAxLjAKLUNvbnRlbnQtVHlwZTogdGV4dC9wbGFpbjsgY2hhcnNldD1VVEYtOAotQ29udGVu
dC1UcmFuc2Zlci1FbmNvZGluZzogOGJpdAotCi1UaGlzIGFsc28gcmVtb3ZlcyBhIG51bWJlciBv
ZiBoYXJkLWNvZGVkIENGTEFHUywgbGVhdmluZyBpdCB1cCB0byB0aGUKLXVzZXIgdG8gcGFzcyBh
cHByb3ByaWF0ZSBvcHRpbWl6YXRpb24vaGFyZGVuaW5nIGZsYWdzLgotCi1TaWduZWQtb2ZmLWJ5
OiBTdGVmYW4gU8O4cmVuc2VuIDxzdGVmYW4uc29yZW5zZW5Ac3BlY3RyYWxpbmsuY29tPgotLS0t
Ci0gTWFrZWZpbGUgfCA0ICsrLS0KLSAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAy
IGRlbGV0aW9ucygtKQotCi1kaWZmIC0tZ2l0IGEvTWFrZWZpbGUgYi9NYWtlZmlsZQotaW5kZXgg
NzAyMmE0YS4uMzA5OGE5YSAxMDA2NDQKLS0tLSBhL01ha2VmaWxlCi0rKysgYi9NYWtlZmlsZQot
QEAgLTUsOCArNSw4IEBAIE1BS0VfRElSICAgICA/PSBpbnN0YWxsIC1kCi0gSU5TVEFMTF9EQVRB
ID89IGluc3RhbGwKLSAKLSBDQz89Z2NjCi0tQ0ZMQUdTPz0tTzIgLVdhbGwgLWcgLURfRk9SVElG
WV9TT1VSQ0U9MiAtZnN0YWNrLXByb3RlY3RvciAtZlBJQwotLUxERkxBR1M/PS1XbCwteixub3cg
LVdsLC16LHJlbHJvIC1XbCwtc29uYW1lLGxpYnNjcnlwdC5zby4wIC1XbCwtLXZlcnNpb24tc2Ny
aXB0PWxpYnNjcnlwdC52ZXJzaW9uCi0rb3ZlcnJpZGUgQ0ZMQUdTKz0tZlBJQwotK292ZXJyaWRl
IExERkxBR1MrPS1XbCwteixub3cgLVdsLC16LHJlbHJvIC1XbCwtc29uYW1lLGxpYnNjcnlwdC5z
by4wIC1XbCwtLXZlcnNpb24tc2NyaXB0PWxpYnNjcnlwdC52ZXJzaW9uCi0gQ0ZMQUdTX0VYVFJB
Pz0tV2wsLXJwYXRoPS4KLSAKLSBhbGw6IHJlZmVyZW5jZQotLS0gCi0yLjcuNAotCmRpZmYgLS1n
aXQgYS9wYWNrYWdlL2xpYnNjcnlwdC9saWJzY3J5cHQuaGFzaCBiL3BhY2thZ2UvbGlic2NyeXB0
L2xpYnNjcnlwdC5oYXNoCmluZGV4IGZkYTYzZDFjMGQuLmZjZGM0YmJlZWIgMTAwNjQ0Ci0tLSBh
L3BhY2thZ2UvbGlic2NyeXB0L2xpYnNjcnlwdC5oYXNoCisrKyBiL3BhY2thZ2UvbGlic2NyeXB0
L2xpYnNjcnlwdC5oYXNoCkBAIC0xLDMgKzEsMyBAQAogIyBMb2NhbGx5IGNhbGN1bGF0ZWQKLXNo
YTI1Ngk2OGUzNzdlNzk3NDVjMTBkNDg5Yjc1OWI5NzBlNTJkODE5ZGJiODBkZDhjYTYxZjhjOTc1
MTg1ZGYzZjQ1N2QzCWxpYnNjcnlwdC0xLjIxLnRhci5negotc2hhMjU2CWFhY2JmZDllMTllNWIz
OGVhMDk2MTZjZWJmMDc1MWVmMGNjN2I2YTE5ZWEwZmQ3OGY0YjA1OThiMmM1MDMzOTQJTElDRU5T
RQorc2hhMjU2ICBhMmQzMGVhMTZlNmQyODg3NzI3OTFkZTY4YmU1NjE1Mzk2NWZlNGZkNGJjZDc4
Nzc3NzYxOGI4MDQ4NzA4OTM2ICBsaWJzY3J5cHQtMS4yMi50YXIuZ3oKK3NoYTI1NiAgYWFjYmZk
OWUxOWU1YjM4ZWEwOTYxNmNlYmYwNzUxZWYwY2M3YjZhMTllYTBmZDc4ZjRiMDU5OGIyYzUwMzM5
NCAgTElDRU5TRQpkaWZmIC0tZ2l0IGEvcGFja2FnZS9saWJzY3J5cHQvbGlic2NyeXB0Lm1rIGIv
cGFja2FnZS9saWJzY3J5cHQvbGlic2NyeXB0Lm1rCmluZGV4IGZhODllZDMxYmMuLmQyOGJkNGU5
MDAgMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvbGlic2NyeXB0L2xpYnNjcnlwdC5taworKysgYi9wYWNr
YWdlL2xpYnNjcnlwdC9saWJzY3J5cHQubWsKQEAgLTQsMjMgKzQsMjkgQEAKICMKICMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjCiAKLUxJQlNDUllQVF9WRVJTSU9OID0gMS4yMQorTElCU0NSWVBUX1ZF
UlNJT04gPSAxLjIyCiBMSUJTQ1JZUFRfU0lURSA9ICQoY2FsbCBnaXRodWIsdGVjaG5pb24sbGli
c2NyeXB0LHYkKExJQlNDUllQVF9WRVJTSU9OKSkKIExJQlNDUllQVF9MSUNFTlNFID0gQlNELTIt
Q2xhdXNlCiBMSUJTQ1JZUFRfTElDRU5TRV9GSUxFUyA9IExJQ0VOU0UKIExJQlNDUllQVF9JTlNU
QUxMX1NUQUdJTkcgPSBZRVMKIAorTElCU0NSWVBUX01BS0VfT1BUUyA9IFwKKwkkKFRBUkdFVF9D
T05GSUdVUkVfT1BUUykgXAorCUNGTEFHU19FWFRSQT0iJChUQVJHRVRfQ0ZMQUdTKSIgXAorCUxE
RkxBR1NfRVhUUkE9IiQoVEFSR0VUX0xERkxBR1MpIiBcCisJUFJFRklYPS91c3IKKwogZGVmaW5l
IExJQlNDUllQVF9CVUlMRF9DTURTCi0JJChUQVJHRVRfTUFLRV9FTlYpICQoTUFLRSkgLUMgJChA
RCkgJChUQVJHRVRfQ09ORklHVVJFX09QVFMpCisJJChUQVJHRVRfTUFLRV9FTlYpICQoTUFLRSkg
LUMgJChARCkgJChMSUJTQ1JZUFRfTUFLRV9PUFRTKQogZW5kZWYKIAogZGVmaW5lIExJQlNDUllQ
VF9JTlNUQUxMX1NUQUdJTkdfQ01EUwotCSQoVEFSR0VUX01BS0VfRU5WKSAkKE1BS0UpIC1DICQo
QEQpIFBSRUZJWD0vdXNyIFwKKwkkKFRBUkdFVF9NQUtFX0VOVikgJChNQUtFKSAtQyAkKEBEKSAk
KExJQlNDUllQVF9NQUtFX09QVFMpIFwKIAkJREVTVERJUj0kKFNUQUdJTkdfRElSKSBpbnN0YWxs
CiBlbmRlZgogCiBkZWZpbmUgTElCU0NSWVBUX0lOU1RBTExfVEFSR0VUX0NNRFMKLQkkKFRBUkdF
VF9NQUtFX0VOVikgJChNQUtFKSAtQyAkKEBEKSBQUkVGSVg9L3VzciBcCisJJChUQVJHRVRfTUFL
RV9FTlYpICQoTUFLRSkgLUMgJChARCkgJChMSUJTQ1JZUFRfTUFLRV9PUFRTKSBcCiAJCURFU1RE
SVI9JChUQVJHRVRfRElSKSBpbnN0YWxsCiBlbmRlZgogCi0tIAoyLjM0LjEKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxp
c3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21h
aWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
