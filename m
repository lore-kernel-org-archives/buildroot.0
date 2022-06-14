Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 844B7CCA47B
	for <buildroot@archiver.kernel.org>; Tue, 14 Jun 2022 19:09:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1E0CE60EA2;
	Tue, 14 Jun 2022 19:09:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6w8PeuEC-SGr; Tue, 14 Jun 2022 19:09:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7992B60E70;
	Tue, 14 Jun 2022 19:09:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D39561BF5B4
 for <buildroot@lists.busybox.net>; Tue, 14 Jun 2022 19:09:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D0731409E3
 for <buildroot@lists.busybox.net>; Tue, 14 Jun 2022 19:09:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XNYsIH1ZM8Pl for <buildroot@lists.busybox.net>;
 Tue, 14 Jun 2022 19:09:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 358B04056D
 for <buildroot@buildroot.org>; Tue, 14 Jun 2022 19:09:32 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id y19so19006302ejq.6
 for <buildroot@buildroot.org>; Tue, 14 Jun 2022 12:09:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=15QdfKzeLTOzwNtwM2T2CblP6TaYZnk21a2yjw+kxvE=;
 b=HimErb+SiOZ2BCmpa4gahJkxiRiZnhXd9rYkh1jGcT6X9LqS5vUbgoUHsVCv7guTHK
 q549E9avtX1dpXd0pfwJoNBSgts3l/4A2bxESKY+14KpNubylBswzU15EVbF5EHur175
 /wq+0Mpxvr+0h7mkQhvSmaqAablpjT55UqJeb55h0i7q8/0kG0juNgaDDzj9ZALfn6om
 xQzyXqpOrDA1roWnde9e/3Q6uCPYj7PfKpQU78sd9lhOlzHqabBw6C6W9zfVRt5xbVt2
 /aS0BpJP1zA4LBLyvyzVtSrPp02COBhmhzFnJ8Fftp/bNP39cJRyy9cZtTWRDQT8Wy0h
 Fisw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=15QdfKzeLTOzwNtwM2T2CblP6TaYZnk21a2yjw+kxvE=;
 b=gGbMn9nYmtrT1+QdJLaXh4MJrZosA02vvh/H41U/Ovyp6FmDg9XU8WT68UccNSQBzJ
 Ej13Y9uliGKyT5U3Lf3vnp9BLDvxq+HhVJm3B6jRZ7zi3Y7oxDczw6bQ7CjMLDo0Grk2
 kZoyBtgUEa/GDjkrjNRsUnlTu3Xmq6mgVM0NpE+T8nstKvgZ10GQkiaWvLX7harCRdsj
 aSERuqNIChk9aAwF5gEV7FI6NWgDOPi40qzmk4gTS9kG8zsYEsSWb+CTUX3t/S4gKX4Z
 p0QUNuBk+K5hj0nyoYFzwRPshqdMVvPHBF4YMTfGRFpb7yxx0xb7aRklr0gOnJc/bapP
 h3NQ==
X-Gm-Message-State: AJIora9gQyYyZ1lUC54TQecHZe62P/4UxvtV+vm6L0kajl0BDldqBNpE
 Nk19NABcWzgLztBvDVeHESkB8x1s33jsGCrO
X-Google-Smtp-Source: AGRyM1vABrMVySAXu4Qq1mWRIQk1PYIEkeDGRaYQRh6kkyKfjMsKqvVC8hyAwJDpUiUQykb58u4I/g==
X-Received: by 2002:a17:906:1d5:b0:715:78c9:df83 with SMTP id
 21-20020a17090601d500b0071578c9df83mr5548526ejj.285.1655233420447; 
 Tue, 14 Jun 2022 12:03:40 -0700 (PDT)
Received: from localhost.localdomain (ip-188-118-3-185.reverse.destiny.be.
 [188.118.3.185]) by smtp.gmail.com with ESMTPSA id
 g4-20020a17090670c400b00711d5bc20d5sm5326600ejk.221.2022.06.14.12.03.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jun 2022 12:03:39 -0700 (PDT)
To: buildroot@buildroot.org
Date: Tue, 14 Jun 2022 21:03:24 +0200
Message-Id: <20220614190325.723977-2-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220614190325.723977-1-raphael.melotte@mind.be>
References: <20220614190325.723977-1-raphael.melotte@mind.be>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] package/python-s3transfer: bump to version
 0.6.0
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
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

V2hpbGUgYXQgaXQsIHJlbW92ZSB0aGUgbWQ1IGhhc2ggYXMgdGhlcmUgaXMgYWxyZWFkeSBhIHNo
YTI1NiBoYXNoLgoKTm90ZSB0aGF0IHRoZSBjaGVja3N1bSBvZiB0aGUgbGljZW5zZSBjaGFuZ2Vk
LCBidXQgdGhlIGxpY2Vuc2UgaXMKc3RpbGwgdGhlIHNhbWUgKHRoZSBvbmx5IGNoYW5nZSBpbiB0
aGUgbGljZW5zZSBmaWxlIGlzIHRoZSByZW1vdmFsIG9mCmEgYmxhbmsgbGluZSBhdCB0aGUgZW5k
IG9mIHRoZSBmaWxlKS4KCkNoYW5nZWxvZzogaHR0cHM6Ly9naXRodWIuY29tL2JvdG8vczN0cmFu
c2Zlci9ibG9iL2RldmVsb3AvQ0hBTkdFTE9HLnJzdAoKU2lnbmVkLW9mZi1ieTogUmFwaGHDq2wg
TcOpbG90dGUgPHJhcGhhZWwubWVsb3R0ZUBtaW5kLmJlPgotLS0KIHBhY2thZ2UvcHl0aG9uLXMz
dHJhbnNmZXIvcHl0aG9uLXMzdHJhbnNmZXIuaGFzaCB8IDcgKysrLS0tLQogcGFja2FnZS9weXRo
b24tczN0cmFuc2Zlci9weXRob24tczN0cmFuc2Zlci5tayAgIHwgNCArKy0tCiAyIGZpbGVzIGNo
YW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9wYWNr
YWdlL3B5dGhvbi1zM3RyYW5zZmVyL3B5dGhvbi1zM3RyYW5zZmVyLmhhc2ggYi9wYWNrYWdlL3B5
dGhvbi1zM3RyYW5zZmVyL3B5dGhvbi1zM3RyYW5zZmVyLmhhc2gKaW5kZXggYjhmNGE1N2FiOC4u
MTZmMGZhY2U3MiAxMDA2NDQKLS0tIGEvcGFja2FnZS9weXRob24tczN0cmFuc2Zlci9weXRob24t
czN0cmFuc2Zlci5oYXNoCisrKyBiL3BhY2thZ2UvcHl0aG9uLXMzdHJhbnNmZXIvcHl0aG9uLXMz
dHJhbnNmZXIuaGFzaApAQCAtMSw1ICsxLDQgQEAKLSMgbWQ1LCBzaGEyNTYgZnJvbSBodHRwczov
L3B5cGkub3JnL3B5cGkvczN0cmFuc2Zlci9qc29uCi1tZDUgIDk0MTZkMWM3ZDMzNTA2NTAxYTg2
MjdiYjFmN2JhZjY2ICBzM3RyYW5zZmVyLTAuNS4wLnRhci5negotc2hhMjU2ICA1MGVkODIzZTFk
YzU4NjhhZDQwYzhkYzkyMDcyZjc1N2FhMGU2NTNhMTkyODQ1Yzk0YTNiNjc2ZjRhNjJkYTRjICBz
M3RyYW5zZmVyLTAuNS4wLnRhci5negorIyBzaGEyNTYgZnJvbSBodHRwczovL3B5cGkub3JnL3B5
cGkvczN0cmFuc2Zlci9qc29uCitzaGEyNTYgIDJlZDA3ZDM4NjZmNTIzY2M1NjFiZjRhMDBmYzU1
MzU4Mjc5ODFiMTE3ZGQ3ODc2ZjAzNmIwYzFhY2E0MmM5NDcgIHMzdHJhbnNmZXItMC42LjAudGFy
Lmd6CiAjIExvY2FsbHkgY29tcHV0ZWQgc2hhMjU2IGNoZWNrc3Vtcwotc2hhMjU2ICA4YzZkYjM0
MDQ3NTEzNmRmM2MxMjAxZDQ1OGZhNTc1NTY5OGVhY2U3NmU1MTA0NzFlY2M5ZDg1N2Q2MDgzZGFj
ICBMSUNFTlNFLnR4dAorc2hhMjU2ICBjZmM3NzQ5Yjk2ZjYzYmQzMWMzYzQyYjVjNDcxYmY3NTY4
MTQwNTNlODQ3YzEwZjNlYjAwMzQxN2JjNTIzZDMwICBMSUNFTlNFLnR4dApkaWZmIC0tZ2l0IGEv
cGFja2FnZS9weXRob24tczN0cmFuc2Zlci9weXRob24tczN0cmFuc2Zlci5tayBiL3BhY2thZ2Uv
cHl0aG9uLXMzdHJhbnNmZXIvcHl0aG9uLXMzdHJhbnNmZXIubWsKaW5kZXggOGI4ZTAyZGI1Ny4u
NjBhNzJkYTcyOSAxMDA2NDQKLS0tIGEvcGFja2FnZS9weXRob24tczN0cmFuc2Zlci9weXRob24t
czN0cmFuc2Zlci5taworKysgYi9wYWNrYWdlL3B5dGhvbi1zM3RyYW5zZmVyL3B5dGhvbi1zM3Ry
YW5zZmVyLm1rCkBAIC00LDkgKzQsOSBAQAogIwogIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKIAot
UFlUSE9OX1MzVFJBTlNGRVJfVkVSU0lPTiA9IDAuNS4wCitQWVRIT05fUzNUUkFOU0ZFUl9WRVJT
SU9OID0gMC42LjAKIFBZVEhPTl9TM1RSQU5TRkVSX1NPVVJDRSA9IHMzdHJhbnNmZXItJChQWVRI
T05fUzNUUkFOU0ZFUl9WRVJTSU9OKS50YXIuZ3oKLVBZVEhPTl9TM1RSQU5TRkVSX1NJVEUgPSBo
dHRwczovL2ZpbGVzLnB5dGhvbmhvc3RlZC5vcmcvcGFja2FnZXMvODgvZWYvNGQxYjNmNTJhZTIw
YTdlNzIxNTFmZGU1YzlmMjU0Y2Q4M2Y4YTQ5MDQ3MzUxZjM0MDA2ZTUxN2UxNjU1CitQWVRIT05f
UzNUUkFOU0ZFUl9TSVRFID0gaHR0cHM6Ly9maWxlcy5weXRob25ob3N0ZWQub3JnL3BhY2thZ2Vz
L2UxL2ViL2U1N2M5M2Q1Y2Q1ZWRmOGMxZDEyNGM4MzFlZjkxNjYwMTU0MGRiNzBhY2Q5NmZhMjFm
ZTYwY2VmMTM2NQogUFlUSE9OX1MzVFJBTlNGRVJfU0VUVVBfVFlQRSA9IHNldHVwdG9vbHMKIFBZ
VEhPTl9TM1RSQU5TRkVSX0xJQ0VOU0UgPSBBcGFjaGUtMi4wCiBQWVRIT05fUzNUUkFOU0ZFUl9M
SUNFTlNFX0ZJTEVTID0gTElDRU5TRS50eHQKLS0gCjIuMzUuMQoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWls
ZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9idWlsZHJvb3QK
