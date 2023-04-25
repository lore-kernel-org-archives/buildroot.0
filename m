Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EF5DC77B73
	for <buildroot@archiver.kernel.org>; Tue, 25 Apr 2023 07:09:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BBE5D4016C;
	Tue, 25 Apr 2023 07:09:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BBE5D4016C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UKEWXovQGlCn; Tue, 25 Apr 2023 07:09:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DFEC24045C;
	Tue, 25 Apr 2023 07:09:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DFEC24045C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 94F911BF330
 for <buildroot@lists.busybox.net>; Tue, 25 Apr 2023 07:09:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6E29C81E30
 for <buildroot@lists.busybox.net>; Tue, 25 Apr 2023 07:09:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6E29C81E30
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ERSTaY0XYfwp for <buildroot@lists.busybox.net>;
 Tue, 25 Apr 2023 07:09:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D867181A16
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D867181A16
 for <buildroot@buildroot.org>; Tue, 25 Apr 2023 07:09:30 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-94f3df30043so842418866b.2
 for <buildroot@buildroot.org>; Tue, 25 Apr 2023 00:09:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682406569; x=1684998569;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=I8cIZiN73hoQhmSIC4Vf+DQLhBuzoJ3JXQdvAkFyAzc=;
 b=WZMVPbRxD2S7ZuOx9EmtMcOjyHtFX/7TJaYiXQvm5u4JOgxLvJDS22Gp+5V11oVm7i
 0IoN3Dxts9eyftbvpWs5WxdrsPbNPsiHnpdHvFK2mGK+wHuqH1k9gAa3iQpyAIkTOoTY
 jGNGdS3iTgsWMAO54LpuawUCRXvKoum/DUwYR9vsHT3TvKMk91pc0uuzsueb4kIJY3FF
 SP2ScODeB33o5yHu+DX7fuK1SUYguur7sz56DbReefe20ZCaYeE5lNNrtxAegM08VJAA
 95M7IS6pey+d5sGyoBkgI02m0ru8Q2uFSJW6yDbh0PNXNxWJ9mvTZ7YPTLMXdNa+LfWG
 IYHA==
X-Gm-Message-State: AAQBX9dpEn/4OHkbP9ltMGUIxbk304+bPKwJynIITSjBmo2b2yqDMjCJ
 br5J9FVXfQcf+lJ4ckZCPmRxzPAd6E+xR2sKWCZDpw==
X-Google-Smtp-Source: AKy350bUbe53X0VK+R2LqFXgrpfDbNxbPcbKBOoyTE1FUF0H6n/Hapa/NXPm7/4RVYAFNjHqlTBDMg==
X-Received: by 2002:a17:906:7c41:b0:956:fdb6:bc77 with SMTP id
 g1-20020a1709067c4100b00956fdb6bc77mr11633625ejp.30.1682406568875; 
 Tue, 25 Apr 2023 00:09:28 -0700 (PDT)
Received: from localhost.localdomain (ip-188-118-3-185.reverse.destiny.be.
 [188.118.3.185]) by smtp.gmail.com with ESMTPSA id
 he12-20020a1709073d8c00b00953951ec91fsm6324395ejc.137.2023.04.25.00.09.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Apr 2023 00:09:28 -0700 (PDT)
From: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
To: buildroot@buildroot.org
Date: Tue, 25 Apr 2023 09:09:22 +0200
Message-Id: <20230425070923.1294644-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1682406569; x=1684998569;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=I8cIZiN73hoQhmSIC4Vf+DQLhBuzoJ3JXQdvAkFyAzc=;
 b=FjPUfrwIel6bCu2dMkkFJ72cfZvbBNpOI5YcM7LUGNeYvDLwipAWLG9N74YfjF9mVo
 s/4Gc4xwcu21vJRBR60RbaGSVoLraHZjoE26iEhCrMSIViwquMP0tbSwR5/261ROI0rp
 Q5IKnvWPnDmD1JgjaQLE4Lp6usRUy6aicgMcnkvj3dWT0nxgs7djWfIF3nPNb2DsGmx5
 BjsC/qlivE+ADlMX0ybK9kUZ/mijQp2rsPdW8xEwk/m1dfoQqn6BA9akXJSC5+f7jYm/
 yt9SotHmgXNLjQzXpWOXZw0B5vFfo9i7TDQ86wFX9m+/MWaxOukiIEie0w2yK3pKwfd5
 Efow==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=FjPUfrwI
Subject: [Buildroot] [PATCH 1/1] package/mupdf: fix building with zlib-ng
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
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhlIGN1cnJlbnQgbXVwZGYgdmVyc2lvbiBmYWlscyB0byBidWlsZCB3aGVuIHpsaWItbmcgaXMg
dXNlZCBhcyB0aGUKemxpYiBpbXBsZW1lbnRhdGlvbi4gQWRkIGEgcGF0Y2ggdG8gZml4IGl0LgoK
VGhpcyBmaXhlcyB0aGUgZm9sbG93aW5nIGJ1aWxkIGZhaWx1cmUgcmFpc2VkIHNpbmNlIHRoZSBi
dW1wIHRvCnZlcnNpb24gMS4yMS4wIG9mIHRoZSBtdXBkZiBwYWNrYWdlIGluIGNvbW1pdAozYzIw
MzNjZDJhY2UwNzdlN2RmYWY1OGEyNTg5YjJhOTNhNWZkN2IwOgoKc291cmNlL2ZpdHovZW5jb2Rl
LWJhc2ljLmM6IEluIGZ1bmN0aW9uICdkZWZsYXRlX3dyaXRlJzoKc291cmNlL2ZpdHovZW5jb2Rl
LWJhc2ljLmM6MzQzOjI3OiBlcnJvcjogJ1VJTlRfTUFYJyB1bmRlY2xhcmVkIChmaXJzdCB1c2Ug
aW4gdGhpcyBmdW5jdGlvbikKICAzNDMgfCAgICAgICAgIG5ld2J1ZnNpemUgPSBuID49IFVJTlRf
TUFYID8gVUlOVF9NQVggOiBkZWZsYXRlQm91bmQoJnN0YXRlLT56LCBuKTsKICAgICAgfCAgICAg
ICAgICAgICAgICAgICAgICAgICAgIF5+fn5+fn5+CnNvdXJjZS9maXR6L2VuY29kZS1iYXNpYy5j
OjI2OjE6IG5vdGU6ICdVSU5UX01BWCcgaXMgZGVmaW5lZCBpbiBoZWFkZXIgJzxsaW1pdHMuaD4n
OyBkaWQgeW91IGZvcmdldCB0byAnI2luY2x1ZGUgPGxpbWl0cy5oPic/CgpGaXhlczogaHR0cDov
L2F1dG9idWlsZC5idWlsZHJvb3QubmV0L3Jlc3VsdHMvODcxMjhlOTk2N2NmZjIwMDc4YzY1YWI4
NDc4NzdhYTQ0Y2M0MDlkOQoKU2lnbmVkLW9mZi1ieTogUmFwaGHDq2wgTcOpbG90dGUgPHJhcGhh
ZWwubWVsb3R0ZUBtaW5kLmJlPgotLS0KIC4uLmlzc2luZy1saW1pdHMuaC1pbmNsdWRlLWZvci1V
SU5UX01BWC5wYXRjaCB8IDcwICsrKysrKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA3
MCBpbnNlcnRpb25zKCspCiBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9tdXBkZi8wMDAxLUFk
ZC1taXNzaW5nLWxpbWl0cy5oLWluY2x1ZGUtZm9yLVVJTlRfTUFYLnBhdGNoCgpkaWZmIC0tZ2l0
IGEvcGFja2FnZS9tdXBkZi8wMDAxLUFkZC1taXNzaW5nLWxpbWl0cy5oLWluY2x1ZGUtZm9yLVVJ
TlRfTUFYLnBhdGNoIGIvcGFja2FnZS9tdXBkZi8wMDAxLUFkZC1taXNzaW5nLWxpbWl0cy5oLWlu
Y2x1ZGUtZm9yLVVJTlRfTUFYLnBhdGNoCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAw
MDAwMDAuLjk1ZjJmODY2NjYKLS0tIC9kZXYvbnVsbAorKysgYi9wYWNrYWdlL211cGRmLzAwMDEt
QWRkLW1pc3NpbmctbGltaXRzLmgtaW5jbHVkZS1mb3ItVUlOVF9NQVgucGF0Y2gKQEAgLTAsMCAr
MSw3MCBAQAorRnJvbSBlYmNlOWYxYjEyOWViYzhmMmIxN2FmYTAyYTRmZmNiOTQ1M2MxMWQ5IE1v
biBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbTogPT9VVEYtOD9xP1JhcGhhPUMzPUFCbD0yME09
QzM9QTlsb3R0ZT89IDxyYXBoYWVsLm1lbG90dGVAbWluZC5iZT4KK0RhdGU6IE1vbiwgMjQgQXBy
IDIwMjMgMTc6Mjc6MzUgKzAyMDAKK1N1YmplY3Q6IFtQQVRDSF0gQWRkIG1pc3NpbmcgbGltaXRz
LmggaW5jbHVkZSBmb3IgVUlOVF9NQVgKK01JTUUtVmVyc2lvbjogMS4wCitDb250ZW50LVR5cGU6
IHRleHQvcGxhaW47IGNoYXJzZXQ9VVRGLTgKK0NvbnRlbnQtVHJhbnNmZXItRW5jb2Rpbmc6IDhi
aXQKKworZW5jb2RlLWJhc2ljLmMgdXNlcyAnVUlOVF9NQVgnLCB3aGljaCBpcyBhdmFpbGFibGUg
aW4gdGhlICdsaW1pdHMuaCcKK2hlYWRlci4KKworSW4gc29tZSBjb25maWd1cmF0aW9ucyB0aGF0
IGJ1aWxkIHdpdGggemxpYiBmcm9tIFsxXSwgYnkgY2hhbmNlCitsaW1pdHMuaCBnZXRzIGluZGly
ZWN0bHkgaW5jbHVkZWQgd2hlbiBpbmNsdWRpbmcgJ3otaW1wLmgnICh0aGUKK2luY2x1ZGVzIGFy
ZTogJ3otaW1wLmgnIC0+ICd6bGliLmgnIC0+ICd6Y29uZi5oJyAtPiAnbGltaXRzLmgnKSwgc28K
K3RoZSBidWlsZCBzdWNjZWVkcy4KKworV2hlbiB1c2luZyBvdGhlciB6bGliIGltcGxlbWVudGF0
aW9ucyBob3dldmVyIChmb3IgZXhhbXBsZSBmcm9tIFsyXSksCitsaW1pdHMuaCBpcyBub3QgbmVj
ZXNzYXJpbHkgaW5jbHVkZWQgaW5kaXJlY3RseSwgd2hpY2ggbGVhZHMgdG8gdGhlCitidWlsZCBm
YWlsaW5nIGluIHRoZSBmb2xsb3dpbmcgd2F5OgorCitzb3VyY2UvZml0ei9lbmNvZGUtYmFzaWMu
YzogSW4gZnVuY3Rpb24gJ2RlZmxhdGVfd3JpdGUnOgorc291cmNlL2ZpdHovZW5jb2RlLWJhc2lj
LmM6MzQzOjI3OiBlcnJvcjogJ1VJTlRfTUFYJyB1bmRlY2xhcmVkIChmaXJzdCB1c2UgaW4gdGhp
cyBmdW5jdGlvbikKKyAgMzQzIHwgICAgICAgICBuZXdidWZzaXplID0gbiA+PSBVSU5UX01BWCA/
IFVJTlRfTUFYIDogZGVmbGF0ZUJvdW5kKCZzdGF0ZS0+eiwgbik7CisgICAgICB8ICAgICAgICAg
ICAgICAgICAgICAgICAgICAgXn5+fn5+fn4KK3NvdXJjZS9maXR6L2VuY29kZS1iYXNpYy5jOjI2
OjE6IG5vdGU6ICdVSU5UX01BWCcgaXMgZGVmaW5lZCBpbiBoZWFkZXIgJzxsaW1pdHMuaD4nOyBk
aWQgeW91IGZvcmdldCB0byAnI2luY2x1ZGUgPGxpbWl0cy5oPic/CisKK0FkZCB0aGUgbWlzc2lu
ZyBpbmNsdWRlLCBzbyB0aGF0IHRoZSBidWlsZCBzdWNjZWVkcyBubyBtYXR0ZXIgaWYgemxpYgor
aW5kaXJlY3RseSBpbmNsdWRlcyAnbGltaXQuaCcgb3Igbm90LgorCitTaW1pbGFybHksIGFsc28g
YWRkIGl0IGluIG91dHB1dC1wcy5jIHdoZXJlIGl0J3MgYWxzbyBtaXNzaW5nLgorCitbMV06IGh0
dHBzOi8vemxpYi5uZXQvCitbMl06IGh0dHBzOi8vZ2l0aHViLmNvbS96bGliLW5nL3psaWItbmcK
KworU2lnbmVkLW9mZi1ieTogUmFwaGHDq2wgTcOpbG90dGUgPHJhcGhhZWwubWVsb3R0ZUBtaW5k
LmJlPgorVXBzdHJlYW06IGh0dHBzOi8vYnVncy5naG9zdHNjcmlwdC5jb20vc2hvd19idWcuY2dp
P2lkPTcwNjY2NworLS0tCisgc291cmNlL2ZpdHovZW5jb2RlLWJhc2ljLmMgfCAyICsrCisgc291
cmNlL2ZpdHovb3V0cHV0LXBzLmMgICAgfCAyICsrCisgMiBmaWxlcyBjaGFuZ2VkLCA0IGluc2Vy
dGlvbnMoKykKKworZGlmZiAtLWdpdCBhL3NvdXJjZS9maXR6L2VuY29kZS1iYXNpYy5jIGIvc291
cmNlL2ZpdHovZW5jb2RlLWJhc2ljLmMKK2luZGV4IDAzYTRmZjc2Yi4uODRmMGMzNWU2IDEwMDY0
NAorLS0tIGEvc291cmNlL2ZpdHovZW5jb2RlLWJhc2ljLmMKKysrKyBiL3NvdXJjZS9maXR6L2Vu
Y29kZS1iYXNpYy5jCitAQCAtMjQsNiArMjQsOCBAQAorIAorICNpbmNsdWRlICJ6LWltcC5oIgor
IAorKyNpbmNsdWRlIDxsaW1pdHMuaD4KKysKKyBzdHJ1Y3QgYWh4CisgeworIAlmel9vdXRwdXQg
KmNoYWluOworZGlmZiAtLWdpdCBhL3NvdXJjZS9maXR6L291dHB1dC1wcy5jIGIvc291cmNlL2Zp
dHovb3V0cHV0LXBzLmMKK2luZGV4IGVmMjJjM2NkNi4uM2RjOGVhMTdkIDEwMDY0NAorLS0tIGEv
c291cmNlL2ZpdHovb3V0cHV0LXBzLmMKKysrKyBiL3NvdXJjZS9maXR6L291dHB1dC1wcy5jCitA
QCAtMjQsNiArMjQsOCBAQAorIAorICNpbmNsdWRlICJ6LWltcC5oIgorIAorKyNpbmNsdWRlIDxs
aW1pdHMuaD4KKysKKyB0eXBlZGVmIHN0cnVjdCBwc19iYW5kX3dyaXRlcl9zCisgeworIAlmel9i
YW5kX3dyaXRlciBzdXBlcjsKKy0tIAorMi4zOS4xCisKLS0gCjIuMzkuMQoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlz
dApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFp
bG1hbi9saXN0aW5mby9idWlsZHJvb3QK
