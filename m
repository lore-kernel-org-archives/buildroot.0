Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6CC2C3271F
	for <buildroot@archiver.kernel.org>; Thu,  4 Jul 2024 19:40:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 930088471E;
	Thu,  4 Jul 2024 19:40:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rGQvWO0As9_a; Thu,  4 Jul 2024 19:40:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7EF468475B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7EF468475B;
	Thu,  4 Jul 2024 19:40:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 399D01BF2C1
 for <buildroot@lists.busybox.net>; Thu,  4 Jul 2024 19:40:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 348FB6085C
 for <buildroot@lists.busybox.net>; Thu,  4 Jul 2024 19:40:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bGm6neon0saq for <buildroot@lists.busybox.net>;
 Thu,  4 Jul 2024 19:40:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.22;
 helo=mout.gmx.net; envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0E9C360742
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0E9C360742
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0E9C360742
 for <buildroot@buildroot.org>; Thu,  4 Jul 2024 19:40:39 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from probook ([89.0.46.161]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N1wll-1sIsmq0WYj-00xEH9; Thu, 04
 Jul 2024 21:40:37 +0200
Date: Thu, 04 Jul 2024 21:40:26 +0200
Message-Id: <20240704-tipidee-v1-0-5ef0942b2025@gmx.net>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAKr6hmYC/x3MQQqAIBBG4avIrBNGEYSuEi3Efms2JhoRSHdPW
 n7weJ0aqqDRrDpV3NLkzANmUhSPkHdo2YbJsnXs2elLimyABiyHaDj6FGjUpSLJ85+W9X0/iV5
 RxFkAAAA=
To: buildroot@buildroot.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720122036; l=1673;
 i=j.neuschaefer@gmx.net; s=20240329; h=from:subject:message-id;
 bh=KV1lxw6S+sLsKqU7LeglT52htqa8BMnr5sbWiHw5xUU=;
 b=gAkyAEb4iMtEBVc5inth+LFdrA/64tK2y9kdd0BGWOlNcZBoIRYNjyU+1z0/jhpmKkFz2TdiS
 F/08GrCYsSOCORVWJINcc4NOxG6vcQ0oAMDSw+/DEKk7PcFUqpXFk2X
X-Developer-Key: i=j.neuschaefer@gmx.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Provags-ID: V03:K1:9p81RsFmQNu5ja4waCMiWK9as0Wr/k52xg1Ax2l2GgbS0hlGlmx
 hmcB0E9FeAWSuvuBU0//Wz7qAObH3+nt5j2ryVP6fg32nqiYa9BFkCKq5VS6fPoJK5M/Bst
 0ZGwPrdZ0CJ9AVhgAA384T37uFAZjLsNw824p3mXThF2Q9xX9fStvlsgAEmhu22jjE9qgQ5
 j6rmkis42T7bO6rsKeQsA==
UI-OutboundReport: notjunk:1;M01:P0:0L7/pblV4QY=;PRyDQiUc0VUIg717hEYfst8mWwt
 aHtjV2/RH4aDEd0FprXr8vqe5RtZTsbRSFS/yG61nyB6Hzh8yaP3p1wnC1YfT8+cuweoUlV8W
 jPcqWk5AAPw/5pI2X+3Zin0Jdw7i+2MmAxIcita9QEVZB5b19i5JIY7vADWRnl5PeUzB9vUY8
 5LlUh43Z5YWtgkwDEyZoT+VrN9VbqVZ9+u8DsalReyClYKiKoqoDMR5qJd7Z+ITQ/xbQpaIbv
 qt5ZLOxsMJ1Fpmirjmbz6DZnG8N+k70alrMBI8ogJwCWx/Bf6PhGHTClKO5RBnfG0Nu7GCS9K
 zVM3olA8aOMmnZCpFVbiA6HR+YNKAw4wx0YtPj2UllEDE6b2H3lzcG3B3vH5ToxI7E49hLB6T
 FBjTaEKarOyGmsZVoW6FXT9Gd7pFn49WddAanusgxhQ4jLqQmz4ovHHAbTxhPtL9X3+r36rQv
 lUMNKzL0Y41ot4ocdU6Jd5GvX0sLtNa+sr+hDCQdyaysi0be2LYeDsPl54TgGqnRTGaCWzk7n
 uNMkKRNpuqleXex8G3+eNUVp9ntOafYcl7ylS0M6hEo7idSgYjbXe9iPSGxXmE7JUWIY1q5vE
 2b41IwJXXLp2Xds0aPmwaBnhpfYW5rKHe4XbkSF+WxxhTZ6RNf1qqZAvfMA2YZIdCgX4ttIUo
 M9cu1GeZnykXKQxu/padRNRTFX2sog3jg24Hq4bXPNXTO/tDPU7vUgy/jF7ntD1w9FfrvPUjq
 rIGIJGqMDr4vXhAn9kK7PZNHiCF+mP845jsk0FHg4bAcx7hg73El0f6E/M6PBRr1A4KaoEjcC
 OTcO2NxntG4l9Ic/22WIwUjQRXa+VMzCFBvIaq/uJdhb4=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.net; 
 s=s31663417; t=1720122037; x=1720726837; i=j.neuschaefer@gmx.net;
 bh=yrHkUVNGLK6Jvte3mfby1v3CpFYkdTELM4eU5ecl7gE=;
 h=X-UI-Sender-Class:From:Subject:Date:Message-Id:MIME-Version:
 Content-Type:Content-Transfer-Encoding:To:Cc:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=AAiJLmPGgzzav83ulEi358sjfoH3kzb/4w1E/d1Ley65NI0pNwkZ6R1iPMf4QhWd
 jw0M+1xvpXaF8h7D3WPg3JJs6eEYVFXvTDxlumYLI9NeAf0EqKvVz2voz1acaUzGn
 3t905B5OnlWNOv9To2kRSuNj52oRFUXRZj9XGh5hm5F7Vnt/5DCjMco+v1usgis/o
 uwTSpyuMjEcU76/6Z0Dih4wa+Drueq79EfGEdAqC+URVbfWwm2WkXxpM63+PpxCtl
 7ro6pr7zjd/wePzEVOdqFxISelz+qxRQpMyGxoHdXI4ciISAPdng0USZgPufoHdu4
 b8jixzkO+rOL0lFclQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.net header.i=j.neuschaefer@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=AAiJLmPG
Subject: [Buildroot] [PATCH 0/8] Various skarnet.org updates and new tipidee
 package
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

U2lnbmVkLW9mZi1ieTogSi4gTmV1c2Now6RmZXIgPGoubmV1c2NoYWVmZXJAZ214Lm5ldD4KLS0t
CkouIE5ldXNjaMOkZmVyICg4KToKICAgICAgc2thbGliczogYnVtcCB0byB2ZXJzaW9uIDIuMTQu
Mi4wCiAgICAgIHM2OiBidW1wIHRvIHZlcnNpb24gMi4xMy4wLjEKICAgICAgZXhlY2xpbmU6IGJ1
bXAgdG8gdmVyc2lvbiAyLjkuNi4wCiAgICAgIHM2LW5ldHdvcmtpbmc6IGJ1bXAgdG8gdmVyc2lv
biAyLjcuMC4zCiAgICAgIHM2LXJjOiBidW1wIHRvIHZlcnNpb24gMC41LjQuMwogICAgICBtZGV2
ZDogYnVtcCB0byB2ZXJzaW9uIDAuMS42LjQKICAgICAgczYtZG5zOiBidW1wIHRvIHZlcnNpb24g
Mi4zLjcuMgogICAgICB0aXBpZGVlOiBuZXcgcGFja2FnZQoKIHBhY2thZ2UvQ29uZmlnLmluICAg
ICAgICAgICAgICAgICAgICAgICAgfCAgMSArCiBwYWNrYWdlL0NvbmZpZy5pbi5ob3N0ICAgICAg
ICAgICAgICAgICAgIHwgIDEgKwogcGFja2FnZS9leGVjbGluZS9leGVjbGluZS5oYXNoICAgICAg
ICAgICB8ICAyICstCiBwYWNrYWdlL2V4ZWNsaW5lL2V4ZWNsaW5lLm1rICAgICAgICAgICAgIHwg
IDIgKy0KIHBhY2thZ2UvbWRldmQvbWRldmQuaGFzaCAgICAgICAgICAgICAgICAgfCAgMiArLQog
cGFja2FnZS9tZGV2ZC9tZGV2ZC5tayAgICAgICAgICAgICAgICAgICB8ICAyICstCiBwYWNrYWdl
L3M2LWRucy9zNi1kbnMuaGFzaCAgICAgICAgICAgICAgIHwgIDIgKy0KIHBhY2thZ2UvczYtZG5z
L3M2LWRucy5tayAgICAgICAgICAgICAgICAgfCAgMiArLQogcGFja2FnZS9zNi1uZXR3b3JraW5n
L3M2LW5ldHdvcmtpbmcuaGFzaCB8ICAyICstCiBwYWNrYWdlL3M2LW5ldHdvcmtpbmcvczYtbmV0
d29ya2luZy5tayAgIHwgIDIgKy0KIHBhY2thZ2UvczYtcmMvczYtcmMuaGFzaCAgICAgICAgICAg
ICAgICAgfCAgMiArLQogcGFja2FnZS9zNi1yYy9zNi1yYy5tayAgICAgICAgICAgICAgICAgICB8
ICAyICstCiBwYWNrYWdlL3M2L3M2Lmhhc2ggICAgICAgICAgICAgICAgICAgICAgIHwgIDIgKy0K
IHBhY2thZ2UvczYvczYubWsgICAgICAgICAgICAgICAgICAgICAgICAgfCAgMiArLQogcGFja2Fn
ZS9za2FsaWJzL3NrYWxpYnMuaGFzaCAgICAgICAgICAgICB8ICAyICstCiBwYWNrYWdlL3NrYWxp
YnMvc2thbGlicy5tayAgICAgICAgICAgICAgIHwgIDIgKy0KIHBhY2thZ2UvdGlwaWRlZS9Db25m
aWcuaW4gICAgICAgICAgICAgICAgfCAzNyArKysrKysrKysrKysrKysrCiBwYWNrYWdlL3RpcGlk
ZWUvQ29uZmlnLmluLmhvc3QgICAgICAgICAgIHwgIDggKysrKwogcGFja2FnZS90aXBpZGVlL3Rp
cGlkZWUuaGFzaCAgICAgICAgICAgICB8ICAzICsrCiBwYWNrYWdlL3RpcGlkZWUvdGlwaWRlZS5t
ayAgICAgICAgICAgICAgIHwgNzIgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKIDIw
IGZpbGVzIGNoYW5nZWQsIDEzNiBpbnNlcnRpb25zKCspLCAxNCBkZWxldGlvbnMoLSkKLS0tCmJh
c2UtY29tbWl0OiAzZWJjN2M2OWQ1NjQzMGMzNGViYTRjODY5ZDFkNGZlNGQxZThkZTU1CmNoYW5n
ZS1pZDogMjAyNDA3MDQtdGlwaWRlZS1lZTIwYWMxMGM3ZmEKCkJlc3QgcmVnYXJkcywKLS0KSi4g
TmV1c2Now6RmZXIgPGoubmV1c2NoYWVmZXJAZ214Lm5ldD4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRy
b290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlz
dGluZm8vYnVpbGRyb290Cg==
