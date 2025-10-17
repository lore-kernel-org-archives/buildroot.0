Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86AA6CCD184
	for <buildroot@archiver.kernel.org>; Fri, 17 Oct 2025 07:43:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 546D28128B;
	Fri, 17 Oct 2025 07:43:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W8LDgyy0WeFH; Fri, 17 Oct 2025 07:43:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7CECE81285
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7CECE81285;
	Fri, 17 Oct 2025 07:43:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id DF2B11EB1
 for <buildroot@buildroot.org>; Fri, 17 Oct 2025 07:42:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D0E6460A77
 for <buildroot@buildroot.org>; Fri, 17 Oct 2025 07:42:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3-X4-YCGmLof for <buildroot@buildroot.org>;
 Fri, 17 Oct 2025 07:42:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=alexis.lothore@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org CB63F60851
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CB63F60851
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CB63F60851
 for <buildroot@buildroot.org>; Fri, 17 Oct 2025 07:42:57 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 404044E41118;
 Fri, 17 Oct 2025 07:42:56 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 179E2606DB;
 Fri, 17 Oct 2025 07:42:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 4A910102F2334; 
 Fri, 17 Oct 2025 09:42:55 +0200 (CEST)
Date: Fri, 17 Oct 2025 09:42:47 +0200
MIME-Version: 1.0
Message-Id: <20251017-python-scp-v1-2-b45644fa9afb@bootlin.com>
References: <20251017-python-scp-v1-0-b45644fa9afb@bootlin.com>
In-Reply-To: <20251017-python-scp-v1-0-b45644fa9afb@bootlin.com>
To: buildroot@buildroot.org
X-Mailer: b4 0.14.2
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1760686975; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=k9UzklK+8KI1xln3DDhWH76EeMw7pJNdcGUJBytp9v8=;
 b=G0IX3WktI4PYWVTWWKvgjwG0maMNN+nRqcdurLjGfl/yVzAnBmU1OcQOP6nWCwRaCfmZ5c
 BrnRqOHod4fuUESkzsnKO9tXdF2cmJ4Gl58gfHMLZvUrZZUxAeRYTAUlrCRMXBdwe4DrAw
 RNaey6o62LbbrPIp1yD2x7QOlpzmuwqfsK4Zprzzz/ig6obotEoJlUDYcgPL0fVAe95o5o
 I6neQOAhCOOARwzmj52EQL/0YvjMKPwy4E3mI+F5kFfNMdqJwh1SRB2bwZFh3sjBP1wH1o
 lsv2gt50ly9vFg1955OrJZ6CsTN3A7fiqxltsDwifdb8pEtsE3nUSMTc216/Fg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=G0IX3Wkt
Subject: [Buildroot] [PATCH 2/2] support/testing: add runtime tests for
 python-scp
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
From: =?utf-8?q?Alexis_Lothor=C3=A9_via_buildroot?= <buildroot@buildroot.org>
Reply-To: =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
Cc: James Hilliard <james.hilliard1@gmail.com>,
 =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QWRkIGEgYmFzaWMgdGVzdCBpbnZvbHZpbmcgYSBsb2NhbCBTU0ggY29ubmVjdGlvbiAoYmFzZWQg
b24gZHJvcGJlYXIKc2VydmVyKS4gVGhlIHRlc3QgdmFsaWRhdGVzIHRoYXQgd2UgYXJlIGFibGUs
IHRocm91Z2ggcHl0aG9uLXNjcCwgdG8KZmV0Y2ggdGhlIC9ldGMvaG9zdG5hbWUgZmlsZS4KClRo
ZSB0ZXN0IG5lZWRzIHNvbWUgYmFzaWMga2V5IGluaXRpYWxpemF0aW9uIHRvIGFsbG93IGNvbm5l
Y3RpbmcgdG8gdGhlCmRyb3BiZWFyIHNlcnZlciwgaGVuY2UgdGhlIGN1c3RvbSBydW5fc2FtcGxl
X3NjcmlwdHMgbWV0aG9kLgoKU2lnbmVkLW9mZi1ieTogQWxleGlzIExvdGhvcsOpIDxhbGV4aXMu
bG90aG9yZUBib290bGluLmNvbT4KLS0tCiBzdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS9z
YW1wbGVfcHl0aG9uX3NjcC5weSB8IDEwICsrKysrKysrKwogc3VwcG9ydC90ZXN0aW5nL3Rlc3Rz
L3BhY2thZ2UvdGVzdF9weXRob25fc2NwLnB5ICAgfCAyNCArKysrKysrKysrKysrKysrKysrKysr
CiAyIGZpbGVzIGNoYW5nZWQsIDM0IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9zdXBwb3J0
L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS9zYW1wbGVfcHl0aG9uX3NjcC5weSBiL3N1cHBvcnQvdGVz
dGluZy90ZXN0cy9wYWNrYWdlL3NhbXBsZV9weXRob25fc2NwLnB5Cm5ldyBmaWxlIG1vZGUgMTAw
NjQ0CmluZGV4IDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAuLmZkYjRi
NzIwYTllNjM0NmE2NTBlNmQ5MDEyMGM1OThhZjlmMjk4OGQKLS0tIC9kZXYvbnVsbAorKysgYi9z
dXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS9zYW1wbGVfcHl0aG9uX3NjcC5weQpAQCAtMCww
ICsxLDEwIEBACitmcm9tIHBhcmFtaWtvIGltcG9ydCBTU0hDbGllbnQKK2Zyb20gcGFyYW1pa28u
Y2xpZW50IGltcG9ydCBBdXRvQWRkUG9saWN5Citmcm9tIHNjcCBpbXBvcnQgU0NQQ2xpZW50CisK
K3NzaF9jbGllbnQgPSBTU0hDbGllbnQoKQorc3NoX2NsaWVudC5sb2FkX3N5c3RlbV9ob3N0X2tl
eXMoKQorc3NoX2NsaWVudC5zZXRfbWlzc2luZ19ob3N0X2tleV9wb2xpY3koQXV0b0FkZFBvbGlj
eSkKK3NzaF9jbGllbnQuY29ubmVjdCgnMTI3LjAuMC4xJywgdXNlcm5hbWU9J3Jvb3QnKQorc2Nw
X2NsaWVudCA9IFNDUENsaWVudChzc2hfY2xpZW50LmdldF90cmFuc3BvcnQoKSkKK3NjcF9jbGll
bnQuZ2V0KCIvZXRjL2hvc3RuYW1lIiwgIi90bXAvaG9zdG5hbWUiKQpkaWZmIC0tZ2l0IGEvc3Vw
cG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2UvdGVzdF9weXRob25fc2NwLnB5IGIvc3VwcG9ydC90
ZXN0aW5nL3Rlc3RzL3BhY2thZ2UvdGVzdF9weXRob25fc2NwLnB5Cm5ldyBmaWxlIG1vZGUgMTAw
NjQ0CmluZGV4IDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAuLjJjYjRm
MWU2N2U2ZTc0YzY0MzE2N2Y0YzYyMWUxODg5NWQzNmU2ZjYKLS0tIC9kZXYvbnVsbAorKysgYi9z
dXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0X3B5dGhvbl9zY3AucHkKQEAgLTAsMCAr
MSwyNCBAQAoraW1wb3J0IG9zCitmcm9tIHRlc3RzLnBhY2thZ2UudGVzdF9weXRob24gaW1wb3J0
IFRlc3RQeXRob25QYWNrYWdlQmFzZQorCisKK2NsYXNzIFRlc3RQeXRob25TQ1AoVGVzdFB5dGhv
blBhY2thZ2VCYXNlKToKKyAgICBfX3Rlc3RfXyA9IFRydWUKKyAgICBjb25maWcgPSBUZXN0UHl0
aG9uUGFja2FnZUJhc2UuY29uZmlnICsgXAorICAgICAgICAiIiIKKyAgICAgICAgQlIyX1BBQ0tB
R0VfRFJPUEJFQVI9eQorICAgICAgICBCUjJfUEFDS0FHRV9QWVRIT04zPXkKKyAgICAgICAgQlIy
X1BBQ0tBR0VfUFlUSE9OX1NDUD15CisgICAgICAgICIiIgorICAgIHNhbXBsZV9zY3JpcHRzID0g
WyJ0ZXN0cy9wYWNrYWdlL3NhbXBsZV9weXRob25fc2NwLnB5Il0KKworICAgIGRlZiBydW5fc2Ft
cGxlX3NjcmlwdHMoc2VsZik6CisgICAgICAgICMgQWxsb3cgcGFzc3dvcmRsZXNzIHJvb3QgbG9n
aW4gaW4gU1NIIHNlcnZlcgorICAgICAgICBvdXRwdXQsIGV4aXRfY29kZSA9IHNlbGYuZW11bGF0
b3IucnVuKCdta2RpciAvcm9vdC8uc3NoJykKKyAgICAgICAgb3V0cHV0LCBleGl0X2NvZGUgPSBz
ZWxmLmVtdWxhdG9yLnJ1bignZHJvcGJlYXJrZXkgLXQgZWQyNTUxOSAtZiAuc3NoL2lkX2Ryb3Bi
ZWFyJykKKyAgICAgICAgb3V0cHV0LCBleGl0X2NvZGUgPSBzZWxmLmVtdWxhdG9yLnJ1bignZHJv
cGJlYXJrZXkgLXkgLWYgLnNzaC9pZF9kcm9wYmVhcnxncmVwICJec3NoLWVkMjU1MTkiID4gLnNz
aC9hdXRob3JpemVkX2tleXMnKQorICAgICAgICBvdXRwdXQsIGV4aXRfY29kZSA9IHNlbGYuZW11
bGF0b3IucnVuKCdkcm9wYmVhcmNvbnZlcnQgZHJvcGJlYXIgb3BlbnNzaCAuc3NoL2lkX2Ryb3Bi
ZWFyIC5zc2gvaWRfZWQyNTUxOScpCisKKyAgICAgICAgZm9yIHNjcmlwdCBpbiBzZWxmLnNhbXBs
ZV9zY3JpcHRzOgorICAgICAgICAgICAgY21kID0gc2VsZi5pbnRlcnByZXRlciArICIgIiArIG9z
LnBhdGguYmFzZW5hbWUoc2NyaXB0KQorICAgICAgICAgICAgc2VsZi5hc3NlcnRSdW5PayhjbWQs
IHRpbWVvdXQ9c2VsZi50aW1lb3V0KQoKLS0gCjIuNTEuMAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJv
b3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0
aW5mby9idWlsZHJvb3QK
