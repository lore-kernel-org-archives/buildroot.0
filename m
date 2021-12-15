Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FFDCC433EF
	for <buildroot@archiver.kernel.org>; Wed, 15 Dec 2021 13:55:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1562281C81;
	Wed, 15 Dec 2021 13:55:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id leK4lk1PVP6v; Wed, 15 Dec 2021 13:55:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7E12B817B5;
	Wed, 15 Dec 2021 13:55:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B603B1BF2A7
 for <buildroot@lists.busybox.net>; Wed, 15 Dec 2021 13:55:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A26648143A
 for <buildroot@lists.busybox.net>; Wed, 15 Dec 2021 13:55:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tXrESPrfJnyL for <buildroot@lists.busybox.net>;
 Wed, 15 Dec 2021 13:55:15 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from serv15.avernis.de (serv15.avernis.de [176.9.89.163])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 503F5817B5
 for <buildroot@buildroot.org>; Wed, 15 Dec 2021 13:55:15 +0000 (UTC)
Received: from iago.. (unknown [151.35.205.56])
 by serv15.avernis.de (Postfix) with ESMTPSA id 588F4BE6B730;
 Wed, 15 Dec 2021 14:55:11 +0100 (CET)
From: Andreas Ziegler <br015@umbiko.net>
To: buildroot@buildroot.org
Date: Wed, 15 Dec 2021 14:54:21 +0100
Message-Id: <20211215135421.1168030-1-br015@umbiko.net>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.3 at serv15.avernis.de
X-Virus-Status: Clean
Subject: [Buildroot] [PATCH 1/1] package/lighttpd: add missing static_assert
 macro
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
Cc: Andreas Ziegler <br015@umbiko.net>, Matt Weber <matthew.weber@collins.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Rml4ZXMgYnVpbGQgZmFpbHVyZSBpbiB0b29sY2hhaW5zIHVzaW5nIHVDbGliYzoKCkluIGZpbGUg
aW5jbHVkZWQgZnJvbSAuLi9zcmMvYWxnb194eGhhc2guYzo0ODoKLi4vc3JjL2FsZ29feHhoYXNo
Lmg6IEluIGZ1bmN0aW9uIOKAmFhYSDMyX2Nhbm9uaWNhbEZyb21IYXNo4oCZOgouLi9zcmMvYWxn
b194eGhhc2guaDoxNTY2OjU0OiB3YXJuaW5nOiBpbXBsaWNpdCBkZWNsYXJhdGlvbiBvZiBmdW5j
dGlvbiDigJhzdGF0aWNfYXNzZXJ04oCZIFstV2ltcGxpY2l0LWZ1bmN0aW9uLWRlY2xhcmF0aW9u
XQogMTU2NiB8ICMgICAgZGVmaW5lIFhYSF9TVEFUSUNfQVNTRVJUX1dJVEhfTUVTU0FHRShjLG0p
IGRvIHsgc3RhdGljX2Fzc2VydCgoYyksbSk7IH0gd2hpbGUoMCkKICAgICAgfCAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF5+fn5+fn5+fn5+fn4K
Li4vc3JjL2FsZ29feHhoYXNoLmg6MTU3MjozMjogbm90ZTogaW4gZXhwYW5zaW9uIG9mIG1hY3Jv
IOKAmFhYSF9TVEFUSUNfQVNTRVJUX1dJVEhfTUVTU0FHReKAmQogMTU3MiB8ICMgIGRlZmluZSBY
WEhfU1RBVElDX0FTU0VSVChjKSBYWEhfU1RBVElDX0FTU0VSVF9XSVRIX01FU1NBR0UoKGMpLCNj
KQogICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBefn5+fn5+fn5+fn5+fn5+
fn5+fn5+fn5+fn5+fn4KLi4vc3JjL2FsZ29feHhoYXNoLmg6MjI4Mjo1OiBub3RlOiBpbiBleHBh
bnNpb24gb2YgbWFjcm8g4oCYWFhIX1NUQVRJQ19BU1NFUlTigJkKIDIyODIgfCAgICAgWFhIX1NU
QVRJQ19BU1NFUlQoc2l6ZW9mKFhYSDMyX2Nhbm9uaWNhbF90KSA9PSBzaXplb2YoWFhIMzJfaGFz
aF90KSk7CiAgICAgIHwgICAgIF5+fn5+fn5+fn5+fn5+fn5+CgouLi4gYW5kIGxhdGVyOgoKLi4v
c3JjL2FsZ29feHhoYXNoLmg6MjI4MjogdW5kZWZpbmVkIHJlZmVyZW5jZSB0byBgc3RhdGljX2Fz
c2VydCcKClNpZ25lZC1vZmYtYnk6IEFuZHJlYXMgWmllZ2xlciA8YnIwMTVAdW1iaWtvLm5ldD4K
LS0tCiAuLi5sZ29feHhoYXNoLWFkZC1taXNzaW5nLXN0YXRpY19hc3NlcnQtbWFjcm8ucGF0Y2gg
fCAxMyArKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygrKQogY3Jl
YXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvbGlnaHR0cGQvMDAwMi1hbGdvX3h4aGFzaC1hZGQtbWlz
c2luZy1zdGF0aWNfYXNzZXJ0LW1hY3JvLnBhdGNoCgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9saWdo
dHRwZC8wMDAyLWFsZ29feHhoYXNoLWFkZC1taXNzaW5nLXN0YXRpY19hc3NlcnQtbWFjcm8ucGF0
Y2ggYi9wYWNrYWdlL2xpZ2h0dHBkLzAwMDItYWxnb194eGhhc2gtYWRkLW1pc3Npbmctc3RhdGlj
X2Fzc2VydC1tYWNyby5wYXRjaApuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAw
Li4xZmM4Y2EzYWZlCi0tLSAvZGV2L251bGwKKysrIGIvcGFja2FnZS9saWdodHRwZC8wMDAyLWFs
Z29feHhoYXNoLWFkZC1taXNzaW5nLXN0YXRpY19hc3NlcnQtbWFjcm8ucGF0Y2gKQEAgLTAsMCAr
MSwxMyBAQAorLS0tIGxpZ2h0dHBkLTEuNC42My9zcmMvYWxnb194eGhhc2guaAkyMDIxLTEyLTA0
IDE1OjQwOjI0LjAwMDAwMDAwMCArMDEwMAorKysrIGxpZ2h0dHBkLTEuNC42NC9zcmMvYWxnb194
eGhhc2guaAkyMDIxLTEyLTE1IDEwOjUwOjE3LjgwMTE1NTAwNyArMDEwMAorQEAgLTE1NjMsNiAr
MTU2MywxMCBAQAorICNpZm5kZWYgWFhIX1NUQVRJQ19BU1NFUlQKKyAjICBpZiBkZWZpbmVkKF9f
U1REQ19WRVJTSU9OX18pICYmIChfX1NURENfVkVSU0lPTl9fID49IDIwMTExMkwpICAgIC8qIEMx
MSAqLworICMgICAgaW5jbHVkZSA8YXNzZXJ0Lmg+CisrLyogdUNsaWJjIGRvZXMgbm90IGRlZmlu
ZSBzdGF0aWNfYXNzZXJ0ICovCisrIyAgICBpZm5kZWYgc3RhdGljX2Fzc2VydAorKyMgICAgICBk
ZWZpbmUgc3RhdGljX2Fzc2VydCBfU3RhdGljX2Fzc2VydAorKyMgICAgZW5kaWYKKyAjICAgIGRl
ZmluZSBYWEhfU1RBVElDX0FTU0VSVF9XSVRIX01FU1NBR0UoYyxtKSBkbyB7IHN0YXRpY19hc3Nl
cnQoKGMpLG0pOyB9IHdoaWxlKDApCisgIyAgZWxpZiBkZWZpbmVkKF9fY3BsdXNwbHVzKSAmJiAo
X19jcGx1c3BsdXMgPj0gMjAxMTAzTCkgICAgICAgICAgICAvKiBDKysxMSAqLworICMgICAgZGVm
aW5lIFhYSF9TVEFUSUNfQVNTRVJUX1dJVEhfTUVTU0FHRShjLG0pIGRvIHsgc3RhdGljX2Fzc2Vy
dCgoYyksbSk7IH0gd2hpbGUoMCkKLS0gCjIuMzMuMQoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RA
YnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5m
by9idWlsZHJvb3QK
