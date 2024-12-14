Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD7CCE7716A
	for <buildroot@archiver.kernel.org>; Sat, 14 Dec 2024 11:48:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6A73884694;
	Sat, 14 Dec 2024 11:48:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qOx6oJAg-wYF; Sat, 14 Dec 2024 11:48:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7D64084697
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7D64084697;
	Sat, 14 Dec 2024 11:48:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id C704EC5
 for <buildroot@buildroot.org>; Sat, 14 Dec 2024 11:48:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A6E1D4021A
 for <buildroot@buildroot.org>; Sat, 14 Dec 2024 11:48:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZFKPZiWujKpS for <buildroot@buildroot.org>;
 Sat, 14 Dec 2024 11:48:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::226;
 helo=relay6-d.mail.gandi.net; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 388B840229
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 388B840229
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 388B840229
 for <buildroot@buildroot.org>; Sat, 14 Dec 2024 11:48:15 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 47F9AC0002;
 Sat, 14 Dec 2024 11:48:14 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peko@dell.be.48ers.dk>) id 1tMQd3-00CJOn-2M;
 Sat, 14 Dec 2024 12:48:13 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 14 Dec 2024 12:48:07 +0100
Message-Id: <20241214114808.2934481-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: [Buildroot] [PATCH] package/wireshark: security bump to version
 4.2.9
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyB2dWxuZXJhYmlsaXRpZXM6Cgo0LjIuOToKCkNWRS0yMDI0LTEx
NTk1OiB3bnBhLXNlYy0yMDI0LTE0IMK3IEZpdmVDbyBSQVAgZGlzc2VjdG9yIGluZmluaXRlIGxv
b3AKaHR0cHM6Ly93d3cud2lyZXNoYXJrLm9yZy9zZWN1cml0eS93bnBhLXNlYy0yMDI0LTE0CgpD
VkUtMjAyNC0xMTU5Njogd25wYS1zZWMtMjAyNC0xNSDCtyBFQ01QIGRpc3NlY3RvciBjcmFzaApo
dHRwczovL3d3dy53aXJlc2hhcmsub3JnL3NlY3VyaXR5L3ducGEtc2VjLTIwMjQtMTUKCjQuMi44
OgoKQ1ZFLTIwMjQtOTc4MTogd25wYS1zZWMtMjAyNC0xMyDCtyBBcHBsZVRhbGsgYW5kIFJFTE9B
RCBGcmFtaW5nIGRpc3NlY3RvcgpjcmFzaGVzCmh0dHBzOi8vd3d3LndpcmVzaGFyay5vcmcvc2Vj
dXJpdHkvd25wYS1zZWMtMjAyNC0xMwoKNC4yLjc6CgpDVkUtMjAyNC04MjUwOiB3bnBhLXNlYy0y
MDI0LTExIMK3IE5UTE1TU1AgZGlzc2VjdG9yIGNyYXNoCmh0dHBzOi8vd3d3LndpcmVzaGFyay5v
cmcvc2VjdXJpdHkvd25wYS1zZWMtMjAyNC0xMQoKU2lnbmVkLW9mZi1ieTogUGV0ZXIgS29yc2dh
YXJkIDxwZXRlckBrb3JzZ2FhcmQuY29tPgotLS0KIHBhY2thZ2Uvd2lyZXNoYXJrL3dpcmVzaGFy
ay5oYXNoIHwgNiArKystLS0KIHBhY2thZ2Uvd2lyZXNoYXJrL3dpcmVzaGFyay5tayAgIHwgMiAr
LQogMiBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEvcGFja2FnZS93aXJlc2hhcmsvd2lyZXNoYXJrLmhhc2ggYi9wYWNrYWdlL3dpcmVz
aGFyay93aXJlc2hhcmsuaGFzaAppbmRleCAwNjExOTg2MWYyLi42NDJiYzU4NjZkIDEwMDY0NAot
LS0gYS9wYWNrYWdlL3dpcmVzaGFyay93aXJlc2hhcmsuaGFzaAorKysgYi9wYWNrYWdlL3dpcmVz
aGFyay93aXJlc2hhcmsuaGFzaApAQCAtMSw2ICsxLDYgQEAKLSMgRnJvbSBodHRwczovL3d3dy53
aXJlc2hhcmsub3JnL2Rvd25sb2FkL3NyYy9hbGwtdmVyc2lvbnMvU0lHTkFUVVJFUy00LjIuNi50
eHQKLXNoYTEgIGRiMDM3NGRjZTM2MGI5OWQ4YWJiOWEzZjM0NzFmM2ZjOThkNmQwOTkgIHdpcmVz
aGFyay00LjIuNi50YXIueHoKLXNoYTI1NiAgNWVjNjAyOGRmMjkwNjhkODg5Yzk4NDg5YmYxOTRh
ODg0YjAwODMxMTA2ZmVhMWU5MjFmZWEzYzY1ZjIwMDNmNSAgd2lyZXNoYXJrLTQuMi42LnRhci54
egorIyBGcm9tIGh0dHBzOi8vd3d3LndpcmVzaGFyay5vcmcvZG93bmxvYWQvc3JjL2FsbC12ZXJz
aW9ucy9TSUdOQVRVUkVTLTQuMi45LnR4dAorc2hhMSAgZDFhYmJlMTEwNDUxZGFiOWU1N2M5ZWUx
ZmUwODkyZTBkNmE3ZDUxNSAgd2lyZXNoYXJrLTQuMi45LnRhci54egorc2hhMjU2ICA2MmMyYjY2
NTJkN2Y5YTUwNjY4ODY3YmQ1N2IyMTYwOWM5YTliNjk1MGYyNmU3ZjMwYTI0YjJkZTBlNzJkZWQz
ICB3aXJlc2hhcmstNC4yLjkudGFyLnh6CiAKICMgTG9jYWxseSBjYWxjdWxhdGVkCiBzaGEyNTYg
IDgxNzdmOTc1MTMyMTM1MjZkZjJjZjYxODRkOGZmOTg2YzY3NWFmYjUxNGQ0ZTY4YTQwNDAxMDUy
MWI4ODA2NDMgIENPUFlJTkcKZGlmZiAtLWdpdCBhL3BhY2thZ2Uvd2lyZXNoYXJrL3dpcmVzaGFy
ay5tayBiL3BhY2thZ2Uvd2lyZXNoYXJrL3dpcmVzaGFyay5tawppbmRleCAyNDI0MzAxOTRmLi5i
YWRlNjhmMjU4IDEwMDY0NAotLS0gYS9wYWNrYWdlL3dpcmVzaGFyay93aXJlc2hhcmsubWsKKysr
IGIvcGFja2FnZS93aXJlc2hhcmsvd2lyZXNoYXJrLm1rCkBAIC00LDcgKzQsNyBAQAogIwogIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMKIAotV0lSRVNIQVJLX1ZFUlNJT04gPSA0LjIuNgorV0lSRVNI
QVJLX1ZFUlNJT04gPSA0LjIuOQogV0lSRVNIQVJLX1NPVVJDRSA9IHdpcmVzaGFyay0kKFdJUkVT
SEFSS19WRVJTSU9OKS50YXIueHoKIFdJUkVTSEFSS19TSVRFID0gaHR0cHM6Ly93d3cud2lyZXNo
YXJrLm9yZy9kb3dubG9hZC9zcmMvYWxsLXZlcnNpb25zCiBXSVJFU0hBUktfTElDRU5TRSA9IHdp
cmVzaGFyayBsaWNlbnNlCi0tIAoyLjM5LjUKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxk
cm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVp
bGRyb290Cg==
