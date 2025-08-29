Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A496CA0FF0
	for <buildroot@archiver.kernel.org>; Fri, 29 Aug 2025 16:14:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 051AE842F2;
	Fri, 29 Aug 2025 16:14:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sUDzac8qNy2n; Fri, 29 Aug 2025 16:14:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EA75D841AD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EA75D841AD;
	Fri, 29 Aug 2025 16:13:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id CA77AD2
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 16:13:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B0B866167B
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 16:13:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jO8FtS9Cs8mj for <buildroot@buildroot.org>;
 Fri, 29 Aug 2025 16:13:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org CB003615E8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CB003615E8
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CB003615E8
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 16:13:56 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id B7A4A1A0E4C;
 Fri, 29 Aug 2025 16:13:54 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 8F2F5605F1;
 Fri, 29 Aug 2025 16:13:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 8F26A1C22D71B; 
 Fri, 29 Aug 2025 18:13:49 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Bernd Kuhls <bernd@kuhls.net>
Date: Fri, 29 Aug 2025 18:13:44 +0200
Message-ID: <20250829161345.2218058-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1756484034; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding; bh=X38qu/c5t43cfg+ui5Gd4qJaGbdbRJWg5akTEx59qDk=;
 b=PPR20UxZyiodxrqIZ/uBMfhj5dFRgTLq0fpHnyGEXbVS83y7qiaMvCBD/RKLVOSJvVGlXd
 Xu36H6ICF8uXmWsKYYjoxD/0QN2V1sZdySAgpwC5S7VxH6E73aCjRN+Rkc6cn134Q92eG/
 bSK3OqQpaIFF77MOc3r2yr4s2GIqDv6wbbzmA9LlJqkl9JFPL0v9ExOEtsuPDgYr7QthKa
 CqGvBi8aiIGP+NejbuIN3pPEFSoXYp4Od+Edk4ZgTDZIeD8ZCT9+uI+rQ1sZU18yW33YrM
 OQXWtkFVCPUMylZflT9fXzuiFZqVJEG9hJOBfr++kfWfy/eGOIrBk27jwdA6OQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=PPR20UxZ
Subject: [Buildroot] [PATCH] package/libfreeglut: fix build with GCC 15.x
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Rml4ZXM6CgovaG9tZS90aG9tYXMvYnVpbGRyb290L2J1aWxkcm9vdC9vdXRwdXRzL2FsbC9idWls
ZC9saWJmcmVlZ2x1dC0zLjQuMC9zcmMveDExL2ZnX2luaXRfeDExLmM6Mjk3OjY6IGVycm9yOiBj
b25mbGljdGluZyB0eXBlcyBmb3Ig4oCYZmdQbGF0Zm9ybURlc3Ryb3lDb250ZXh04oCZOyBoYXZl
IOKAmHZvaWQoU0ZHX1BsYXRmb3JtRGlzcGxheSwgIHN0cnVjdCBfX0dMWGNvbnRleHRSZWMgKini
gJkge2FrYSDigJh2b2lkKHN0cnVjdCB0YWdTRkdfUGxhdGZvcm1EaXNwbGF5LCAgc3RydWN0IF9f
R0xYY29udGV4dFJlYyAqKeKAmX0KICAyOTcgfCB2b2lkIGZnUGxhdGZvcm1EZXN0cm95Q29udGV4
dCAoIFNGR19QbGF0Zm9ybURpc3BsYXkgcERpc3BsYXksIFNGR19XaW5kb3dDb250ZXh0VHlwZSBN
Q29udGV4dCApCgpObyBhdXRvYnVpbGRlciBmYWlsdXJlcyBmb3IgdGhpcyBpc3N1ZS4KClNpZ25l
ZC1vZmYtYnk6IFRob21hcyBQZXRhenpvbmkgPHRob21hcy5wZXRhenpvbmlAYm9vdGxpbi5jb20+
Ci0tLQogLi4uZm9ybURlc3Ryb3lDb250ZXh0LXByb3RvdHlwZS1mb3ItQzIzLnBhdGNoIHwgMzEg
KysrKysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDMxIGluc2VydGlvbnMoKykKIGNy
ZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL2xpYmZyZWVnbHV0LzAwMDItZWdsLWZpeC1mZ1BsYXRm
b3JtRGVzdHJveUNvbnRleHQtcHJvdG90eXBlLWZvci1DMjMucGF0Y2gKCmRpZmYgLS1naXQgYS9w
YWNrYWdlL2xpYmZyZWVnbHV0LzAwMDItZWdsLWZpeC1mZ1BsYXRmb3JtRGVzdHJveUNvbnRleHQt
cHJvdG90eXBlLWZvci1DMjMucGF0Y2ggYi9wYWNrYWdlL2xpYmZyZWVnbHV0LzAwMDItZWdsLWZp
eC1mZ1BsYXRmb3JtRGVzdHJveUNvbnRleHQtcHJvdG90eXBlLWZvci1DMjMucGF0Y2gKbmV3IGZp
bGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMC4uYzNhYWRiODdkZQotLS0gL2Rldi9udWxs
CisrKyBiL3BhY2thZ2UvbGliZnJlZWdsdXQvMDAwMi1lZ2wtZml4LWZnUGxhdGZvcm1EZXN0cm95
Q29udGV4dC1wcm90b3R5cGUtZm9yLUMyMy5wYXRjaApAQCAtMCwwICsxLDMxIEBACitGcm9tIDZk
MDE3OGExYzQzZjk0YjA0NmU0ZDVmM2RmYTcxODVhMzk4NzA2YWUgTW9uIFNlcCAxNyAwMDowMDow
MCAyMDAxCitGcm9tOiBTYW0gSmFtZXMgPHNhbUBnZW50b28ub3JnPgorRGF0ZTogU3VuLCAxNyBO
b3YgMjAyNCAwMToxNDoyNiArMDAwMAorU3ViamVjdDogW1BBVENIXSBlZ2w6IGZpeCBmZ1BsYXRm
b3JtRGVzdHJveUNvbnRleHQgcHJvdG90eXBlIGZvciBDMjMKKworQzIzIHJlbW92ZXMgdW5wcm90
b3R5cGVkIGZ1bmN0aW9ucywgc28gdGhpcyBjb25mbGljdGVkIHdpdGggdGhlIGRlZmluaXRpb24K
K2luIGZnX2luaXRfeDExLmMuCisKK0J1ZzogaHR0cHM6Ly9naXRodWIuY29tL2ZyZWVnbHV0L2Zy
ZWVnbHV0L2lzc3Vlcy8xODYKKworVXBzdHJlYW06IDgwMDc3MmU5OTNhM2NlZmZhMDFjY2YzZmNh
NDQ5ZDMyNzljZGUzMzgKK1NpZ25lZC1vZmYtYnk6IFRob21hcyBQZXRhenpvbmkgPHRob21hcy5w
ZXRhenpvbmlAYm9vdGxpbi5jb20+CistLS0KKyBzcmMvZWdsL2ZnX2luaXRfZWdsLmggfCAyICst
CisgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCisKK2RpZmYg
LS1naXQgYS9zcmMvZWdsL2ZnX2luaXRfZWdsLmggYi9zcmMvZWdsL2ZnX2luaXRfZWdsLmgKK2lu
ZGV4IDU5MmM1MjIxLi44NzUzZGMwYiAxMDA2NDQKKy0tLSBhL3NyYy9lZ2wvZmdfaW5pdF9lZ2wu
aAorKysrIGIvc3JjL2VnbC9mZ19pbml0X2VnbC5oCitAQCAtMjgsNiArMjgsNiBAQAorIAorIGV4
dGVybiB2b2lkIGZnaFBsYXRmb3JtSW5pdGlhbGl6ZUVHTCgpOworIGV4dGVybiB2b2lkIGZnaFBs
YXRmb3JtQ2xvc2VEaXNwbGF5RUdMKCk7CistZXh0ZXJuIHZvaWQgZmdQbGF0Zm9ybURlc3Ryb3lD
b250ZXh0KCk7CisrZXh0ZXJuIHZvaWQgZmdQbGF0Zm9ybURlc3Ryb3lDb250ZXh0ICggU0ZHX1Bs
YXRmb3JtRGlzcGxheSBwRGlzcGxheSwgU0ZHX1dpbmRvd0NvbnRleHRUeXBlIE1Db250ZXh0ICk7
CisgCisgI2VuZGlmCistLSAKKzIuNTAuMQorCi0tIAoyLjUwLjEKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVp
bGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4v
bGlzdGluZm8vYnVpbGRyb290Cg==
