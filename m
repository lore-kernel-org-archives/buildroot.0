Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B09E5EB64D7
	for <buildroot@archiver.kernel.org>; Wed, 28 Jun 2023 06:16:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 13AEC405CB;
	Wed, 28 Jun 2023 06:16:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 13AEC405CB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eGt76ueZVEvE; Wed, 28 Jun 2023 06:16:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5A9BA40650;
	Wed, 28 Jun 2023 06:16:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5A9BA40650
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A80941BF855
 for <buildroot@lists.busybox.net>; Wed, 28 Jun 2023 06:16:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8190C40298
 for <buildroot@lists.busybox.net>; Wed, 28 Jun 2023 06:16:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8190C40298
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qj7l7P51-fhQ for <buildroot@lists.busybox.net>;
 Wed, 28 Jun 2023 06:16:35 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 55CC2401D8
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 55CC2401D8
 for <buildroot@buildroot.org>; Wed, 28 Jun 2023 06:16:35 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b71b.dip0.t-ipconnect.de [84.161.183.27])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 51B0EA4C031B
 for <buildroot@buildroot.org>; Wed, 28 Jun 2023 08:16:33 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:40130)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qEOTh-0008Nf-0G
 for buildroot@buildroot.org; Wed, 28 Jun 2023 08:16:33 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed, 28 Jun 2023 08:16:32 +0200
Message-Id: <20230628061632.32715-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1687932993;
 bh=m1aKTEKHwQfUvGgtLoC/iQ235SYUy0dM21m65Q7Jk0k=;
 h=From:To:Subject:Date:From;
 b=tpQqXAa+4Ex9zLyn6q5m6v7Pc/P0A4zkTdbxLleLuqoMlBkHaR6V0S8AwKagJVonn
 eTkhJkDzDqFcP2R97zIwEXbDnGPHoYVebwtKlsrSY2pVWUQxjHFoagHdGuAF+G1kvE
 +gFf8EkBGlyevrrsXwEejnI8TEETY+RA0vpEdxWQSPYNEfhoDj7GigPk+NcpBYfcEX
 T7h3/MufFvd2Ejm3zSIGusJWNBnvolfSI9RWTxiDVLsBPd/Z0jo+vY8r91HpNYKa3E
 SfyzP2+RlYpWeA9/WfcJj2QwtovTdlwavEIupEETUKH4uS5u/xtquDqY7hN69IttWH
 XnDDASaqz5GYQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=tpQqXAa+
Subject: [Buildroot] [PATCH 1/1] package/flac: bump version to 1.4.3
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

Q2hhbmdlbG9nOiBodHRwczovL3hpcGgub3JnL2ZsYWMvY2hhbmdlbG9nLmh0bWwKClVwZGF0ZWQg
bGljZW5zZSBoYXNoIGR1ZSB0byBjb3B5cmlnaHQgeWVhciBidW1wOgpodHRwczovL2dpdGh1Yi5j
b20veGlwaC9mbGFjL2NvbW1pdC9lMDBkOWI4ODFmM2ZiOGExODE2OTlhZGE5NjZlOTA5YWI2ZDY4
OWMwCgpSZW1vdmVkIGFsbCBQb3dlclBDLXJlbGF0ZWQgY29uZmlndXJlIG9wdGlvbnMsIHF1b3Rp
bmcgY2hhbmdlbG9nOgoiQWxsIFBvd2VyUEMtc3BlY2lmaWMgY29kZSBoYXMgYmVlbiByZW1vdmVk
LCBhcyBpdCB0dXJuZWQgb3V0IHRob3NlCiBpbXByb3ZlbWVudHMgZGlkbuKAmXQgYWN0dWFsbHkg
aW1wcm92ZSBhbnl0aGluZyIKClNpZ25lZC1vZmYtYnk6IEJlcm5kIEt1aGxzIDxiZXJuZEBrdWhs
cy5uZXQ+Ci0tLQogcGFja2FnZS9mbGFjL2ZsYWMuaGFzaCB8IDQgKystLQogcGFja2FnZS9mbGFj
L2ZsYWMubWsgICB8IDQgKy0tLQogMiBmaWxlcyBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDUg
ZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9mbGFjL2ZsYWMuaGFzaCBiL3BhY2th
Z2UvZmxhYy9mbGFjLmhhc2gKaW5kZXggYjk5M2ViZDc1OS4uMDAxM2E3NDg1YSAxMDA2NDQKLS0t
IGEvcGFja2FnZS9mbGFjL2ZsYWMuaGFzaAorKysgYi9wYWNrYWdlL2ZsYWMvZmxhYy5oYXNoCkBA
IC0xLDYgKzEsNiBAQAogIyBGcm9tIGh0dHBzOi8vZnRwLm9zdW9zbC5vcmcvcHViL3hpcGgvcmVs
ZWFzZXMvZmxhYy9TSEEyNTZTVU1TLnR4dAotc2hhMjU2ICBlMzIyZDU4YTFmNDhkMjNkOWRkMzhm
NDMyNjcyODY1ZjZmNzllNzNhNmY5Y2M1YTVmNTdmY2FhODNlYjVhOGU0ICBmbGFjLTEuNC4yLnRh
ci54egorc2hhMjU2ICA2YzU4ZTY5Y2QyMjM0OGY0NDFiODYxMDkyYjgyNWU1OTFkMGI4MjJlMTA2
ZGU2ZWIwZWU0ZDA1ZDI3MjA1YjcwICBmbGFjLTEuNC4zLnRhci54egogIyBMb2NhbGx5IGNvbXB1
dGVkCiBzaGEyNTYgIDgxNzdmOTc1MTMyMTM1MjZkZjJjZjYxODRkOGZmOTg2YzY3NWFmYjUxNGQ0
ZTY4YTQwNDAxMDUyMWI4ODA2NDMgIENPUFlJTkcuR1BMCiBzaGEyNTYgIDVkZjA3MDA3MTk4OTg5
YzYyMmY1ZDQxZGU4ZDcwM2U3YmVmM2QwZTc5ZDYyZTI0MzMyZWU3MzlhNDUyYWY2MmEgIENPUFlJ
TkcuTEdQTAotc2hhMjU2ICA2ZTU4ZDMwMzZmMDVlMmEwZDU4YWY4NTRjMTJhNTA1ZGRiZTc1MDEx
ZDcxYTU5OGEyMTcwOTg3ZjNiMTU0MDhkICBDT1BZSU5HLlhpcGgKK3NoYTI1NiAgMTI2MDBlYTFh
N2FmZmNiZjQ2OWJkMGQ4YjJjZDcyNWU0MTY3MTE0YTJlZTgzNGI4OGY1ZDI4NTdiZmQ3ZGRiZiAg
Q09QWUlORy5YaXBoCmRpZmYgLS1naXQgYS9wYWNrYWdlL2ZsYWMvZmxhYy5tayBiL3BhY2thZ2Uv
ZmxhYy9mbGFjLm1rCmluZGV4IDU5NWMyMzc5YjAuLmFiMDZhZjgyNmUgMTAwNjQ0Ci0tLSBhL3Bh
Y2thZ2UvZmxhYy9mbGFjLm1rCisrKyBiL3BhY2thZ2UvZmxhYy9mbGFjLm1rCkBAIC00LDcgKzQs
NyBAQAogIwogIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKIAotRkxBQ19WRVJTSU9OID0gMS40LjIK
K0ZMQUNfVkVSU0lPTiA9IDEuNC4zCiBGTEFDX1NJVEUgPSBodHRwczovL2Z0cC5vc3Vvc2wub3Jn
L3B1Yi94aXBoL3JlbGVhc2VzL2ZsYWMKIEZMQUNfU09VUkNFID0gZmxhYy0kKEZMQUNfVkVSU0lP
TikudGFyLnh6CiBGTEFDX0lOU1RBTExfU1RBR0lORyA9IFlFUwpAQCAtMTQsOSArMTQsNyBAQCBG
TEFDX0xJQ0VOU0VfRklMRVMgPSBDT1BZSU5HLlhpcGggQ09QWUlORy5HUEwgQ09QWUlORy5MR1BM
CiBGTEFDX0NQRV9JRF9WRU5ET1IgPSBmbGFjX3Byb2plY3QKIAogRkxBQ19DT05GX09QVFMgPSBc
Ci0JJChpZiAkKEJSMl9QT1dFUlBDX0NQVV9IQVNfQUxUSVZFQyksLS1lbmFibGUtYWx0aXZlYywt
LWRpc2FibGUtYWx0aXZlYykgXAogCSQoaWYgJChCUjJfSU5TVEFMTF9MSUJTVERDUFApLC0tZW5h
YmxlLWNwcGxpYnMsLS1kaXNhYmxlLWNwcGxpYnMpIFwKLQkkKGlmICQoQlIyX1BPV0VSUENfQ1BV
X0hBU19WU1gpLC0tZW5hYmxlLXZzeCwtLWRpc2FibGUtdnN4KSBcCiAJLS1kaXNhYmxlLXN0YWNr
LXNtYXNoLXByb3RlY3Rpb24KIAogaWZlcSAoJChCUjJfUEFDS0FHRV9MSUJPR0cpLHkpCi0tIAoy
LjM5LjIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1
aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0
cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
