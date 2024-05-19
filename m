Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46DA2C25B75
	for <buildroot@archiver.kernel.org>; Sun, 19 May 2024 10:14:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C0A7E405AD;
	Sun, 19 May 2024 10:14:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UnqwINrt4b_2; Sun, 19 May 2024 10:14:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 50C7440605
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 50C7440605;
	Sun, 19 May 2024 10:14:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 607331C3CAE
 for <buildroot@lists.busybox.net>; Sun, 19 May 2024 10:14:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3CFD9605F1
 for <buildroot@lists.busybox.net>; Sun, 19 May 2024 10:14:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nGRsPn5fFMJZ for <buildroot@lists.busybox.net>;
 Sun, 19 May 2024 10:14:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::222;
 helo=relay2-d.mail.gandi.net; envelope-from=peko@48ers.dk; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B8B39605EE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B8B39605EE
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B8B39605EE
 for <buildroot@buildroot.org>; Sun, 19 May 2024 10:14:11 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 390AA40002;
 Sun, 19 May 2024 10:14:08 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peko@dell.be.48ers.dk>) id 1s8dYO-00024q-1T;
 Sun, 19 May 2024 12:14:08 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 19 May 2024 12:13:53 +0200
Message-Id: <20240519101355.7792-3-peter@korsgaard.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240519101355.7792-1-peter@korsgaard.com>
References: <20240519101355.7792-1-peter@korsgaard.com>
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: [Buildroot] [PATCH 3/5] configs/orangepi_r1_defconfig: bump Linux
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

VGhlIDUuMTAuMTAga2VybmVsIGZhaWxzIHRvIGJ1aWxkIHdpdGggR0NDIDEzLng6CgpJbiBmaWxl
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
c2dhYXJkLmNvbT4KLS0tCiBjb25maWdzL29yYW5nZXBpX3IxX2RlZmNvbmZpZyB8IDIgKy0KIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBh
L2NvbmZpZ3Mvb3JhbmdlcGlfcjFfZGVmY29uZmlnIGIvY29uZmlncy9vcmFuZ2VwaV9yMV9kZWZj
b25maWcKaW5kZXggZDdhMjE4OTRiZC4uMzE4ZmExMjZhNyAxMDA2NDQKLS0tIGEvY29uZmlncy9v
cmFuZ2VwaV9yMV9kZWZjb25maWcKKysrIGIvY29uZmlncy9vcmFuZ2VwaV9yMV9kZWZjb25maWcK
QEAgLTcsNyArNyw3IEBAIEJSMl9UQVJHRVRfR0VORVJJQ19JU1NVRT0iV2VsY29tZSB0byBCdWls
ZHJvb3QgZm9yIHRoZSBPcmFuZ2UgUGkgUjEiCiBCUjJfU1lTVEVNX0RIQ1A9ImV0aDAiCiBCUjJf
TElOVVhfS0VSTkVMPXkKIEJSMl9MSU5VWF9LRVJORUxfQ1VTVE9NX1ZFUlNJT049eQotQlIyX0xJ
TlVYX0tFUk5FTF9DVVNUT01fVkVSU0lPTl9WQUxVRT0iNS4xMC4xMCIKK0JSMl9MSU5VWF9LRVJO
RUxfQ1VTVE9NX1ZFUlNJT05fVkFMVUU9IjUuMTAuMjE3IgogQlIyX0xJTlVYX0tFUk5FTF9ERUZD
T05GSUc9InN1bnhpIgogQlIyX0xJTlVYX0tFUk5FTF9EVFNfU1VQUE9SVD15CiBCUjJfTElOVVhf
S0VSTkVMX0lOVFJFRV9EVFNfTkFNRT0ic3VuOGktaDItcGx1cy1vcmFuZ2VwaS1yMSIKLS0gCjIu
MzkuMgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVp
bGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3Rz
LmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
