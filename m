Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BD30C369B8
	for <buildroot@archiver.kernel.org>; Mon, 14 Apr 2025 11:20:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D945940B84;
	Mon, 14 Apr 2025 11:20:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xBi9ztboOZ4E; Mon, 14 Apr 2025 11:20:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E864C401FB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E864C401FB;
	Mon, 14 Apr 2025 11:20:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 04090251
 for <buildroot@buildroot.org>; Mon, 14 Apr 2025 11:20:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E93C0403B6
 for <buildroot@buildroot.org>; Mon, 14 Apr 2025 11:20:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lZylCXSQqF_o for <buildroot@buildroot.org>;
 Mon, 14 Apr 2025 11:20:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.20;
 helo=mout.gmx.net; envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 53693408CA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 53693408CA
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 53693408CA
 for <buildroot@buildroot.org>; Mon, 14 Apr 2025 11:20:11 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from probook ([89.1.210.117]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mz9Z5-1t9ivr317r-00ytis; Mon, 14
 Apr 2025 13:20:08 +0200
Date: Mon, 14 Apr 2025 13:19:31 +0200
Message-Id: <20250414-ska-bump-v2-0-efb0a276750d@gmx.net>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAEPv/GcC/0XMQQ6DIBCF4auYWZcGKEh11Xs0LlCnOmlEA5bYG
 O5eatJ0+b+8fDsE9IQB6mIHj5ECzS6HPBXQjdYNyKjPDZJLJbi8sPC0rH1NC6tUZVB1HJXRkO+
 LxwdtB3Vvco8U1tm/DzmK7/pD1B+JgnFmTGmt7q9tqfVtmLazwxWalNIH011wU54AAAA=
X-Change-ID: 20241023-ska-bump-9497e4c0e475
To: buildroot@buildroot.org
Cc: Dick Olsson <hi@senzilla.io>, Eric Le Bihan <eric.le.bihan.dev@free.fr>, 
 =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744629607; l=2169;
 i=j.neuschaefer@gmx.net; s=20240329; h=from:subject:message-id;
 bh=Q912oEXNxPAq8+t4HX2X1JplZAUMpA8JQm9wvFgoPI4=;
 b=5AB9FYyPw4Et2MH1ZUagaOBLKyY76ki31ozOhlskI74j5Hht9fL2hgIuDUqnVBHwVg9DR5VN2
 Wh8H8nlc9ErDcT2uxNdiNC9MhALLBcm2628y8ku0mJgFAAZhaWvsyQ0
X-Developer-Key: i=j.neuschaefer@gmx.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Provags-ID: V03:K1:8KW61GJV5kxd7amxUiFHs/PIG894jBAD97AGhUGzeVbP1HlYeZD
 shbhQNy26koGQUQH0gI40uvcIdzfWKUOb8Y8hnZOKhL3iI50XuLM0GMtQhWILyaWUtsrVIo
 kTOUw+EWRKNjD6BE8IIkgibWZ05KGyVBbiGtyyNHGc+A4cclbBeTzNYvv9PunJgR9H8GZB4
 yM3qXUXX3cAhPSR2bRNPA==
UI-OutboundReport: notjunk:1;M01:P0:eFx8cImVyEA=;fiq1eZXUrBn8OlsVC6hVZh7Bv4G
 kRRmBzIoVr2/J+ibLty2t43LIukpMIVZV2G1KySSj+nL5RozVGyT0ujKgz53+hI4UIvFA7yw6
 i8FHJE6Ri8J5X50sQxpfQMNR3tbHR4BAodhQYkfUvnvfgNS7GrOqKuva2X675oBwMdV52X2i5
 hYIKnal6xb1vQLToXg4hi7nwFpxSQwHQOTvkYIwCV7tE0SfQKZMPOU++ZFdPXfmKbAqAPmPGS
 muawtp7hZoo2kljoymtgLeQSZBu+Hut0ZiT5rqcuqnt4BA3skrqjNFcyjJDJn2cRIOf7K19jv
 3t8WHZgFpkt+AM0FEIaOg5FiD8KhY3WPcveId4+YIZA+4YVM5iGoMxQodE68VoEU28V69REbF
 s3+xbaMCqzF+iX6/un2RcXBe8DsmGgXTJfUplFVrbQICCUdcBd0eYoS9uO/QizzQZZcEzcFmr
 IzpRgU2TkcCilNdWb806vm0xD+fATJeAYFRlY8NMwzir1cvG/W5OxhYWej5hBCICr3oUMiSpD
 fMvCaoPIjtreStxVL8f3K5IS3Gpp5EllCziDWL12+LpiNd75erH9bX8WLVIAqn+cJM6k0a1zX
 uwu7BDMNe5qwcmumWCT4McJoO1mRM+8sSIbUfSZDOqEmbbBBFSDhdceb95OtVHSns9LYJdVKh
 b/0bqhB0l++qKDXGyB2z0xIqkBPLBj+2kxOi7/9GyRZ3011mbCR82/f23JFoEGeAfTXvfTyNg
 sO4n2IckUpeLdKFHmv/8yf4Y8RkKv2puco2fHyo3WvPkUHgncBJPaL4NzVKcdpvYGlys0bD0I
 VuOsy11BTQNqJZ21y8j5fKc8rSiwjbnf9YRzMtO+mtMunlWGg6vBR4YvTuuxeEgD/UElNkpaR
 fOtIUCcfa9CPuxkte4eQO8/Oce4iFi8yirnyF518SMBF6gFjfNm7tadeHzQ0TpSnyTrwUHAoq
 90xxqhYJIGdwL2ugpJxlzFIs7bMe/CK0GUSVEiTW1fP2/SSoyQOqXv0dqPaPD+Zm2bDJ6COD0
 aR1s9k+HKhXIqbsJrlEwGOS33bDF2HvR9HEO1NageV3KPojjxIhT2qOuYnbGCn27KlWsIgvS5
 44orxRI+4yvAK5ToHFvEqDvPrBtGWN/Dz/QSiZDkYhinUwKBgRCyrNHeIrQiWpl7O9CyB/veN
 OUjSpb/AQjFj+T8vpBLSuSOD30cHzOWFVePB5eNnan/q6AY0oI/42xGoxUOFjUvcajie6wiMp
 yN01B5S8ahpr9K5FurAltMvBMDxvn6qsco/Z5tuvzddi26DD5ZucAd6YMI5TgDpyHmT4ZMTy7
 9Cynm1ISMPR6ISakE+D61vCQQRZXG+nSdNjoukQFgAQdHAaneHy0a2gHIvOazNKdFoh1yrUiQ
 BJ2PQVzHWudLyPZJeO7sCDdKqXtwd/OXJRZHbE3STT50H5I5yXZCXvX3BVJHWMmrt5h8iqIW0
 L0KnbaMBBwqcZrBCUSR2HsEp2C8M=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.net; 
 s=s31663417; t=1744629608; x=1745234408; i=j.neuschaefer@gmx.net;
 bh=LFsBKaditPulBKHIb6U9THqr9ZZrGCbL7pKpZ17cbys=;
 h=X-UI-Sender-Class:From:Subject:Date:Message-Id:MIME-Version:
 Content-Type:Content-Transfer-Encoding:To:Cc:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=QaRC51IDPEBbkbKKDM4MWPeW9oMLfRp/9gy4zhWPHquuXJ28xZEc8F4aXQSqsZON
 4bAuLBujjBW0BWuwGBTW4YnK9rrkaCtSj7djjZ+2RkjouyycvBB57zEHpluM5IBep
 de0icEnSh72UjCu59UmiHpyrQbH4Pod8Ek0V2tSuFlGLh3Dxeu6UFRsjvrYHCUL77
 EZT5ZQDET9aKTZQq5kTNJsMI/B8W1bWw+NbQgU6HeHv1ELXj9pp8eDqFZ9qjVacuf
 YEU7biLKnGq3WH6ZANzujgUCZCNJ7UblmzIlp2fXWvjYF2V2Cjoq3E9ZjPE+ZPxZ6
 VWGDiPMnBqhfyUoHtQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.net header.i=j.neuschaefer@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=QaRC51ID
Subject: [Buildroot] [PATCH v2 0/3] Update skarnet.org packages
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
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_buildroot?= <buildroot@buildroot.org>
Reply-To: =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhpcyBwYXRjaHNldCB1cGRhdGVzIHRoZSBwYWNrYWdlcyB0aGF0IGNvbWUgZnJvbSBza2FybmV0
Lm9yZyAoaW4gb25lCmNvbW1pdCwgYmVjYXVzZSB0aGF0J3MgdGhlIGVhc2llc3Qgd2F5IHRvIGRl
YWwgd2l0aCB0aGUgdmVyc2lvbgpyZXF1aXJlbWVudHMpLCBhbmQgYWxzbyBkb2VzIHNvbWUgY2xl
YW51cHMgd2hpbGUgYXQgaXQuCgpTaWduZWQtb2ZmLWJ5OiBKLiBOZXVzY2jDpGZlciA8ai5uZXVz
Y2hhZWZlckBnbXgubmV0PgotLS0KQ2hhbmdlcyBpbiB2MjoKLSByZWJhc2Ugb24gbWFzdGVyIGJy
YW5jaCAoMjAyNS0wNC0xMykKLSBmaXggY29tbWl0IG1lc3NhZ2Ugc3R5bGUgKGxvd2VyY2FzZSBh
ZnRlciB0aGUgcHJlZml4KQotIExpbmsgdG8gdjE6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3Iv
MjAyNDEwMjQtc2thLWJ1bXAtdjEtMC03NzZhYTVkOGI2NTVAZ214Lm5ldAoKLS0tCkouIE5ldXNj
aMOkZmVyICgzKToKICAgICAgc2thcm5ldC5vcmcgcGFja2FnZXM6IHJlbW92ZSAtLXByZWZpeD0v
CiAgICAgIHNrYXJuZXQub3JnIHBhY2thZ2VzOiBidW1wIHRvIG5ldyB2ZXJzaW9ucyAoT2N0b2Jl
ciAyMDI0KQogICAgICBwYWNrYWdlL2V4ZWNsaW5lOiByZW1vdmUgLURfR05VX1NPVVJDRQoKIHBh
Y2thZ2UvZXhlY2xpbmUvZXhlY2xpbmUuaGFzaCAgICAgICAgICAgICAgICAgICB8IDIgKy0KIHBh
Y2thZ2UvZXhlY2xpbmUvZXhlY2xpbmUubWsgICAgICAgICAgICAgICAgICAgICB8IDYgKystLS0t
CiBwYWNrYWdlL21kZXZkL21kZXZkLmhhc2ggICAgICAgICAgICAgICAgICAgICAgICAgfCAyICst
CiBwYWNrYWdlL21kZXZkL21kZXZkLm1rICAgICAgICAgICAgICAgICAgICAgICAgICAgfCA1ICsr
LS0tCiBwYWNrYWdlL3M2LWRucy9zNi1kbnMuaGFzaCAgICAgICAgICAgICAgICAgICAgICAgfCAy
ICstCiBwYWNrYWdlL3M2LWRucy9zNi1kbnMubWsgICAgICAgICAgICAgICAgICAgICAgICAgfCA1
ICsrLS0tCiBwYWNrYWdlL3M2LWxpbnV4LWluaXQvczYtbGludXgtaW5pdC5oYXNoICAgICAgICAg
fCAyICstCiBwYWNrYWdlL3M2LWxpbnV4LWluaXQvczYtbGludXgtaW5pdC5tayAgICAgICAgICAg
fCA1ICsrLS0tCiBwYWNrYWdlL3M2LWxpbnV4LXV0aWxzL3M2LWxpbnV4LXV0aWxzLmhhc2ggICAg
ICAgfCA0ICsrLS0KIHBhY2thZ2UvczYtbGludXgtdXRpbHMvczYtbGludXgtdXRpbHMubWsgICAg
ICAgICB8IDUgKystLS0KIHBhY2thZ2UvczYtbmV0d29ya2luZy9zNi1uZXR3b3JraW5nLmhhc2gg
ICAgICAgICB8IDIgKy0KIHBhY2thZ2UvczYtbmV0d29ya2luZy9zNi1uZXR3b3JraW5nLm1rICAg
ICAgICAgICB8IDUgKystLS0KIHBhY2thZ2UvczYtcG9ydGFibGUtdXRpbHMvczYtcG9ydGFibGUt
dXRpbHMuaGFzaCB8IDIgKy0KIHBhY2thZ2UvczYtcG9ydGFibGUtdXRpbHMvczYtcG9ydGFibGUt
dXRpbHMubWsgICB8IDUgKystLS0KIHBhY2thZ2UvczYtcmMvczYtcmMuaGFzaCAgICAgICAgICAg
ICAgICAgICAgICAgICB8IDIgKy0KIHBhY2thZ2UvczYtcmMvczYtcmMubWsgICAgICAgICAgICAg
ICAgICAgICAgICAgICB8IDUgKystLS0KIHBhY2thZ2UvczYvczYuaGFzaCAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICB8IDIgKy0KIHBhY2thZ2UvczYvczYubWsgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICB8IDUgKystLS0KIHBhY2thZ2Uvc2thbGlicy9za2FsaWJzLmhhc2gg
ICAgICAgICAgICAgICAgICAgICB8IDIgKy0KIHBhY2thZ2Uvc2thbGlicy9za2FsaWJzLm1rICAg
ICAgICAgICAgICAgICAgICAgICB8IDMgKy0tCiBwYWNrYWdlL3RpcGlkZWUvdGlwaWRlZS5oYXNo
ICAgICAgICAgICAgICAgICAgICAgfCAyICstCiBwYWNrYWdlL3RpcGlkZWUvdGlwaWRlZS5tayAg
ICAgICAgICAgICAgICAgICAgICAgfCA0ICsrLS0KIDIyIGZpbGVzIGNoYW5nZWQsIDMzIGluc2Vy
dGlvbnMoKyksIDQ0IGRlbGV0aW9ucygtKQotLS0KYmFzZS1jb21taXQ6IGE5ZmU1YWMwM2MwYmQy
MTViZWIyODZjZWNhMzg5YTk1ZmI5OWM2ZTAKY2hhbmdlLWlkOiAyMDI0MTAyMy1za2EtYnVtcC05
NDk3ZTRjMGU0NzUKCkJlc3QgcmVnYXJkcywKLS0gCkouIE5ldXNjaMOkZmVyIDxqLm5ldXNjaGFl
ZmVyQGdteC5uZXQ+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBz
Oi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
