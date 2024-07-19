Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59603C3DA59
	for <buildroot@archiver.kernel.org>; Fri, 19 Jul 2024 14:18:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E6C0C409F1;
	Fri, 19 Jul 2024 14:18:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xKTqt72vdtrd; Fri, 19 Jul 2024 14:18:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B376F409F5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B376F409F5;
	Fri, 19 Jul 2024 14:18:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C5BAA1BF335
 for <buildroot@lists.busybox.net>; Fri, 19 Jul 2024 14:18:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BFEE6600C7
 for <buildroot@lists.busybox.net>; Fri, 19 Jul 2024 14:18:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5N9_Dk0WXNLy for <buildroot@lists.busybox.net>;
 Fri, 19 Jul 2024 14:18:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.21;
 helo=mout.gmx.net; envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 83408600C4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 83408600C4
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 83408600C4
 for <buildroot@buildroot.org>; Fri, 19 Jul 2024 14:18:19 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from probook ([151.216.37.99]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MiaYJ-1rs9lv15AV-00nWDl; Fri, 19
 Jul 2024 16:18:16 +0200
Date: Fri, 19 Jul 2024 16:17:58 +0200
Message-Id: <20240719-micropython-v1-0-9d71f1125e49@gmx.net>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAJZ1mmYC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDE0Nz3dzM5KL8gsqSjPw8XWML4yRLQ8MkEwszSyWgjoKi1LTMCrBp0bG
 1tQDNsVPTXQAAAA==
To: buildroot@buildroot.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1721398695; l=513;
 i=j.neuschaefer@gmx.net; s=20240329; h=from:subject:message-id;
 bh=SUkn6Sm5+Kuo2DlCi25TIoF6prZC1mraaAfYWNoHvqw=;
 b=hnO1JwVpxHh2IQEMRz0tN+obczbSOVY8QgNxgCqt4cGOD+1yySfES4xge+GM3ujdwqTHAXB1l
 /4Wmrt1/J5nBsXAGpt+UblyzSQIKSL0YJuEixZDOvAeub5jO3Bi5VI6
X-Developer-Key: i=j.neuschaefer@gmx.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Provags-ID: V03:K1:pvixmU5/khLh4yWVjKuM4pThh4ChfKEt3NcshiSQ69X2G2dX+jA
 JQF+Rz3xuYIB25eRTs5axrK5MAeYiU/TjmxcCk1JVP3aCIlgEt7/ywMSAeEvHBt739m5JdB
 Tw6ZUANVZ1Lbcv/Mjl62ronclAy2P5t8Dj3rWz3FcCDt9iIv/mE2dNoQqr8I60d/ZnKXZct
 4rtC5hjLJB9zcJD/ACq2g==
UI-OutboundReport: notjunk:1;M01:P0:ve1ntN7uh80=;UTYzB0jkv2y0O9GH7DIbjpxdG4s
 KT4ZdH1qZvUxm9DaoS73h8Gj1VU6Nag1R82LFeaBzzFsljcqMGB82Xpvdup26g06poNtI58I5
 TpomdXoCiE1+A88GjTEcnLxWOx13pOmWtlQZ5r9XmjOrH5Az0VJwk/E0oSVswnRdLIOj5Y1+W
 Ec+uTVaPmLaESPgbxv02EnzJr59/jb1b8Dbrom8NvqVTb/m9JkuHlNGUNXMZ4VC8kl95+MUka
 y4BkVH8sAoUXovH1/hMmiYgy0eau+G3moq1joPODvbUky/qVohCF23bUt4y0EUyXhsGKKcdqr
 pRsR2l9uLOJeVea78FrqYP5H7NNqih+Kx82xqfUKl+N8j6eSA8khp9nFLfe4eti5SSx6DYNgE
 /cF/3v94rOtFV1ZJeU8NDs8RLZXySk+73+OG7yoEzgP8qr3LhBeM/ljdLZTohz1TwQ89zprNA
 E5pF/0jcdgiks9ijINAWygNDq1GPMmU8woCeZ+5RcH8mpK0k5b5JJRLRrrGnOFbCmkrwQYU8g
 MBJp5JwZgU2lesqC1yh/oWJyxXb2MqH4ewMOyK8F5Z9SqIUsU4rCgYWYqX0dlXMXPPH0qY3r1
 VZEyj24gsVU8hORhZ0WfXtdwz/nWjgOfrLmNFghzueSAfqUKbDuF+J36lSNU3JYckq4v+ezvx
 Az+uzEzdf8W3FxzdSGpRmrfuiSKIGOpeQOZnA97WvCmc6nafeT8sp//Zk6sKGmGc9asRZ4D3a
 ZvmiUtOy3Zfy80EqIwjb/FPA/MOTEderFfcDE+BUyZnvIxCM0hj6zpLYwQ4CG8ekYS8UkFiH+
 TT6Yc/lnAzy1UGMACgeMUW0Q==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.net; 
 s=s31663417; t=1721398696; x=1722003496; i=j.neuschaefer@gmx.net;
 bh=Q+/M9dipY9iGXhGnYZN1NTnKTpKtkb8yrkARpFtS2Bs=;
 h=X-UI-Sender-Class:From:Subject:Date:Message-Id:MIME-Version:
 Content-Type:Content-Transfer-Encoding:To:Cc:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=KFGCPQk+/smA9oGGTp29fxs5x/DWRfZFvQu0UEgT542Q/ixlQMNu+QIbdVxuCUg6
 a1qRIhkFTVLU9cR6qK8WnpH2lExFsUf4YJgJeLuHEXKNA7K8VpfKFaJkjkdg3ilNW
 duSBWMWFjyjhC5TaAgDHL6461MfUSa9pW+q03Xhn9gabhqk4agJvSTPFQcXA+UOdZ
 tewGRqc03qmk6x46+hSwJt2e5lQxbhTelSe8CQ8efN54W1nv+W25ziCZQ8NnxRqld
 4T2GqoL6CHQUyLcYzGMW1NJEKPeHTYAS4B6aD5A6mAUizaz57KDpZBJqGhIeLKIKF
 q36QaMoCTNjlGJ5eQw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.net header.i=j.neuschaefer@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=KFGCPQk+
Subject: [Buildroot] [PATCH 0/2] micropython help text improvements
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
Cc: Chris Packham <judge.packham@gmail.com>,
 =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhpcyBzZXJpZXMgaW1wcm92ZXMgdGhlIEtjb25maWcgaGVscCB0ZXh0IG9mIHRoZSBtaWNyb3B5
dGhvbiBwYWNrYWdlLgoKU2lnbmVkLW9mZi1ieTogSi4gTmV1c2Now6RmZXIgPGoubmVAcG9zdGVv
Lm5ldD4KLS0tCkouIE5ldXNjaMOkZmVyICgyKToKICAgICAgcGFja2FnZS9taWNyb3B5dGhvbjog
Q2hhbmdlIFVSTCB0byBIVFRQUwogICAgICBwYWNrYWdlL21pY3JvcHl0aG9uOiBBZGp1c3QgbmFt
ZSBpbiBkZXNjcmlwdGlvbgoKIHBhY2thZ2UvbWljcm9weXRob24vQ29uZmlnLmluIHwgNCArKy0t
CiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQotLS0KYmFz
ZS1jb21taXQ6IDg5ZTNiMmZiODQ2NTA2MjE3YjQ3NjdmZTkxNjVmMTY0MWE0MDczMTQKY2hhbmdl
LWlkOiAyMDI0MDQxNy1taWNyb3B5dGhvbi0zODNiOTExYjQ4NjkKCkJlc3QgcmVnYXJkcywKLS0K
Si4gTmV1c2Now6RmZXIgPGoubmV1c2NoYWVmZXJAZ214Lm5ldD4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVp
bGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4v
bGlzdGluZm8vYnVpbGRyb290Cg==
