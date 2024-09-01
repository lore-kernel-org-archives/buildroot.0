Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DC8ECA101E
	for <buildroot@archiver.kernel.org>; Sun,  1 Sep 2024 14:29:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 389216064C;
	Sun,  1 Sep 2024 14:29:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NDrZEHDoDSoC; Sun,  1 Sep 2024 14:29:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4BE6960765
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4BE6960765;
	Sun,  1 Sep 2024 14:29:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B1CFA1BF2B6
 for <buildroot@lists.busybox.net>; Sun,  1 Sep 2024 14:29:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AC43E60765
 for <buildroot@lists.busybox.net>; Sun,  1 Sep 2024 14:29:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GUoN7GqYygHW for <buildroot@lists.busybox.net>;
 Sun,  1 Sep 2024 14:29:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.18;
 helo=mout.gmx.net; envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7AB656064C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7AB656064C
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7AB656064C
 for <buildroot@buildroot.org>; Sun,  1 Sep 2024 14:29:53 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from probook ([87.78.25.164]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MKbgE-1sUC6Y1q28-00KTPU; Sun, 01
 Sep 2024 16:29:46 +0200
Date: Sun, 01 Sep 2024 16:29:44 +0200
MIME-Version: 1.0
Message-Id: <20240901-rgbmatrix-v2-1-3a10c3c367e4@gmx.net>
References: <20240901-rgbmatrix-v2-0-3a10c3c367e4@gmx.net>
In-Reply-To: <20240901-rgbmatrix-v2-0-3a10c3c367e4@gmx.net>
To: buildroot@buildroot.org
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1725200985; l=1782;
 i=j.neuschaefer@gmx.net; s=20240329; h=from:subject:message-id;
 bh=1x/hR/b7P2vIfcg/VmoH6P/FJ1e6RGPOWZIavO4cS8A=;
 b=cpRVXb5uSMqQbvXGYX4rzx6TLo8hvSikkzkNfULF68RjSI2zZ1s1H0Wkw0NfT4TVLwgYYUk9V
 7gNtGAoNo+oBC2T3P5HZ/TINld6zSSBFq4sPPhXTcTRluTxzPXEEQSq
X-Developer-Key: i=j.neuschaefer@gmx.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Provags-ID: V03:K1:QCTGGmITPUcNsbHAlVKrCGoHvnepepI2kuZmCzEZ4ADpkWNCuhg
 QOjs6zV9KvBCkb6jQoMToGdUKOvEaoCFB5KnKibLrr8TbgHNXzeGkc7QoUqOdRG7Kff+043
 Oc0b764O5L0qB4CWlkj0zel3fLFKNnTnzw0Jxx1xCPc8AWMC1XvMOGokQGpuk8mgfsxxzAa
 q3aHEHDIvnDXQP7DqwABg==
UI-OutboundReport: notjunk:1;M01:P0:PrEDkah+Pdo=;/XrFocoTxWgSBbgGMwWRMoKdeBr
 WhpxgPKCqPqnxG5+ZuBMVm2KSapMaugcWHGPeBxwX4ak41PSmrX5dwL7+3JxjeWXSkt5gU2wS
 zqnmQJySVO+Iqeqn9QuWTfjbS9onzUuR/6lGRys4x2RUoSYyYDbq1ppRweeCAjiQLrazclcaQ
 qF/CjH9xuwC6lgAleIv0AnQWyhhCJiu4AZ6TzmUiKMe7jq+j5x/B6pAAJqpVJJCAGI/q9yYnO
 3+uABpD62jrSVvfORgylqS3tAM9uV8YVpZysRUiUP6KX3EKfLHRzDII/rwnY71l6IfMyfhmkl
 4JppdUlzjf4pcr4khEr8snw7bz18C4189B4tor7uiL2217yVvkG3Q6IkdEtqZPIdOXPo7+HW6
 iiiseV2/SLE7Q7WW88TKi4AafEN4Q9Zepy+8utYw6F+RFQfd+l8ScAetV/r12fCTnqVXqgskD
 i6qOOAPgXoydmVUgverlR+mRVhs7A23r7guVPgiFyUd4ILtayKhg69HOk5Tpnu0o+jzscSPFf
 LCZk/zzCOAdPxwyuotva9hxNnNUxehs1aZuKAJnQhzyvmWZYOu4ns6eZ4w+26l87Vn/5x2q/o
 iYOGdcW9KG2G6pJFzw3aVag4Bt4cbLyaTSemN6lybillzMW9CXJ/KgGoRqqmeVuNzmluufcqg
 ElxbTYTIHy20kfDfTb7jHHNhbbe/V9R+pqN6HXacC0mXHAWc0iuFs7PZt2Q18vzrxxM+DwErg
 UkE2ipDcKMr8/j45OzZwH9x6k5PNIz7WP3GpgX5dVh6ic7CfEaxr61l7vc05eGJcIAM9AEytN
 BAW2SWDlH4jTneM5AwJ6inIw==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.net; 
 s=s31663417; t=1725200986; x=1725805786; i=j.neuschaefer@gmx.net;
 bh=qA7QqCaYbLAFl927bm9IiP5Hxx8aYydSnKJwlKuIDtE=;
 h=X-UI-Sender-Class:From:Date:Subject:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=qTnPq8fsS31GWAWV5T/AI+JeuzVa7ngdeh9gEJxpHksx62xOHyTCLYHhiFF0Lkk/
 pFqPD/PYGclwzaJF1rc+st8v68tK5WoJyMRy/yByi/4K/Tvgi5kVim7EnXiyTaa9B
 gCy5ts8r/0qHfOMdmbcyVnaccWxPWqeSQHiduVr8C9J3FbBHpsbWRUjIPQhxD4cbg
 yujv9ig8MabEUjM0eMbD7KU/Eq+A3J60wLQyWi1prF+s8UblZR5dn/wpczFa1Lm2P
 5AcFZUVDDKWCQgBDsKvntdPEJy/8E3VXgH9URKzZlvIg+rgERzV8nPqKntOlPHXhi
 eh4zAceHBENAZO6hIA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.net header.i=j.neuschaefer@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=qTnPq8fs
Subject: [Buildroot] [PATCH v2 1/3] package/rpi-rgb-led-matrix: update to
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
X0xJQ0VOU0VfRklMRVMgPSBDT1BZSU5HCgotLQoyLjQ1LjIKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRy
b290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlz
dGluZm8vYnVpbGRyb290Cg==
