Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ECB7C352A1
	for <buildroot@archiver.kernel.org>; Tue,  6 Dec 2022 17:17:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 99EAF40A6A;
	Tue,  6 Dec 2022 17:17:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 99EAF40A6A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9UWj72GV9lm9; Tue,  6 Dec 2022 17:17:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BDB7C405A8;
	Tue,  6 Dec 2022 17:17:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BDB7C405A8
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1FFDD1BF95D
 for <buildroot@lists.busybox.net>; Tue,  6 Dec 2022 17:17:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 07F314021D
 for <buildroot@lists.busybox.net>; Tue,  6 Dec 2022 17:17:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 07F314021D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xAkgH7SZb0vd for <buildroot@lists.busybox.net>;
 Tue,  6 Dec 2022 17:17:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B46D740951
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B46D740951
 for <buildroot@buildroot.org>; Tue,  6 Dec 2022 17:17:23 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 2B6HHJFs110268;
 Tue, 6 Dec 2022 11:17:19 -0600
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 2B6HHJ6e105128
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 6 Dec 2022 11:17:19 -0600
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Tue, 6
 Dec 2022 11:17:19 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Tue, 6 Dec 2022 11:17:19 -0600
Received: from uda0393673 (ileaxei01-snat2.itg.ti.com [10.180.69.6])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 2B6HHJr2003087;
 Tue, 6 Dec 2022 11:17:19 -0600
Received: from a0393673 by uda0393673 with local (Exim 4.95)
 (envelope-from <gadiyar@ti.com>) id 1p2bZH-0038U3-BU;
 Tue, 06 Dec 2022 11:17:19 -0600
To: <buildroot@buildroot.org>
Date: Tue, 6 Dec 2022 11:17:16 -0600
Message-ID: <20221206171719.747581-1-gadiyar@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1670347039;
 bh=RljnBg3hjoSCLp0GS5WvOsmE4+AtyczFlGzfiorL7MA=;
 h=From:To:CC:Subject:Date;
 b=NYQwrMTBJ7kNQlzgtRvOM/FoS/CYld+TcbGwlSARAIhVmBv5ixkAgJ72ngh7RS605
 Mu0mBSvW3olxEWlEoOOEN5uPSBuuNDgWZoS4YxPl5tZtGxv/HWhnFpQ/oqWxMWY4Rq
 5fUlHMpQV4Wnob2Tw0IDm0jsi4tFp+c2notpp3tg=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=NYQwrMTB
Subject: [Buildroot] [PATCH v7 0/3] add support for TI's AM64x boards
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
From: Anand Gadiyar via buildroot <buildroot@buildroot.org>
Reply-To: Anand Gadiyar <gadiyar@ti.com>
Cc: Bryan Brattlof <bb@ti.com>, Andrew Davis <afd@ti.com>,
 Xuanhao Shi <X15000177@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhpcyBzZXJpZXMgaW50cm9kdWNlcyBzdXBwb3J0IGZvciBUSSdzIEFNNjR4IFNLIGJvYXJkcy4K
CldlIHdvdWxkIGxpa2UgdG8gYWRkIHN1cHBvcnQgZm9yIHRoZSBBTTYyeCBTSyBhcyB3ZWxsLCBi
dXQgYXJlCmN1cnJlbnRseSBibG9ja2VkIGJ5IGF2YWlsYWJpbGl0eSBvZiBzb21lIGZpcm13YXJl
LiBUaGF0J3Mgc3RpbGwKb24gdGhlIGxpc3QsIGFzIGlzIHRoZSBTSy1UREE0Vk0uIFdlIHNob3Vs
ZCBhbHNvIGJlIGFibGUgdG8KZW5hYmxlIHRoZSBiZWFnbGVib2FyZC1haTY0IGFsb25nc2lkZSB0
aGF0IGF0IHRoZSBzYW1lIHRpbWUuCgoKVGhpcyBzZXJpZXMgd2FzIHByZXZpb3VzbHkgc2VudCBv
dXQgYnkgWHVhbmhhbyBpbiBBdWd1c3QgYW5kCndhcyByZXZpZXdlZCBieSBHaXVsaW8gQmVuZXR0
aSB1cCB0byB2NSAoVGhhbmtzISkuCgpUaGlzIHNlcmllcyBhZGRyZXNzZXMgZnVydGhlciByZXZp
ZXcgY29tbWVudHMgZm9yIHY1IGZyb20gUm9tYWluCk5hb3VyIGFuZCBmb3IgdjYgZnJvbSBGcmFu
w6dvaXMgUGVycmFkLiBUaGFua3MgZm9yIHRoZSByZXZpZXdzClJvbWFpbiBhbmQgRnJhbsOnb2lz
IQoKQW5kcmV3IERhdmlzIGFja2VkIHRoZSBwcmV2aW91cyBzZXJpZXMsIGV4Y2VwdCBmb3Igb25l
IG5ldyBjaGFuZ2UKdGhhdCBJJ3ZlIGFkZHJlc3NlZCBpbiB0aGlzIHZlcnNpb24uCgpJIGFkZHJl
c3NlZCBhbGwgb2YgUm9tYWluJ3MgY29tbWVudHMgZXhjZXB0IG9uZSAtIEkgY291bGRuJ3QgZ2V0
CnRoZSBzaGEyNTZzdW0gZm9yIHRoZSBrMy1pbWFnZS1nZW4gcGFja2FnZSB0byBiZSB1cGRhdGVk
IGluIHRoZQpzb3VyY2UgcmVwb3NpdG9yeSwgc28gZm9yIG5vdyBpdCdzIHN0aWxsIG1hbnVhbGx5
IGNvbXB1dGVkLiBJJ2xsCnNlZSB3aGF0IEkgY2FuIGRvIGFib3V0IGdldHRpbmcgdGhlIHJlcG9z
aXRvcnkgb3duZXJzIHRvIGdlbmVyYXRlCnRoZXNlIGF1dG9tYXRpY2FsbHkgYXQgcmVsZWFzZSB0
aW1lLgoKQ2hhbmdlcyBpbiB2NzoKLSBjaGFuZ2VzIHBlciBGcmFuw6dvaXMgUGVycmFkJ3MgcmV2
aWV3IGNvbW1lbnRzCgpDaGFuZ2VzIGluIHY2OgotIHJlYmFzZWQgdG8gbGF0ZXN0IG5leHQgYnJh
bmNoIGFuZCByZXRlc3RlZAotIHVwZGF0ZWQgdS1ib290IGFuZCBrZXJuZWwgdG8gbGF0ZXN0IHJl
bGVhc2VkIHZlcnNpb25zIGFzIG9mIHRvZGF5CkZyb20gQW5kcmV3J3MgY29tbWVudHM6Ci0gYWRk
ZWQgYSBuZXcgU09DX1RZUEUgb3B0aW9uIGZvciBrMy1pbWFnZS1nZW4sIGFzIHJlcXVlc3RlZCBi
eSBBbmRyZXcKICBEYXZpcyBpbiBhIHJldmlldyBjb21tZW50LgpGcm9tIFJvbWFpbidzIGNvbW1l
bnRzOgotIHVzZSAiaWYiIGluc3RlYWQgb2YgImRlcGVuZHMgb24iIGZvciBzdWItb3B0aW9ucwot
IG1vdmUgVEkgSzMgUjUgTG9hZGVyIGRlZmNvbmZpZyBzZWxlY3Rpb24gdG8gS2NvbmZpZwotIHVz
ZSAkKEhPU1RfRElSKSBpbnN0ZWFkIG9mICQoSE9TVF9BUk1fR05VX1RPT0xDSEFJTl9JTlNUQUxM
X0RJUikKLSBSZXRhaW4gWHVhbmhhbydzIGdtYWlsIElEIGluIHRoZSBNQUlOVEFJTkVScyBmaWxl
LCBidXQgZHJvcCBoaXMgVEkKICBlbWFpbCBmcm9tIENDIGxpc3QgYXMgaXQgd2lsbCBiZSBpbmFj
dGl2ZSB0aWxsIGhlIHJlam9pbnMgVEkKLSBBZGQgYSBwbGFpbi10ZXh0IGxpY2Vuc2UgZmlsZSBp
bnRvIHRoZSBrMy1pbWFnZS1nZW4gcmVwb3NpdG9yeSBhbmQgdXNlCiAgaXQgaW5zdGVhZCBvZiB0
aGUgSFRNTCBtYW5pZmVzdCBmaWxlLiBDb25maXJtZWQgdGhhdCB0aGlzIGlzIHN0aWxsCiAgQlNE
LTMtQ2xhdXNlIGxpY2Vuc2UuCi0gQWRkIGNvbW1lbnRzIGluIHRoZSB0aS1rMy1pbWFnZS1nZW4u
bWsgZmlsZSBmb3IgYSBjb3VwbGUgb2Ygb3B0aW9ucwoKQ2hhbmdlcyBpbiB2NToKLSBOb25lIChy
ZXN1Ym1pc3Npb24gb2YgWHVhbmhhbydzIHNlcmllcykKCkNoYW5nZXMgaW4gdjQ6Ci0gcmViYXNl
ZCB0byBsYXRlc3QgbWFzdGVyIGFuZCByZXRlc3RlZAotIGRyb3BwZWQgT1BURUUgQ1VTVE9NKiBv
cHRpb25zIGFzIHdlIGRvbid0IG5lZWQgdGhlbS4KCkNoYW5nZXMgaW4gdjM6Ci0gRml4IGJvb3Qv
dGktazMtcjUtbG9hZGVyIHBhY2thZ2UncyBidWlsZCBvcHRpb25zIGFuZCBkZXBlbmRlbmNpZXMu
Ci0gRml4IGJvb3QvdGktazMtaW1hZ2UtZ2VuIHBhY2thZ2UncyBjb25maWcKLSBBZGQgbW9yZSBk
ZXRhaWxzIGluIGJvYXJkL3RpL2FtNjR4X3NrJ3MgcmVhZG1lCi0gVHJpbSBjb25maWdzL2FtNjR4
X3NrJ3MgdG9vbGNoYWluIG9wdGlvbnMgYW5kIAogIGZpeCB1Ym9vdCBhbmQgZ2VuaW1hZ2UgZGVw
ZW5kZW5jaWVzLgotIFJlbW92ZSBib2FyZC90aS9hbTYyeF9zayBhbmQgY29uZmlncy9hbTYyeF9z
ayBmb3Igbm93IGR1ZSB0byBzb21lCiAgZmlybXdhcmUgZGVwZW5kZW5jeSBwcm9ibGVtcy4gV2ls
bCBiZSBhZGRlZCBiYWNrIGluIHRoZSBmdXR1cmUuCgpDaGFuZ2VzIGluIHYyOgotIFJldmVydCBh
cm0tZ251LXRvb2xjaGFpbiBiYWNrIHRvIHZlcnNpb24gMTAueCBkdWUgdG8gYSBidWcuCiAgV2hl
biB0aGUgcHJlLXBhY2thZ2VkIEdDQyB3YXMgYnVpbHQsIGl0IGNvdWxkIGJlIHRhcmdldGluZwog
IGEgbmV3ZXIgeDg2XzY0IGFyY2hpdGVjdHVyZSB0aGFuIHRoZSBwcm9jZXNzb3IgYmVpbmcgdXNl
ZC4KLSBBZGQgYm9vdC90aS1rMy1yNS1sb2FkZXIgcGFja2FnZSB0aGF0IGJ1aWxkcyBhIHNlcGFy
YXRlIFUtQm9vdAogIGZvciB0aGUgUjUgY29yZXMgb24gVEkncyBLMyBkZXZpY2VzLgotIEFkZCBi
b290L3RpLWszLWltYWdlLWdlbiBwYWNrYWdlIHRoYXQgYnVpbGRzIHRoZSBmdWxsIGJvb3QgYmlu
YXJ5CiAgdGlib290My5iaW4gZnJvbSB0aGUgc3BsIGJ1aWx0IGZyb20gdGktazMtcjUtbG9hZGVy
LgotIEFkZCBib2FyZC90aSBkaXJlY3RvcnkgdG8gaW5jbHVkZSBzZGNhcmQgY29uZmlnIGFuZCBi
b2FyZCBpbmZvcm1hdGlvbgogIGZvciBBTTY0eF9zayBhbmQgQU02Mnhfc2sgYm9hcmRzLgotIEFk
ZCB0aGUgQnVpbGRyb290IGRlZmNvbmZpZ3MgZm9yIEFNNjR4X3NrIGFuZCBBTTYyeF9zay4KLSBB
ZGQgdG8gREVWRUxPUEVSUyBsaXN0LgoKWHVhbmhhbyBTaGkgKDMpOgogIGJvb3QvdGktazMtcjUt
bG9hZGVyOiBhZGQgbmV3IHBhY2thZ2UKICBib290L3RpLWszLWltYWdlLWdlbjogYWRkIG5ldyBw
YWNrYWdlCiAgYm9hcmQvdGkvYW02NHhfc2s6IGFkZCBuZXcgYm9hcmQKCiBERVZFTE9QRVJTICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8IDEyICsrKysrKwogYm9hcmQvdGkvYW02NHhf
c2svZ2VuaW1hZ2UuY2ZnICAgICAgICAgICAgfCAyNyArKysrKysrKysrKysrCiBib2FyZC90aS9h
bTY0eF9zay9yZWFkbWUudHh0ICAgICAgICAgICAgICB8IDQ5ICsrKysrKysrKysrKysrKysrKysr
KysrCiBib290L0NvbmZpZy5pbiAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAyICsKIGJv
b3QvdGktazMtaW1hZ2UtZ2VuL0NvbmZpZy5pbiAgICAgICAgICAgIHwgMzAgKysrKysrKysrKysr
KysKIGJvb3QvdGktazMtaW1hZ2UtZ2VuL3RpLWszLWltYWdlLWdlbi5oYXNoIHwgIDIgKwogYm9v
dC90aS1rMy1pbWFnZS1nZW4vdGktazMtaW1hZ2UtZ2VuLm1rICAgfCA0MiArKysrKysrKysrKysr
KysrKysrCiBib290L3RpLWszLXI1LWxvYWRlci9Db25maWcuaW4gICAgICAgICAgICB8IDMyICsr
KysrKysrKysrKysrKwogYm9vdC90aS1rMy1yNS1sb2FkZXIvdGktazMtcjUtbG9hZGVyLmhhc2gg
fCAgMiArCiBib290L3RpLWszLXI1LWxvYWRlci90aS1rMy1yNS1sb2FkZXIubWsgICB8IDQ5ICsr
KysrKysrKysrKysrKysrKysrKysrCiBjb25maWdzL2FtNjR4X3NrX2RlZmNvbmZpZyAgICAgICAg
ICAgICAgICB8IDQ0ICsrKysrKysrKysrKysrKysrKysrCiAxMSBmaWxlcyBjaGFuZ2VkLCAyOTEg
aW5zZXJ0aW9ucygrKQogY3JlYXRlIG1vZGUgMTAwNjQ0IGJvYXJkL3RpL2FtNjR4X3NrL2dlbmlt
YWdlLmNmZwogY3JlYXRlIG1vZGUgMTAwNjQ0IGJvYXJkL3RpL2FtNjR4X3NrL3JlYWRtZS50eHQK
IGNyZWF0ZSBtb2RlIDEwMDY0NCBib290L3RpLWszLWltYWdlLWdlbi9Db25maWcuaW4KIGNyZWF0
ZSBtb2RlIDEwMDY0NCBib290L3RpLWszLWltYWdlLWdlbi90aS1rMy1pbWFnZS1nZW4uaGFzaAog
Y3JlYXRlIG1vZGUgMTAwNjQ0IGJvb3QvdGktazMtaW1hZ2UtZ2VuL3RpLWszLWltYWdlLWdlbi5t
awogY3JlYXRlIG1vZGUgMTAwNjQ0IGJvb3QvdGktazMtcjUtbG9hZGVyL0NvbmZpZy5pbgogY3Jl
YXRlIG1vZGUgMTAwNjQ0IGJvb3QvdGktazMtcjUtbG9hZGVyL3RpLWszLXI1LWxvYWRlci5oYXNo
CiBjcmVhdGUgbW9kZSAxMDA2NDQgYm9vdC90aS1rMy1yNS1sb2FkZXIvdGktazMtcjUtbG9hZGVy
Lm1rCiBjcmVhdGUgbW9kZSAxMDA2NDQgY29uZmlncy9hbTY0eF9za19kZWZjb25maWcKCi0tIAoy
LjM0LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1
aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0
cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
