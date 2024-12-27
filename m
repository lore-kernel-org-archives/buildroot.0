Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42552E7718B
	for <buildroot@archiver.kernel.org>; Fri, 27 Dec 2024 21:58:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A3CA540338;
	Fri, 27 Dec 2024 21:58:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PIxTi-V61R2X; Fri, 27 Dec 2024 21:58:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1F1974031D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1F1974031D;
	Fri, 27 Dec 2024 21:58:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 580FAF1B
 for <buildroot@buildroot.org>; Fri, 27 Dec 2024 21:58:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 535FE80CAC
 for <buildroot@buildroot.org>; Fri, 27 Dec 2024 21:58:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FZo4H_44L2NW for <buildroot@buildroot.org>;
 Fri, 27 Dec 2024 21:58:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::222;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org EF54180CAD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EF54180CAD
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EF54180CAD
 for <buildroot@buildroot.org>; Fri, 27 Dec 2024 21:58:15 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id 02A4340002;
 Fri, 27 Dec 2024 21:58:12 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 27 Dec 2024 22:58:08 +0100
Message-ID: <20241227215811.2830716-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1735336693;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=wZp5kpsuBFh3yTmDInu3sBtHpu5/Z7rOEkhOdRPMlTI=;
 b=D4bWonLtC4jZ5K1cCk/U00u5kqafjToZFcg0sgAuOnenZ1uEDscgDPVV0t+h6G+oEmstUm
 mn6uXwqno+TnvJo0GGdUoqutzJVx20gnI0/+zUM050ml4e2r3kMBmDwEvHp6bFYmxC+t3i
 6LP4TZlUZm3k80HLkpeFuLxWOudfU/k54QxMLyrv7vG9soPKm/bbAluuxj6+cxcUUIag26
 DV/uyXYDpo8Kk2rkSghn5dmnNvgmivKf9lVAGg6AKcZh2i8yZlaDvN45RGE8gGfC8cdmhR
 VklEgHEXYT8TaC0TA67l9mWF3UARHPeU53QQvTsd29CPG2QoOrxXwQdT/ABniA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=D4bWonLt
Subject: [Buildroot] [PATCH 1/2] package/monit: reformat patch 0001 as git
 formatted patch
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

VGhpcyB3aWxsIG1ha2UgaXQgZWFzaWVyIHRvIGVkaXQgdGhlIHBhdGNoIGlmIG5lZWRlZC4KClNp
Z25lZC1vZmYtYnk6IFRob21hcyBQZXRhenpvbmkgPHRob21hcy5wZXRhenpvbmlAYm9vdGxpbi5j
b20+Ci0tLQogLmNoZWNrcGFja2FnZWlnbm9yZSAgICAgICAgICAgICAgICAgICAgICAgICAgIHwg
IDIgKy0KIC4uLi1idWlsZGluZy1hLXN0YXRpY2FsbHktbGlua2VkLWJpbmFyeS5wYXRjaCB8IDM1
ICsrKysrKysrKysrKysrKysrKysKIHBhY2thZ2UvbW9uaXQvMDAwMS1uby1mb3JjZS1zdGF0aWMu
cGF0Y2ggICAgICB8IDIyIC0tLS0tLS0tLS0tLQogMyBmaWxlcyBjaGFuZ2VkLCAzNiBpbnNlcnRp
b25zKCspLCAyMyBkZWxldGlvbnMoLSkKIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL21vbml0
LzAwMDEtRG8tbm90LWZvcmNlLWJ1aWxkaW5nLWEtc3RhdGljYWxseS1saW5rZWQtYmluYXJ5LnBh
dGNoCiBkZWxldGUgbW9kZSAxMDA2NDQgcGFja2FnZS9tb25pdC8wMDAxLW5vLWZvcmNlLXN0YXRp
Yy5wYXRjaAoKZGlmZiAtLWdpdCBhLy5jaGVja3BhY2thZ2VpZ25vcmUgYi8uY2hlY2twYWNrYWdl
aWdub3JlCmluZGV4IDhiODc0ZDIyYmYuLjM3Y2Q0Yzk0NjAgMTAwNjQ0Ci0tLSBhLy5jaGVja3Bh
Y2thZ2VpZ25vcmUKKysrIGIvLmNoZWNrcGFja2FnZWlnbm9yZQpAQCAtODQ4LDcgKzg0OCw3IEBA
IHBhY2thZ2UvbWluaXNzZHBkL1M1MG1pbmlzc2RwZCBTaGVsbGNoZWNrIGxpYl9zeXN2LkluZGVu
dCBsaWJfc3lzdi5WYXJpYWJsZXMKIHBhY2thZ2UvbW9kZW0tbWFuYWdlci9TNDRtb2RlbS1tYW5h
Z2VyIFNoZWxsY2hlY2sgbGliX3N5c3YuVmFyaWFibGVzCiBwYWNrYWdlL21vbmdyZWwyLzAwMDEt
RG8tbm90LXJ1bi10ZXN0cy5wYXRjaCBsaWJfcGF0Y2guVXBzdHJlYW0KIHBhY2thZ2UvbW9uZ3Jl
bDIvMDAwMi1GaXgtTWFrZWZpbGVzLWZvci1jcm9zcy1jb21waWxhdGlvbi5wYXRjaCBsaWJfcGF0
Y2guVXBzdHJlYW0KLXBhY2thZ2UvbW9uaXQvMDAwMS1uby1mb3JjZS1zdGF0aWMucGF0Y2ggbGli
X3BhdGNoLlVwc3RyZWFtCitwYWNrYWdlL21vbml0LzAwMDEtRG8tbm90LWZvcmNlLWJ1aWxkaW5n
LWEtc3RhdGljYWxseS1saW5rZWQtYmluYXJ5LnBhdGNoIGxpYl9wYXRjaC5VcHN0cmVhbQogcGFj
a2FnZS9tb25vLWd0a3NoYXJwMy8wMDAxLUZpeGVzLU1PTk9fUFJPRklMRV9FTlRFUl9MRUFWRS11
bmRlY2xhcmVkLnBhdGNoIGxpYl9wYXRjaC5VcHN0cmVhbQogcGFja2FnZS9tb25vLWd0a3NoYXJw
My8wMDAyLU1vbm8tY29tcGlsYXRpb24tZXJyb3ItYnJhbmNoLnBhdGNoIGxpYl9wYXRjaC5VcHN0
cmVhbQogcGFja2FnZS9tb25vLzAwMDEtRml4LWxpbmthZ2Utd2l0aC1hLXN5c3RlbS1saWJhdG9t
aWNfb3BzLXNoYXJlZC1saWJyYXJ5LnBhdGNoIGxpYl9wYXRjaC5VcHN0cmVhbQpkaWZmIC0tZ2l0
IGEvcGFja2FnZS9tb25pdC8wMDAxLURvLW5vdC1mb3JjZS1idWlsZGluZy1hLXN0YXRpY2FsbHkt
bGlua2VkLWJpbmFyeS5wYXRjaCBiL3BhY2thZ2UvbW9uaXQvMDAwMS1Eby1ub3QtZm9yY2UtYnVp
bGRpbmctYS1zdGF0aWNhbGx5LWxpbmtlZC1iaW5hcnkucGF0Y2gKbmV3IGZpbGUgbW9kZSAxMDA2
NDQKaW5kZXggMDAwMDAwMDAwMC4uM2I1NzZmMDUwMgotLS0gL2Rldi9udWxsCisrKyBiL3BhY2th
Z2UvbW9uaXQvMDAwMS1Eby1ub3QtZm9yY2UtYnVpbGRpbmctYS1zdGF0aWNhbGx5LWxpbmtlZC1i
aW5hcnkucGF0Y2gKQEAgLTAsMCArMSwzNSBAQAorRnJvbSA1YmViNzkxOGRhYTQ2YmNjNTEwNmU2
MzAyZjBkODQzNGZjNWEyM2U2IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbTogIllhbm4g
RS4gTU9SSU4iIDx5YW5uLm1vcmluLjE5OThAZnJlZS5mcj4KK0RhdGU6IEZyaSwgMjcgRGVjIDIw
MjQgMjI6MTI6MDIgKzAxMDAKK1N1YmplY3Q6IFtQQVRDSF0gRG8gbm90IGZvcmNlIGJ1aWxkaW5n
IGEgc3RhdGljYWxseS1saW5rZWQgYmluYXJ5CitNSU1FLVZlcnNpb246IDEuMAorQ29udGVudC1U
eXBlOiB0ZXh0L3BsYWluOyBjaGFyc2V0PVVURi04CitDb250ZW50LVRyYW5zZmVyLUVuY29kaW5n
OiA4Yml0CisKK1N0YXRpY2FsbHktbGlua2VkIGJpbmFyeSBkbyBub3Qgd29yayB3ZWxsIHdpdGgg
Z2xpYmMsIGJlY2F1c2UgaXQKK3N0aWxsIGRsb3BlbigpcyB0aGUgTlNTIGxpYnJhcmllcy4KKwor
UmVwb3J0ZWQtYnk6IFBldGVyIEvDvG1tZWwgPHN5bnRoZXRpY3BwQGdteC5uZXQ+CitTaWduZWQt
b2ZmLWJ5OiAiWWFubiBFLiBNT1JJTiIgPHlhbm4ubW9yaW4uMTk5OEBmcmVlLmZyPgorW0Rhcmlv
OiBtYWtlIHRoZSBwYXRjaCB0byBiZSBhcHBsaWVkIHdpdGggZnV6eiBmYWN0b3IgMF0KK1NpZ25l
ZC1vZmYtYnk6IERhcmlvIEJpbmFjY2hpIDxkYXJpby5iaW5hY2NoaUBhbWFydWxhc29sdXRpb25z
LmNvbT4KKy0tLQorIE1ha2VmaWxlLmFtIHwgMiArLQorIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKSwgMSBkZWxldGlvbigtKQorCitkaWZmIC0tZ2l0IGEvTWFrZWZpbGUuYW0gYi9NYWtl
ZmlsZS5hbQoraW5kZXggNjkwNzcwNmEuLmQyZDEyM2JhIDEwMDY0NAorLS0tIGEvTWFrZWZpbGUu
YW0KKysrKyBiL01ha2VmaWxlLmFtCitAQCAtOTgsNyArOTgsNyBAQCBtb25pdF9TT1VSQ0VTCT0g
c3JjL3kudGFiLmMgXAorICAgICAgICAgICAgICAgICAgIHNyYy9zdGF0aXN0aWNzL1N0YXRpc3Rp
Y3MuYworIAorIG1vbml0X0xEQUREIAk9IGxpYm1vbml0L2xpYm1vbml0LmxhCistbW9uaXRfTERG
TEFHUyAJPSAtc3RhdGljICQoRVhUTERGTEFHUykKKyttb25pdF9MREZMQUdTIAk9ICQoRVhUTERG
TEFHUykKKyAKKyBtYW5fTUFOUyAJPSBtb25pdC4xCisgCistLSAKKzIuNDcuMAorCmRpZmYgLS1n
aXQgYS9wYWNrYWdlL21vbml0LzAwMDEtbm8tZm9yY2Utc3RhdGljLnBhdGNoIGIvcGFja2FnZS9t
b25pdC8wMDAxLW5vLWZvcmNlLXN0YXRpYy5wYXRjaApkZWxldGVkIGZpbGUgbW9kZSAxMDA2NDQK
aW5kZXggNDYzNGE5NTFmMy4uMDAwMDAwMDAwMAotLS0gYS9wYWNrYWdlL21vbml0LzAwMDEtbm8t
Zm9yY2Utc3RhdGljLnBhdGNoCisrKyAvZGV2L251bGwKQEAgLTEsMjIgKzAsMCBAQAotRG8gbm90
IGZvcmNlIGJ1aWxkaW5nIGEgc3RhdGljYWxseS1saW5rZWQgYmluYXJ5Ci0KLVN0YXRpY2FsbHkt
bGlua2VkIGJpbmFyeSBkbyBub3Qgd29yayB3ZWxsIHdpdGggZ2xpYmMsIGJlY2F1c2UgaXQKLXN0
aWxsIGRsb3BlbigpcyB0aGUgTlNTIGxpYnJhcmllcy4KLQotUmVwb3J0ZWQtYnk6IFBldGVyIEvD
vG1tZWwgPHN5bnRoZXRpY3BwQGdteC5uZXQ+Ci1TaWduZWQtb2ZmLWJ5OiAiWWFubiBFLiBNT1JJ
TiIgPHlhbm4ubW9yaW4uMTk5OEBmcmVlLmZyPgotW0RhcmlvOiBtYWtlIHRoZSBwYXRjaCB0byBi
ZSBhcHBsaWVkIHdpdGggZnV6eiBmYWN0b3IgMF0KLVNpZ25lZC1vZmYtYnk6IERhcmlvIEJpbmFj
Y2hpIDxkYXJpby5iaW5hY2NoaUBhbWFydWxhc29sdXRpb25zLmNvbT4KLQotZGlmZiAtZHVyTiBt
b25pdC01Ljcub3JpZy9NYWtlZmlsZS5hbSBtb25pdC01LjcvTWFrZWZpbGUuYW0KLS0tLSBtb25p
dC01Ljcub3JpZy9NYWtlZmlsZS5hbQkyMDE0LTAyLTIwIDA5OjAwOjQyLjAwMDAwMDAwMCArMDEw
MAotKysrIG1vbml0LTUuNy9NYWtlZmlsZS5hbQkyMDE0LTA5LTA1IDEyOjQ5OjQzLjcxMTEwNDAw
MSArMDIwMAotQEAgLTk3LDcgKzk3LDcgQEAKLSAgICAgICAgICAgICAgICAgICBzcmMvc3RhdGlz
dGljcy9TdGF0aXN0aWNzLmMKLSAKLSBtb25pdF9MREFERCAJPSBsaWJtb25pdC9saWJtb25pdC5s
YQotLW1vbml0X0xERkxBR1MgCT0gLXN0YXRpYyAkKEVYVExERkxBR1MpCi0rbW9uaXRfTERGTEFH
UyAJPSAkKEVYVExERkxBR1MpCi0gCi0gbWFuX01BTlMgCT0gbW9uaXQuMQotIAotLSAKMi40Ny4w
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJv
b3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVp
bGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
