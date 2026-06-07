Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34BCFCD8C8C
	for <buildroot@archiver.kernel.org>; Sun,  7 Jun 2026 19:00:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5127C80658;
	Sun,  7 Jun 2026 19:00:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p_fADPq6YDa3; Sun,  7 Jun 2026 19:00:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2FC978025B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780858854;
	bh=eBj0yc6avIy1Srq+Iyi/SSkOYR+o62KxMos9nQznxmg=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=Yp2zTZSBaqj0vCjI2VG+Xtjgh7b6e3/I2ZIPvdHoRPndVGupX+L464YiAUVFqg7NS
	 wreJ9j1loD6y+fToJ6aiIe5hovG1w3u+54fgS/Qz5dBFWO5lahFVeJmKOkLQuKH1eF
	 Hfy/QZLjDHhAsv0XAGd5AVON9b3PaYhveiV44qmVEVU0lf4xKtq9Ok3lG8WEGMpBEd
	 sxr1UYC0woVGgSVzp+tJDTGKrIRafIgiWykVrpMKFHCXE/vNwfpTPV2MnJZrOlaHN/
	 +WTM6sqZpcpjmzMuoojPjJR+wGCyW3LkrpAePbr8Lwf7G8FZuZiuAwQPSWWa66K11I
	 JcGWPq0OQYk2w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2FC978025B;
	Sun,  7 Jun 2026 19:00:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id E5673345
 for <buildroot@buildroot.org>; Sun,  7 Jun 2026 19:00:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CC17884A71
 for <buildroot@buildroot.org>; Sun,  7 Jun 2026 19:00:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PUohqB-9Oxkl for <buildroot@buildroot.org>;
 Sun,  7 Jun 2026 19:00:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42b; helo=mail-wr1-x42b.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 939E884A68
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 939E884A68
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 939E884A68
 for <buildroot@buildroot.org>; Sun,  7 Jun 2026 19:00:51 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-45fd45e596cso1661780f8f.1
 for <buildroot@buildroot.org>; Sun, 07 Jun 2026 12:00:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780858849; x=1781463649;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AOWqacGj4iuLT7Ua9qlsO9hA4v/uB02FyLpyY7IzOKQ=;
 b=gBF3L7ANHx7+mDPM1CTld1vG7/Zr39hdMwLdzL9CtCnn1uBujJf+kz/Vhq8c0tvZSU
 2ODiN99xezjQjW0fsGvOQtnPm4f1rrU8ZkN7q5nFrxkP9KImHwH2ik/VlB7c3Tawrlvk
 J/2Tx/TPX1Rqx2TZQ3AImuL//8L58CMQJCMYlCIskG7VipdVjuQNq6fIGDIDZM3MslWr
 MQgnwz2qQgnSwM+dIOsmYFo3Q2lpIvHnoNoNz63Gb0XRHJDGDl4c3ojT4VjH0Gu1475u
 r6fccMTifAZF+G8Xlm7nBy+WH3d6JNFRW2YXt1GYp6MKt8qdo8M87pkL9WIqlVSBRAFM
 0HMw==
X-Gm-Message-State: AOJu0Yw9OKgG189W0frHZQvDcuu4CaOjR5fVvD9oMSZNDZnJdMUj+vK0
 6fJVSiTeQW2RTuHbFiYf67LCzWHsmtmOw2l/yW0DfqHS0Ttp1Cef9AE0LqFnrHY+jr+Ek26zr+x
 2TdG6
X-Gm-Gg: Acq92OEAg7RT2mWMIINdFKLGxsmzoasF/JA0/iVqRum8/+5LjUUXVSJpIGIh2biyxw9
 89sURN27O7gaXNdH4bvJ3ztAdC+sRa+j7bTLtrBMJhmwoo6LpseJquJ94hK9JGQ312tAiFzrKBg
 XyNpMyPpLodCVicKCcZqjOoBTZ/bPj4SXMfN+vFJ+R0H6QnL2IFN4dshJdwGI7kWvEgCHNJUvzD
 S66IA6fPLTTpVDlHysgrMcVgm2zHSzS9sB/tErIWJgJYNcy5G1vQMJsar0nboIvw/VsFqMGzYgq
 OC0+V6nNLJaa+GCwLZWQzqkplrzuE0NnbuSoATc0XhqlrylK9MLVO/Fb3H0G1rnTI4rTPK9slcF
 UGN1IGt2pdnVvQpTx/RhAVq9QABTChgVCBuKHZnAXWgaIacTnCRZhzahPO9phNd0Mgqrp14N5g1
 MTmCrNw2y0LbwyYWm3tpFBjK21zAUu3Eu7Yg/7xSaagHxGf0emR4d5dw4vpExGSHF9BYv9PK29v
 S3WusUYaiDkoUD/CPV8u89hkQyumG5GhVy9
X-Received: by 2002:a05:6000:299c:20b0:441:2aee:d561 with SMTP id
 ffacd0b85a97d-460306578aemr13643718f8f.28.1780858848974; 
 Sun, 07 Jun 2026 12:00:48 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb0594a2a2002ad9827a59cb148a.ipv6.abo.wanadoo.fr.
 [2a01:cb05:94a2:a200:2ad9:827a:59cb:148a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4601f351ac0sm81070183f8f.27.2026.06.07.12.00.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Jun 2026 12:00:47 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@smile.fr>
Date: Sun,  7 Jun 2026 21:00:44 +0200
Message-ID: <20260607190044.850030-1-romain.naour@smile.fr>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1780858849; x=1781463649; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=AOWqacGj4iuLT7Ua9qlsO9hA4v/uB02FyLpyY7IzOKQ=;
 b=2O5aCb12em0q+EY4XLJUEBeHabV/r0FtdVOHbGP/fVgMd68bBOR6HF6H0C05bFRZ0M
 m6nN7xIZwGwOLfDv0eXa112luzZAOAsFvkS3Cjrk9fHdvw+75R9RPlW527N07ILGVPeK
 f/H4m4DbjjnYbdh0suKDkJ4y55I57ViEefF40=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=2O5aCb12
Subject: [Buildroot] [PATCH] configs/at91sam9x5ek*: remove at91bootstrap3
 license
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

V2hlbiB1c2luZyBhIHNwZWNpZmljIGdpdCByZXBvIGFuZCB2ZXJzaW9uIGZvciBhdDkxYm9vdHN0
cmFwMywKQlIyX1RBUkdFVF9BVDkxQk9PVFNUUkFQM19MSUNFTlNFX0ZJTEVTIGRlZmF1bHRzIHRv
ICJMSUNFTlNFUy9NSVQudHh0Ii4KSG93ZXZlciB0aGUgZ2l0IHZlcnNpb24gd2UgdXNlIChuYW1l
bHkgdjMuMTAuMykgZG9lcyBub3QgcHJvdmlkZSB0aGlzCmZpbGUuIEFjdHVhbGx5LCBpdCBkb2Vz
IG5vdCBwcm92aWRlIGEgbGljZW5zZSBmaWxlIGF0IGFsbC4gVGhpcyBjYXVzZXMK4oCYbWFrZSBs
ZWdhbC1pbmZv4oCZIHRvIGZhaWwgd2l0aDoKCiAgICA+Pj4gYXQ5MWJvb3RzdHJhcDMgdjMuMTAu
MyBDb2xsZWN0aW5nIGxlZ2FsIGluZm8KICAgIHNoYTI1NnN1bTogL2J1aWxkcy9idWlsZHJvb3Qu
b3JnL2J1aWxkcm9vdC9vdXRwdXQvYnVpbGQvYXQ5MWJvb3RzdHJhcDMtdjMuMTAuMy9MSUNFTlNF
Uy9NSVQudHh0OiBObyBzdWNoIGZpbGUgb3IgZGlyZWN0b3J5CiAgICBFUlJPUjogd2hpbGUgY2hl
Y2tpbmcgaGFzaGVzIGZyb20gYm9vdC9hdDkxYm9vdHN0cmFwMy9hdDkxYm9vdHN0cmFwMy5oYXNo
CiAgICBFUlJPUjogTElDRU5TRVMvTUlULnR4dCBoYXMgd3Jvbmcgc2hhMjU2IGhhc2g6CiAgICBF
UlJPUjogZXhwZWN0ZWQ6IDVhMzgwOWIxYzJiYTEzYjcyNDI1NzIzMjI5NTEzMTFjNTg0NDE5ZjFm
ODUxNmY2NjVkNmMwNmYwNjY4ZDc4ZGUKICAgIEVSUk9SOiBnb3QgICAgIDoKICAgIEVSUk9SOiBJ
bmNvbXBsZXRlIGRvd25sb2FkLCBvciBtYW4taW4tdGhlLW1pZGRsZSAoTUlUTSkgYXR0YWNrCiAg
ICBtYWtlWzFdOiAqKiogW2Jvb3QvYXQ5MWJvb3RzdHJhcDMvYXQ5MWJvb3RzdHJhcDMubWs6MTEy
OiBhdDkxYm9vdHN0cmFwMy1sZWdhbC1pbmZvXSBFcnJvciAxCgpMZXQncyBiZSBleHBsaWNpdCB0
aGF0IHRoZXJlIGlzIG5vIGxpY2Vuc2UgZmlsZSB0byBjaGVjay4KCkZpeGVzOgpodHRwczovL2dp
dGxhYi5jb20vYnVpbGRyb290Lm9yZy9idWlsZHJvb3QvLS9qb2JzLzE0NzI4OTEzODIxIChhdDkx
c2FtOXg1ZWtfbW1jX2Rldl9kZWZjb25maWcpCmh0dHBzOi8vZ2l0bGFiLmNvbS9idWlsZHJvb3Qu
b3JnL2J1aWxkcm9vdC8tL2pvYnMvMTQ3Mjg5MTM4MjAgKGF0OTFzYW05eDVla19tbWNfZGVmY29u
ZmlnKQpodHRwczovL2dpdGxhYi5jb20vYnVpbGRyb290Lm9yZy9idWlsZHJvb3QvLS9qb2JzLzE0
NzI4OTEzODE5IChhdDkxc2FtOXg1ZWtfZGV2X2RlZmNvbmZpZykKaHR0cHM6Ly9naXRsYWIuY29t
L2J1aWxkcm9vdC5vcmcvYnVpbGRyb290Ly0vam9icy8xNDcyODkxMzgxOCAoYXQ5MXNhbTl4NWVr
X2RlZmNvbmZpZykKClNpZ25lZC1vZmYtYnk6IFJvbWFpbiBOYW91ciA8cm9tYWluLm5hb3VyQHNt
aWxlLmZyPgotLS0KIGNvbmZpZ3MvYXQ5MXNhbTl4NWVrX2RlZmNvbmZpZyAgICAgICAgIHwgMSAr
CiBjb25maWdzL2F0OTFzYW05eDVla19kZXZfZGVmY29uZmlnICAgICB8IDEgKwogY29uZmlncy9h
dDkxc2FtOXg1ZWtfbW1jX2RlZmNvbmZpZyAgICAgfCAxICsKIGNvbmZpZ3MvYXQ5MXNhbTl4NWVr
X21tY19kZXZfZGVmY29uZmlnIHwgMSArCiA0IGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygr
KQoKZGlmZiAtLWdpdCBhL2NvbmZpZ3MvYXQ5MXNhbTl4NWVrX2RlZmNvbmZpZyBiL2NvbmZpZ3Mv
YXQ5MXNhbTl4NWVrX2RlZmNvbmZpZwppbmRleCA3NzVmY2NlYWUzLi4yNDZkMzRlZGVmIDEwMDY0
NAotLS0gYS9jb25maWdzL2F0OTFzYW05eDVla19kZWZjb25maWcKKysrIGIvY29uZmlncy9hdDkx
c2FtOXg1ZWtfZGVmY29uZmlnCkBAIC0xNiw2ICsxNiw3IEBAIEJSMl9UQVJHRVRfQVQ5MUJPT1RT
VFJBUDM9eQogQlIyX1RBUkdFVF9BVDkxQk9PVFNUUkFQM19DVVNUT01fR0lUPXkKIEJSMl9UQVJH
RVRfQVQ5MUJPT1RTVFJBUDNfQ1VTVE9NX1JFUE9fVVJMPSJodHRwczovL2dpdGh1Yi5jb20vbGlu
dXg0c2FtL2F0OTFib290c3RyYXAuZ2l0IgogQlIyX1RBUkdFVF9BVDkxQk9PVFNUUkFQM19DVVNU
T01fUkVQT19WRVJTSU9OPSJ2My4xMC4zIgorQlIyX1RBUkdFVF9BVDkxQk9PVFNUUkFQM19MSUNF
TlNFX0ZJTEVTPSIiCiBCUjJfVEFSR0VUX0FUOTFCT09UU1RSQVAzX0RFRkNPTkZJRz0iYXQ5MXNh
bTl4NWVrbmZfdWJvb3QiCiBCUjJfVEFSR0VUX1VCT09UPXkKIEJSMl9UQVJHRVRfVUJPT1RfQlVJ
TERfU1lTVEVNX0tDT05GSUc9eQpkaWZmIC0tZ2l0IGEvY29uZmlncy9hdDkxc2FtOXg1ZWtfZGV2
X2RlZmNvbmZpZyBiL2NvbmZpZ3MvYXQ5MXNhbTl4NWVrX2Rldl9kZWZjb25maWcKaW5kZXggMGYy
OTIxNjczNi4uMzY0NDFmMzhlNyAxMDA2NDQKLS0tIGEvY29uZmlncy9hdDkxc2FtOXg1ZWtfZGV2
X2RlZmNvbmZpZworKysgYi9jb25maWdzL2F0OTFzYW05eDVla19kZXZfZGVmY29uZmlnCkBAIC02
Nyw2ICs2Nyw3IEBAIEJSMl9UQVJHRVRfQVQ5MUJPT1RTVFJBUDM9eQogQlIyX1RBUkdFVF9BVDkx
Qk9PVFNUUkFQM19DVVNUT01fR0lUPXkKIEJSMl9UQVJHRVRfQVQ5MUJPT1RTVFJBUDNfQ1VTVE9N
X1JFUE9fVVJMPSJodHRwczovL2dpdGh1Yi5jb20vbGludXg0c2FtL2F0OTFib290c3RyYXAuZ2l0
IgogQlIyX1RBUkdFVF9BVDkxQk9PVFNUUkFQM19DVVNUT01fUkVQT19WRVJTSU9OPSJ2My4xMC4z
IgorQlIyX1RBUkdFVF9BVDkxQk9PVFNUUkFQM19MSUNFTlNFX0ZJTEVTPSIiCiBCUjJfVEFSR0VU
X0FUOTFCT09UU1RSQVAzX0RFRkNPTkZJRz0iYXQ5MXNhbTl4NWVrbmZfdWJvb3QiCiBCUjJfVEFS
R0VUX1VCT09UPXkKIEJSMl9UQVJHRVRfVUJPT1RfQlVJTERfU1lTVEVNX0tDT05GSUc9eQpkaWZm
IC0tZ2l0IGEvY29uZmlncy9hdDkxc2FtOXg1ZWtfbW1jX2RlZmNvbmZpZyBiL2NvbmZpZ3MvYXQ5
MXNhbTl4NWVrX21tY19kZWZjb25maWcKaW5kZXggYTZmZDdlMDVmYy4uNGMyYTYyNTViYyAxMDA2
NDQKLS0tIGEvY29uZmlncy9hdDkxc2FtOXg1ZWtfbW1jX2RlZmNvbmZpZworKysgYi9jb25maWdz
L2F0OTFzYW05eDVla19tbWNfZGVmY29uZmlnCkBAIC0xNyw2ICsxNyw3IEBAIEJSMl9UQVJHRVRf
QVQ5MUJPT1RTVFJBUDM9eQogQlIyX1RBUkdFVF9BVDkxQk9PVFNUUkFQM19DVVNUT01fR0lUPXkK
IEJSMl9UQVJHRVRfQVQ5MUJPT1RTVFJBUDNfQ1VTVE9NX1JFUE9fVVJMPSJodHRwczovL2dpdGh1
Yi5jb20vbGludXg0c2FtL2F0OTFib290c3RyYXAuZ2l0IgogQlIyX1RBUkdFVF9BVDkxQk9PVFNU
UkFQM19DVVNUT01fUkVQT19WRVJTSU9OPSJ2My4xMC4zIgorQlIyX1RBUkdFVF9BVDkxQk9PVFNU
UkFQM19MSUNFTlNFX0ZJTEVTPSIiCiBCUjJfVEFSR0VUX0FUOTFCT09UU1RSQVAzX0RFRkNPTkZJ
Rz0iYXQ5MXNhbTl4NWVrc2RfdWJvb3QiCiBCUjJfVEFSR0VUX1VCT09UPXkKIEJSMl9UQVJHRVRf
VUJPT1RfQlVJTERfU1lTVEVNX0tDT05GSUc9eQpkaWZmIC0tZ2l0IGEvY29uZmlncy9hdDkxc2Ft
OXg1ZWtfbW1jX2Rldl9kZWZjb25maWcgYi9jb25maWdzL2F0OTFzYW05eDVla19tbWNfZGV2X2Rl
ZmNvbmZpZwppbmRleCAzNDRjNmMyZWFlLi45MDg5MDdhY2RhIDEwMDY0NAotLS0gYS9jb25maWdz
L2F0OTFzYW05eDVla19tbWNfZGV2X2RlZmNvbmZpZworKysgYi9jb25maWdzL2F0OTFzYW05eDVl
a19tbWNfZGV2X2RlZmNvbmZpZwpAQCAtNjksNiArNjksNyBAQCBCUjJfVEFSR0VUX0FUOTFCT09U
U1RSQVAzPXkKIEJSMl9UQVJHRVRfQVQ5MUJPT1RTVFJBUDNfQ1VTVE9NX0dJVD15CiBCUjJfVEFS
R0VUX0FUOTFCT09UU1RSQVAzX0NVU1RPTV9SRVBPX1VSTD0iaHR0cHM6Ly9naXRodWIuY29tL2xp
bnV4NHNhbS9hdDkxYm9vdHN0cmFwLmdpdCIKIEJSMl9UQVJHRVRfQVQ5MUJPT1RTVFJBUDNfQ1VT
VE9NX1JFUE9fVkVSU0lPTj0idjMuMTAuMyIKK0JSMl9UQVJHRVRfQVQ5MUJPT1RTVFJBUDNfTElD
RU5TRV9GSUxFUz0iIgogQlIyX1RBUkdFVF9BVDkxQk9PVFNUUkFQM19ERUZDT05GSUc9ImF0OTFz
YW05eDVla3NkX3Vib290IgogQlIyX1RBUkdFVF9VQk9PVD15CiBCUjJfVEFSR0VUX1VCT09UX0JV
SUxEX1NZU1RFTV9LQ09ORklHPXkKLS0gCjIuNTQuMAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RA
YnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5m
by9idWlsZHJvb3QK
