Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C86DC52D7C
	for <buildroot@archiver.kernel.org>; Sun, 11 Aug 2024 10:01:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4F52A40589;
	Sun, 11 Aug 2024 10:01:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fL-vmmikPx6O; Sun, 11 Aug 2024 10:01:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6A9804055D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6A9804055D;
	Sun, 11 Aug 2024 10:01:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 188731BF2AA
 for <buildroot@lists.busybox.net>; Sun, 11 Aug 2024 10:01:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 055E24027D
 for <buildroot@lists.busybox.net>; Sun, 11 Aug 2024 10:01:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jO_Yqp_VAYJO for <buildroot@lists.busybox.net>;
 Sun, 11 Aug 2024 10:01:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.22;
 helo=mout.gmx.net; envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6DB5140129
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6DB5140129
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6DB5140129
 for <buildroot@buildroot.org>; Sun, 11 Aug 2024 10:01:24 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from probook ([89.0.46.195]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MFsYx-1sPeiG3byx-00EPS8; Sun, 11
 Aug 2024 12:01:19 +0200
Date: Sun, 11 Aug 2024 12:01:12 +0200
MIME-Version: 1.0
Message-Id: <20240811-s6-multicall-v2-2-14249fd20cbd@gmx.net>
References: <20240811-s6-multicall-v2-0-14249fd20cbd@gmx.net>
In-Reply-To: <20240811-s6-multicall-v2-0-14249fd20cbd@gmx.net>
To: buildroot@buildroot.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1723370475; l=1526;
 i=j.neuschaefer@gmx.net; s=20240329; h=from:subject:message-id;
 bh=VCkz6VAyWbEQcQLhGiOvkSju/gm9ZKVm4pfqGs9cyRY=;
 b=tjPYFQvpT9MM0SIfijV+n9StsRXByP1qSgFrN4lwjsD5OIscXnDKXqJrKpiMQ/c/Jebg4WXr7
 RbbX6Sh+vE0BMYooIqjHm/nWDiaKz/ONFDLIXFwszw7p7XmO2A5mknE
X-Developer-Key: i=j.neuschaefer@gmx.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Provags-ID: V03:K1:jz9+5MkSDJzm/01lr5vIZSpT0xZ+r1pQi4PdcCW6xnTjSmrQLcJ
 OzGOaX6ta/mjUTGrBlpJ0T5dUnpEApTpq5P95jOm11pW9W0mTU1u6Tk3qoujYsQJLz5NRT5
 VSmu72R8oeZWz6ek6A+WueX1890XoDAzakBB2K/7ieky6C3R0IVqwTtwzrFQYNGZ/kzhiGG
 A7HFS3h7nMvd49irqDl9Q==
UI-OutboundReport: notjunk:1;M01:P0:Ei0EB24GvXY=;4C2kSovTCQ9MmrMxjKjE/EOj3nc
 U5W4an2ycv3sa/3UGOZhiT9RU0qngzvIyJhyvtYqaswOhGSoGR67LIiwRsOh3L+1A+dCSX9xz
 Y/BNhybWUx2WAbUplHN7aLjkMnzyFxNlKGBCLbxutmWpR58i/vZEWxuDjSLuTMepOljLEJocV
 ScePWnJzaSxL9ifBOzpMZhL71tPEgp2p79DVzTL5olqwY5dEs3tBAaglW8TC2OExQxgdRnOg6
 oIyWDTYytn1Dy/iTxYwmNiPj8LfQ/n36A/iSEnSz/ohZyrccy5rLUN5YKkbknVhIpVQPn08ms
 7ieGMAr/syjfkolsPmPtVqFpI1DM26UJHDUtWh5rv8QxO5uP99ccNUyHUe/CftKg5GiIonYO1
 aD2AWqzE2RmZk6P0Gjqkv321JgQJd95eNH9jTflKW1XlqnSqN83+rbBvFHbUiDBSAhfGGtfQo
 rBMgZWW1klHHIHOq9FjLOGhY8pSVizFjH51aSFdSzXpOcWkVv7sUgS68LR0bRXURBJS4R/e2H
 WjnFVAEVmO6Qim6WgDnsAJ9gvy+a4YCNgp4ETkQKhbG+Y8iwFWKwRUsSUf5GktFpLWXagDs82
 4BqYOsA2LyTlLMO0d+xuLIu0D/3A/tdR7EpDYEyEaf07MsZbgqEhA6T+AUl3tz+2PNxRMHcY+
 h1X9hJBRGFKN9iHxzryaeJ5DjCDS3dj+Tyh0NG+IGNlVSoX7wJRS5Qb6v2s/PlPtkvQijAoTQ
 bDBSNvkrFT2jRHqkPTM8U4T6xEMVFz3GbVctbDXy1n9419np8/XVVqDu3MpvAUpN8Y8WPscgC
 1Pt0wPuh2KuslAbdbbQfoPNA==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.net; 
 s=s31663417; t=1723370480; x=1723975280; i=j.neuschaefer@gmx.net;
 bh=khtSk/Vu+N8B/a69NupOh9elyTZlCI+1hzvTHhXENoA=;
 h=X-UI-Sender-Class:From:Date:Subject:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=qdtHg/1HSmk8+oX44gO0vriNg0rJRBgQQRI+uoPVnLG0GIBD4JV+fl5yea9cYCld
 rYMqWO+w3vUisMz02t0CDB04Phh1dGFZ8I2L58SNL/G7wnNmeX65FpNkfNqnXNhyX
 cCdtPt7BjSB62T4W1SEsMHK0Xmx5qElwFM5Y0Dl3ALRzdbOKsvAWPPAm64+pGxy+M
 sxEtIJOZDfNAPk7Io7OZ8codE2ZQaW9XAaTjUPW9kLymJht2z7O6SQWj/t/xu1qlk
 Ph1GEzcNLl0m4fz0NDc9YdmPFl29GZC/uvWxM879j+TWhPXPSXEr0NqP6iKanlt5S
 NIKSzy4W0BdScDXGbA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.net header.i=j.neuschaefer@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=qdtHg/1H
Subject: [Buildroot] [PATCH v2 2/4] package/s6-portable-utils: Add option to
 build multicall binary
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
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
