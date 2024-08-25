Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B3B5C5320E
	for <buildroot@archiver.kernel.org>; Sun, 25 Aug 2024 13:56:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CAB4B606C9;
	Sun, 25 Aug 2024 13:56:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UEYZ9egTPy-Z; Sun, 25 Aug 2024 13:56:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 558E260703
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 558E260703;
	Sun, 25 Aug 2024 13:56:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2FC541BF2CC
 for <buildroot@lists.busybox.net>; Sun, 25 Aug 2024 13:56:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1E97C40350
 for <buildroot@lists.busybox.net>; Sun, 25 Aug 2024 13:56:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eGBCk2yMXyBw for <buildroot@lists.busybox.net>;
 Sun, 25 Aug 2024 13:56:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.19;
 helo=mout.gmx.net; envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B70434004A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B70434004A
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B70434004A
 for <buildroot@buildroot.org>; Sun, 25 Aug 2024 13:56:10 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from probook ([89.0.48.155]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MqJm5-1sLTkj1Sx1-00l9dG; Sun, 25
 Aug 2024 15:55:58 +0200
Date: Sun, 25 Aug 2024 15:55:49 +0200
MIME-Version: 1.0
Message-Id: <20240825-rgbmatrix-v1-1-0f2b0106f2ee@gmx.net>
References: <20240825-rgbmatrix-v1-0-0f2b0106f2ee@gmx.net>
In-Reply-To: <20240825-rgbmatrix-v1-0-0f2b0106f2ee@gmx.net>
To: buildroot@buildroot.org
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1724594157; l=1782;
 i=j.neuschaefer@gmx.net; s=20240329; h=from:subject:message-id;
 bh=Za/jW/I+x5mvz/n4u7IpgtGmwIgf+sRAGHRcLuZ3B5E=;
 b=sgXQr6YuoBrB52Kwo5xDc+r0/C2gm4x25rtJjfYIWyFg6Rt56/kywEWRgG9dH7CuM3RAAgRmC
 pnp7guyZSH1DAbPW2Srg7oN1OQMUmJ15wOKcJwg5qAX3EyyuYTSzXZ2
X-Developer-Key: i=j.neuschaefer@gmx.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Provags-ID: V03:K1:AqqdcbMDJUTfOWdP/Slxd9j6KMGndkFhBywn74bPrk1tvnzFXEO
 n//Zq72biW1zIrxV2ckoVKL4n30fO1MEScO6DWtZj64Rj4NjY9dNiEYISvG2IVkQqeWmu+Q
 uuNywkmEtYLnVni0qzXLLFsTzfDT4pHhc+1IYmaNtgxOCc6dsHGu0UJu2Eba5jWMXz7sBeS
 LPfy0ZCZJOy7Arn6KCn2A==
UI-OutboundReport: notjunk:1;M01:P0:lFWH/gykHU8=;XbD+3mTaECNfkRPqLmy22rI9h8Q
 O2vnNisZ0qbf/+oGO7TMn5oZodv91LoM1/FNZs3miAh/0WCq/Z3pxxuWfdoCEozBHmiYA6ImM
 UOb85Do6u7AsMrpYrDOI3UVHYqYJEDds0W3F2Tx6hXQg1XUzqUrkkgORS4xzJelA3aRYd8tWZ
 g7fcSckm61sx9Lzksj+d/6n6zi8i4El/VsF0e5+kUIC4ImH8I4nRj8a2/IRLxQDO2LHYWNrMr
 T0ujJESpvT9DUplJRhUCLIr4Y86aH4+Q4vKA3Y+firGDdToD9jGaAJMDJzKxreWpICg3sHp6o
 AvbHeY+/ENzUxFvhDyk09tggrHW9fsCo9UqH4o3Q220uEVZBQUetQNVQR+Bohe3bumdWSKuNO
 jAV17bZD1kv9TqTJLyRH4w5AM1M3PIbseIUGsP8Bfg/I9z2pxgpi3zJ+Dcx7t7ae1xyMh6bjm
 9bkT6eY7cu+VPEdJ+dsWmg4FcHa7xsjIcMBfeLt4r1ia7LXiovO5naHyx1IToVtVW3ShjgL8n
 LJZHFS8IH5kC4GsWovhH1q9yukIky0rI3Tezi7BNDJnTW/XOIciR5sJVtmw85LuQcQX8sRUeH
 VaxDr6vuY++z+dO+OL3YoTMGAoZ8Z7kJ8RY0KKINcTHqmn//avnr4ecWVp611E0bYtAuXwOgO
 zYyLUZ2plUJhUwZvwefSjgid6dRLkW4E/RIaMqtprHquaTHPxYZjNcU8lFFN9mO9sDEygfZgF
 K6vFqOtz9piFacQv6mS8CDL/6TyncBu7TbA84oQmH+t1z2xrC1c5eMmMXE0YQv2rRcNYDgrDA
 15xwqgIoxDJWmKgQJSUqwpIQ==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.net; 
 s=s31663417; t=1724594158; x=1725198958; i=j.neuschaefer@gmx.net;
 bh=HqGDafPeiq+LANLP5ofiwrIdXlv3tgSCRhn1N1Yl3pk=;
 h=X-UI-Sender-Class:From:Date:Subject:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=pwZ6JVg/LXnkTEjTTm4SfVA804NNAmQFUkl8IhjLf8L0453BCliGWjjbC085eoxd
 O0+1OpOCwsbKPDBlQVmTV2mUcmQ0SgB60AKoNh4xw0T3Gn7lRVRc0WWBh4C62+6Dp
 Qf1GoPnlyJS5k5AZ0TfcHDlKSOp19SudGh2jCZX5mZhUr32LVik1RVMSEoVDYEH/W
 HGWLMBAXRY6rMOG3ezc68aoPR6kSMw9GEzJhwJryPwXykLFtsJxsO2KA/AhKOw+1w
 CJkzXUW76sfnaVeQJC6IQZhPCsynhapXa/f/+zmtUBlhfZnSbq2MBE23j1YRnK8BP
 By0xAhe/VD42jui9cg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.net header.i=j.neuschaefer@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=pwZ6JVg/
Subject: [Buildroot] [PATCH 1/3] package/rpi-rgb-led-matrix: update to
 latest commit
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
Cc: Grzegorz Blach <grzegorz@blach.pl>,
 =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 Asaf Kahlon <asafka7@gmail.com>, James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhlIHJwaS1yZ2ItbGVkLW1hdHJpeCBwcm9qZWN0IGRvZXNuJ3QgaGF2ZSB0YWdnZWQgcmVsZWFz
ZXMsIHNvIHRoaXMKcGF0Y2ggdXBkYXRlcyB0aGUgcGFja2FnZSB0byB0aGUgbGF0ZXN0IGNvbW1p
dCBvbiB0aGUgbWFzdGVyIGJyYW5jaC4KClNpZ25lZC1vZmYtYnk6IEouIE5ldXNjaMOkZmVyIDxq
Lm5ldXNjaGFlZmVyQGdteC5uZXQ+Ci0tLQogcGFja2FnZS9ycGktcmdiLWxlZC1tYXRyaXgvcnBp
LXJnYi1sZWQtbWF0cml4Lmhhc2ggfCAyICstCiBwYWNrYWdlL3JwaS1yZ2ItbGVkLW1hdHJpeC9y
cGktcmdiLWxlZC1tYXRyaXgubWsgICB8IDIgKy0KIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRp
b25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3BhY2thZ2UvcnBpLXJnYi1sZWQt
bWF0cml4L3JwaS1yZ2ItbGVkLW1hdHJpeC5oYXNoIGIvcGFja2FnZS9ycGktcmdiLWxlZC1tYXRy
aXgvcnBpLXJnYi1sZWQtbWF0cml4Lmhhc2gKaW5kZXggMjY1ZTRjNDI0OS4uZWU2YzUwZGVlMCAx
MDA2NDQKLS0tIGEvcGFja2FnZS9ycGktcmdiLWxlZC1tYXRyaXgvcnBpLXJnYi1sZWQtbWF0cml4
Lmhhc2gKKysrIGIvcGFja2FnZS9ycGktcmdiLWxlZC1tYXRyaXgvcnBpLXJnYi1sZWQtbWF0cml4
Lmhhc2gKQEAgLTEsMyArMSwzIEBACiAjIExvY2FsbHkgY29tcHV0ZWQ6Ci1zaGEyNTYgIDQ5MGNh
NmZhMGM4MTQ1MWYyNDcyYjRhYTg1Nzk2YTg3Njc5MGYyZTIxMmJmMDg4MmUzYmI3Y2FmNWM0N2Uy
YzMgIHJwaS1yZ2ItbGVkLW1hdHJpeC1hNTYzMzhkYjBmMDAzZDUyMzZmMmNlOThjNzNhNTkxZDY0
YTcwODUyLnRhci5negorc2hhMjU2ICA5YTZkYTViMGFkNzMwODgzYTVmYTE4YWZjNTliMTI5N2I0
YjA1ZWI1ODFjMmMxNGFlNTBhMzU4MzI5NmE0YmVkICBycGktcmdiLWxlZC1tYXRyaXgtZjU1NzM2
Zjc1OTViYzAyODQ1MTY1ODk5NmVlZGVhOTc0MjY4OGJiYy50YXIuZ3oKIHNoYTI1NiAgODE3N2Y5
NzUxMzIxMzUyNmRmMmNmNjE4NGQ4ZmY5ODZjNjc1YWZiNTE0ZDRlNjhhNDA0MDEwNTIxYjg4MDY0
MyAgQ09QWUlORwpkaWZmIC0tZ2l0IGEvcGFja2FnZS9ycGktcmdiLWxlZC1tYXRyaXgvcnBpLXJn
Yi1sZWQtbWF0cml4Lm1rIGIvcGFja2FnZS9ycGktcmdiLWxlZC1tYXRyaXgvcnBpLXJnYi1sZWQt
bWF0cml4Lm1rCmluZGV4IDQ5OWZiNDA4YzIuLjUzNDA4OTk2YTMgMTAwNjQ0Ci0tLSBhL3BhY2th
Z2UvcnBpLXJnYi1sZWQtbWF0cml4L3JwaS1yZ2ItbGVkLW1hdHJpeC5taworKysgYi9wYWNrYWdl
L3JwaS1yZ2ItbGVkLW1hdHJpeC9ycGktcmdiLWxlZC1tYXRyaXgubWsKQEAgLTQsNyArNCw3IEBA
CiAjCiAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwoKLVJQSV9SR0JfTEVEX01BVFJJWF9WRVJTSU9O
ID0gYTU2MzM4ZGIwZjAwM2Q1MjM2ZjJjZTk4YzczYTU5MWQ2NGE3MDg1MgorUlBJX1JHQl9MRURf
TUFUUklYX1ZFUlNJT04gPSBmNTU3MzZmNzU5NWJjMDI4NDUxNjU4OTk2ZWVkZWE5NzQyNjg4YmJj
ICAjIDIwMjQtMDgtMTgKIFJQSV9SR0JfTEVEX01BVFJJWF9TSVRFID0gJChjYWxsIGdpdGh1Yixo
emVsbGVyLHJwaS1yZ2ItbGVkLW1hdHJpeCwkKFJQSV9SR0JfTEVEX01BVFJJWF9WRVJTSU9OKSkK
IFJQSV9SR0JfTEVEX01BVFJJWF9MSUNFTlNFID0gR1BMLTIuMAogUlBJX1JHQl9MRURfTUFUUklY
X0xJQ0VOU0VfRklMRVMgPSBDT1BZSU5HCgotLQoyLjQzLjAKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRy
b290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlz
dGluZm8vYnVpbGRyb290Cg==
