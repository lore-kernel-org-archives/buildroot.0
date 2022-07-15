Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E2FDC433EF
	for <buildroot@archiver.kernel.org>; Fri, 15 Jul 2022 09:59:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 90AC7408EA;
	Fri, 15 Jul 2022 09:59:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 90AC7408EA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lmffQvm0ePK2; Fri, 15 Jul 2022 09:59:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 702A040250;
	Fri, 15 Jul 2022 09:59:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 702A040250
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 223BF1BF25F
 for <buildroot@lists.busybox.net>; Fri, 15 Jul 2022 09:59:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0A2BB60E4C
 for <buildroot@lists.busybox.net>; Fri, 15 Jul 2022 09:59:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0A2BB60E4C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Q0ky_KxWfKDx for <buildroot@lists.busybox.net>;
 Fri, 15 Jul 2022 09:59:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DC46160899
Received: from smtp-outgoing-1801.laposte.net (smtp-outgoing-1801.laposte.net
 [160.92.124.102])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DC46160899
 for <buildroot@buildroot.org>; Fri, 15 Jul 2022 09:59:41 +0000 (UTC)
X-mail-filterd: {"version":"1.4.3", "queueID":"4Lkmzr3jf7zqSH5",
 "contextId":"082a0e80-2bd9-4517-95b4-3afa5afdd6eb"}
Received: from outgoing-mail.laposte.net (localhost.localdomain [127.0.0.1])
 by mlpnf0108.laposte.net (SMTP Server) with ESMTP id 4Lkmzr3jf7zqSH5;
 Fri, 15 Jul 2022 11:59:36 +0200 (CEST)
X-mail-filterd: {"version":"1.4.3", "queueID":"4Lkmzr2jbvzqSH4",
 "contextId":"966da898-8514-4534-a569-e33bd22db48b"}
X-lpn-mailing: LEGIT
X-lpn-spamrating: 50
X-lpn-spamlevel: not-spam
Received: from romuald.bergerie (unknown [88.169.129.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mlpnf0108.laposte.net (SMTP Server) with ESMTPSA id 4Lkmzr2jbvzqSH4;
 Fri, 15 Jul 2022 11:59:36 +0200 (CEST)
Received: from radicelle.bergerie (radicelle.bergerie [192.168.124.12])
 by romuald.bergerie (Postfix) with ESMTP id 1100D4BA1810;
 Fri, 15 Jul 2022 11:59:36 +0200 (CEST)
Received: from vincent by radicelle.bergerie with local (Exim 4.96)
 (envelope-from <vincent@radicelle.bergerie>) id 1oCI6c-0003Lu-2i;
 Fri, 15 Jul 2022 11:59:30 +0200
To: buildroot@buildroot.org
Date: Fri, 15 Jul 2022 11:59:25 +0200
Message-Id: <20220715095925.12881-1-vincent.stehle@laposte.net>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=laposte.net; s=lpn-wlmd; t=1657879178;
 bh=8P/sN6H9sI8j3stFeYgIUlIesyRX0QEWbbVMPtM+95I=;
 h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding;
 b=skaeQ5WAfhIWWPF4MtWHU/HVie/2bBmo6lHI4Y19SzaxT/27MKIZX5w7TmLssGQ2z3/ddHqT9Oc73Ajv4y7UR9bqa9cmUMJYVADF2iNvRVw2FZo0zavD2nFFVygm7YE5VYIxW8n26oSZKAoAIgMpY4OSxigLxpLAUUXKZNZL7asGhFawKCNPAl1JcXsYHzofk92+D2sLiMD7BB7Qv50tguUTbMEawmhPXNtQvHExC4iGfWJVywlMcPVxv6dd0eIW+JHExLCNLZGOadAP9AID93ERRObBnbb9EF66UXBDkcJz4ab5foW3uE23XTbWlsRiXBjbyVrBK6gWmYnRAFF4cg==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=laposte.net header.i=@laposte.net
 header.a=rsa-sha256 header.s=lpn-wlmd header.b=skaeQ5WA
Subject: [Buildroot] [PATCH] support/testing: add test for msr-tools
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
From: =?utf-8?q?Vincent_Stehl=C3=A9_via_buildroot?= <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@laposte.net>
Cc: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@laposte.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QWRkIGEgc2ltcGxlIHRlc3QgdG8gdmVyaWZ5IHRoYXQgbXNyLXRvb2xzIGFyZSB3b3JraW5nLgoK
VGhlIHRlc3QgbmVlZHMgdG8gYnVpbGQgYSBjdXN0b20geDg2XzY0IGtlcm5lbCB3aXRoIHN1cHBv
cnQgZm9yIENQVUlEIGFuZApNU1IuCgpBcyB0aGUgVFNDX0FVWCBNU1IgaXMgZW11bGF0ZWQgb24g
cWVtdSB3ZSBjYW4gdXNlIGl0IHRvIHRlc3QgdGhhdCBhIHZhbHVlCndyaXR0ZW4gd2l0aCB3cm1z
ciBjYW4gaW5kZWVkIGJlIHJlYWQgYmFjayB3aXRoIHJkbXNyLgoKU2lnbmVkLW9mZi1ieTogVmlu
Y2VudCBTdGVobMOpIDx2aW5jZW50LnN0ZWhsZUBsYXBvc3RlLm5ldD4KLS0tCgoKSGksCgpJIGhh
dmUgdmVyaWZpZWQgdGhhdCB0aGlzIHRlc3Qgd29ya3MgZmluZSBsb2NhbGx5IGFuZCBvbiBnaXRs
YWIuCgpJdCBpcyBleHBlY3RlZCB0byBoYXZlIGEgdHJpdmlhbCBjb25mbGljdCB3aXRoIHRoaXMg
cHJldmlvdXMgcGF0Y2hbMV0gb24gdGhlCkRFVkVMT1BFUlMgZmlsZS4KCkJlc3QgcmVnYXJkcywK
VmluY2VudC4KClsxXTogaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL3BpcGVybWFpbC9idWls
ZHJvb3QvMjAyMi1KdWx5LzY0NjAwOC5odG1sCgoKIERFVkVMT1BFUlMgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICB8ICAxICsKIC4uLi90ZXN0aW5nL3Rlc3RzL3BhY2thZ2UvdGVz
dF9tc3JfdG9vbHMucHkgICB8IDUwICsrKysrKysrKysrKysrKysrKysKIC4uLi90ZXN0cy9wYWNr
YWdlL3Rlc3RfbXNyX3Rvb2xzL2xpbnV4LmNvbmZpZyB8ICAyICsKIDMgZmlsZXMgY2hhbmdlZCwg
NTMgaW5zZXJ0aW9ucygrKQogY3JlYXRlIG1vZGUgMTAwNjQ0IHN1cHBvcnQvdGVzdGluZy90ZXN0
cy9wYWNrYWdlL3Rlc3RfbXNyX3Rvb2xzLnB5CiBjcmVhdGUgbW9kZSAxMDA2NDQgc3VwcG9ydC90
ZXN0aW5nL3Rlc3RzL3BhY2thZ2UvdGVzdF9tc3JfdG9vbHMvbGludXguY29uZmlnCgpkaWZmIC0t
Z2l0IGEvREVWRUxPUEVSUyBiL0RFVkVMT1BFUlMKaW5kZXggMGFmZDY5N2I2Yy4uODc1M2YwYzE3
ZSAxMDA2NDQKLS0tIGEvREVWRUxPUEVSUworKysgYi9ERVZFTE9QRVJTCkBAIC0yOTE3LDYgKzI5
MTcsNyBAQCBGOgljb25maWdzL3Vldm01NDMyX2RlZmNvbmZpZwogRjoJcGFja2FnZS9pN3ovCiBG
OglwYWNrYWdlL21zci10b29scy8KIEY6CXBhY2thZ2UvcGl4ei8KK0Y6CXN1cHBvcnQvdGVzdGlu
Zy90ZXN0cy9wYWNrYWdlL3Rlc3RfbXNyX3Rvb2xzKgogCiBOOglWaW5pY2l1cyBUaW50aSA8dmlu
aWNpdXN0aW50aUBnbWFpbC5jb20+CiBGOglwYWNrYWdlL3B5dGhvbi10aHJpZnQvCmRpZmYgLS1n
aXQgYS9zdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0X21zcl90b29scy5weSBiL3N1
cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rlc3RfbXNyX3Rvb2xzLnB5Cm5ldyBmaWxlIG1v
ZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAuLjRkNjI3NDJhNWYKLS0tIC9kZXYvbnVsbAorKysg
Yi9zdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0X21zcl90b29scy5weQpAQCAtMCww
ICsxLDUwIEBACitpbXBvcnQgb3MKKworaW1wb3J0IGluZnJhLmJhc2V0ZXN0CisKKworY2xhc3Mg
VGVzdE1zclRvb2xzKGluZnJhLmJhc2V0ZXN0LkJSVGVzdCk6CisgICAgY29uZmlnID0gXAorICAg
ICAgICAiIiIKKyAgICAgICAgQlIyX3g4Nl82ND15CisgICAgICAgIEJSMl94ODZfY29yZWk3PXkK
KyAgICAgICAgQlIyX1RPT0xDSEFJTl9FWFRFUk5BTD15CisgICAgICAgIEJSMl9MSU5VWF9LRVJO
RUw9eQorICAgICAgICBCUjJfTElOVVhfS0VSTkVMX0NVU1RPTV9WRVJTSU9OPXkKKyAgICAgICAg
QlIyX0xJTlVYX0tFUk5FTF9DVVNUT01fVkVSU0lPTl9WQUxVRT0iNS4xNS41NSIKKyAgICAgICAg
QlIyX0xJTlVYX0tFUk5FTF9VU0VfQ1VTVE9NX0NPTkZJRz15CisgICAgICAgIEJSMl9MSU5VWF9L
RVJORUxfQ1VTVE9NX0NPTkZJR19GSUxFPSJib2FyZC9xZW11L3g4Nl82NC9saW51eC5jb25maWci
CisgICAgICAgIEJSMl9MSU5VWF9LRVJORUxfQ09ORklHX0ZSQUdNRU5UX0ZJTEVTPSJ7fSIKKyAg
ICAgICAgQlIyX0xJTlVYX0tFUk5FTF9ORUVEU19IT1NUX0xJQkVMRj15CisgICAgICAgIEJSMl9Q
QUNLQUdFX01TUl9UT09MUz15CisgICAgICAgIEJSMl9UQVJHRVRfUk9PVEZTX0NQSU89eQorICAg
ICAgICAjIEJSMl9UQVJHRVRfUk9PVEZTX1RBUiBpcyBub3Qgc2V0CisgICAgICAgICIiIi5mb3Jt
YXQoCisgICAgICAgICAgICAgIGluZnJhLmZpbGVwYXRoKCJ0ZXN0cy9wYWNrYWdlL3Rlc3RfbXNy
X3Rvb2xzL2xpbnV4LmNvbmZpZyIpKQorCisgICAgZGVmIHRlc3RfcnVuKHNlbGYpOgorICAgICAg
ICBrZXJuZWwgPSBvcy5wYXRoLmpvaW4oc2VsZi5idWlsZGRpciwgImltYWdlcyIsICJiekltYWdl
IikKKyAgICAgICAgY3Bpb19maWxlID0gb3MucGF0aC5qb2luKHNlbGYuYnVpbGRkaXIsICJpbWFn
ZXMiLCAicm9vdGZzLmNwaW8iKQorICAgICAgICBzZWxmLmVtdWxhdG9yLmJvb3QoCisgICAgICAg
ICAgICBhcmNoPSJ4ODZfNjQiLAorICAgICAgICAgICAga2VybmVsPWtlcm5lbCwga2VybmVsX2Nt
ZGxpbmU9WyJjb25zb2xlPXR0eVMwIl0sCisgICAgICAgICAgICBvcHRpb25zPVsiLWNwdSIsICJO
ZWhhbGVtIiwgIi1tIiwgIjMyMCIsICItaW5pdHJkIiwgY3Bpb19maWxlXQorICAgICAgICApCisg
ICAgICAgIHNlbGYuZW11bGF0b3IubG9naW4oKQorCisgICAgICAgICMgQ1BVIElELgorICAgICAg
ICBjbWQgPSAiY3B1aWQiCisgICAgICAgIHNlbGYuYXNzZXJ0UnVuT2soY21kKQorCisgICAgICAg
ICMgV3JpdGUgTVNSLgorICAgICAgICAjIFdlIHdyaXRlIHRvIFRTQ19BVVguCisgICAgICAgIGNt
ZCA9ICJ3cm1zciAweGMwMDAwMTAzIDB4MTIzNDU2NzgxMjM0NTY3OCIKKyAgICAgICAgc2VsZi5h
c3NlcnRSdW5PayhjbWQpCisKKyAgICAgICAgIyBSZWFkIE1TUi4KKyAgICAgICAgIyBXZSByZWFk
IGJhY2sgdGhlIFRTQ19BVVggYW5kIHdlIHZlcmlmeSB0aGF0IHdlIHJlYWQgYmFjayB0aGUgY29y
cmVjdAorICAgICAgICAjIHZhbHVlLgorICAgICAgICBjbWQgPSAicmRtc3IgMHhjMDAwMDEwMyIK
KyAgICAgICAgb3V0cHV0LCBleGl0X2NvZGUgPSBzZWxmLmVtdWxhdG9yLnJ1bihjbWQpCisgICAg
ICAgIHNlbGYuYXNzZXJ0RXF1YWwoZXhpdF9jb2RlLCAwKQorICAgICAgICBzZWxmLmFzc2VydEVx
dWFsKG91dHB1dFswXSwgIjEyMzQ1Njc4MTIzNDU2NzgiKQpkaWZmIC0tZ2l0IGEvc3VwcG9ydC90
ZXN0aW5nL3Rlc3RzL3BhY2thZ2UvdGVzdF9tc3JfdG9vbHMvbGludXguY29uZmlnIGIvc3VwcG9y
dC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2UvdGVzdF9tc3JfdG9vbHMvbGludXguY29uZmlnCm5ldyBm
aWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAuLjhmZTA5ZGI4N2IKLS0tIC9kZXYvbnVs
bAorKysgYi9zdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0X21zcl90b29scy9saW51
eC5jb25maWcKQEAgLTAsMCArMSwyIEBACitDT05GSUdfWDg2X0NQVUlEPXkKK0NPTkZJR19YODZf
TVNSPXkKLS0gCjIuMzUuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpo
dHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
