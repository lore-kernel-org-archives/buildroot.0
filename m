Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FC93C00140
	for <buildroot@archiver.kernel.org>; Tue,  2 Aug 2022 20:05:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 39945409A6;
	Tue,  2 Aug 2022 20:05:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 39945409A6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Tt-B3LjxLBX8; Tue,  2 Aug 2022 20:05:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 22C30402FE;
	Tue,  2 Aug 2022 20:05:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 22C30402FE
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 74B861BF3B8
 for <buildroot@lists.busybox.net>; Tue,  2 Aug 2022 20:05:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4ECCF60E19
 for <buildroot@lists.busybox.net>; Tue,  2 Aug 2022 20:05:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4ECCF60E19
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IjH--2tGZetm for <buildroot@lists.busybox.net>;
 Tue,  2 Aug 2022 20:05:27 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 269D460AC2
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 269D460AC2
 for <buildroot@buildroot.org>; Tue,  2 Aug 2022 20:05:26 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 272K5Ni8016439;
 Tue, 2 Aug 2022 15:05:23 -0500
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 272K5NNZ103844
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 2 Aug 2022 15:05:23 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 2
 Aug 2022 15:05:23 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 2 Aug 2022 15:05:23 -0500
Received: from uda0500531.dal.design.ti.com (ileax41-snat.itg.ti.com
 [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 272K5M3R106903;
 Tue, 2 Aug 2022 15:05:22 -0500
To: <buildroot@buildroot.org>
Date: Tue, 2 Aug 2022 15:05:20 -0500
Message-ID: <20220802200522.4619-2-x-shi@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220802200522.4619-1-x-shi@ti.com>
References: <20220802200522.4619-1-x-shi@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1659470723;
 bh=nDS3vfSkoRA+FUfFsr+OcgcjsUGotFl96S4UMJpdqJY=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=GqSChF5NtNc3af/QfDp1q3+KbOc3EvTGL/pvVtP7mTQniX7P+9yR42LvO4GKYUxaS
 PuDwcUVoJb6MbByynJZK3PmNifeTDw499895U7W60Xz/22Wamcc9OYIR48QkHAJOFe
 HauQzuDmHADZ2xuv+pa8EbqcEU83Z6pNdI+bo/8E=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=GqSChF5N
Subject: [Buildroot] [PATCH 1/3] boot/ti-k3-r5-loader: add new package
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
From: Xuanhao Shi via buildroot <buildroot@buildroot.org>
Reply-To: Xuanhao Shi <x-shi@ti.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhpcyBpcyBhIHNlcGFyYXRlIFUtQm9vdCBwYWNrYWdlIHRoYXQgd291bGQgYnVpbGQKdGhlIGlu
dGVybWVkaWF0ZSBzcGwgYmluYXJ5IGZvciB0aGUgUjUgY29yZSBvbiBUSSdzIGszIGJvYXJkcy4K
VXN1YWxseSwgdGhlIHJlc3VsdGluZyBzcGwgd2lsbCBiZSB1c2VkIGZvciBrMy1pbWFnZS1nZW4K
dG8gYnVpbGQgdGhlIGZ1bGwgUjUgYm9vdCBiaW5hcnkgdGlib290My5iaW4uCgpTaWduZWQtb2Zm
LWJ5OiBYdWFuaGFvIFNoaSA8eC1zaGlAdGkuY29tPgotLS0KIERFVkVMT1BFUlMgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHwgIDYgKysrCiBib290L0NvbmZpZy5pbiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICB8ICAxICsKIGJvb3QvdGktazMtcjUtbG9hZGVyL0NvbmZpZy5pbiAg
ICAgICAgICAgIHwgMTMgKysrKysrKwogYm9vdC90aS1rMy1yNS1sb2FkZXIvdGktazMtcjUtbG9h
ZGVyLmhhc2ggfCAgMiArCiBib290L3RpLWszLXI1LWxvYWRlci90aS1rMy1yNS1sb2FkZXIubWsg
ICB8IDQ1ICsrKysrKysrKysrKysrKysrKysrKysrCiA1IGZpbGVzIGNoYW5nZWQsIDY3IGluc2Vy
dGlvbnMoKykKIGNyZWF0ZSBtb2RlIDEwMDY0NCBib290L3RpLWszLXI1LWxvYWRlci9Db25maWcu
aW4KIGNyZWF0ZSBtb2RlIDEwMDY0NCBib290L3RpLWszLXI1LWxvYWRlci90aS1rMy1yNS1sb2Fk
ZXIuaGFzaAogY3JlYXRlIG1vZGUgMTAwNjQ0IGJvb3QvdGktazMtcjUtbG9hZGVyL3RpLWszLXI1
LWxvYWRlci5tawoKZGlmZiAtLWdpdCBhL0RFVkVMT1BFUlMgYi9ERVZFTE9QRVJTCmluZGV4IGZh
NmVmZDIxMGMuLmU0OThkMmZmMDMgMTAwNjQ0Ci0tLSBhL0RFVkVMT1BFUlMKKysrIGIvREVWRUxP
UEVSUwpAQCAtMTI3LDYgKzEyNyw5IEBAIEY6CXBhY2thZ2UvZGNyb24vCiBGOglwYWNrYWdlL2xp
YnhtbHJwYy8KIEY6CXBhY2thZ2UvcHl0aG9uLWRvY29wdC8KIAorTjoJQW5hbmQgR2FkaXlhciA8
Z2FkaXlhckB0aS5jb20+CitGOglib290L3RpLWszLXI1LWxvYWRlci8KKwogTjoJQW5kcsOpIFp3
aW5nIDxuZXJ2QGRhd25jcm93LmRlPgogRjoJcGFja2FnZS9saWJrcmI1LwogRjoJcGFja2FnZS9v
cGVuYWwvCkBAIC0zMDIxLDYgKzMwMjQsOSBAQCBGOglwYWNrYWdlL3B5dGhvbi1weXVzYi8KIE46
CVdvamNpZWNoIE5pemnFhHNraSA8bml6aWFrQHNwb3gub3JnPgogRjoJcGFja2FnZS9md3VwLwog
CitOOglYdWFuaGFvIFNoaSA8WDE1MDAwMTc3QGdtYWlsLmNvbT4KK0Y6CWJvb3QvdGktazMtcjUt
bG9hZGVyLworCiBOOglZYWlyIEJlbiBBdnJhaGFtIDx5YWlyYmFAcHJvdG9ubWFpbC5jb20+CiBG
OglwYWNrYWdlL2Nhc3luYy8KIEY6CXBhY2thZ2UvZ2xvb3gvCmRpZmYgLS1naXQgYS9ib290L0Nv
bmZpZy5pbiBiL2Jvb3QvQ29uZmlnLmluCmluZGV4IDQwNDcyYWUwN2QuLmNlMTdiMmRmNmIgMTAw
NjQ0Ci0tLSBhL2Jvb3QvQ29uZmlnLmluCisrKyBiL2Jvb3QvQ29uZmlnLmluCkBAIC0yMiw2ICsy
Miw3IEBAIHNvdXJjZSAiYm9vdC9zNTAwLWJvb3Rsb2FkZXIvQ29uZmlnLmluIgogc291cmNlICJi
b290L3NoaW0vQ29uZmlnLmluIgogc291cmNlICJib290L3N1bjIwaS1kMS1zcGwvQ29uZmlnLmlu
Igogc291cmNlICJib290L3N5c2xpbnV4L0NvbmZpZy5pbiIKK3NvdXJjZSAiYm9vdC90aS1rMy1y
NS1sb2FkZXIvQ29uZmlnLmluIgogc291cmNlICJib290L3Vib290L0NvbmZpZy5pbiIKIHNvdXJj
ZSAiYm9vdC92ZXhwcmVzcy1maXJtd2FyZS9Db25maWcuaW4iCiAKZGlmZiAtLWdpdCBhL2Jvb3Qv
dGktazMtcjUtbG9hZGVyL0NvbmZpZy5pbiBiL2Jvb3QvdGktazMtcjUtbG9hZGVyL0NvbmZpZy5p
bgpuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwLi43ZjVmYTBiNGM4Ci0tLSAv
ZGV2L251bGwKKysrIGIvYm9vdC90aS1rMy1yNS1sb2FkZXIvQ29uZmlnLmluCkBAIC0wLDAgKzEs
MTMgQEAKK2NvbmZpZyBCUjJfVEFSR0VUX1RJX0szX1I1X0xPQURFUgorCWJvb2wgInRpLWszLXI1
LWxvYWRlciIKKwloZWxwCisJICBTZXBhcmF0ZSBVLUJvb3QgYnVpbGQgZm9yIFI1IGNvcmVzIG9u
IFRJJ3MgazMgYm9hcmRzLgorCSAgVXN1YWxseSB1c2VkIHRvIGJ1aWxkIHRpYm9vdDMuYmluIHdp
dGggazMtaW1hZ2UtZ2VuLgorCitjb25maWcgQlIyX1RBUkdFVF9USV9LM19SNV9MT0FERVJfQk9B
UkQKKwlzdHJpbmcgIkJvYXJkIHRvIGNvbmZpZ3VyZSBmb3IiCisJZGVwZW5kcyBvbiBCUjJfVEFS
R0VUX1RJX0szX1I1X0xPQURFUgorCWhlbHAKKwkgIFNwZWNpZnkgdGhlIGJvYXJkIHRvIGNvbmZp
Z3VyZSB0aGUgYm9vdGxvYWRlciBmb3IuCisJICBUaGlzIHNob3VsZCBiZSB0aGUgbmFtZSBvZiBh
IGJvYXJkIHVuZGVyIGJvYXJkL3RpCisJICBGb3IgZXhhbXBsZSwgImFtNjR4X2V2bSIuCmRpZmYg
LS1naXQgYS9ib290L3RpLWszLXI1LWxvYWRlci90aS1rMy1yNS1sb2FkZXIuaGFzaCBiL2Jvb3Qv
dGktazMtcjUtbG9hZGVyL3RpLWszLXI1LWxvYWRlci5oYXNoCm5ldyBmaWxlIG1vZGUgMTAwNjQ0
CmluZGV4IDAwMDAwMDAwMDAuLmZiNmNlN2MyYTYKLS0tIC9kZXYvbnVsbAorKysgYi9ib290L3Rp
LWszLXI1LWxvYWRlci90aS1rMy1yNS1sb2FkZXIuaGFzaApAQCAtMCwwICsxLDIgQEAKKyMgTG9j
YWxseSBjb21wdXRlZDoKK3NoYTI1NiAgNmQ2OWQ1ZTQ2MzVjYjNmYTc4NTJiZjE1Zjg4Y2EzNDJl
Zjc3NDAxOTZlNzE5NjFkMzU3MmRlYjU4YmE0NGJlYSAgdS1ib290LTIwMjIuMTAtcmMxLnRhci5i
ejIKZGlmZiAtLWdpdCBhL2Jvb3QvdGktazMtcjUtbG9hZGVyL3RpLWszLXI1LWxvYWRlci5tayBi
L2Jvb3QvdGktazMtcjUtbG9hZGVyL3RpLWszLXI1LWxvYWRlci5tawpuZXcgZmlsZSBtb2RlIDEw
MDY0NAppbmRleCAwMDAwMDAwMDAwLi4xZTA5ZmFkOWY1Ci0tLSAvZGV2L251bGwKKysrIGIvYm9v
dC90aS1rMy1yNS1sb2FkZXIvdGktazMtcjUtbG9hZGVyLm1rCkBAIC0wLDAgKzEsNDUgQEAKKyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjCisjCisjIHRpLWszLXI1LWxvYWRlci5taworIworIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMKKworVElfSzNfUjVfTE9BREVSX1ZFUlNJT04gPSAyMDIyLjEwLXJj
MQorVElfSzNfUjVfTE9BREVSX1NJVEUgPSBodHRwczovL2Z0cC5kZW54LmRlL3B1Yi91LWJvb3QK
K1RJX0szX1I1X0xPQURFUl9TT1VSQ0UgPSB1LWJvb3QtJChUSV9LM19SNV9MT0FERVJfVkVSU0lP
TikudGFyLmJ6MgorVElfSzNfUjVfTE9BREVSX0xJQ0VOU0UgPSBHUEwtMi4wKworVElfSzNfUjVf
TE9BREVSX0xJQ0VOU0VfRklMRVMgPSBMaWNlbnNlcy9ncGwtMi4wLnR4dAorVElfSzNfUjVfTE9B
REVSX0NQRV9JRF9WRU5ET1IgPSBkZW54CitUSV9LM19SNV9MT0FERVJfQ1BFX0lEX1BST0RVQ1Qg
PSB1LWJvb3QKK1RJX0szX1I1X0xPQURFUl9JTlNUQUxMX0lNQUdFUyA9IFlFUworVElfSzNfUjVf
TE9BREVSX0RFUEVOREVOQ0lFUyA9IFwKKwlob3N0LXBrZ2NvbmYgXAorCSQoQlIyX01BS0VfSE9T
VF9ERVBFTkRFTkNZKSBcCisJaG9zdC1hcm0tZ251LXRvb2xjaGFpbiBcCisJaG9zdC1vcGVuc3Ns
CisKK1RJX0szX1I1X0xPQURFUl9NQUtFID0gJChCUjJfTUFLRSkKK1RJX0szX1I1X0xPQURFUl9N
QUtFX0VOViA9ICQoVEFSR0VUX01BS0VfRU5WKQorVElfSzNfUjVfTE9BREVSX0tDT05GSUdfREVQ
RU5ERU5DSUVTID0gXAorCWhvc3QtYXJtLWdudS10b29sY2hhaW4gXAorCSQoQlIyX01BS0VfSE9T
VF9ERVBFTkRFTkNZKSBcCisJJChCUjJfQklTT05fSE9TVF9ERVBFTkRFTkNZKSBcCisJJChCUjJf
RkxFWF9IT1NUX0RFUEVOREVOQ1kpCisKK1RJX0szX1I1X0xPQURFUl9CT0FSRCA9ICQoY2FsbCBx
c3RyaXAsJChCUjJfVEFSR0VUX1RJX0szX1I1X0xPQURFUl9CT0FSRCkpCitUSV9LM19SNV9MT0FE
RVJfS0NPTkZJR19ERUZDT05GSUcgPSAkKFRJX0szX1I1X0xPQURFUl9CT0FSRClfcjVfZGVmY29u
ZmlnCitUSV9LM19SNV9MT0FERVJfTUFLRV9PUFRTICs9IFwKKwlDUk9TU19DT01QSUxFPSQoSE9T
VF9BUk1fR05VX1RPT0xDSEFJTl9JTlNUQUxMX0RJUikvYmluL2FybS1ub25lLWVhYmktIFwKKwlB
UkNIPWFybSBcCisJSE9TVENDPSIkKEhPU1RDQykgJChzdWJzdCAtSS8sLWlzeXN0ZW0gLywkKHN1
YnN0IC1JIC8sLWlzeXN0ZW0gLywkKEhPU1RfQ0ZMQUdTKSkpIiBcCisJSE9TVExERkxBR1M9IiQo
SE9TVF9MREZMQUdTKSIKKworZGVmaW5lIFRJX0szX1I1X0xPQURFUl9CVUlMRF9DTURTCisJJChU
QVJHRVRfQ09ORklHVVJFX09QVFMpICQoVElfSzNfUjVfTE9BREVSX01BS0UpIC1DICQoQEQpICQo
VElfSzNfUjVfTE9BREVSX01BS0VfT1BUUykKK2VuZGVmCisKK2RlZmluZSBUSV9LM19SNV9MT0FE
RVJfSU5TVEFMTF9JTUFHRVNfQ01EUworCWNwICQoQEQpL3NwbC91LWJvb3Qtc3BsLmJpbiAkKEJJ
TkFSSUVTX0RJUikvcjUtdS1ib290LXNwbC5iaW4KK2VuZGVmCisKKyQoZXZhbCAkKGtjb25maWct
cGFja2FnZSkpCi0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5v
cmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290
Cg==
