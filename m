Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B35BC3DA49
	for <buildroot@archiver.kernel.org>; Thu, 18 Jul 2024 21:48:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 11D1E813CF;
	Thu, 18 Jul 2024 21:48:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0GK43Umekduw; Thu, 18 Jul 2024 21:48:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 19433818C9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 19433818C9;
	Thu, 18 Jul 2024 21:48:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AE61C1BF3A1
 for <buildroot@lists.busybox.net>; Thu, 18 Jul 2024 21:48:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A6DF5818C9
 for <buildroot@lists.busybox.net>; Thu, 18 Jul 2024 21:48:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KTIYg1qX3ylR for <buildroot@lists.busybox.net>;
 Thu, 18 Jul 2024 21:48:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.20;
 helo=mout.gmx.net; envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5D00B813CF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5D00B813CF
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5D00B813CF
 for <buildroot@buildroot.org>; Thu, 18 Jul 2024 21:48:22 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from probook ([151.216.37.99]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MTRQq-1stx5V0M4S-00Lk9H; Thu, 18
 Jul 2024 23:48:21 +0200
Date: Thu, 18 Jul 2024 23:48:19 +0200
MIME-Version: 1.0
Message-Id: <20240718-tipidee-fixes-v1-1-2e184a7361c1@gmx.net>
X-B4-Tracking: v=1; b=H4sIAKKNmWYC/x3LTQqAIBBA4avIrBPUirKrRAt/ppqNiUYE4t2Tl
 h+PVyBjIsywsAIJH8p0hQbZMXCnCQdy8s2ghBrEJGd+UySPyHd6MfNRae167YyyFtoTE/6hLet
 W6wdNO3ZRXwAAAA==
To: buildroot@buildroot.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1721339300; l=881;
 i=j.neuschaefer@gmx.net; s=20240329; h=from:subject:message-id;
 bh=jSukim2gvVerP89am0SSO52quyqlNX7saIVPfrULXFs=;
 b=/c5diC27Tw58dX7tCwv5RGZllGYJqEbfwCGz6yr7Hl9kMebd7OsARHOEHbi7X/uL9Jh0b316E
 36YBPKZxDYIBb5131jlwctU+8/P18WcJGdnr2H4V7aC+QsaYQtbfACV
X-Developer-Key: i=j.neuschaefer@gmx.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Provags-ID: V03:K1:IsXNVhGWGy6LbBDJGojLG1m+zb3kRfO/PW784ta6ioRYQ9hEbF2
 Y+to9d76ri95L1Kl/yYlZ/PIoKacDfd2TDoLqWdWSsfYCs7KbZYzeZ+irVzJFtWHwUf1pIl
 L8sCHWdiqNKZCvMT9yJEVdOFPV/UxKLOhJThB0AIB2NmY5TYOQWUEkuNXUcnwlVTXG2Xf3p
 ySVGiPX6oQIEnQ86HDEjQ==
UI-OutboundReport: notjunk:1;M01:P0:Dc56aP1t5sc=;D/PqFEy5Hg34FoGjBLmGy9+nVmI
 f5i1U+cUTpbUcz46c04tDKLnQKDr+pQ/Q1cmYCEcxA3jnJ2SkdOF2iXaGkJI2/1NDAFIHsx4J
 ZfWp39Gk9n7BQLuQovAXPJEegnxNfBjMAMulFWd6PLPEMqEjjx2qOTzep0xBRiq/o3UO8q7qc
 y4RpMY5llpSWN3gyaqoSYmnXvLVHqd8z1FLToCQdrRdLSrZFzvPNI6oHlAJY1Q5yHZmq3vnTu
 aM5QKeXTmo9ADPJYrAXw+zYKNV3zYMPGG8qjtaAZNPXeJn1BKsqgCzAxPiLdMYmy+tbLjz60d
 UzAY4lrf5T9eEFrqYa6R5XZivzIXh2EolF0eBImJSqqGKKczVpXmXY85Cx1LeX8VXUgBG7SPO
 yyE4uWIhNbmCcpIcz6xTrXnsO3QNiwSz/64c7PFT+sgbM48H0GK2gwQnF/FwgrnriLU1pXUlL
 BPWAWkFIAoxmVlEIIBclpMp976DU1t5YB0jZa0HUdVPu0Kd9HS1H5AycH9iv5dgsF/6E+cjAa
 cLHHizg5v9EZT8pQZJgjbcSD8R6DrOHovYYsaKxtpkKF4vUYlwIM7XTDiCHfkR5G3VZUq1wAl
 5TpYyLoriQePLxx1GkdFvyI9LdMrAiFlR9hs2nXoYiS1WhEuPuhVV/vb8P13KOMZdQ0QZgQY8
 3Za73CGhXG+FHZTy+sPEpUpcehyz2ySExxL7fL6L1dVL+a8e/5mo7jeB97xD+5R0aWSJHm0wT
 qVJqjmerWzv8A4khSAWGOYei9Fz3iiiVSNjuGtEnDHPnPeYSvQ56oL8XitmzPqy4ygVbrsQvc
 Me6rM+p5yiDakTtrsPVEs7ww==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.net; 
 s=s31663417; t=1721339301; x=1721944101; i=j.neuschaefer@gmx.net;
 bh=O5IMCkgVr+1LG5K+7mj07B/VtjasdAW44Ga6BlBSM5s=;
 h=X-UI-Sender-Class:From:Date:Subject:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Message-Id:To:Cc:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=iPtrtmSGbPVUGyP0Gwn7bMuukVwyYdeH6gCRaxbL+pp38KQPnMTaA/87c1H7D5fB
 bm4QS4TASEwvH7LFHNnZhTn7+ZnFM+q3hlXoIj2mYeGF5IB35E0eG6RX0YgyWC5KP
 Mljnlxq/I3uCFjjwPb4Asc6qmvi/X4VAB/sNZQgbOKFQeF/lrr6/w9TU2ZxiE0+PG
 DcLTOkA1PlXqssarAr4wmKUgAAB9d0Dk6lyzDmP17aK1kjxQbO+2ZdpA/HF5ivLuO
 Xli+2M49oxDZq9u1SkRWNoamZgQgSAbm3DuiOxDB1nQ9I3SWwCq4Jt8XSrt6m0Xt/
 3525bSey+y28Ks7itw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.net header.i=j.neuschaefer@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=iPtrtmSG
Subject: [Buildroot] [PATCH] package/tipidee: Load config from /etc,
 not /usr/etc
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

LS1wcmVmaXggaW5mbHVlbmNlcyB0aGUgZGVmYXVsdCBvZiAtLXN5c2NvbmZkaXIsIHNvIHdlIG5l
ZWQgdG8gc3BlY2lmeQotLXN5c2NvbmZkaXI9L2V0YyBleHBsaWNpdGx5LgoKRml4ZXM6IDE3ZGVh
ZjYwZjYgKCJ0aXBpZGVlOiBuZXcgcGFja2FnZSIpClNpZ25lZC1vZmYtYnk6IEouIE5ldXNjaMOk
ZmVyIDxqLm5ldXNjaGFlZmVyQGdteC5uZXQ+Ci0tLQogcGFja2FnZS90aXBpZGVlL3RpcGlkZWUu
bWsgfCAxICsKIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQoKZGlmZiAtLWdpdCBhL3Bh
Y2thZ2UvdGlwaWRlZS90aXBpZGVlLm1rIGIvcGFja2FnZS90aXBpZGVlL3RpcGlkZWUubWsKaW5k
ZXggMWUxNTc4MmFhNC4uNzQ4YzI5YzRmMSAxMDA2NDQKLS0tIGEvcGFja2FnZS90aXBpZGVlL3Rp
cGlkZWUubWsKKysrIGIvcGFja2FnZS90aXBpZGVlL3RpcGlkZWUubWsKQEAgLTEyLDYgKzEyLDcg
QEAgVElQSURFRV9ERVBFTkRFTkNJRVMgPSBza2FsaWJzCgogVElQSURFRV9DT05GX09QVFMgPSBc
CiAJLS1wcmVmaXg9L3VzciBcCisJLS1zeXNjb25mZGlyPS9ldGMgXAogCS0td2l0aC1zeXNkZXBz
PSQoU1RBR0lOR19ESVIpL2xpYi9za2FsaWJzL3N5c2RlcHMgXAogCS0td2l0aC1pbmNsdWRlPSQo
U1RBR0lOR19ESVIpL2luY2x1ZGUgXAogCS0td2l0aC1keW5saWI9JChTVEFHSU5HX0RJUikvbGli
IFwKCi0tLQpiYXNlLWNvbW1pdDogZWI1MTlhZDdjYzcxNjM0N2RiZjBmOTcwN2ZmMjgyYTk3YjIx
ZjYyMwpjaGFuZ2UtaWQ6IDIwMjQwNzE4LXRpcGlkZWUtZml4ZXMtNTI5OWMzOWNhMmJiCgpCZXN0
IHJlZ2FyZHMsCi0tCkouIE5ldXNjaMOkZmVyIDxqLm5ldXNjaGFlZmVyQGdteC5uZXQ+CgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFp
bGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
