Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22A8FC433EF
	for <buildroot@archiver.kernel.org>; Sun,  9 Jan 2022 18:32:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B0CC8405BF;
	Sun,  9 Jan 2022 18:32:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Tx1ZyRlRUaA0; Sun,  9 Jan 2022 18:32:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 76A14405AE;
	Sun,  9 Jan 2022 18:32:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 341271BF291
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 18:32:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2F8D160BD0
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 18:32:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=smile-fr.20210112.gappssmtp.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SRgN2BfqQxbm for <buildroot@lists.busybox.net>;
 Sun,  9 Jan 2022 18:32:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 069FB60B97
 for <buildroot@buildroot.org>; Sun,  9 Jan 2022 18:32:05 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 l12-20020a7bc34c000000b003467c58cbdfso7996406wmj.2
 for <buildroot@buildroot.org>; Sun, 09 Jan 2022 10:32:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=v/TyRgF+x9bOppzSz9uOANjzoM4x5ja9iwNCP77KIHk=;
 b=gG7t/urRrucG0ldSwtavVUXFGtAIBrcABR46Yy6GSt/BhsdzLvPJO8JOSDQ6VAN8qW
 MR3Z1kaPltlAnyXedNjvhww1ok6DQ2nQanAZ5z9bP5f1qrrTrRXYQjHvoo0VTUZ0Y7Di
 eDiDebJ5vDJQue2RKSvGRTSfB/kl6IHFP8P9mkobjwqYgesVqYYbccJLHaagVI3hBv8A
 Bz78CKq3+50xOzHcUVJou27q7DytMkg70Jdq+ltV3s3hzlK6KBytKKMUvZ7Brsvx7chR
 E0s/citXUwuiFk89TOokD1gnWeevG9G2kwNMqtaZ75Neq/8qS7lUlEn5vfAnXwM8BP9d
 cA6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=v/TyRgF+x9bOppzSz9uOANjzoM4x5ja9iwNCP77KIHk=;
 b=iH+t24tv9s0b03FZXZmRj8LqaDEQHjTwq+3Bq6+ju4Sr1uT7wMbkHTS/p8TpoytULb
 ER1dZ4s6pPqQAdWPxdG8Ru5kDl8yzdZKIH1wQBBfv4CcIGK+ZyfiddO4mjxUT99b2asT
 Z6oziInKZ/G43NR1B3ZJALKVIUhIqKrs2zTyLOPwypalmaf0EG3BdPV0H0JM4JPA7ii5
 pHjuXh0fdRncx+wZuM2LnsfQRd69u7O7QC5uKVizfHmAgGZe8JeUAACoBqLqn9UwKDwF
 5jy/UGYOAeRVyIa3JKXjmUmTWZZfG7b9L8cvbSz4X/J640crbPRxM1RZ2Ls/9n2I2lTg
 1lYA==
X-Gm-Message-State: AOAM530Y3l/96xA0HZ2JOz4R1NVa4aLeZf9NbOiSda44gE9VNQwlnI8y
 qTH5+RhpJCQtuP45kXKqz+HDcA==
X-Google-Smtp-Source: ABdhPJxfyAkiTp2nZYLtlftZg9VGBgyY1H09PttkBcnPkg8GQvmR8eVlJ5Ft5a+Hmxk57AJhoT6XKQ==
X-Received: by 2002:a1c:1b17:: with SMTP id b23mr9002943wmb.194.1641753124176; 
 Sun, 09 Jan 2022 10:32:04 -0800 (PST)
Received: from ?IPV6:2a01:cb05:8f8a:1800:1c97:b8d1:b477:d53f?
 (2a01cb058f8a18001c97b8d1b477d53f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:1c97:b8d1:b477:d53f])
 by smtp.gmail.com with ESMTPSA id c11sm5282054wmq.48.2022.01.09.10.32.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 09 Jan 2022 10:32:03 -0800 (PST)
Message-ID: <ebdbfc53-e0da-e431-2d5a-15bb96a49594@smile.fr>
Date: Sun, 9 Jan 2022 19:32:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-US
To: Christian Stewart <christian@paral.in>, buildroot@buildroot.org
References: <20201216084058.102180-1-christian@paral.in>
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <20201216084058.102180-1-christian@paral.in>
Subject: Re: [Buildroot] [PATCH v1 1/1] package/moby-buildkit: new package
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
Cc: Asaf Kahlon <asafka7@gmail.com>, Peter Seiderer <ps.report@gmx.net>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>, Adam Duskett <aduskett@gmail.com>,
 Angelo Compagnucci <angelo@amarulasolutions.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gQ2hyaXN0aWFuLAoKTGUgMTYvMTIvMjAyMCDDoCAwOTo0MCwgQ2hyaXN0aWFuIFN0ZXdh
cnQgYSDDqWNyaXTCoDoKPiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RpYW4gU3Rld2FydCA8Y2hyaXN0
aWFuQHBhcmFsLmluPgo+IC0tLQo+ICBwYWNrYWdlL0NvbmZpZy5pbiAgICAgICAgICAgICAgICAg
ICAgICAgIHwgIDEgKwo+ICBwYWNrYWdlL21vYnktYnVpbGRraXQvQ29uZmlnLmluICAgICAgICAg
IHwgMTkgKysrKysrKysrKysrKysrKysrKwo+ICBwYWNrYWdlL21vYnktYnVpbGRraXQvbW9ieS1i
dWlsZGtpdC5oYXNoIHwgIDMgKysrCj4gIHBhY2thZ2UvbW9ieS1idWlsZGtpdC9tb2J5LWJ1aWxk
a2l0Lm1rICAgfCAyNCArKysrKysrKysrKysrKysrKysrKysrKysKPiAgNCBmaWxlcyBjaGFuZ2Vk
LCA0NyBpbnNlcnRpb25zKCspCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL21vYnktYnVp
bGRraXQvQ29uZmlnLmluCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL21vYnktYnVpbGRr
aXQvbW9ieS1idWlsZGtpdC5oYXNoCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL21vYnkt
YnVpbGRraXQvbW9ieS1idWlsZGtpdC5tawo+IAo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL0NvbmZp
Zy5pbiBiL3BhY2thZ2UvQ29uZmlnLmluCj4gaW5kZXggZGM3MTM5YTQ5YS4uY2UzN2EyZWQzNSAx
MDA2NDQKPiAtLS0gYS9wYWNrYWdlL0NvbmZpZy5pbgo+ICsrKyBiL3BhY2thZ2UvQ29uZmlnLmlu
Cj4gQEAgLTI0MTQsNiArMjQxNCw3IEBAIG1lbnUgIlN5c3RlbSB0b29scyIKPiAgCXNvdXJjZSAi
cGFja2FnZS9tZW5kZXIvQ29uZmlnLmluIgo+ICAJc291cmNlICJwYWNrYWdlL21lbmRlci1ncnVi
ZW52L0NvbmZpZy5pbiIKPiAgCXNvdXJjZSAicGFja2FnZS9tZm9jL0NvbmZpZy5pbiIKPiArCXNv
dXJjZSAicGFja2FnZS9tb2J5LWJ1aWxka2l0L0NvbmZpZy5pbiIKPiAgCXNvdXJjZSAicGFja2Fn
ZS9tb25pdC9Db25maWcuaW4iCj4gIAlzb3VyY2UgInBhY2thZ2UvbXVsdGlwYXRoLXRvb2xzL0Nv
bmZpZy5pbiIKPiAgCXNvdXJjZSAicGFja2FnZS9uY2R1L0NvbmZpZy5pbiIKPiBkaWZmIC0tZ2l0
IGEvcGFja2FnZS9tb2J5LWJ1aWxka2l0L0NvbmZpZy5pbiBiL3BhY2thZ2UvbW9ieS1idWlsZGtp
dC9Db25maWcuaW4KPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAwMDAuLjE0
MTM0YWE3YWUKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvcGFja2FnZS9tb2J5LWJ1aWxka2l0L0Nv
bmZpZy5pbgo+IEBAIC0wLDAgKzEsMTkgQEAKPiArY29uZmlnIEJSMl9QQUNLQUdFX01PQllfQlVJ
TERLSVQKPiArCWJvb2wgIm1vYnktYnVpbGRraXQiCj4gKwlkZXBlbmRzIG9uIEJSMl9QQUNLQUdF
X0hPU1RfR09fVEFSR0VUX0FSQ0hfU1VQUE9SVFMKPiArCWRlcGVuZHMgb24gQlIyX1BBQ0tBR0Vf
SE9TVF9HT19UQVJHRVRfQ0dPX0xJTktJTkdfU1VQUE9SVFMKPiArCWRlcGVuZHMgb24gQlIyX1RP
T0xDSEFJTl9IQVNfVEhSRUFEUwo+ICsJZGVwZW5kcyBvbiAhQlIyX1RPT0xDSEFJTl9VU0VTX1VD
TElCQwo+ICsJZGVwZW5kcyBvbiBCUjJfVVNFX01NVQo+ICsJc2VsZWN0IEJSMl9QQUNLQUdFX0NH
Uk9VUEZTX01PVU5UIGlmICFCUjJfUEFDS0FHRV9TWVNURU1EICMgcnVudGltZSBkZXBlbmRlbmN5
Cj4gKwloZWxwCj4gKwkgIEJ1aWxkS2l0IGlzIGEgdG9vbGtpdCBmb3IgY29udmVydGluZyBzb3Vy
Y2UgY29kZSB0byBidWlsZCBhcnRpZmFjdHMgaW4gYW4KClRoaXMgbGluZSBpcyB0cmlnZ2VyIGEg
Y2hlY2stcGFja2FnZSB3YXJuaW5nOgoKJCAuL3V0aWxzL2NoZWNrLXBhY2thZ2UgcGFja2FnZS9t
b2J5LWJ1aWxka2l0LyoKcGFja2FnZS9tb2J5LWJ1aWxka2l0L0NvbmZpZy5pbjoxMDogaGVscCB0
ZXh0OiA8dGFiPjwyIHNwYWNlcz48NjIgY2hhcnM+CihodHRwOi8vbmlnaHRseS5idWlsZHJvb3Qu
b3JnLyN3cml0aW5nLXJ1bGVzLWNvbmZpZy1pbikKCj4gKwkgIGVmZmljaWVudCwgZXhwcmVzc2l2
ZSBhbmQgcmVwZWF0YWJsZSBtYW5uZXIuCj4gKwo+ICsJICBodHRwczovL2dpdGh1Yi5jb20vbW9i
eS9idWlsZGtpdAo+ICsKPiArY29tbWVudCAibW9ieS1idWlsZGtpdCBuZWVkcyBhIGdsaWJjIG9y
IG11c2wgdG9vbGNoYWluIHcvIHRocmVhZHMiCj4gKwlkZXBlbmRzIG9uIEJSMl9QQUNLQUdFX0hP
U1RfR09fVEFSR0VUX0FSQ0hfU1VQUE9SVFMKPiArCWRlcGVuZHMgb24gQlIyX1BBQ0tBR0VfSE9T
VF9HT19UQVJHRVRfQ0dPX0xJTktJTkdfU1VQUE9SVFMKPiArCWRlcGVuZHMgb24gIUJSMl9UT09M
Q0hBSU5fSEFTX1RIUkVBRFMgfHwgQlIyX1RPT0xDSEFJTl9VU0VTX1VDTElCQwo+ICsJZGVwZW5k
cyBvbiBCUjJfVVNFX01NVQo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL21vYnktYnVpbGRraXQvbW9i
eS1idWlsZGtpdC5oYXNoIGIvcGFja2FnZS9tb2J5LWJ1aWxka2l0L21vYnktYnVpbGRraXQuaGFz
aAo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwMC4uYTZiZmRjZTRmMQo+
IC0tLSAvZGV2L251bGwKPiArKysgYi9wYWNrYWdlL21vYnktYnVpbGRraXQvbW9ieS1idWlsZGtp
dC5oYXNoCj4gQEAgLTAsMCArMSwzIEBACj4gKyMgTG9jYWxseSBjYWxjdWxhdGVkCj4gK3NoYTI1
NiAgMGNjMzFhYTRiNmRjZGVhZDYzYjA3ZDc1ZTBiODk0OTVlY2ZmY2MxODNmNGY2MjY5NWQ4YmI1
MDc0MzNmYzhmZiAgbW9ieS1idWlsZGtpdC0wLjguMS50YXIuZ3oKPiArc2hhMjU2CTdjODc4NzMy
OTFmMjg5NzEzYWM1ZGY0OGIxZjIwMTBlYjY5NjM3NTJiYmQ2YjUzMDQxNmFiOTlmYzM3OTE0YTgg
IExJQ0VOU0UKCkNoZWNraW5nIGxlZ2FsLWluZm8gcmVwb3J0IGEgcHJvYmxlbSB3aXRoIHRoZSBM
SUNFTlNFIGZpbGUgaGFzaDoKCkVSUk9SOiBMSUNFTlNFIGhhcyB3cm9uZyBzaGEyNTYgaGFzaDoK
RVJST1I6IGV4cGVjdGVkOiA3Yzg3ODczMjkxZjI4OTcxM2FjNWRmNDhiMWYyMDEwZWI2OTYzNzUy
YmJkNmI1MzA0MTZhYjk5ZmMzNzkxNGE4CkVSUk9SOiBnb3QgICAgIDogYzcxZDIzOWRmOTE3MjZm
YzUxOWM2ZWI3MmQzMThlYzY1ODIwNjI3MjMyYjJmNzk2MjE5ZTg3ZGNmMzVkMGFiNAoKPiBkaWZm
IC0tZ2l0IGEvcGFja2FnZS9tb2J5LWJ1aWxka2l0L21vYnktYnVpbGRraXQubWsgYi9wYWNrYWdl
L21vYnktYnVpbGRraXQvbW9ieS1idWlsZGtpdC5tawo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4g
aW5kZXggMDAwMDAwMDAwMC4uZmI0ZTc4ZTNhNgo+IC0tLSAvZGV2L251bGwKPiArKysgYi9wYWNr
YWdlL21vYnktYnVpbGRraXQvbW9ieS1idWlsZGtpdC5tawo+IEBAIC0wLDAgKzEsMjQgQEAKPiAr
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKPiArIwo+ICsjIG1vYnktYnVpbGRraXQKPiArIwo+ICsj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIwo+ICsKPiArTU9CWV9CVUlMREtJVF9WRVJTSU9OID0gMC44
LjEKPiArTU9CWV9CVUlMREtJVF9TSVRFID0gJChjYWxsIGdpdGh1Yixtb2J5LGJ1aWxka2l0LHYk
KE1PQllfQlVJTERLSVRfVkVSU0lPTikpCj4gKwo+ICtNT0JZX0JVSUxES0lUX0xJQ0VOU0UgPSBB
cGFjaGUtMi4wCj4gK01PQllfQlVJTERLSVRfTElDRU5TRV9GSUxFUyA9IExJQ0VOU0UKPiArCj4g
K01PQllfQlVJTERLSVRfREVQRU5ERU5DSUVTID0gaG9zdC1wa2djb25mCgpXaHkgaG9zdC1wa2dj
b25maWcgaXMgbmVlZGVkID8KSXQgZG9lc24ndCBzZWVtcyB1c2VkIGJ5IHRoZSBidWlsZCBzeXN0
ZW0uCgpCZXN0IHJlZ2FyZHMsClJvbWFpbgoKCj4gK01PQllfQlVJTERLSVRfR09NT0QgPSBnaXRo
dWIuY29tL21vYnkvYnVpbGRraXQKPiArCj4gK01PQllfQlVJTERLSVRfVEFHUyA9IGNnbwo+ICtN
T0JZX0JVSUxES0lUX0JVSUxEX1RBUkdFVFMgPSBjbWQvYnVpbGRjdGwgY21kL2J1aWxka2l0ZAo+
ICsKPiArTU9CWV9CVUlMREtJVF9MREZMQUdTID0gXAo+ICsJLVggJChNT0JZX0JVSUxES0lUX0dP
TU9EKS92ZXJzaW9uLlZlcnNpb249IiQoTU9CWV9CVUlMREtJVF9WRVJTSU9OKSIKPiArCj4gK01P
QllfQlVJTERLSVRfSU5TVEFMTF9CSU5TID0gJChub3RkaXIgJChNT0JZX0JVSUxES0lUX0JVSUxE
X1RBUkdFVFMpKQo+ICsKPiArJChldmFsICQoZ29sYW5nLXBhY2thZ2UpKQo+IAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcg
bGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcv
bWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
