Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D532C4332F
	for <buildroot@archiver.kernel.org>; Tue, 18 Oct 2022 19:43:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9BDA96111E;
	Tue, 18 Oct 2022 19:43:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9BDA96111E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id j5DtehDFh4al; Tue, 18 Oct 2022 19:43:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6A19F6111D;
	Tue, 18 Oct 2022 19:43:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6A19F6111D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D433C1BF95F
 for <buildroot@lists.busybox.net>; Tue, 18 Oct 2022 19:43:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B001B6111D
 for <buildroot@lists.busybox.net>; Tue, 18 Oct 2022 19:43:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B001B6111D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kIPz1TI0rKYR for <buildroot@lists.busybox.net>;
 Tue, 18 Oct 2022 19:43:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7891D61115
Received: from relais-inet.orange.com (relais-inet.orange.com [80.12.70.34])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7891D61115
 for <buildroot@buildroot.org>; Tue, 18 Oct 2022 19:43:14 +0000 (UTC)
Received: from opfednr02.francetelecom.fr (unknown [xx.xx.xx.66])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by opfednr23.francetelecom.fr (ESMTP service) with ESMTPS id 4MsPRN1yRbz5w04; 
 Tue, 18 Oct 2022 21:43:12 +0200 (CEST)
Received: by tl-lnx-nyma7486 (sSMTP sendmail emulation);
 Tue, 18 Oct 2022 21:43:09 +0200
From: <yann.morin@orange.com>
To: <buildroot@buildroot.org>
Date: Tue, 18 Oct 2022 21:43:04 +0200
Message-ID: <18712_1666122192_634F01D0_18712_304_1_aadcab6f9e8f71b5581c8a15b2773a431bb29ca0.1666122184.git.yann.morin@orange.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1666122184.git.yann.morin@orange.com>
References: <cover.1666122184.git.yann.morin@orange.com>
MIME-Version: 1.0
X-Originating-IP: [10.115.26.52]
X-ClientProxiedBy: OPE16NORMBX302.corporate.adroot.infra.ftgroup
 (10.115.26.11) To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; s=ORANGE001; t=1666122192;
 bh=PW1kWKnrFIsUp6e0BeGQOtY4EkD31TPZKHUfwI6otmk=;
 h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:
 Content-Transfer-Encoding;
 b=HU8sMAlwganZbiHNBSbwl6gQWTAvzz/TI/hNUUBb3A2+9v1QISontDs9bIC0WvyeY
 8uS7qq5gNgrVSJtQbe7Ru2h+OcQNt9/04mSWWWHzQNdCGfB9oFVUvbVrcIBsaTLI/E
 LTkK9hDrQSRiApcezzI3eZgVW4BbVdixMU0s/f44l1wX9YkeHpHm+bIlM2OWDDCkYO
 WcH4ZXY6YCpUWv/TRjoec1NBZX4u+5Lf1Hh2kWFl5s8GYmHJVDjCLJvav9Euug47/1
 YhVCgkrQ5iylXjhV6OAax5088crffJ4C/bdZbdgN9ZWu5rDdLiApBClhs0BimXEPbX
 7TovuU73BYRjw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=orange.com header.i=@orange.com
 header.a=rsa-sha256 header.s=ORANGE001 header.b=HU8sMAlw
Subject: [Buildroot] [PATCH 1/6 v3] package/skeleton-systemd: move /var
 factory tmpfiles out of /etc
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
Cc: Norbert Lange <nolange79@gmail.com>, yann.morin@orange.com,
 =?UTF-8?q?Je=CC=81re=CC=81my=20Rosen?= <jeremy.rosen@smile.fr>,
 Romain Naour <romain.naour@smile.fr>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

V2hlbiB0aGUgcm9vdGZzIGlzIG5vdCByZW1vdW50ZWQgcmVhZC13cml0ZSAodGh1cyBhc3N1bWlu
ZyBhIHJlYWQtb25seQpyb290ZnMgbGlrZSBzcXVhc2hmcyksIHdlIGNyZWF0ZSBhIHRtcGZpbGVz
LmQgZmFjdG9yeSBmb3IgL3Zhci4KCkhvd2V2ZXIsIHdlIHJlZ2lzdGVyIHRob3NlIGluIC9ldGMv
dG1wZmlsZXMuZC8sIGJ1dCAvZXRjIGNvdWxkIGFsc28gYmUKYSB0bXBmcyAoZm9yIGZ1bGwgc3Rh
dGUtbGVzcyBzeXN0ZW1zLCBvciBlYXN5IGZhY3RvcnktcmVzZXQsIHNlZSBbMF0pLgoKU28sIHdl
IG1vdmUgb3VyIHZhciBmYWN0b3J5IHRvIC91c3IvbGliL3RtcGZpbGVzLmQvLCB3aGljaCBpcyBh
bHNvIHRoZQpsb2NhdGlvbiB3aGVyZSBzeXN0ZW1kIGl0c2VsZiBwbGFjZXMgaXRzIG93biB0bXBm
aWxlcywgYW5kIHdoZXJlIHdlCmFscmVhZHkgcHV0IGFsbCBvdXIgb3RoZXIgdG1wZmlsZXMgKHNl
ZSBhdWRpdCwgYXZhaGksIGNyeXB0c2V0dXAsIGRoY3AsCmxpZ2h0dHBkLCBuZnMtdXRpbHMsIHF1
YWdnYSwgc2FtYmE0LCBzd3VwZGF0ZSkgYW5kIG91ciBoYW5kbGluZyBvZgpzeXN0ZW1kJ3MgY2F0
YWxvZyBmaWxlcyB0b28uIFdlIGFsc28gcmVuYW1lIHRoZSBmaWxlIHRvIGEgYmV0dGVyIG5hbWUs
CnNvIHRoYXQgaXQgaXMgb2J2aW91cyBpdCBpcyBnZW5lcmF0ZWQgYnkgdXMgKHN5c3RlbWQgYWxy
ZWFkeSBpbnN0YWxscyBhCnZhci5jb25mIG9mIGl0cyBvd24sIHNvIHdlIHdhbnQgdG8gYXZvaWQg
bmFtZSBjbGFzaGluZykuCgpMYXN0IGxpdHRsZSBkZXRhaWw6IHRoZXJlIGlzIG5vIG5lZWQgb3Ig
cmVhc29uIHRvIGNyZWF0ZSAuLi4vdG1wZmlsZXMuZC8KYXQgaW5zdGFsbCB0aW1lOyBpdCBpcyBv
bmx5IG5lZWRlZCBpbiB0aGUgcm9vdGZzLXByZS1jbWQgaG9vaywgc28gd2UKb25seSBjcmVhdGUg
aXQganVzdCBiZWZvcmUgd2UgbmVlZCBpdC4KClswXSBodHRwOi8vMHBvaW50ZXIuZGUvYmxvZy9w
cm9qZWN0cy9zdGF0ZWxlc3MuaHRtbAoKU2lnbmVkLW9mZi1ieTogWWFubiBFLiBNT1JJTiA8eWFu
bi5tb3JpbkBvcmFuZ2UuY29tPgpDYzogTm9yYmVydCBMYW5nZSA8bm9sYW5nZTc5QGdtYWlsLmNv
bT4KQ2M6IFJvbWFpbiBOYW91ciA8cm9tYWluLm5hb3VyQHNtaWxlLmZyPgpDYzogSmXMgXJlzIFt
eSBSb3NlbiA8amVyZW15LnJvc2VuQHNtaWxlLmZyPgpbeWFubi5tb3Jpbi4xOTk4QGZyZWUuZnI6
CiAgLSBzcGxpdCBvcmlnaW5hbCBwYXRjaCBpbiB0d28KICAtIHRoaXMgb25lIG9ubHkgbW92ZXMg
b3V0IG9mIC9ldGMgYW5kIGludG8gL3Vzci9saWIKICAtIGFkYXB0IGNvbW1pdCBsb2cgYWNjb3Jk
aW5nbHkKXQpTaWduZWQtb2ZmLWJ5OiBZYW5uIEUuIE1PUklOIDx5YW5uLm1vcmluLjE5OThAZnJl
ZS5mcj4KLS0tCiBwYWNrYWdlL3NrZWxldG9uLWluaXQtc3lzdGVtZC9za2VsZXRvbi1pbml0LXN5
c3RlbWQubWsgfCA0ICsrLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVs
ZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9za2VsZXRvbi1pbml0LXN5c3RlbWQvc2tl
bGV0b24taW5pdC1zeXN0ZW1kLm1rIGIvcGFja2FnZS9za2VsZXRvbi1pbml0LXN5c3RlbWQvc2tl
bGV0b24taW5pdC1zeXN0ZW1kLm1rCmluZGV4IDc5NWExNzE4MDkuLjdiNjY3MzJlZjQgMTAwNjQ0
Ci0tLSBhL3BhY2thZ2Uvc2tlbGV0b24taW5pdC1zeXN0ZW1kL3NrZWxldG9uLWluaXQtc3lzdGVt
ZC5taworKysgYi9wYWNrYWdlL3NrZWxldG9uLWluaXQtc3lzdGVtZC9za2VsZXRvbi1pbml0LXN5
c3RlbWQubWsKQEAgLTI5LDcgKzI5LDYgQEAgZWxzZQogIyBhIHJlYWwgKGJ1dCBlbXB0eSkgZGly
ZWN0b3J5LCBhbmQgdGhlICJmYWN0b3J5IGZpbGVzIiB3aWxsIGJlIGNvcGllZAogIyBiYWNrIHRo
ZXJlIGJ5IHRoZSB0bXBmaWxlcy5kIG1lY2hhbmlzbS4KIGRlZmluZSBTS0VMRVRPTl9JTklUX1NZ
U1RFTURfUk9PVF9ST19PUl9SVwotCW1rZGlyIC1wICQoVEFSR0VUX0RJUikvZXRjL3N5c3RlbWQv
dG1wZmlsZXMuZAogCWVjaG8gIi9kZXYvcm9vdCAvIGF1dG8gcm8gMCAxIiA+JChUQVJHRVRfRElS
KS9ldGMvZnN0YWIKIAllY2hvICJ0bXBmcyAvdmFyIHRtcGZzIG1vZGU9MTc3NyAwIDAiID4+JChU
QVJHRVRfRElSKS9ldGMvZnN0YWIKIGVuZGVmCkBAIC0zOCw2ICszNyw3IEBAIGRlZmluZSBTS0VM
RVRPTl9JTklUX1NZU1RFTURfUFJFX1JPT1RGU19WQVIKIAlybSAtcmYgJChUQVJHRVRfRElSKS91
c3Ivc2hhcmUvZmFjdG9yeS92YXIKIAltdiAkKFRBUkdFVF9ESVIpL3ZhciAkKFRBUkdFVF9ESVIp
L3Vzci9zaGFyZS9mYWN0b3J5L3ZhcgogCW1rZGlyIC1wICQoVEFSR0VUX0RJUikvdmFyCisJbWtk
aXIgLXAgJChUQVJHRVRfRElSKS91c3IvbGliL3RtcGZpbGVzLmQKIAlmb3IgaSBpbiAkKFRBUkdF
VF9ESVIpL3Vzci9zaGFyZS9mYWN0b3J5L3Zhci8qIFwKIAkJICQoVEFSR0VUX0RJUikvdXNyL3No
YXJlL2ZhY3RvcnkvdmFyL2xpYi8qIFwKIAkJICQoVEFSR0VUX0RJUikvdXNyL3NoYXJlL2ZhY3Rv
cnkvdmFyL2xpYi9zeXN0ZW1kLyo7IGRvIFwKQEAgLTUxLDcgKzUxLDcgQEAgZGVmaW5lIFNLRUxF
VE9OX0lOSVRfU1lTVEVNRF9QUkVfUk9PVEZTX1ZBUgogCQkJcHJpbnRmICJDISAlcyAtIC0gLSAt
XG4iICIkJHtqfSIgXAogCQkJfHwgZXhpdCAxOyBcCiAJCWZpOyBcCi0JZG9uZSA+JChUQVJHRVRf
RElSKS9ldGMvdG1wZmlsZXMuZC92YXItZmFjdG9yeS5jb25mCisJZG9uZSA+JChUQVJHRVRfRElS
KS91c3IvbGliL3RtcGZpbGVzLmQvYnVpbGRyb290LWZhY3RvcnkuY29uZgogZW5kZWYKIFNLRUxF
VE9OX0lOSVRfU1lTVEVNRF9ST09URlNfUFJFX0NNRF9IT09LUyArPSBTS0VMRVRPTl9JTklUX1NZ
U1RFTURfUFJFX1JPT1RGU19WQVIKIAotLSAKMi4yNS4xCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwoKQ2UgbWVzc2FnZSBl
dCBzZXMgcGllY2VzIGpvaW50ZXMgcGV1dmVudCBjb250ZW5pciBkZXMgaW5mb3JtYXRpb25zIGNv
bmZpZGVudGllbGxlcyBvdSBwcml2aWxlZ2llZXMgZXQgbmUgZG9pdmVudCBkb25jCnBhcyBldHJl
IGRpZmZ1c2VzLCBleHBsb2l0ZXMgb3UgY29waWVzIHNhbnMgYXV0b3Jpc2F0aW9uLiBTaSB2b3Vz
IGF2ZXogcmVjdSBjZSBtZXNzYWdlIHBhciBlcnJldXIsIHZldWlsbGV6IGxlIHNpZ25hbGVyCmEg
bCdleHBlZGl0ZXVyIGV0IGxlIGRldHJ1aXJlIGFpbnNpIHF1ZSBsZXMgcGllY2VzIGpvaW50ZXMu
IExlcyBtZXNzYWdlcyBlbGVjdHJvbmlxdWVzIGV0YW50IHN1c2NlcHRpYmxlcyBkJ2FsdGVyYXRp
b24sCk9yYW5nZSBkZWNsaW5lIHRvdXRlIHJlc3BvbnNhYmlsaXRlIHNpIGNlIG1lc3NhZ2UgYSBl
dGUgYWx0ZXJlLCBkZWZvcm1lIG91IGZhbHNpZmllLiBNZXJjaS4KClRoaXMgbWVzc2FnZSBhbmQg
aXRzIGF0dGFjaG1lbnRzIG1heSBjb250YWluIGNvbmZpZGVudGlhbCBvciBwcml2aWxlZ2VkIGlu
Zm9ybWF0aW9uIHRoYXQgbWF5IGJlIHByb3RlY3RlZCBieSBsYXc7CnRoZXkgc2hvdWxkIG5vdCBi
ZSBkaXN0cmlidXRlZCwgdXNlZCBvciBjb3BpZWQgd2l0aG91dCBhdXRob3Jpc2F0aW9uLgpJZiB5
b3UgaGF2ZSByZWNlaXZlZCB0aGlzIGVtYWlsIGluIGVycm9yLCBwbGVhc2Ugbm90aWZ5IHRoZSBz
ZW5kZXIgYW5kIGRlbGV0ZSB0aGlzIG1lc3NhZ2UgYW5kIGl0cyBhdHRhY2htZW50cy4KQXMgZW1h
aWxzIG1heSBiZSBhbHRlcmVkLCBPcmFuZ2UgaXMgbm90IGxpYWJsZSBmb3IgbWVzc2FnZXMgdGhh
dCBoYXZlIGJlZW4gbW9kaWZpZWQsIGNoYW5nZWQgb3IgZmFsc2lmaWVkLgpUaGFuayB5b3UuCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3Qg
bWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRy
b290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
