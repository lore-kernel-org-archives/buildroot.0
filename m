Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55826C54FC6
	for <buildroot@archiver.kernel.org>; Sun,  1 Sep 2024 16:11:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E9A3340200;
	Sun,  1 Sep 2024 16:11:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oVSfLTXm2mHo; Sun,  1 Sep 2024 16:11:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A881840205
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A881840205;
	Sun,  1 Sep 2024 16:11:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BD21F1BF30C
 for <buildroot@lists.busybox.net>; Sun,  1 Sep 2024 16:11:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B801360777
 for <buildroot@lists.busybox.net>; Sun,  1 Sep 2024 16:11:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zVbfOOpWfv7F for <buildroot@lists.busybox.net>;
 Sun,  1 Sep 2024 16:11:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.19;
 helo=mout.gmx.net; envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4C8A660774
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4C8A660774
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4C8A660774
 for <buildroot@buildroot.org>; Sun,  1 Sep 2024 16:11:50 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from probook ([87.78.25.164]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MatRZ-1sEUQx1wdv-00eWBt; Sun, 01
 Sep 2024 18:11:48 +0200
Date: Sun, 01 Sep 2024 18:11:42 +0200
MIME-Version: 1.0
Message-Id: <20240901-aer-v1-1-03b124cb64b1@gmx.net>
X-B4-Tracking: v=1; b=H4sIAD2S1GYC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDSwND3cTUIt2UZCNj0+Q0i1QTC2MloMqCotS0zAqwKdGxtbUAzfmuU1U
 AAAA=
To: buildroot@buildroot.org
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1725207108; l=1910;
 i=j.neuschaefer@gmx.net; s=20240329; h=from:subject:message-id;
 bh=2yj3ZsNM8w6CSKm0Uo6LwwuxkTdOhiicwa3cIkBr3Y8=;
 b=p+H4fb7vrIChFjHWRie2sUyMU/YfHwSmC2FW+sbI+LtBLSJfAt33HgWiuANa3UhDWkKC1e0ss
 lERHy4pliPpAAXvB6ZNzBn25ptz4ZEKZxoPpX1ZAXBiWYZVV46iarGq
X-Developer-Key: i=j.neuschaefer@gmx.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Provags-ID: V03:K1:InAG6Tzi/Wpp1SdS26HQS9mLBm3ZOjPGdveuxTKmZfL0TKWpxA6
 EGq9hvH3hmYbwNj4m+3okQKkAoBy7U0QqTBAL5a/syzrFV6Z0AXbasaT6DCq5DPQVTnTmSX
 0owryECfFBTg9dlOIyimgMqQdUh4Yex7G276vnL6T9y2Wc7ScEcr6WfCtnCh06OijBckC7P
 aBMTceZFd0lPEQpQPNeTQ==
UI-OutboundReport: notjunk:1;M01:P0:GvcCWlS8Phg=;BCNRiFAhHKjee+nAl+apQ8VzN4E
 d8CadO9hcovlKMkk5q+JViTezs0WldtymgUPHMx0GTis2ct4HCIDiSL/uc8+1Rks+imtqjbo1
 66Eqjy7egY5GbsIPkrtMqzoO2BzXa8+oIKJBDFSQWiC/DQ6BZchlnhzquXrhNYsItBqgV0Us7
 GdFMVjwDBLjXza2eMVIsmwRhBm1rf2x32mhEq44uMVQywvXlffhwZ0D9kKU8g5MCAcFH8ceRx
 qrQmzlkfnIt0XTfTdUzsuNkYXJj8BmlOpuiAMhrtgs1cGhTHxf81VvH7daw4oUgJpcM0Uh0Iy
 1BMsG1ypNRkaPB3yQcwvYRNBLsTidRBP/raiN8n30Hv7N+lPPUAwsKpGmzOJSqh90Grx5Mhm0
 Gh7qMXUC2SlA+IEjrPE0GYYk+P5xyaqWk9nHafWNAQF0VkSCSwUNLQuAZNdiivrpVkKRyDMbD
 vu+j89LNy9UtM7njdYiTi2M2jgjAMeePOmiFkvO5FETxqWnJiatOw03OzoPMtTNkvabfY9rzh
 XyRG9Gn7d/dE80y+z878o6mwv/LKI16ty9E7I/idMCnSiavTKEDihy+YVp9MfrbatewUUINH5
 yNTsVsv6QJvaWhXu7F+ayMXs7hK4d0fH2zDbXXWiKZWFt2tJhqn5qgHubO2o7SinCVN/h424d
 Ob+X7z3P6nbPlZ1g7E0U1Na+CI5wm+L6JSUSVCwHYK901Ai6AmWIgH/unbnZ7mGR0P7ljDlLC
 2nA29BGjgSTOraEf/B3L/x7CkdfDXkJdcHyttr+so3XOf9H1Pjd4nsxmTKUPBx08vUT73Si87
 M/FiFhpYcOOnf8vqhPkp6UNQ==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.net; 
 s=s31663417; t=1725207108; x=1725811908; i=j.neuschaefer@gmx.net;
 bh=uzIKS9VyXMhMJuSeQuje3CUWCrD/xvh4D+H4kq0x2Pg=;
 h=X-UI-Sender-Class:From:Date:Subject:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Message-Id:To:Cc:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=MhldWst1HOfFBDtQsoWdtMiQL3xlhKA88L+sjW7GKC9bq0fetnACSSGqGgub5hsL
 eTqfpSUhDDZLwX4ZSjJTgiv+xNnfrQMMJ39VaF409+tl0tg5Zl8fJshM9i57i1Ak/
 WfX2apT90P75tFmLZgX9ewN5xJDOQgkV5Gfd/Ee0j0Q4MrtHMNfpquZTsHSRVySzk
 HSpy2w2bDU9f7oJh++XqngLAH1PCjUUKdyBBumZxxrLANIkGi0hdpa/SeDY1Dr3hk
 uxXQG5NfCsmzSDSBFU+beyLPHjWQuB15QZ+gU0RVJD85ZkO98EMhWP+JBS4PyTQN3
 x0Mr+6aUeWl7sZQzHw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.net header.i=j.neuschaefer@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=MhldWst1
Subject: [Buildroot] [PATCH] package/aer-inject: switch upstream
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

QWNjb3JkaW5nIHRvIGEgY29tbWl0IGluIExpbnV4WzFdLCB0aGUgdXBzdHJlYW0gb2YgYWVyLWlu
amVjdCBjaGFuZ2VkIHRvCmh0dHBzOi8vZ2l0aHViLmNvbS9pbnRlbC9hZXItaW5qZWN0LgoKVGhl
IGhhc2ggY2hhbmdlZCBiZWNhdXNlIHRoZSB0YXJiYWxsIGlzIGdlbmVyYXRlZCBkaWZmZXJlbnRs
eS4KClsxXTogaHR0cHM6Ly9naXQua2VybmVsLm9yZy9saW51cy9hMjllNTI5MGUzNTY2YWU0ZGI0
ZTZmZTVmMzFjYWYyMzExOGM4MmI2CgotLS0KU2lnbmVkLW9mZi1ieTogSi4gTmV1c2Now6RmZXIg
PGoubmV1c2NoYWVmZXJAZ214Lm5ldD4KLS0tCiBwYWNrYWdlL2Flci1pbmplY3QvYWVyLWluamVj
dC5oYXNoIHwgMiArLQogcGFja2FnZS9hZXItaW5qZWN0L2Flci1pbmplY3QubWsgICB8IDMgKy0t
CiAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYg
LS1naXQgYS9wYWNrYWdlL2Flci1pbmplY3QvYWVyLWluamVjdC5oYXNoIGIvcGFja2FnZS9hZXIt
aW5qZWN0L2Flci1pbmplY3QuaGFzaAppbmRleCAzYjlkMTQ0ZWM5Li5lZTA5N2M4NzNhIDEwMDY0
NAotLS0gYS9wYWNrYWdlL2Flci1pbmplY3QvYWVyLWluamVjdC5oYXNoCisrKyBiL3BhY2thZ2Uv
YWVyLWluamVjdC9hZXItaW5qZWN0Lmhhc2gKQEAgLTEsMyArMSwzIEBACiAjIExvY2FsbHkgY29t
cHV0ZWQKLXNoYTI1NiAgN2VkNTk5NGI0OGYxYzA1MDRhZGQzODBiYTRkMTg2ZjQ4YTVhMjJiOWJj
MmRkOTBjNzlkMGQyZjBjMTgzNTQwYyAgYWVyLWluamVjdC05YmQ1ZTJjNzg4NmZjYTcyZjEzOWNk
ODQwMjQ4OGEyMjM1OTU3ZDQxLWdpdDQudGFyLmd6CitzaGEyNTYgIDQ5YTQ0YjdhOWUzOTgzZGMx
NWZkYzViYWNkMGUwOTVkZjY1MDI5NjAyNGY0M2Y5ZDZjMDgwYWQ1NGRlMGIwN2YgIGFlci1pbmpl
Y3QtOWJkNWUyYzc4ODZmY2E3MmYxMzljZDg0MDI0ODhhMjIzNTk1N2Q0MS50YXIuZ3oKIHNoYTI1
NiAgNjU5YTE5MWQ4Nzc1ZTA1YzZjNmE5YTRiYTY2YjM1NzdjNTc3MzQyYmI4M2YyMGQzOTMxMzVl
YjY2MzNjODk3MyAgUkVBRE1FCmRpZmYgLS1naXQgYS9wYWNrYWdlL2Flci1pbmplY3QvYWVyLWlu
amVjdC5tayBiL3BhY2thZ2UvYWVyLWluamVjdC9hZXItaW5qZWN0Lm1rCmluZGV4IDZiYzljYjQ0
ZGEuLmQwYWUzY2M1MTYgMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvYWVyLWluamVjdC9hZXItaW5qZWN0
Lm1rCisrKyBiL3BhY2thZ2UvYWVyLWluamVjdC9hZXItaW5qZWN0Lm1rCkBAIC01LDggKzUsNyBA
QAogIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKCiBBRVJfSU5KRUNUX1ZFUlNJT04gPSA5YmQ1ZTJj
Nzg4NmZjYTcyZjEzOWNkODQwMjQ4OGEyMjM1OTU3ZDQxCi1BRVJfSU5KRUNUX1NJVEUgPSBodHRw
czovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9nb25nLmNoZW4vYWVy
LWluamVjdC5naXQKLUFFUl9JTkpFQ1RfU0lURV9NRVRIT0QgPSBnaXQKK0FFUl9JTkpFQ1RfU0lU
RSA9ICQoY2FsbCBnaXRodWIsaW50ZWwsYWVyLWluamVjdCwkKEFFUl9JTkpFQ1RfVkVSU0lPTikp
CiBBRVJfSU5KRUNUX0xJQ0VOU0UgPSBHUEwtMi4wCiBBRVJfSU5KRUNUX0xJQ0VOU0VfRklMRVMg
PSBSRUFETUUKIEFFUl9JTkpFQ1RfREVQRU5ERU5DSUVTID0gaG9zdC1mbGV4IGhvc3QtYmlzb24K
Ci0tLQpiYXNlLWNvbW1pdDogMzc4MDE3NjdmNjhjMDU1MDBmMWQ0NDk1YjViYWFjMGU3MzQwZjdh
OQpjaGFuZ2UtaWQ6IDIwMjQwOTAxLWFlci1kYzIzNWNmOGU0ODMKCkJlc3QgcmVnYXJkcywKLS0K
Si4gTmV1c2Now6RmZXIgPGoubmV1c2NoYWVmZXJAZ214Lm5ldD4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVp
bGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4v
bGlzdGluZm8vYnVpbGRyb290Cg==
