Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6675CAC59E
	for <buildroot@archiver.kernel.org>; Tue, 17 Sep 2024 20:10:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 898FD81DFE;
	Tue, 17 Sep 2024 20:10:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NJQMb1szfsG6; Tue, 17 Sep 2024 20:10:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 77C5181E26
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 77C5181E26;
	Tue, 17 Sep 2024 20:10:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8E42D1BF2C3
 for <buildroot@lists.busybox.net>; Tue, 17 Sep 2024 20:10:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7CF9681882
 for <buildroot@lists.busybox.net>; Tue, 17 Sep 2024 20:10:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KhgiwEacDyid for <buildroot@lists.busybox.net>;
 Tue, 17 Sep 2024 20:10:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1F9AF81E24
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1F9AF81E24
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1F9AF81E24
 for <buildroot@buildroot.org>; Tue, 17 Sep 2024 20:10:35 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-42cba6cdf32so50487185e9.1
 for <buildroot@buildroot.org>; Tue, 17 Sep 2024 13:10:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726603834; x=1727208634;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=z983jp2uNse0jXL+x6p5bpQH3GBHNZNb6IDLNY3EtNU=;
 b=l9vBiq2jt+13828uL9pIxactRx+4HZcW19rmpdws2LV0tdAIR5EMpiG3IJAYr4ky1h
 904u7kyte4Co9Ei4kxPtHyKgOw2RdJjT9hjSTHKPKOzsWaUFF3fGLtdP6StH8ACBrRFD
 9L8V2vSVNhUHDXHEr4O7TZnmpvSiQPLIpo5bEeXLv3kKPwhwzAIF0WoCoY9ch+NUlxWq
 /0/Ccd50kYItJ/bXr+8vO9i/jxIdBabAzFD+X5jVOUz9z8c4K6EI//nPnZI/61yODLzH
 xFRz1J77n5AoKoC/4sWoplkTmlRj48lGphtpoXqcenzd3d4eX8hMQ6/hhqKNMjUh6Bd/
 GcjA==
X-Gm-Message-State: AOJu0Yyot2NcmG72PQyKnbwDlaj3cgmw/jQYqY++qgCwL/uUTyrEL211
 CQQIsn3wVrZ2g1YQkJmFBAMsM3On5Nke46rWFoCx3Pl7LJssN6+7fh1yp4t/9FUk+uItiXu3CvF
 d4jonGg==
X-Google-Smtp-Source: AGHT+IEao3fPu/+eDfufHkiX42FzogPD+z/d59KUcr9sH/+spoxoM2nU2IgMqESg02uH9/p7gUT6aQ==
X-Received: by 2002:a05:600c:6c8d:b0:42c:b7e2:3bc3 with SMTP id
 5b1f17b1804b1-42cdb54d638mr134218505e9.19.1726603833800; 
 Tue, 17 Sep 2024 13:10:33 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i..
 (91.141.77.19.wireless.dyn.drei.com. [91.141.77.19])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42d9b15d4f7sm146459205e9.27.2024.09.17.13.10.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Sep 2024 13:10:33 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue, 17 Sep 2024 22:10:30 +0200
Message-ID: <20240917201030.11583-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1726603834; x=1727208634;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=z983jp2uNse0jXL+x6p5bpQH3GBHNZNb6IDLNY3EtNU=;
 b=LcODjxU82PdYsqf5c9IXvSl1TDfzolSuP521PcUI922fitDL7fX9dEmlSp6eiZkNMb
 8v0Mx4h167LBZLI22wXUJ9Ls3Kqr5/j0K4rhVR6AY4613MpZ+IYS7YljObJXjSsRaAl3
 d/E/jTanWk89W+iVZA38a1JrYknozjNFUS4Uo=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=LcODjxU8
Subject: [Buildroot] [PATCH 1/1] package/babeld: bump to version 1.13.1
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

LSBJbXBsZW1lbnRlZCB0aGUgcGVyLWludGVyZmFjZSBvcHRpb24gInByb2JlLW10dSIsIHdoaWNo
IGF1dG9tYXRpY2FsbHkKICBkaXNjYXJkcyBsaW5rcyB3aXRoIGEgbWlzLWNvbmZpZ3VyZWQgTVRV
LiAgVGhhbmtzIHRvIERhbmllbCBHcsO2YmVyLgotIEZpeGVkIGEgdHlwbyBpbiB0aGUgaGFuZGlu
ZyBvZiB0aGUgb3B0aW9uICJ2NHZpYXY2Ii4KClJlbGVhc2Ugbm90ZXM6Cmh0dHBzOi8vZ2l0aHVi
LmNvbS9qZWNoL2JhYmVsZC9ibG9iL21hc3Rlci9DSEFOR0VTCgpTaWduZWQtb2ZmLWJ5OiBEYXJp
byBCaW5hY2NoaSA8ZGFyaW8uYmluYWNjaGlAYW1hcnVsYXNvbHV0aW9ucy5jb20+Ci0tLQogLi4u
LzAwMDEtRml4LWNvbXBpbGF0aW9uLWVycm9yLW9uLWxpbnV4LnBhdGNoIHwgMzYgKysrKysrKysr
KysrKysrKysrKwogcGFja2FnZS9iYWJlbGQvYmFiZWxkLmhhc2ggICAgICAgICAgICAgICAgICAg
IHwgIDIgKy0KIHBhY2thZ2UvYmFiZWxkL2JhYmVsZC5tayAgICAgICAgICAgICAgICAgICAgICB8
ICAyICstCiAzIGZpbGVzIGNoYW5nZWQsIDM4IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0p
CiBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9iYWJlbGQvMDAwMS1GaXgtY29tcGlsYXRpb24t
ZXJyb3Itb24tbGludXgucGF0Y2gKCmRpZmYgLS1naXQgYS9wYWNrYWdlL2JhYmVsZC8wMDAxLUZp
eC1jb21waWxhdGlvbi1lcnJvci1vbi1saW51eC5wYXRjaCBiL3BhY2thZ2UvYmFiZWxkLzAwMDEt
Rml4LWNvbXBpbGF0aW9uLWVycm9yLW9uLWxpbnV4LnBhdGNoCm5ldyBmaWxlIG1vZGUgMTAwNjQ0
CmluZGV4IDAwMDAwMDAwMDAwMC4uNDFmZjgzNGVjZjEyCi0tLSAvZGV2L251bGwKKysrIGIvcGFj
a2FnZS9iYWJlbGQvMDAwMS1GaXgtY29tcGlsYXRpb24tZXJyb3Itb24tbGludXgucGF0Y2gKQEAg
LTAsMCArMSwzNiBAQAorRnJvbSBhN2Y4MDczNDlkY2MzMjk3NDczZDhkZGMwMzEyMDZiMjkxMmY3
MzAxIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbTogRGFyaW8gQmluYWNjaGkgPGRhcmlv
LmJpbmFjY2hpQGFtYXJ1bGFzb2x1dGlvbnMuY29tPgorRGF0ZTogVHVlLCAxNyBTZXAgMjAyNCAy
MTo0ODowMSArMDIwMAorU3ViamVjdDogW1BBVENIXSBGaXggY29tcGlsYXRpb24gZXJyb3Igb24g
bGludXgKKworVGhpcyBwYXRjaCBmaXhlcyB0aGUgZm9sbG93aW5nIGNvbXBpbGF0aW9uIGVycm9y
IHJhaXNlZCBieSB0aGUgYnVtcCB0bwordmVyc2lvbiAxLjEzLjEgaW4gQnVpbGRyb290OgorCitu
ZXQuYzogSW4gZnVuY3Rpb24gJ2JhYmVsX3NlbmQnOgorbmV0LmM6MTk5OjI3OiBlcnJvcjogJ0lQ
VjZfRE9OVEZSQUcnIHVuZGVjbGFyZWQgKGZpcnN0IHVzZSBpbiB0aGlzIGZ1bmN0aW9uKQorICAx
OTkgfCAgICAgICAgIGNtc2ctPmNtc2dfdHlwZSA9IElQVjZfRE9OVEZSQUc7OworCitTaWduZWQt
b2ZmLWJ5OiBEYXJpbyBCaW5hY2NoaSA8ZGFyaW8uYmluYWNjaGlAYW1hcnVsYXNvbHV0aW9ucy5j
b20+CitVcHN0cmVhbTogaHR0cHM6Ly9naXRodWIuY29tL2plY2gvYmFiZWxkL3B1bGwvMTIxCist
LS0KKyBuZXQuYyB8IDQgKysrKworIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykKKwor
ZGlmZiAtLWdpdCBhL25ldC5jIGIvbmV0LmMKK2luZGV4IDdhN2I1Nzg0NGU2Yy4uODIyMTEyMjk5
ZmQ4IDEwMDY0NAorLS0tIGEvbmV0LmMKKysrKyBiL25ldC5jCitAQCAtMzcsNiArMzcsMTAgQEAg
VEhFIFNPRlRXQVJFLgorICNpbmNsdWRlIDxhcnBhL2luZXQuaD4KKyAjaW5jbHVkZSA8ZXJybm8u
aD4KKyAKKysjaWYgZGVmaW5lZChfX2xpbnV4KQorKyNpbmNsdWRlIDxsaW51eC9pbjYuaD4KKysj
ZW5kaWYKKysKKyAjaW5jbHVkZSAiYmFiZWxkLmgiCisgI2luY2x1ZGUgInV0aWwuaCIKKyAjaW5j
bHVkZSAibmV0LmgiCistLSAKKzIuNDMuMAorCmRpZmYgLS1naXQgYS9wYWNrYWdlL2JhYmVsZC9i
YWJlbGQuaGFzaCBiL3BhY2thZ2UvYmFiZWxkL2JhYmVsZC5oYXNoCmluZGV4IDNlYjVkMjIwODE1
My4uYWIyZmZjNmVmODExIDEwMDY0NAotLS0gYS9wYWNrYWdlL2JhYmVsZC9iYWJlbGQuaGFzaAor
KysgYi9wYWNrYWdlL2JhYmVsZC9iYWJlbGQuaGFzaApAQCAtMSwzICsxLDMgQEAKICMgTG9jYWxs
eSBjb21wdXRlZAotc2hhMjU2ICBkMDg1Y2NjY2ZiMDZhMTFkN2ZhNWI1NGM1MWQ5YzQxMGY1ZjNi
MGE5Mzg5ZjU4NDk1MTMzNmZmMTc4ZjI5M2I4ICBiYWJlbGQtMS4xMy50YXIuZ3oKK3NoYTI1NiAg
MTVmMjRkMjZkYTBjY2ZjMDczYWJjZGVmMDMwOWYyODFlNDY4NGYyYWE3MTEyNmY4MjY1NzJjNGM4
NDVlOGRkOSAgYmFiZWxkLTEuMTMuMS50YXIuZ3oKIHNoYTI1NiAgYjQxNWM0MTI5MmNlZGVmNmM5
N2IyNDM2MDllNTA1NTI4ODdjMjkzNDM1NjZjNjM5ZjIzMjgyZDMxZWZkMmFmZCAgTElDRU5DRQpk
aWZmIC0tZ2l0IGEvcGFja2FnZS9iYWJlbGQvYmFiZWxkLm1rIGIvcGFja2FnZS9iYWJlbGQvYmFi
ZWxkLm1rCmluZGV4IDY3ZmY1NTNiOGJlZC4uZTlkMjAxMTFmOTNkIDEwMDY0NAotLS0gYS9wYWNr
YWdlL2JhYmVsZC9iYWJlbGQubWsKKysrIGIvcGFja2FnZS9iYWJlbGQvYmFiZWxkLm1rCkBAIC00
LDcgKzQsNyBAQAogIwogIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKIAotQkFCRUxEX1ZFUlNJT04g
PSAxLjEzCitCQUJFTERfVkVSU0lPTiA9IDEuMTMuMQogQkFCRUxEX1NJVEUgPSBodHRwczovL3d3
dy5pcmlmLmZyL35qY2gvc29mdHdhcmUvZmlsZXMKIEJBQkVMRF9MSUNFTlNFID0gTUlUCiBCQUJF
TERfTElDRU5TRV9GSUxFUyA9IExJQ0VOQ0UKLS0gCjIuNDMuMAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWls
ZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9idWlsZHJvb3QK
