Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AF58C25B74
	for <buildroot@archiver.kernel.org>; Tue, 21 May 2024 06:41:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2DA2940492;
	Tue, 21 May 2024 06:40:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3YC5SbTb46Uf; Tue, 21 May 2024 06:40:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 002BD414CC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 002BD414CC;
	Tue, 21 May 2024 06:40:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 87C181C4FE2
 for <buildroot@lists.busybox.net>; Tue, 21 May 2024 06:40:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6B63A4062D
 for <buildroot@lists.busybox.net>; Tue, 21 May 2024 06:40:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1IGtT5PVp9eE for <buildroot@lists.busybox.net>;
 Tue, 21 May 2024 06:40:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.194;
 helo=relay2-d.mail.gandi.net; envelope-from=peko@48ers.dk; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8E4874060A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8E4874060A
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8E4874060A
 for <buildroot@buildroot.org>; Tue, 21 May 2024 06:40:50 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6610740007;
 Tue, 21 May 2024 06:40:47 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peko@dell.be.48ers.dk>) id 1s9JB0-008vBc-2W;
 Tue, 21 May 2024 08:40:46 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 21 May 2024 08:40:44 +0200
Message-Id: <20240521064045.2126436-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: [Buildroot] [PATCH 1/2] configs/beagleboneai_defconfig: bump Linux
 to 5.10.217 to fix gcc 13.x build
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

VGhlIDUuMTAuNzkga2VybmVsIGZhaWxzIHRvIGJ1aWxkIHdpdGggR0NDIDEzLng6CgpJbiBmaWxl
IGluY2x1ZGVkIGZyb20gPGNvbW1hbmQtbGluZT46CmRyaXZlcnMvYXRhL2xpYmFoY2kuYzogSW4g
ZnVuY3Rpb24g4oCYYWhjaV9sZWRfc3RvcmXigJk6Ci4vLi9pbmNsdWRlL2xpbnV4L2NvbXBpbGVy
X3R5cGVzLmg6MzE1OjQ1OiBlcnJvcjogY2FsbCB0byDigJhfX2NvbXBpbGV0aW1lX2Fzc2VydF8z
MjHigJkgZGVjbGFyZWQgd2l0aCBhdHRyaWJ1dGUgZXJyb3I6IEJVSUxEX0JVR19PTiBmYWlsZWQ6
IHNpemVvZihfcykgPiBzaXplb2YobG9uZykKICAzMTUgfCAgICAgICAgIF9jb21waWxldGltZV9h
c3NlcnQoY29uZGl0aW9uLCBtc2csIF9fY29tcGlsZXRpbWVfYXNzZXJ0XywgX19DT1VOVEVSX18p
CiAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBeCi4v
Li9pbmNsdWRlL2xpbnV4L2NvbXBpbGVyX3R5cGVzLmg6Mjk2OjI1OiBub3RlOiBpbiBkZWZpbml0
aW9uIG9mIG1hY3JvIOKAmF9fY29tcGlsZXRpbWVfYXNzZXJ04oCZCiAgMjk2IHwgICAgICAgICAg
ICAgICAgICAgICAgICAgcHJlZml4ICMjIHN1ZmZpeCgpOyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgXAogICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAgIF5+fn5+fgouLy4vaW5jbHVk
ZS9saW51eC9jb21waWxlcl90eXBlcy5oOjMxNTo5OiBub3RlOiBpbiBleHBhbnNpb24gb2YgbWFj
cm8g4oCYX2NvbXBpbGV0aW1lX2Fzc2VydOKAmQogIDMxNSB8ICAgICAgICAgX2NvbXBpbGV0aW1l
X2Fzc2VydChjb25kaXRpb24sIG1zZywgX19jb21waWxldGltZV9hc3NlcnRfLCBfX0NPVU5URVJf
XykKICAgICAgfCAgICAgICAgIF5+fn5+fn5+fn5+fn5+fn5+fn4KLi9pbmNsdWRlL2xpbnV4L2J1
aWxkX2J1Zy5oOjM5OjM3OiBub3RlOiBpbiBleHBhbnNpb24gb2YgbWFjcm8g4oCYY29tcGlsZXRp
bWVfYXNzZXJ04oCZCiAgIDM5IHwgI2RlZmluZSBCVUlMRF9CVUdfT05fTVNHKGNvbmQsIG1zZykg
Y29tcGlsZXRpbWVfYXNzZXJ0KCEoY29uZCksIG1zZykKICAgICAgfCAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBefn5+fn5+fn5+fn5+fn5+fn4KLi9pbmNsdWRlL2xpbnV4L2J1
aWxkX2J1Zy5oOjUwOjk6IG5vdGU6IGluIGV4cGFuc2lvbiBvZiBtYWNybyDigJhCVUlMRF9CVUdf
T05fTVNH4oCZCiAgIDUwIHwgICAgICAgICBCVUlMRF9CVUdfT05fTVNHKGNvbmRpdGlvbiwgIkJV
SUxEX0JVR19PTiBmYWlsZWQ6ICIgI2NvbmRpdGlvbikKICAgICAgfCAgICAgICAgIF5+fn5+fn5+
fn5+fn5+fn4KLi9pbmNsdWRlL2xpbnV4L25vc3BlYy5oOjU4Ojk6IG5vdGU6IGluIGV4cGFuc2lv
biBvZiBtYWNybyDigJhCVUlMRF9CVUdfT07igJkKICAgNTggfCAgICAgICAgIEJVSUxEX0JVR19P
TihzaXplb2YoX3MpID4gc2l6ZW9mKGxvbmcpKTsgICAgICAgICAgICAgICAgICAgICAgICBcCiAg
ICAgIHwgICAgICAgICBefn5+fn5+fn5+fn4KZHJpdmVycy9hdGEvbGliYWhjaS5jOjExMzc6MjM6
IG5vdGU6IGluIGV4cGFuc2lvbiBvZiBtYWNybyDigJhhcnJheV9pbmRleF9ub3NwZWPigJkKIDEx
MzcgfCAgICAgICAgICAgICAgICAgcG1wID0gYXJyYXlfaW5kZXhfbm9zcGVjKHBtcCwgRU1fTUFY
X1NMT1RTKTsKICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgXn5+fn5+fn5+fn5+fn5+fn5+
CgpUaGlzIGlzIGZpeGVkIHVwc3RyZWFtIGJ5IGNvbW1pdCBmMDc3ODgwNzlmNTE1Y2EgKGF0YTog
YWhjaTogZml4IGVudW0KY29uc3RhbnRzIGZvciBnY2MtMTMpLCB3aGljaCBoYXMgYmVlbiBiYWNr
cG9ydGVkIHRvIDUuMTAueCBhcyBvZiA1LjEwLjE4NCwKc28gYnVtcCB0byB2NS4xMC4yMTcgdG8g
Zml4IHRoZSBidWlsZC4KClNpZ25lZC1vZmYtYnk6IFBldGVyIEtvcnNnYWFyZCA8cGV0ZXJAa29y
c2dhYXJkLmNvbT4KLS0tCiBjb25maWdzL2JlYWdsZWJvbmVhaV9kZWZjb25maWcgfCAyICstCiAx
IGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQg
YS9jb25maWdzL2JlYWdsZWJvbmVhaV9kZWZjb25maWcgYi9jb25maWdzL2JlYWdsZWJvbmVhaV9k
ZWZjb25maWcKaW5kZXggNTg2YTc1MzE3ZS4uMTM3M2JhNjYyZSAxMDA2NDQKLS0tIGEvY29uZmln
cy9iZWFnbGVib25lYWlfZGVmY29uZmlnCisrKyBiL2NvbmZpZ3MvYmVhZ2xlYm9uZWFpX2RlZmNv
bmZpZwpAQCAtOCw3ICs4LDcgQEAgQlIyX1JPT1RGU19QT1NUX0lNQUdFX1NDUklQVD0ic3VwcG9y
dC9zY3JpcHRzL2dlbmltYWdlLnNoIgogQlIyX1JPT1RGU19QT1NUX1NDUklQVF9BUkdTPSItYyBi
b2FyZC9iZWFnbGVib25lYWkvZ2VuaW1hZ2UuY2ZnIgogQlIyX0xJTlVYX0tFUk5FTD15CiBCUjJf
TElOVVhfS0VSTkVMX0NVU1RPTV9WRVJTSU9OPXkKLUJSMl9MSU5VWF9LRVJORUxfQ1VTVE9NX1ZF
UlNJT05fVkFMVUU9IjUuMTAuNzkiCitCUjJfTElOVVhfS0VSTkVMX0NVU1RPTV9WRVJTSU9OX1ZB
TFVFPSI1LjEwLjIxNyIKIEJSMl9MSU5VWF9LRVJORUxfREVGQ09ORklHPSJvbWFwMnBsdXMiCiBC
UjJfTElOVVhfS0VSTkVMX0RUU19TVVBQT1JUPXkKIEJSMl9MSU5VWF9LRVJORUxfSU5UUkVFX0RU
U19OQU1FPSJhbTU3MjktYmVhZ2xlYm9uZWFpIgotLSAKMi4zOS4yCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1
aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2J1aWxkcm9vdAo=
