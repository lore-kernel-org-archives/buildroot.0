Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A26A6C3DA4A
	for <buildroot@archiver.kernel.org>; Mon,  5 Aug 2024 22:16:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 59B77401E8;
	Mon,  5 Aug 2024 22:16:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sKji4KCZcpP0; Mon,  5 Aug 2024 22:16:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1FE714025A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1FE714025A;
	Mon,  5 Aug 2024 22:16:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4607D1BF313
 for <buildroot@lists.busybox.net>; Mon,  5 Aug 2024 22:16:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 346E06078C
 for <buildroot@lists.busybox.net>; Mon,  5 Aug 2024 22:16:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Hu0WhuCh3Sci for <buildroot@lists.busybox.net>;
 Mon,  5 Aug 2024 22:16:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.21;
 helo=mout.gmx.net; envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org EBB6860774
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EBB6860774
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EBB6860774
 for <buildroot@buildroot.org>; Mon,  5 Aug 2024 22:16:10 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from probook ([87.78.127.77]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MhlKy-1rxea831RQ-00nF5e; Tue, 06
 Aug 2024 00:16:08 +0200
Date: Tue, 06 Aug 2024 00:16:05 +0200
MIME-Version: 1.0
Message-Id: <20240806-tipidee-fixes-v1-1-7f50779b0484@gmx.net>
To: buildroot@buildroot.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1722896168; l=881;
 i=j.neuschaefer@gmx.net; s=20240329; h=from:subject:message-id;
 bh=jSukim2gvVerP89am0SSO52quyqlNX7saIVPfrULXFs=;
 b=2/fQuDuK0pfx1dSKGSkjS2oQdhOF6n4nGQdcmy/vSqtlHI/OGzS3+EgTpXx8EwRDoNLjxuITU
 p4Cc9JRKO4BAsNNkzQcVdUNIJq96C/fDd09XQUXAWLhWiP6xcTb4KeJ
X-Developer-Key: i=j.neuschaefer@gmx.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Provags-ID: V03:K1:CLnccN9lmfNl/F33kHLZpCNiG8s+uZAeiaQhI9KvncvZfv1TwcD
 z6AgTS7hdkv6SxJb+Fkxdl4bl6HFogIiBOcr9hhC4IT4c4HTQYkP6DEFRyxGOwPX3daspch
 YA/WeXHZmyj1KAXIH65vOKVA2lmgm9lZxYw8VayBYS4gnnmTcbfhpWf0DAej4rqp3Y8ofwj
 5otMcaS2PPyOQujCqFL/w==
UI-OutboundReport: notjunk:1;M01:P0:axh1WhTiBL4=;IwLllC+7igmk4iUczRtqw0gTqJ4
 sDPw0KKa+u30HThnUtEEY/WXPTugTIZYAlLRcjfdkgf0Jy1zdlGFih0uRLsgxeTS2l+cgcRLI
 TqEepY96GELgQrpNl9TIiXLJHQ1l67XJsTY+X2g4bVklnsCQaSZsM22HbnWDjdysrujdvkopP
 ugiP/jqs7hU8ubOtsh+LcxjeKuHR+mL2Z7E8I+WtqhjtP80SuBNPak7uiJzY9GOkAvM2dGNaD
 zTmooS9IKHOemeoAjTSep/lpCqsk5PDB0vX5QOJVBn0EPlOaS+9Ec9KHlHsInEKWRHl1WRy67
 N52WZRvPWTACyTZSy2Sb0puGwCChTpdYlEgQM3lMf8Os0PvVF2wR5qs8U1OAgNghRdOdDu50z
 Zw4AAK1qON4EwP5jtXAOGAzQ5EixkK99E89m6spbWMVfke/31fit5xbd6MubT+M3RRXIKIggO
 HmiUEcR/zFANX6x4xm1siDRMTzEkFkRf30M/qb9QcAS1ycoJ8XQ1N1jpH0KVfFoWZNUH+W613
 VCvDoaSrWk65tzLrj0fCgUs7WOFkdeTZPbPxf7bERX42PdDUEtSBft9UPjIohUrGUffGTq3AV
 1PawCgzkuwC5p+cEUiboAHQaH+Q9LYG87Ji4jInPsmr2L+GK0wDLgjjAgtff3hs7OwdyZYMHz
 5VfUFc/jGkFtvmBnEqftyroDahMkdYfDMgPC+BTFI0fGnlDEbfJYSDPLyNYOsLzDeEfiAAB4d
 Onje5IcU/hNGiW8Yv3aYJWu7fQpTT0UbKiF3wFTHKXXXozYSpJ/ips3vQQdh+KB62ue4vsUSW
 9gk1JHkfE3fp30ErpqI8plOA==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.net; 
 s=s31663417; t=1722896168; x=1723500968; i=j.neuschaefer@gmx.net;
 bh=O5IMCkgVr+1LG5K+7mj07B/VtjasdAW44Ga6BlBSM5s=;
 h=X-UI-Sender-Class:From:Date:Subject:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Message-Id:To:Cc:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=bWBLdhRx01t81LN8UkZ9x9nD2zj0VTtvozaeEKpn+JSSscLtQj4wW67IIpqlyeZL
 I0rrKqb0qu//R5fXjYdzyi9T94Lmc5abiLes6tZndLIbToDoNS14kwRN9TIxstR0A
 aIHzDRtGABgMyCpj8XuW7UhP5NsLZvv+xAuvTCe9l+BFiW5StgZC40qCuMRcXZj2r
 d83yLEMlV1hHvS7KKp+/9FfBpYdcPOprQCxVaqACE699zI3zZbxaYzl3vULT7yRFW
 iFLC6EvUX13b0GDhVY8GWgR09bcKlshhIftnZGQwzSP/qnr959ZJTkN+d3SwO5zk3
 fB3akG97aVy+sc9Wwg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.net header.i=j.neuschaefer@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=bWBLdhRx
Subject: [Buildroot] [PATCH RESEND] package/tipidee: Load config from /etc,
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
