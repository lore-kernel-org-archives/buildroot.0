Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A89C4C30653
	for <buildroot@archiver.kernel.org>; Thu,  4 Jul 2024 19:53:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 16BFE812C3;
	Thu,  4 Jul 2024 19:53:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o2Fh82U5my_j; Thu,  4 Jul 2024 19:53:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8155B847BD
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8155B847BD;
	Thu,  4 Jul 2024 19:53:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B2A6A1BF2C1
 for <buildroot@lists.busybox.net>; Thu,  4 Jul 2024 19:53:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9F516404C5
 for <buildroot@lists.busybox.net>; Thu,  4 Jul 2024 19:53:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3i_oxaKMANcC for <buildroot@lists.busybox.net>;
 Thu,  4 Jul 2024 19:53:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.22;
 helo=mout.gmx.net; envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E861F4042E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E861F4042E
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E861F4042E
 for <buildroot@buildroot.org>; Thu,  4 Jul 2024 19:53:15 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from probook ([89.0.46.161]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M6lpG-1sUNfT34sI-008xbF; Thu, 04
 Jul 2024 21:53:13 +0200
Date: Thu, 04 Jul 2024 21:53:11 +0200
MIME-Version: 1.0
Message-Id: <20240704-s6-multicall-v1-2-b6adb2bd0905@gmx.net>
References: <20240704-s6-multicall-v1-0-b6adb2bd0905@gmx.net>
In-Reply-To: <20240704-s6-multicall-v1-0-b6adb2bd0905@gmx.net>
To: buildroot@buildroot.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720122792; l=1526;
 i=j.neuschaefer@gmx.net; s=20240329; h=from:subject:message-id;
 bh=VCkz6VAyWbEQcQLhGiOvkSju/gm9ZKVm4pfqGs9cyRY=;
 b=nr0iVqT7H9I/9UfWJ04pcOGBwh6qZxXd244Q0MhVtXTGIYTZdj5nOC1vzF0JF7HLxBBgxQuIV
 9+++YJtEqVMC8rHlRWFMtWwRzszNHl40JcqtJi+J+WVvP1kC+BjQ4+o
X-Developer-Key: i=j.neuschaefer@gmx.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Provags-ID: V03:K1:QlxrHahfAwdeVmjGPkzyNhqUYxQano17MGrsiF9OtWjQ0lKCapb
 IuYnxgf5eRIO7ew6ugjI0kO+8+vwlrRTSol5qD3dsW2nDm+GRuNcEulaBx+RabnEoAMrKmf
 jwh9+w52FOOqNbUzjct9Bkh7NFRbpa2jp1PTqEbAHSNDbeLcsiBxtDxBU6r2R1CGpiZU0Mm
 3ztAsvYG3Q5V1uUWDjBBQ==
UI-OutboundReport: notjunk:1;M01:P0:JXLtjbTNpO8=;vBs9uH+TpMEg/AJ2yGIS1Zr5I1t
 jksmUdf4zY/PhBi0ACTOhvvicCr2L6KXgtrGWvMfOI43cGZaf/tKDp3ta76siBpJ+bBRlFXuY
 bdHxsd2szBTzKVEWkWXOE1nPjpMBN1OqTOKwNNcHHk0NRLQ3l7JDcpp+FxqpVgfPSkwN+AmMm
 D+ipGchF5LHtGASQ5SaHjUGOg85XdIwg0zvSofxWRmfF0loRJF+vVXxeZJvX6hv9e3QGkQ92O
 XoLQapoN9UxQqH2emu8hQE9vUXATecjc9TywrgrC4wQTjGMoccq7rwyj3f+XPXkjF8s4ApqP+
 EGjCXHzyrHHa60+nS4nksiQ9OJuIT2xsE+TNupR34iWhWuUUiSt/r9geYkTiNELjbRrYcNYDO
 DLDUmtxveegDrZNR0K4XMMGkLP80o7nKacs4W+UcFbfW3PykqxMmkIJbLMij4X7VeVjwdCuBl
 28pf6TNI99smuHEVXc/1zQHCpzGzicKfN7HWtIKJnaLkqp6r/GC0lNeTgtfBsvpYJc1LD6Hwg
 uFUui0GXLyAXhzBPvluh7eQkqw6ENVKMI22b9ugEnKRJ+XRwdwVjx+EcWrsZxFITHLQK8DIhP
 mTj4fygg1EvXNSgwlqKK3TFKu2Z76jCuEremO9lg89kifIEGeH89WqPbLmW7lPcoC1qNyJVgY
 VGPplhPPANqIwy9qB4s6AL0VDJeAdoAHfiQreiKwlhl1JeYFIv1P5BOtHKGA0nmiT9MZX9EPD
 V+zGMG3clkDOLnfpZF2vbKoEjBU2mFakLtHaqsBZMlXPafzqy0MQNQtyREFh3kvSKrWLR7KYH
 QvqrX/exbzELFOWnV84yzYyIZcV5Dzegme0RpKXeuL66Y=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.net; 
 s=s31663417; t=1720122793; x=1720727593; i=j.neuschaefer@gmx.net;
 bh=khtSk/Vu+N8B/a69NupOh9elyTZlCI+1hzvTHhXENoA=;
 h=X-UI-Sender-Class:From:Date:Subject:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=Fc9ZsQTfZj261+dRbdHWYk4RGfqaNp5EKoIMJ5gpIMW3xL2c/WsPWc8rFss213PL
 PVZNxnDsIE7T4i4Cwu8MB85EUDfrshLbG6J3hkW52XBzypW6SzeZA+MS7dlNSq10w
 lvr7shL1dt6G3+xs9F5povgcGQ4CbGVPDbIcxVkJD5///ZnFsH+LgMQ5CgHNr4XDd
 yFnuWgpti7Tft4of0pJb6sw6Mb5pkNbZ/bAXKcPRO7LupXWbNn90C9J56uCpD29jz
 oYpoFHwsaT8c6KzaAId/VWQ1XtgipcYTm7jzVrH5UC/xcAe8lrxUhdbO6wRYhaDic
 GpXBHASWPr5H/A85fw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.net header.i=j.neuschaefer@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=Fc9ZsQTf
Subject: [Buildroot] [PATCH 2/3] s6-portable-utils: Add option to build
 multicall binary
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
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_buildroot?= <buildroot@buildroot.org>
Reply-To: =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Cc: =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

U2luY2UgdmVyc2lvbiAyLjMuMC4wLCB3aXRoIGFub3RoZXIgYnVnZml4IGluIDIuMy4wLjMsIHM2
LXBvcnRhYmxlLXV0aWxzCmNhbiBiZSBidWlsdCBhcyBhIG11bHRpY2FsbCBiaW5hcnksIHNpbWls
YXIgdG8gYnVzeWJveC4KClNpZ25lZC1vZmYtYnk6IEouIE5ldXNjaMOkZmVyIDxqLm5ldXNjaGFl
ZmVyQGdteC5uZXQ+Ci0tLQogcGFja2FnZS9zNi1wb3J0YWJsZS11dGlscy9Db25maWcuaW4gICAg
ICAgICAgICB8IDkgKysrKysrKysrCiBwYWNrYWdlL3M2LXBvcnRhYmxlLXV0aWxzL3M2LXBvcnRh
YmxlLXV0aWxzLm1rIHwgMSArCiAyIGZpbGVzIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKykKCmRp
ZmYgLS1naXQgYS9wYWNrYWdlL3M2LXBvcnRhYmxlLXV0aWxzL0NvbmZpZy5pbiBiL3BhY2thZ2Uv
czYtcG9ydGFibGUtdXRpbHMvQ29uZmlnLmluCmluZGV4IDg1MjFlY2ZhOGEuLmJhOTU0NzY3Nzcg
MTAwNjQ0Ci0tLSBhL3BhY2thZ2UvczYtcG9ydGFibGUtdXRpbHMvQ29uZmlnLmluCisrKyBiL3Bh
Y2thZ2UvczYtcG9ydGFibGUtdXRpbHMvQ29uZmlnLmluCkBAIC0xMCwzICsxMCwxMiBAQCBjb25m
aWcgQlIyX1BBQ0tBR0VfUzZfUE9SVEFCTEVfVVRJTFMKIAkgIHRoZXkgd29yayBldmVyeXdoZXJl
LgoKIAkgIGh0dHA6Ly9za2FybmV0Lm9yZy9zb2Z0d2FyZS9zNi1wb3J0YWJsZS11dGlscy8KKwor
aWYgQlIyX1BBQ0tBR0VfUzZfUE9SVEFCTEVfVVRJTFMKKworY29uZmlnIEJSMl9QQUNLQUdFX1M2
X1BPUlRBQkxFX1VUSUxTX01VTFRJQ0FMTAorCWJvb2wgInM2LXBvcnRhYmxlLXV0aWxzIG11bHRp
Y2FsbCBiaW5hcnkiCisJaGVscAorCSAgQnVpbGQgczYtcG9ydGFibGUtdXRpbHMgYXMgYSBtdWx0
aWNhbGwgYmluYXJ5IHRvIHNhdmUgZGlzayBzcGFjZS4KKworZW5kaWYKZGlmZiAtLWdpdCBhL3Bh
Y2thZ2UvczYtcG9ydGFibGUtdXRpbHMvczYtcG9ydGFibGUtdXRpbHMubWsgYi9wYWNrYWdlL3M2
LXBvcnRhYmxlLXV0aWxzL3M2LXBvcnRhYmxlLXV0aWxzLm1rCmluZGV4IGM0MDEwMGIwNmMuLjgy
Njc1MGYzODcgMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvczYtcG9ydGFibGUtdXRpbHMvczYtcG9ydGFi
bGUtdXRpbHMubWsKKysrIGIvcGFja2FnZS9zNi1wb3J0YWJsZS11dGlscy9zNi1wb3J0YWJsZS11
dGlscy5tawpAQCAtMTcsNiArMTcsNyBAQCBTNl9QT1JUQUJMRV9VVElMU19DT05GX09QVFMgPSBc
CiAJLS13aXRoLWR5bmxpYj0kKFNUQUdJTkdfRElSKS9saWIgXAogCS0td2l0aC1saWI9JChTVEFH
SU5HX0RJUikvbGliL3NrYWxpYnMgXAogCSQoaWYgJChCUjJfU1RBVElDX0xJQlMpLCwtLWRpc2Fi
bGUtYWxsc3RhdGljKSBcCisJJChpZiAkKEJSMl9QQUNLQUdFX1M2X1BPUlRBQkxFX1VUSUxTX01V
TFRJQ0FMTCksLS1lbmFibGUtbXVsdGljYWxsLCkgXAogCSQoU0hBUkVEX1NUQVRJQ19MSUJTX09Q
VFMpCgogZGVmaW5lIFM2X1BPUlRBQkxFX1VUSUxTX0NPTkZJR1VSRV9DTURTCgotLQoyLjQzLjAK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9v
dCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWls
ZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
