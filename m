Return-Path: <SRS0=a43l=QF=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D970C433EF
	for <buildroot@archiver.kernel.org>; Thu, 18 Nov 2021 17:46:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C0D5761A52
	for <buildroot@archiver.kernel.org>; Thu, 18 Nov 2021 17:46:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C0D5761A52
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 556AB8177C;
	Thu, 18 Nov 2021 17:46:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MjUpqAjbc-vU; Thu, 18 Nov 2021 17:46:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9083281776;
	Thu, 18 Nov 2021 17:46:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E874D1BF488
 for <buildroot@lists.busybox.net>; Thu, 18 Nov 2021 17:46:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D13B6404A1
 for <buildroot@lists.busybox.net>; Thu, 18 Nov 2021 17:46:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id v4MTs9UmBRU6 for <buildroot@lists.busybox.net>;
 Thu, 18 Nov 2021 17:46:38 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp4.osuosl.org (Postfix) with ESMTP id E0C6540345
 for <buildroot@buildroot.org>; Thu, 18 Nov 2021 17:46:37 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EBB9CED1;
 Thu, 18 Nov 2021 09:46:36 -0800 (PST)
Received: from localhost.localdomain (unknown [10.34.128.67])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 617173F5A1;
 Thu, 18 Nov 2021 09:46:36 -0800 (PST)
From: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@arm.com>
To: buildroot@buildroot.org
Date: Thu, 18 Nov 2021 18:45:47 +0100
Message-Id: <20211118174547.3939-1-vincent.stehle@arm.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/uboot-tools: add support for
 mkeficapsule
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
Cc: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@arm.com>,
 Matt Weber <matthew.weber@collins.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhlIG1rZWZpY2Fwc3VsZSBVLUJvb3QgdG9vbCBjYW4gYmUgdXNlZCB0byBnZW5lcmF0ZSBVRUZJ
IGNhcHN1bGUgYmluYXJpZXMuCkFkZCBhbiBvcHRpb24gdG8gY3Jvc3MtYnVpbGQgaXQgYW5kIGlu
c3RhbGwgaXQgdG8gdGhlIHRhcmdldCBmaWxlc3lzdGVtLgpBbHNvLCBidWlsZCBpdCBhbmQgaW5z
dGFsbCBpdCB1bmNvbmRpdGlvbmFsbHkgdG8gdGhlIGhvc3QgZGlyLgoKU2lnbmVkLW9mZi1ieTog
VmluY2VudCBTdGVobMOpIDx2aW5jZW50LnN0ZWhsZUBhcm0uY29tPgpDYzogTWF0dCBXZWJlciA8
bWF0dGhldy53ZWJlckBjb2xsaW5zLmNvbT4KLS0tCiBwYWNrYWdlL3Vib290LXRvb2xzL0NvbmZp
Zy5pbiAgICAgIHwgIDggKysrKysrKysKIHBhY2thZ2UvdWJvb3QtdG9vbHMvdWJvb3QtdG9vbHMu
bWsgfCAxOSArKysrKysrKysrKysrKysrKystCiAyIGZpbGVzIGNoYW5nZWQsIDI2IGluc2VydGlv
bnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9wYWNrYWdlL3Vib290LXRvb2xzL0Nv
bmZpZy5pbiBiL3BhY2thZ2UvdWJvb3QtdG9vbHMvQ29uZmlnLmluCmluZGV4IDY4MWY4N2I0NWY1
Li5lOGJiZjNhMTZlZiAxMDA2NDQKLS0tIGEvcGFja2FnZS91Ym9vdC10b29scy9Db25maWcuaW4K
KysrIGIvcGFja2FnZS91Ym9vdC10b29scy9Db25maWcuaW4KQEAgLTY2LDYgKzY2LDE0IEBAIGNv
bmZpZyBCUjJfUEFDS0FHRV9VQk9PVF9UT09MU19NS0lNQUdFCiAJICBUaGUgbWtpbWFnZSB0b29s
IGZyb20gRGFzIFUtQm9vdCBib290bG9hZGVyLCB3aGljaCBhbGxvd3MKIAkgIGdlbmVyYXRpb24g
b2YgVS1Cb290IGltYWdlcyBpbiB2YXJpb3VzIGZvcm1hdHMuCiAKK2NvbmZpZyBCUjJfUEFDS0FH
RV9VQk9PVF9UT09MU19NS0VGSUNBUFNVTEUKKwlib29sICJta2VmaWNhcHN1bGUiCisJaGVscAor
CSAgSW5zdGFsbCB0aGUgbWtlZmljYXBzdWxlIHRvb2wgb24gdGhlIHRhcmdldCBzeXN0ZW0KKwor
CSAgVGhlIG1rZWZpY2Fwc3VsZSB0b29sIGZyb20gRGFzIFUtQm9vdCBib290bG9hZGVyLCB3aGlj
aCBhbGxvd3MKKwkgIGdlbmVyYXRpb24gb2YgVUVGSSBjYXBzdWxlIGJpbmFyaWVzLgorCiBjb25m
aWcgQlIyX1BBQ0tBR0VfVUJPT1RfVE9PTFNfTUtFTlZJTUFHRQogCWJvb2wgIm1rZW52aW1hZ2Ui
CiAJaGVscApkaWZmIC0tZ2l0IGEvcGFja2FnZS91Ym9vdC10b29scy91Ym9vdC10b29scy5tayBi
L3BhY2thZ2UvdWJvb3QtdG9vbHMvdWJvb3QtdG9vbHMubWsKaW5kZXggODFmNjA5NjNlY2YuLjM3
ZTMyOWEyYWY2IDEwMDY0NAotLS0gYS9wYWNrYWdlL3Vib290LXRvb2xzL3Vib290LXRvb2xzLm1r
CisrKyBiL3BhY2thZ2UvdWJvb3QtdG9vbHMvdWJvb3QtdG9vbHMubWsKQEAgLTIyLDYgKzIyLDgg
QEAgZGVmaW5lIFVCT09UX1RPT0xTX0NPTkZJR1VSRV9DTURTCiAJdG91Y2ggJChARCkvaW5jbHVk
ZS9jb25maWcvYXV0by5jb25mCiAJbWtkaXIgLXAgJChARCkvaW5jbHVkZS9nZW5lcmF0ZWQKIAl0
b3VjaCAkKEBEKS9pbmNsdWRlL2dlbmVyYXRlZC9hdXRvY29uZi5oCisJbWtkaXIgLXAgJChARCkv
aW5jbHVkZS9hc20KKwl0b3VjaCAkKEBEKS9pbmNsdWRlL2FzbS9saW5rYWdlLmgKIGVuZGVmCiAK
IFVCT09UX1RPT0xTX01BS0VfT1BUUyA9IENST1NTX0NPTVBJTEU9IiQoVEFSR0VUX0NST1NTKSIg
XApAQCAtNDAsNiArNDIsMTAgQEAgVUJPT1RfVE9PTFNfTUFLRV9PUFRTICs9IENPTkZJR19GSVRf
U0lHTkFUVVJFPXkgQ09ORklHX0ZJVF9TSUdOQVRVUkVfTUFYX1NJWkU9MHgKIFVCT09UX1RPT0xT
X0RFUEVOREVOQ0lFUyArPSBvcGVuc3NsIGhvc3QtcGtnY29uZgogZW5kaWYKIAoraWZlcSAoJChC
UjJfUEFDS0FHRV9VQk9PVF9UT09MU19NS0VGSUNBUFNVTEUpLHkpCitVQk9PVF9UT09MU19NQUtF
X09QVFMgKz0gQ09ORklHX0VGSV9IQVZFX0NBUFNVTEVfU1VQUE9SVD15CitlbmRpZgorCiBpZmVx
ICgkKEJSMl9QQUNLQUdFX1VCT09UX1RPT0xTX0ZJVF9DSEVDS19TSUdOKSx5KQogZGVmaW5lIFVC
T09UX1RPT0xTX0lOU1RBTExfRklUX0NIRUNLX1NJR04KIAkkKElOU1RBTEwpIC1tIDA3NTUgLUQg
JChARCkvdG9vbHMvZml0X2NoZWNrX3NpZ24gJChUQVJHRVRfRElSKS91c3IvYmluL2ZpdF9jaGVj
a19zaWduCkBAIC01OSw2ICs2NSwxMiBAQCBkZWZpbmUgVUJPT1RfVE9PTFNfSU5TVEFMTF9NS0lN
QUdFCiBlbmRlZgogZW5kaWYKIAoraWZlcSAoJChCUjJfUEFDS0FHRV9VQk9PVF9UT09MU19NS0VG
SUNBUFNVTEUpLHkpCitkZWZpbmUgVUJPT1RfVE9PTFNfSU5TVEFMTF9NS0VGSUNBUFNVTEUKKwkk
KElOU1RBTEwpIC1tIDA3NTUgLUQgJChARCkvdG9vbHMvbWtlZmljYXBzdWxlICQoVEFSR0VUX0RJ
UikvdXNyL2Jpbi9ta2VmaWNhcHN1bGUKK2VuZGVmCitlbmRpZgorCiBpZmVxICgkKEJSMl9QQUNL
QUdFX1VCT09UX1RPT0xTX01LRU5WSU1BR0UpLHkpCiBkZWZpbmUgVUJPT1RfVE9PTFNfSU5TVEFM
TF9NS0VOVklNQUdFCiAJJChJTlNUQUxMKSAtbSAwNzU1IC1EICQoQEQpL3Rvb2xzL21rZW52aW1h
Z2UgJChUQVJHRVRfRElSKS91c3IvYmluL21rZW52aW1hZ2UKQEAgLTg1LDYgKzk3LDcgQEAgZW5k
ZWYKIAogZGVmaW5lIFVCT09UX1RPT0xTX0lOU1RBTExfVEFSR0VUX0NNRFMKIAkkKFVCT09UX1RP
T0xTX0lOU1RBTExfTUtJTUFHRSkKKwkkKFVCT09UX1RPT0xTX0lOU1RBTExfTUtFRklDQVBTVUxF
KQogCSQoVUJPT1RfVE9PTFNfSU5TVEFMTF9NS0VOVklNQUdFKQogCSQoVUJPT1RfVE9PTFNfSU5T
VEFMTF9GV1BSSU5URU5WKQogCSQoVUJPT1RfVE9PTFNfSU5TVEFMTF9EVU1QSU1BR0UpCkBAIC05
OCwxMSArMTExLDE0IEBAIGRlZmluZSBIT1NUX1VCT09UX1RPT0xTX0NPTkZJR1VSRV9DTURTCiAJ
dG91Y2ggJChARCkvaW5jbHVkZS9jb25maWcvYXV0by5jb25mCiAJbWtkaXIgLXAgJChARCkvaW5j
bHVkZS9nZW5lcmF0ZWQKIAl0b3VjaCAkKEBEKS9pbmNsdWRlL2dlbmVyYXRlZC9hdXRvY29uZi5o
CisJbWtkaXIgLXAgJChARCkvaW5jbHVkZS9hc20KKwl0b3VjaCAkKEBEKS9pbmNsdWRlL2FzbS9s
aW5rYWdlLmgKIGVuZGVmCiAKIEhPU1RfVUJPT1RfVE9PTFNfTUFLRV9PUFRTID0gSE9TVENDPSIk
KEhPU1RDQykiIFwKIAlIT1NUQ0ZMQUdTPSIkKEhPU1RfQ0ZMQUdTKSIgXAotCUhPU1RMREZMQUdT
PSIkKEhPU1RfTERGTEFHUykiCisJSE9TVExERkxBR1M9IiQoSE9TVF9MREZMQUdTKSIgXAorCUNP
TkZJR19FRklfSEFWRV9DQVBTVUxFX1NVUFBPUlQ9eQogCiBpZmVxICgkKEJSMl9QQUNLQUdFX0hP
U1RfVUJPT1RfVE9PTFNfRklUX1NVUFBPUlQpLHkpCiBIT1NUX1VCT09UX1RPT0xTX01BS0VfT1BU
UyArPSBDT05GSUdfRklUPXkgQ09ORklHX01LSU1BR0VfRFRDX1BBVEg9ZHRjCkBAIC0xOTMsNiAr
MjA5LDcgQEAgZW5kZWYKIAogZGVmaW5lIEhPU1RfVUJPT1RfVE9PTFNfSU5TVEFMTF9DTURTCiAJ
JChJTlNUQUxMKSAtbSAwNzU1IC1EICQoQEQpL3Rvb2xzL21raW1hZ2UgJChIT1NUX0RJUikvYmlu
L21raW1hZ2UKKwkkKElOU1RBTEwpIC1tIDA3NTUgLUQgJChARCkvdG9vbHMvbWtlZmljYXBzdWxl
ICQoSE9TVF9ESVIpL2Jpbi9ta2VmaWNhcHN1bGUKIAkkKElOU1RBTEwpIC1tIDA3NTUgLUQgJChA
RCkvdG9vbHMvbWtlbnZpbWFnZSAkKEhPU1RfRElSKS9iaW4vbWtlbnZpbWFnZQogCSQoSU5TVEFM
TCkgLW0gMDc1NSAtRCAkKEBEKS90b29scy9kdW1waW1hZ2UgJChIT1NUX0RJUikvYmluL2R1bXBp
bWFnZQogCSQoSE9TVF9VQk9PVF9UT09MU19JTlNUQUxMX0VOVklNQUdFKQotLSAKMi4zMy4wCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3Qg
bWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRy
b290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
