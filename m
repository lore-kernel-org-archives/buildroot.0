Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DDCCE7D240
	for <buildroot@archiver.kernel.org>; Tue, 26 Sep 2023 07:22:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A486F6140B;
	Tue, 26 Sep 2023 07:22:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A486F6140B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Bx50aKP0YwLI; Tue, 26 Sep 2023 07:22:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E044160AA5;
	Tue, 26 Sep 2023 07:22:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E044160AA5
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3EFCA1BF2FA
 for <buildroot@lists.busybox.net>; Tue, 26 Sep 2023 07:22:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 172EF41E6B
 for <buildroot@lists.busybox.net>; Tue, 26 Sep 2023 07:22:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 172EF41E6B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5ec2IqoHdLFw for <buildroot@lists.busybox.net>;
 Tue, 26 Sep 2023 07:22:41 +0000 (UTC)
Received: from smtpcmd0757.aruba.it (smtpcmd0757.aruba.it [62.149.156.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8235C41E48
 for <buildroot@buildroot.org>; Tue, 26 Sep 2023 07:22:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8235C41E48
Received: from localhost.localdomain ([146.241.127.78])
 by Aruba Outgoing Smtp  with ESMTPSA
 id l2OxqcgAjDAHrl2OyqFAox; Tue, 26 Sep 2023 09:22:36 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Tue, 26 Sep 2023 09:22:34 +0200
Message-Id: <20230926072234.3639106-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfFqg/gvYHNl+Sg0Ha7fLh7Syoc0H55EaUe4yBkbY0jld4+bqQUm5IWr3EQVvZORzHBqOHl2XEEUwAs2UNKzFIE1gmTt6ApXVmCMK2aVEt3IARltxOyrm
 gd/L1k764oP3a8YlOBTq1H8oCsV6Cq5VJerCQsi0dBJCjc6K9p6cF2BbloqI4IUHMq66aP0PC/0ZPZy72ikpyTgl/axQe6XCTjR5RzCZb32szk8xpgcRE6RG
 kfzucmai/l5IW2ZDEvgLUkr4S/uY41zXefJt3SNarRIPR1fRoBbEXX8kVd/AtN7FHYiX450US5oEXR1MYbdmWPnj0Z74TdyrC2LRNpvjSRM=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1695712956; bh=90sNlRkTkBMbFknZQLMMog3wLzrtgNvgqAEIGpqkyOE=;
 h=From:To:Subject:Date:MIME-Version:Content-Type;
 b=hOcQvWKC+3/cbdG1ZH3V5xDYWATD9Y0kyF1YyYEixv3uxOIIvksM3o3molyDa5MWN
 L72xgQw5J2zU7680oe3/XHZgoS5WUW6vppEnDQ5TnkZMLxQ9Zx6sMeNk43BKUzjh2G
 vBOONMUllmKyesG5bychX7105ksD6+Drzn3QTtIxRIrZffnnj3i688gR1FWlmGRE2G
 kcWLpU5q0J1UQmOQ87ID0MBXvBUJhbjNAx/QkZXMa98JJtgVNd+6eUKOpmsANF0U6k
 aywarHFZxGQNNOpBVBI/OnPAHffWGLOoEbp+ys/BGH3iPIzO6B05m9aQ7l2jz+z6/B
 3rA6uoqqPj0WA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=hOcQvWKC
Subject: [Buildroot] [PATCH] package/mmc-utils: fix build failure due to
 potential overflow
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QWRkIGxvY2FsIHBhdGNoIHBlbmRpbmcgdXBzdHJlYW0gdG8gZml4IHBvdGVudGlhbCBvdmVyZmxv
dyBvbiByZWFkKCkuClRoaXMgYnVpbGQgZmFpbHVyZSBpcyBjYXRjaGVkIGJ5IGZvcnRpZnkuCgpG
aXhlczoKaHR0cDovL2F1dG9idWlsZC5idWlsZHJvb3QubmV0L3Jlc3VsdHMvYTUzOTIyYzVkYjNl
NjA1YTVlODFlNTNjMDM0ZjQ1MDE3ZWJiN2RiNwoKU2lnbmVkLW9mZi1ieTogR2l1bGlvIEJlbmV0
dGkgPGdpdWxpby5iZW5ldHRpQGJlbmV0dGllbmdpbmVlcmluZy5jb20+Ci0tLQogLi4uMDAxLW1t
Yy11dGlscy1maXgtcG90ZW50aWFsLW92ZXJmbG93LnBhdGNoIHwgNDkgKysrKysrKysrKysrKysr
KysrKwogMSBmaWxlIGNoYW5nZWQsIDQ5IGluc2VydGlvbnMoKykKIGNyZWF0ZSBtb2RlIDEwMDY0
NCBwYWNrYWdlL21tYy11dGlscy8wMDAxLW1tYy11dGlscy1maXgtcG90ZW50aWFsLW92ZXJmbG93
LnBhdGNoCgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9tbWMtdXRpbHMvMDAwMS1tbWMtdXRpbHMtZml4
LXBvdGVudGlhbC1vdmVyZmxvdy5wYXRjaCBiL3BhY2thZ2UvbW1jLXV0aWxzLzAwMDEtbW1jLXV0
aWxzLWZpeC1wb3RlbnRpYWwtb3ZlcmZsb3cucGF0Y2gKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5k
ZXggMDAwMDAwMDAwMC4uZDI3ZGY5MWZiMAotLS0gL2Rldi9udWxsCisrKyBiL3BhY2thZ2UvbW1j
LXV0aWxzLzAwMDEtbW1jLXV0aWxzLWZpeC1wb3RlbnRpYWwtb3ZlcmZsb3cucGF0Y2gKQEAgLTAs
MCArMSw0OSBAQAorRnJvbSBlOGE4NGM3MDQ1ODMwODNjYzg0ODdiYTQxZDE0ODhmYWYxMjEwYWVj
IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbTogR2l1bGlvIEJlbmV0dGkgPGdpdWxpby5i
ZW5ldHRpQGJlbmV0dGllbmdpbmVlcmluZy5jb20+CitEYXRlOiBUdWUsIDI2IFNlcCAyMDIzIDA5
OjEyOjIzICswMjAwCitTdWJqZWN0OiBbUEFUQ0hdIG1tYy11dGlsczogZml4IHBvdGVudGlhbCBv
dmVyZmxvdworTUlNRS1WZXJzaW9uOiAxLjAKK0NvbnRlbnQtVHlwZTogdGV4dC9wbGFpbjsgY2hh
cnNldD1VVEYtOAorQ29udGVudC1UcmFuc2Zlci1FbmNvZGluZzogOGJpdAorCitXaXRoIGZvcnRp
ZnkgZW5hYmxlZCBnY2MgdGhyb3dzIGZvbGxvd2luZyBlcnJvcjoKKyAgICAgICAgICAgICAgICAg
ZnJvbSBtbWNfY21kcy5jOjIwOgorSW4gZnVuY3Rpb24g4oCYcmVhZOKAmSwKKyAgICBpbmxpbmVk
IGZyb20g4oCYZG9fcnBtYl93cml0ZV9rZXnigJkgYXQgbW1jX2NtZHMuYzoyMjMzOjg6CisvaG9t
ZS9naXVsaW9iZW5ldHRpL2JyX3JlcHJvZHVjZS9hNTM5MjJjNWRiM2U2MDVhNWU4MWU1M2MwMzRm
NDUwMTdlYmI3ZGI3L291dHB1dC9ob3N0L21pcHNlbC1idWlsZHJvb3QtbGludXgtZ251L3N5c3Jv
b3QvdXNyL2luY2x1ZGUvYml0cy91bmlzdGQuaDozODoxMDogZXJyb3I6IOKAmF9fcmVhZF9hbGlh
c+KAmSB3cml0aW5nIDIyOCBvciBtb3JlIGJ5dGVzIGludG8gYSByZWdpb24gb2Ygc2l6ZSAzMiBv
dmVyZmxvd3MgdGhlIGRlc3RpbmF0aW9uIFstV2Vycm9yPXN0cmluZ29wLW92ZXJmbG93PV0KKyAg
IDM4IHwgICByZXR1cm4gX19nbGliY19mb3J0aWZ5IChyZWFkLCBfX25ieXRlcywgc2l6ZW9mIChj
aGFyKSwKKyAgICAgIHwgICAgICAgICAgXn5+fn5+fn5+fn5+fn5+CittbWNfY21kcy5jOiBJbiBm
dW5jdGlvbiDigJhkb19ycG1iX3dyaXRlX2tleeKAmToKK21tY19jbWRzLmM6MjA4NzoxOTogbm90
ZTogZGVzdGluYXRpb24gb2JqZWN0IOKAmGtleV9tYWPigJkgb2Ygc2l6ZSAzMgorIDIwODcgfCAg
ICAgICAgIHVfaW50OF90ICBrZXlfbWFjWzMyXTsKKyAgICAgIHwgICAgICAgICAgICAgICAgICAg
Xn5+fn5+fgorL2hvbWUvZ2l1bGlvYmVuZXR0aS9icl9yZXByb2R1Y2UvYTUzOTIyYzVkYjNlNjA1
YTVlODFlNTNjMDM0ZjQ1MDE3ZWJiN2RiNy9vdXRwdXQvaG9zdC9taXBzZWwtYnVpbGRyb290LWxp
bnV4LWdudS9zeXNyb290L3Vzci9pbmNsdWRlL2JpdHMvdW5pc3RkLmg6MjY6MTY6IG5vdGU6IGlu
IGEgY2FsbCB0byBmdW5jdGlvbiDigJhfX3JlYWRfYWxpYXPigJkgZGVjbGFyZWQgd2l0aCBhdHRy
aWJ1dGUg4oCYYWNjZXNzICh3cml0ZV9vbmx5LCAyLCAzKeKAmQorICAgMjYgfCBleHRlcm4gc3Np
emVfdCBfX1JFRElSRUNUIChfX3JlYWRfYWxpYXMsIChpbnQgX19mZCwgdm9pZCAqX19idWYsCisg
ICAgICB8ICAgICAgICAgICAgICAgIF5+fn5+fn5+fn4KKworcmVhZCgpIGNvdWxkIHBvdGVudGlh
bGx5IHJldHVybiBtb3JlIHRoYW4gbmJ5dGUgc28gbGV0J3MgY2hlY2sgZm9yCityZXQgPCBuYnl0
ZS4KKworVXBzdHJlYW06IGh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVjdC9saW51
eC1tbWMvcGF0Y2gvMjAyMzA5MjYwNzE1MjQuMzYzODcwNi0xLWdpdWxpby5iZW5ldHRpQGJlbmV0
dGllbmdpbmVlcmluZy5jb20vCisKK1NpZ25lZC1vZmYtYnk6IEdpdWxpbyBCZW5ldHRpIDxnaXVs
aW8uYmVuZXR0aUBiZW5ldHRpZW5naW5lZXJpbmcuY29tPgorLS0tCisgbW1jX2NtZHMuYyB8IDIg
Ky0KKyAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKKworZGlm
ZiAtLWdpdCBhL21tY19jbWRzLmMgYi9tbWNfY21kcy5jCitpbmRleCAxMGQwNjNkLi5hZTdiODc2
IDEwMDY0NAorLS0tIGEvbW1jX2NtZHMuYworKysrIGIvbW1jX2NtZHMuYworQEAgLTIwNjUsNyAr
MjA2NSw3IEBAIGludCBkb19zYW5pdGl6ZShpbnQgbmFyZ3MsIGNoYXIgKiphcmd2KQorIAkJCX0J
CQkJCQkJCQkJXAorIAkJCWVsc2UgaWYgKHIgPiAwKQkJCQkJCQlcCisgCQkJCXJldCArPSByOwkJ
CQkJCQlcCistCQl9IHdoaWxlIChyICE9IDAgJiYgKHNpemVfdClyZXQgIT0gbmJ5dGUpOwlcCisr
CQl9IHdoaWxlIChyICE9IDAgJiYgKHNpemVfdClyZXQgPCBuYnl0ZSk7CVwKKyAJCQkJCQkJCQkJ
CQkJXAorIAkJcmV0OwkJCQkJCQkJCQlcCisgCX0pCistLSAKKzIuMzQuMQorCi0tIAoyLjM0LjEK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9v
dCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWls
ZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
