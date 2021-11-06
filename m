Return-Path: <SRS0=GWv0=PZ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A183BC433EF
	for <buildroot@archiver.kernel.org>; Sat,  6 Nov 2021 09:15:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E5173611C1
	for <buildroot@archiver.kernel.org>; Sat,  6 Nov 2021 09:15:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E5173611C1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A47696071E;
	Sat,  6 Nov 2021 09:15:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id p7O3YXAKBJ2j; Sat,  6 Nov 2021 09:15:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 06150606E2;
	Sat,  6 Nov 2021 09:15:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AE1921BF34A
 for <buildroot@lists.busybox.net>; Sat,  6 Nov 2021 09:15:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9AC4A4015F
 for <buildroot@lists.busybox.net>; Sat,  6 Nov 2021 09:15:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zsIRgNXpEh0F for <buildroot@lists.busybox.net>;
 Sat,  6 Nov 2021 09:15:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5AEAC400CF
 for <buildroot@buildroot.org>; Sat,  6 Nov 2021 09:15:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1636190108;
 bh=dHnW5Otcd4zJlr98FpCzB/4gxzkVwsZPpp+4ngULik0=;
 h=X-UI-Sender-Class:From:To:Subject:Date;
 b=aaq/sWdlU5+bnAxF497xLDqWxuIQCppyhP+rtBWRbP1viOlhb+x/PbE+pfEUGHYTA
 /fMIESBdr9jmVzsbsvh1lJVDiPj6atsz+o55rNEo0TSoBBIKkObQfTE7kW0wDrQn54
 moh/WdiqAy7PFviaFcbgjBjS1NPxAq7AyvHGQUTk=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.fritz.box ([62.216.209.26]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MTzay-1n969G2J8s-00QyXK
 for <buildroot@buildroot.org>; Sat, 06 Nov 2021 10:15:08 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Sat,  6 Nov 2021 10:15:08 +0100
Message-Id: <20211106091508.29167-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:OqVyPOhfWhE2tG4ARI1MUeEAZ2KC2QXzm8ScXc6ZCjRtcBeCkcN
 0lOc0mubFKIw+CcGb5KItLb2Rh+hKku2ahCdF/HTKJftnd/voPcOFU4VXh6ydGX5vLOn6Hi
 AcULBMwtQhz74DTb3lZb8bnbWuLwHUGAgrQUZFdUeXy3xxzoq8bxMesB9mVIru3KVJAc4Xj
 5gfbwzQaOY5PjQ16Bz29w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:OLKsGeA3JoY=:f0GRk9cdjSlLkJJ+WXdhLb
 1ME0k5c7Kucp0wzWNurU6LC7BgEsBCCpFH98T1BRK4DIc7y3cuO/O1GqqKQWKB3I2lzl325pC
 Ykhcv2gmkgfcaHWMc5APRHuYzF4NLh+FdbCQHq1Id4ushKAJKamm6SPwqBqH5SKJn/xNRm+v/
 z+8UidgVf/UI/+GzWxGrLlVKrU6MZSLYFEdjKTMl2QCkryMquY3SjmzsvDbQDax0Dlo6CSc1s
 GUbYHJc0y1OONhu/zbF5gCHAg717NdInZJ5OkSGkVM6Iw4PS76fXjKoJYuW1v5mZH1kq39KJk
 IomCI97uZbxVwOpFD8QFkqQQZducJgtA1fI09e4j5l8/jweVyw3PaTk/o8dPxDo3jHiW+V2Xr
 wE8rNdewlfjO81oggS3S47u3OOYu4XqYPwo/2DRwYcHunmEzHbbjcUOzLiYycPxoMwnrWqFit
 a8jcrcSWWk1HA6WKpDbjUzv/Tn4PtYQHV/VoORp4MmxKw4z8BB6rLvualJZqCc4kFIWVyT4v9
 3XaB6nKuNMTWAsMMaI6nfCrD8eQE+clDy56qDH1sbYV22n/tS7l7kCzxJ9d31oL9vxxjIhnTk
 JXXODpUFhK7ghvy0WCtHf89Yol8n1JfmgJNfrvRchzBTAuCexIgULACcn7Wp3kSl1nCtxTWt+
 xT3ThnCiviicWrwlPBNVEFzEQWaAZvgm6VG02KbxrnIewhScTwW6IWUhAGOA7ccRvHEAxi9N6
 j9pVk/sdFQ7t+A2akMxmYUPyxcDOQw6RbXUSFnMUxPv5uiYTpq8ARXrF3myM3vqHdpGZTmWP+
 +mDZ0J1GULdhlmIPszmb48p2Pns13F+88DfVTovdHl8vlTgnuhm1PW0KkXiuzC/m/7v9WsK5N
 +PzkMdZL3DVw/9vEC1ebwBhAr/0dI6cZ2O1vVJtt1VVe0RoHj/X2hL+Vb7rCzblT3NBKpstf6
 5UP9kOjChhMmc+D3J89VLf2ly4POQqqgVp3Teg9vtjaMXnRfthz6JIosiP5Gni+we450yMtl0
 /5dGoXjWMhztcDubXTLAwiMfRfe7LayPysN5lwsv8Rp1aOF/GwOtmevydo75N2K2lgr6zEzVB
 jHdT3NaqDcYjhk=
Subject: [Buildroot] [PATCH v1] package/gdb: fix gdb-10.2 compile for uclibc
 < v1.0.35 (getrandom related)
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

LSBmaXggZ2V0cmFuZG9tIGNvbXBpbGUgZm9yIHVjbGliYyA8IHYxLjAuMzUsIGFkZCBtaXNzaW5n
IHN0ZGRlZi5oCiAgaW5jbHVkZSAoZml4ZWQgaW4gdWNsaWJjIHNpbmNlIHYxLjAuMzUsIHNlZSBb
MV0pCgpGaXhlczoKCiAgLSBodHRwOi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5uZXQvcmVzdWx0cy82
ZDRhNjJjNzAzYzg1ZGQ5OTNkZGIyZDkwZWJlMWY2Y2FkMjRlMGIwCgogIC4uLi9ob3N0L3g4Nl82
NC1idWlsZHJvb3QtbGludXgtdWNsaWJjL3N5c3Jvb3QvdXNyL2luY2x1ZGUvc3lzL3JhbmRvbS5o
OjI3OjM1OiBlcnJvcjogdW5rbm93biB0eXBlIG5hbWUg4oCYc2l6ZV904oCZCiAgICAgMjcgfCBl
eHRlcm4gaW50IGdldHJhbmRvbSh2b2lkICpfX2J1Ziwgc2l6ZV90IGNvdW50LCB1bnNpZ25lZCBp
bnQgZmxhZ3MpCiAgICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXn5+
fn5+CgpbMV0gaHR0cHM6Ly9jZ2l0LnVjbGliYy1uZy5vcmcvY2dpL2NnaXQvdWNsaWJjLW5nLmdp
dC9jb21taXQvP2lkPTAwOTcyYzAyYzJiNmUwYTk1ZDVkZWY0YTcxYmRmYjE4OGUwOTE3ODJ0CgpT
aWduZWQtb2ZmLWJ5OiBQZXRlciBTZWlkZXJlciA8cHMucmVwb3J0QGdteC5uZXQ+Ci0tLQogLi4u
Z2V0cmFuZG9tLWNvbXBpbGUtZm9yLXVjbGliYy12MS4wLjM1LnBhdGNoIHwgMzkgKysrKysrKysr
KysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDM5IGluc2VydGlvbnMoKykKIGNyZWF0ZSBtb2Rl
IDEwMDY0NCBwYWNrYWdlL2dkYi8xMC4yLzAwMDYtRml4LWdldHJhbmRvbS1jb21waWxlLWZvci11
Y2xpYmMtdjEuMC4zNS5wYXRjaAoKZGlmZiAtLWdpdCBhL3BhY2thZ2UvZ2RiLzEwLjIvMDAwNi1G
aXgtZ2V0cmFuZG9tLWNvbXBpbGUtZm9yLXVjbGliYy12MS4wLjM1LnBhdGNoIGIvcGFja2FnZS9n
ZGIvMTAuMi8wMDA2LUZpeC1nZXRyYW5kb20tY29tcGlsZS1mb3ItdWNsaWJjLXYxLjAuMzUucGF0
Y2gKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMC4uNGIyMTJlMmQwMwotLS0g
L2Rldi9udWxsCisrKyBiL3BhY2thZ2UvZ2RiLzEwLjIvMDAwNi1GaXgtZ2V0cmFuZG9tLWNvbXBp
bGUtZm9yLXVjbGliYy12MS4wLjM1LnBhdGNoCkBAIC0wLDAgKzEsMzkgQEAKK0Zyb20gYmI4OTRh
OWNmYjFjM2NmMGUwYTE3NGM0OTZhZDg0OGY1ODllZTdkYSBNb24gU2VwIDE3IDAwOjAwOjAwIDIw
MDEKK0Zyb206IFBldGVyIFNlaWRlcmVyIDxwcy5yZXBvcnRAZ214Lm5ldD4KK0RhdGU6IFNhdCwg
NiBOb3YgMjAyMSAxMDowNjoyNSArMDEwMAorU3ViamVjdDogW1BBVENIXSBGaXggZ2V0cmFuZG9t
IGNvbXBpbGUgZm9yIHVjbGliYyA8IHYxLjAuMzUKK01JTUUtVmVyc2lvbjogMS4wCitDb250ZW50
LVR5cGU6IHRleHQvcGxhaW47IGNoYXJzZXQ9VVRGLTgKK0NvbnRlbnQtVHJhbnNmZXItRW5jb2Rp
bmc6IDhiaXQKKworLSBmaXggZ2V0cmFuZG9tIGNvbXBpbGUgZm9yIHVjbGliYyA8IHYxLjAuMzUs
IGFkZCBtaXNzaW5nIHN0ZGRlZi5oCisgIGluY2x1ZGUgKGZpeGVkIGluIHVjbGliYyBzaW5jZSB2
MS4wLjM1LCBzZWUgWzFdKQorCitGaXhlczoKKworICAuLi4vaG9zdC94ODZfNjQtYnVpbGRyb290
LWxpbnV4LXVjbGliYy9zeXNyb290L3Vzci9pbmNsdWRlL3N5cy9yYW5kb20uaDoyNzozNTogZXJy
b3I6IHVua25vd24gdHlwZSBuYW1lIOKAmHNpemVfdOKAmQorICAgICAyNyB8IGV4dGVybiBpbnQg
Z2V0cmFuZG9tKHZvaWQgKl9fYnVmLCBzaXplX3QgY291bnQsIHVuc2lnbmVkIGludCBmbGFncykK
KyAgICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXn5+fn5+CisKK1sx
XSBodHRwczovL2NnaXQudWNsaWJjLW5nLm9yZy9jZ2kvY2dpdC91Y2xpYmMtbmcuZ2l0L2NvbW1p
dC8/aWQ9MDA5NzJjMDJjMmI2ZTBhOTVkNWRlZjRhNzFiZGZiMTg4ZTA5MTc4MnQKKworU2lnbmVk
LW9mZi1ieTogUGV0ZXIgU2VpZGVyZXIgPHBzLnJlcG9ydEBnbXgubmV0PgorLS0tCisgZ251bGli
L2ltcG9ydC9nZXRyYW5kb20uYyB8IDEgKworIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigr
KQorCitkaWZmIC0tZ2l0IGEvZ251bGliL2ltcG9ydC9nZXRyYW5kb20uYyBiL2dudWxpYi9pbXBv
cnQvZ2V0cmFuZG9tLmMKK2luZGV4IDAzMGE3OGIuLjdiMjQzNTAgMTAwNjQ0CistLS0gYS9nbnVs
aWIvaW1wb3J0L2dldHJhbmRvbS5jCisrKysgYi9nbnVsaWIvaW1wb3J0L2dldHJhbmRvbS5jCitA
QCAtMTksNiArMTksNyBAQAorIAorICNpbmNsdWRlIDxjb25maWcuaD4KKyAKKysjaW5jbHVkZSA8
c3RkZGVmLmg+CisgI2luY2x1ZGUgPHN5cy9yYW5kb20uaD4KKyAKKyAjaW5jbHVkZSA8ZXJybm8u
aD4KKy0tIAorMi4zMy4xCisKLS0gCjIuMzMuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVp
bGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9i
dWlsZHJvb3QK
