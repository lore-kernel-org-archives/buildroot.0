Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69364C5DF81
	for <buildroot@archiver.kernel.org>; Sun, 23 Aug 2026 21:50:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0C91B80CB6;
	Sun, 23 Aug 2026 21:50:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y1tyOCtQvkyd; Sun, 23 Aug 2026 21:50:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787521804;
	bh=/9rPBLbvB6gq6aGugtiGL9EsQFmNad89ufrN7VnvL6A=;
	h=Date:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=bpdifDQwzkPIBODjnqhIOAt9cyUhWrPqP94JB0t0FNM7KIvUTUvHaVTM8qsW48yqC
	 T/r8KWuNibQF6mIs54GIWJgCSQQ8ISiRzFtUhaQ33oVIUNuVElntrbOpnrOJ3fsrDW
	 X54DZOGz/9DJX7rKFQNtUfINaz/hOuG2qdER+mIaef5yWX45Qp5j+N1H+dBB3T2+YR
	 SCaIY2N85HFLDDtOgHzLsd1UQiNa5alUseeRiyeNEyE8i1ji6jsUC+Rx2yOW4/FEIu
	 6W9kg76urc2jOCx7yWor/wE6yjw4Dck+zMsyrEPKt/e+GGw+XZvRzqVaVHu1fqgeo1
	 uEGntqv0Rn+1A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id ED5158081D;
	Sun, 23 Aug 2026 21:50:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id F07E0279
 for <buildroot@buildroot.org>; Sun, 23 Aug 2026 21:50:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EC6C840578
 for <buildroot@buildroot.org>; Sun, 23 Aug 2026 21:50:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ISmK1agf1QDF for <buildroot@buildroot.org>;
 Sun, 23 Aug 2026 21:50:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=alexis.lothore@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CFE9740540
 for <buildroot@buildroot.org>; Sun, 23 Aug 2026 21:49:59 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 8CA0C1A17CC;
 Sun, 23 Aug 2026 21:49:57 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 4D56D60378;
 Sun, 23 Aug 2026 21:49:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 11A2E11C785FD; 
 Sun, 23 Aug 2026 23:49:51 +0200 (CEST)
Date: Sun, 23 Aug 2026 23:49:38 +0200
MIME-Version: 1.0
Message-Id: <20260823-fix-host-erlang-v1-1-4886b00d10f0@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWMQQqDQAxFryJZG5hGtOJViouZMWqKaJmoCOLdT
 dvl4//3TlBOwgpNdkLiXVSW2eCRZxBHPw+M0hkDOapcTQX2cuC46IqcJtuxjC7UFPzTUw9mfRL
 b5Vd8tX/WLbw5rt8MXNcNYKlRY3MAAAA=
X-Change-ID: 20260823-fix-host-erlang-5c0b82ba7a2f
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Will Newton <will.newton@gmail.com>, 
 =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
X-Mailer: b4 0.15.2
X-Last-TLS-Session-Version: TLSv1.3
Subject: [Buildroot] [PATCH] package/erlang: fix link failure on odbcserver
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

aG9zdC1lcmxhbmcgYnVpbGQgY2FuIGZhaWwgd2l0aCB0aGUgZm9sbG93aW5nIGVycm9yOgoKICBt
YWtlWzVdOiBOb3RoaW5nIHRvIGJlIGRvbmUgZm9yICdvcHQnLgogICBNQUtFCW9wdAogICBDQwku
Li9wcml2L2Jpbi94ODZfNjQtcGMtbGludXgtZ251L29kYmNzZXJ2ZXIKICAvdXNyL2Jpbi9sZDog
Li4vcHJpdi9vYmoveDg2XzY0LXBjLWxpbnV4LWdudS9vZGJjc2VydmVyLm86IGluIGZ1bmN0aW9u
IGBlbmNvZGVfY29sdW1uX2R5bic6CiAgb2RiY3NlcnZlci5jOigudGV4dCsweDZiNCk6IHVuZGVm
aW5lZCByZWZlcmVuY2UgdG8gYGVpX3hfZW5jb2RlX3R1cGxlX2hlYWRlcicKICAvdXNyL2Jpbi9s
ZDogb2RiY3NlcnZlci5jOigudGV4dCsweDZjMik6IHVuZGVmaW5lZCByZWZlcmVuY2UgdG8gYGVp
X3hfZW5jb2RlX3R1cGxlX2hlYWRlcicKICAvdXNyL2Jpbi9sZDogb2RiY3NlcnZlci5jOigudGV4
dCsweDZkNCk6IHVuZGVmaW5lZCByZWZlcmVuY2UgdG8gYGVpX3hfZW5jb2RlX3Vsb25nJwogIC91
c3IvYmluL2xkOiBvZGJjc2VydmVyLmM6KC50ZXh0KzB4NmU3KTogdW5kZWZpbmVkIHJlZmVyZW5j
ZSB0byBgZWlfeF9lbmNvZGVfdWxvbmcnCiAgL3Vzci9iaW4vbGQ6IG9kYmNzZXJ2ZXIuYzooLnRl
eHQrMHg2ZmEpOiB1bmRlZmluZWQgcmVmZXJlbmNlIHRvIGBlaV94X2VuY29kZV91bG9uZycKICAv
dXNyL2Jpbi9sZDogb2RiY3NlcnZlci5jOigudGV4dCsweDcwOCk6IHVuZGVmaW5lZCByZWZlcmVu
Y2UgdG8gYGVpX3hfZW5jb2RlX3R1cGxlX2hlYWRlcicKICAvdXNyL2Jpbi9sZDogb2RiY3NlcnZl
ci5jOigudGV4dCsweDcxYik6IHVuZGVmaW5lZCByZWZlcmVuY2UgdG8gYGVpX3hfZW5jb2RlX3Vs
b25nJwogIC91c3IvYmluL2xkOiBvZGJjc2VydmVyLmM6KC50ZXh0KzB4NzJlKTogdW5kZWZpbmVk
IHJlZmVyZW5jZSB0byBgZWlfeF9lbmNvZGVfdWxvbmcnCiAgWy4uLl0KClRoaXMgY2FuIGJlIHJl
cHJvZHVjZWQgd2l0aCB0aGUgZm9sbG93aW5nIG1pbmltYWwgZGVmY29uZmlnIChhbmQKbGliZWku
c28gcHJlc2VudCBvbiBob3N0LCBzZWUgZGV0YWlscyBiZWxvdyk6CgogIEJSMl94ODZfNjQ9eQog
IEJSMl9UT09MQ0hBSU5fRVhURVJOQUw9eQogIEJSMl9QQUNLQUdFX0VSTEFORz15CgpUaG9zZSBt
aXNzaW5nIHN5bWJvbHMgYXJlIHBhcnQgb2YgdGhlIGVybF9pbnRlcmZhY2UsIGV4cG9zZWQgYnkg
bGliZWkuYS4KaG9zdC1lcmxhbmcgYnVpbGRzIGNvcnJlY3RseSBsaWJlaS5hIF9iZWZvcmVfIG9k
YmNzZXJ2ZXIuYyAoaXQgY2FuIGJlCmZvdW5kIGluIGxpYi9lcmxfaW50ZXJmYWNlL29iai94ODZf
NjQtcGMtbGludXgtZ251L2xpYmVpLmEpLCBidXQgdGhlCmZhaWx1cmUgaXMgYWN0dWFsbHkgZHVl
IHRvIHRoZSBidWlsZCBjb21tYW5kIGdlbmVyYXRlZCBhbmQgdXNlZCBmb3IKb2RiY3NlcnZlci5j
LCBlc3BlY2lhbGx5IHRoZSBsaW5rIGFyZ3VtZW50czoKCiAgL3Vzci9iaW4vZ2NjIFwKICBbLi4u
XQogIC1vIC4uL3ByaXYvYmluL3g4Nl82NC1wYy1saW51eC1nbnUvb2RiY3NlcnZlciBcCiAgLi4v
cHJpdi9vYmoveDg2XzY0LXBjLWxpbnV4LWdudS9vZGJjc2VydmVyLm8gXAogIC1ML3Vzci9saWI2
NCBcCiAgLWxvZGJjIFwKICAtTC9ob21lL2FsZXhpcy9zcmMvYnVpbGRyb290L2VybGFuZy1tYXN0
ZXIvYnVpbGQvaG9zdC1lcmxhbmctY3VzdG9tL2xpYi9lcmxfaW50ZXJmYWNlL29iai94ODZfNjQt
cGMtbGludXgtZ251IFwKICAtbHB0aHJlYWQgLWxlaQoKL3Vzci9saWI2NCBpcyBzZWFyY2hlZCBi
ZWZvcmUgdGhlIHBhdGggd2hlcmUgbGliZWkuYSBoYXMgYmVlbiBidWlsdCwgc28KaWYgd2hldGhl
ciBhIHZhbGlkIGxpYmVpLmEgb3IgbGliZWkuc28gaXMgZm91bmQgdGhlcmUsIGl0IHNoYWRvd3Mg
dGhlCmV4cGVjdGVkIGxpYmVpLmEuIEluIHRoZSBidWlsZCBmcm9tIHdoaWNoIHRoZSBsb2dzIGFi
b3ZlIGNvbWUsIHRoZQpub3RhYmxlIHBvaW50IGlzIHRoYXQgdGhlIGhvc3Qgc3lzdGVtIGluZGVl
ZCBoYXZlIGEgdmFsaWQgbGliZWkuc28sIGJ1dAppcyBjb21wbGV0ZWx5IHVucmVsYXRlZCB0byBl
cmxfaW50ZXJmYWNlOyBpdCByYXRoZXIgZXhwb3NlcyB0aGUgRW11bGF0ZWQKSW5wdXQgcHJvdG9j
b2wgYWltZWQgYXQgV2F5bGFuZCBzdGFjazsgYW5kIHNvIGl0IG9idmlvdXNseSBjb250YWlucyBu
b25lCm9mIHRoZSBleHBlY3RlZCBlaV8qIHN5bWJvbHMuCgpVcHN0cmVhbSBoYXMgYWxyZWFkeSBp
ZGVudGlmaWVkIGFuZCBmaXhlZCB0aGUgaXNzdWUsIHRoZSBmaXggaXMgYWxyZWFkeQpyZWxlYXNl
ZCBpbiB2ZXJzaW9ucyA+PSAyNy54LnkuIEVybGFuZyAyNiAodGhlIHZlcnNpb24gY3VycmVudGx5
CnBhY2thZ2VkIGluIGJ1aWxkcm9vdCksIGlzbid0IHN1cHBvcnRlZCBhbnltb3JlIChvbmx5IHRo
ZSB0aHJlZSBsYXRlc3QKcmVsZWFzZXMgYXJlIHN1cHBvcnRlZCwgc2VlCmh0dHBzOi8vZ2l0aHVi
LmNvbS9lcmxhbmcvb3RwL2Jsb2IvbWFzdGVyL1NFQ1VSSVRZLm1kKSwgc28gdGhlcmUgd29uJ3QK
YmUgYW55IG5ldyBtaW5vciB1cGRhdGUgdGhhdCB3aWxsIHJlbGVhc2UgdGhpcyBmaXguCgpQaWNr
IGFuZCBiYWNrcG9ydCB0aGUgZml4aW5nIHBhdGNoIHNvIHRoYXQgdGhlIGN1cnJlbnQgdmVyc2lv
biBwYWNrYWdlZAppbiBidWlsZHJvb3QgY2FuIHN0aWxsIGJ1aWxkLgoKU2lnbmVkLW9mZi1ieTog
QWxleGlzIExvdGhvcsOpIDxhbGV4aXMubG90aG9yZUBib290bGluLmNvbT4KLS0tClRoZSBpc3N1
ZSBhZmZlY3RzIDIwMjUuMDIueCwgMjAyNi4wNS54IGFuZCBtYXN0ZXIuCgpJJ3ZlIGFsc28gdGFr
ZW4gYSBsb29rIGF0IHVwZGF0aW5nIHRoZSBlcmxhbmcgcGFja2FnZSwgYnV0OgotIEkgaG9wZSB0
aGUgZml4IHRvIGJlIGFwcGxpZWQgb24gY3VycmVudCBMVFMsIHNvIGEgcGFja2FnZSB1cGdyYWRl
CiAgdXBkYXRpbmcgdG8gYSBuZXcgbWFqb3IgdmVyc2lvbiBzZWVtcyBvdXQgb2Ygc2NvcGUKLSBP
biBtYXN0ZXIgYnJhbmNoLCB3aGlsZSBJIG1hbmFnZWQgdG8gYnVpbGQgaG9zdC1lcmxhbmcgMjkg
d2hlbgogIHVwZGF0aW5nIHRoZSAubWssIEkgcXVpY2tseSBlbmNvdW50ZXJlZCBzb21lIGZhaWx1
cmVzIG9uIHNvbWUgZXJsYW5nCiAgcGFja2FnZXMsIHNvIGl0IG5lZWRzIG1vcmUgd29yawotLS0K
IC4uLmJzLW9yZGVyLXRvLWF2b2lkLXBpY2tpbmctdXAtc3lzdGVtLWxpYmVpLnBhdGNoIHwgMzIg
KysrKysrKysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDMyIGluc2VydGlvbnMoKykK
CmRpZmYgLS1naXQgYS9wYWNrYWdlL2VybGFuZy8wMDAxLUNoYW5nZS1saWJzLW9yZGVyLXRvLWF2
b2lkLXBpY2tpbmctdXAtc3lzdGVtLWxpYmVpLnBhdGNoIGIvcGFja2FnZS9lcmxhbmcvMDAwMS1D
aGFuZ2UtbGlicy1vcmRlci10by1hdm9pZC1waWNraW5nLXVwLXN5c3RlbS1saWJlaS5wYXRjaApu
ZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwMDAuLmMyMTMxMWNiYjM5NQotLS0g
L2Rldi9udWxsCisrKyBiL3BhY2thZ2UvZXJsYW5nLzAwMDEtQ2hhbmdlLWxpYnMtb3JkZXItdG8t
YXZvaWQtcGlja2luZy11cC1zeXN0ZW0tbGliZWkucGF0Y2gKQEAgLTAsMCArMSwzMiBAQAorRnJv
bSBkZTU4Y2JlOTc5OTQyMzA4ZWI4ODIzYTUyNmNkNjhiMDZkNWRjNjYyIE1vbiBTZXAgMTcgMDA6
MDA6MDAgMjAwMQorRnJvbTogU2FjaGEgPHNhY2hhaG9ueUBnbWFpbC5jb20+CitEYXRlOiBXZWQs
IDEzIE1hciAyMDI0IDEzOjI4OjQxICswMTAwCitTdWJqZWN0OiBbUEFUQ0hdIENoYW5nZSBsaWJz
IG9yZGVyIHRvIGF2b2lkIHBpY2tpbmcgdXAgc3lzdGVtIGxpYmVpCisKK1Vwc3RyZWFtOiBodHRw
czovL2dpdGh1Yi5jb20vZXJsYW5nL290cC9jb21taXQvZGU1OGNiZQorU2lnbmVkLW9mZi1ieTog
QWxleGlzIExvdGhvcsOpIDxhbGV4aXMubG90aG9yZUBib290bGluLmNvbT4KKy0tLQorIGxpYi9v
ZGJjL2Nfc3JjL01ha2VmaWxlLmluIHwgNiArKystLS0KKyAxIGZpbGUgY2hhbmdlZCwgMyBpbnNl
cnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQorCitkaWZmIC0tZ2l0IGEvbGliL29kYmMvY19zcmMv
TWFrZWZpbGUuaW4gYi9saWIvb2RiYy9jX3NyYy9NYWtlZmlsZS5pbgoraW5kZXggZDFiMjY3NDNh
NmE0Li4wM2VkMzE0ZjZhMjYgMTAwNjQ0CistLS0gYS9saWIvb2RiYy9jX3NyYy9NYWtlZmlsZS5p
bgorKysrIGIvbGliL29kYmMvY19zcmMvTWFrZWZpbGUuaW4KK0BAIC04MCwxMCArODAsMTAgQEAg
T0RCQ19JTkNMVURFID0gQE9EQkNfSU5DTFVERUAKKyAjIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KKyBDQyA9ICBAQ0NACisgQ0ZMQUdTID0gJChU
WVBFRkxBR1MpIEBDRkxBR1NAIEBUSFJfREVGU0AgQERFRlNACistRUlfTERGTEFHUyA9IC1MJChF
SV9ST09UKS9vYmokKFRZUEVNQVJLRVIpLyQoVEFSR0VUKQorK0VJX0xERkxBR1MgPSAtTCQoRUlf
Uk9PVCkvb2JqJChUWVBFTUFSS0VSKS8kKFRBUkdFVCkgJChFSV9MSUIpCisgTEQgPSBATERACist
TERGTEFHUyA9ICAkKE9EQkNfTElCKSAkKEVJX0xERkxBR1MpCistTElCUyA9IEBMSUJTQCBAVEhS
X0xJQlNAICQoRUlfTElCKQorK0xERkxBR1MgPSAgJChFSV9MREZMQUdTKSAkKE9EQkNfTElCKQor
K0xJQlMgPSBATElCU0AgQFRIUl9MSUJTQAorIElOQ0xVREVTID0gLUkuICQoT0RCQ19JTkNMVURF
KSAkKEVJX0lOQ0xVREUpCisgVEFSR0VUX0ZMQUdTID0gIEBUQVJHRVRfRkxBR1NACisgCistLSAK
KzIuNTUuMAorCgotLS0KYmFzZS1jb21taXQ6IGMzZjM3MDVhMmZkMjcyMDZjZjJlNzlmZDgwMmI2
ODFlNzdiZTJjZmUKY2hhbmdlLWlkOiAyMDI2MDgyMy1maXgtaG9zdC1lcmxhbmctNWMwYjgyYmE3
YTJmCgpCZXN0IHJlZ2FyZHMsCi0tICAKQWxleGlzIExvdGhvcsOpIDxhbGV4aXMubG90aG9yZUBi
b290bGluLmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6
Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
