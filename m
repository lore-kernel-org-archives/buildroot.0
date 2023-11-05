Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CA9AC4167B
	for <buildroot@archiver.kernel.org>; Sun,  5 Nov 2023 18:37:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4D5E6820D8;
	Sun,  5 Nov 2023 18:37:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4D5E6820D8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oPtjcBQeohMg; Sun,  5 Nov 2023 18:37:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 94E3C81F69;
	Sun,  5 Nov 2023 18:37:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 94E3C81F69
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0B4F41BF870
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 18:37:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E45B3401E1
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 18:37:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E45B3401E1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id k8wJ9FZqCEk3 for <buildroot@lists.busybox.net>;
 Sun,  5 Nov 2023 18:37:25 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8B42D400D6
 for <buildroot@buildroot.org>; Sun,  5 Nov 2023 18:37:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8B42D400D6
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3A6E61C0004;
 Sun,  5 Nov 2023 18:37:21 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peko@48ers.dk>) id 1qzhzt-00FzQR-1Q;
 Sun, 05 Nov 2023 19:37:21 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun,  5 Nov 2023 19:37:17 +0100
Message-Id: <20231105183719.3811015-2-peter@korsgaard.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231105183719.3811015-1-peter@korsgaard.com>
References: <20231105183719.3811015-1-peter@korsgaard.com>
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: [Buildroot] [PATCH 2/4] configs/stm32mp157c_dk2_defconfig: unbreak
 TF-A build with GCC >= 12
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

V2l0aCB0aGUgbW92ZSB0byBkZWZhdWx0IHRvIEdDQyAxMiBpbiBjb21taXQgZTAwOTFlNDJlZWY5
IChwYWNrYWdlL2djYzoKc3dpdGNoIHRvIGdjYyAxMi54IGFzIHRoZSBkZWZhdWx0KSwgVEYtQSBu
b3cgZmFpbHMgdG8gYnVpbGQgYXMgYSB3YXJuaW5nIGlzCmdlbmVyYXRlZCBhbmQgaXQgYnVpbGRz
IHdpdGggLVdlcnJvcjoKCiAgQ0MgICAgICBwbGF0L3N0L3N0bTMybXAxL2JsMl9wbGF0X3NldHVw
LmMKZHJpdmVycy9zdC9pby9pb19zdG0zMmltYWdlLmM6IEluIGZ1bmN0aW9uIOKAmHN0bTMyaW1h
Z2VfcGFydGl0aW9uX3JlYWTigJk6CmRyaXZlcnMvc3QvaW8vaW9fc3RtMzJpbWFnZS5jOjI0OTox
MzogZXJyb3I6IOKAmHJlc3VsdOKAmSBtYXkgYmUgdXNlZCB1bmluaXRpYWxpemVkIFstV2Vycm9y
PW1heWJlLXVuaW5pdGlhbGl6ZWRdCiAgMjQ5IHwgICAgICAgICBpbnQgcmVzdWx0OwogICAgICB8
ICAgICAgICAgICAgIF5+fn5+fgpjYzE6IGFsbCB3YXJuaW5ncyBiZWluZyB0cmVhdGVkIGFzIGVy
cm9ycwoKVGhpcyBpcyBmaXhlZCBpbiBURi1BIHYyLjYgd2l0aCBjb21taXQgYzFkNzMyZDBkYjI0
IChmaXgoaW9fc3RtMzJpbWFnZSk6CnVuaW5pdGlhbGl6ZWQgdmFyaWFibGUgd2FybmluZyksIGJ1
dCBJIGRvIG5vdCBoYXZlIHRoZSBib2FyZCB0byB2ZXJpZnkgaWYKdjIuNiB3b3Jrcywgc28gaW5z
dGVhZCBkaXNhYmxlIC1XZXJyb3IgYnkgbWFzc3NpbmcgRT0wLgoKU2lnbmVkLW9mZi1ieTogUGV0
ZXIgS29yc2dhYXJkIDxwZXRlckBrb3JzZ2FhcmQuY29tPgotLS0KIGNvbmZpZ3Mvc3RtMzJtcDE1
N2NfZGsyX2RlZmNvbmZpZyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwg
MSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2NvbmZpZ3Mvc3RtMzJtcDE1N2NfZGsyX2RlZmNv
bmZpZyBiL2NvbmZpZ3Mvc3RtMzJtcDE1N2NfZGsyX2RlZmNvbmZpZwppbmRleCBjZjI0MzNkNjdl
Li5hYTBmY2ZhODQzIDEwMDY0NAotLS0gYS9jb25maWdzL3N0bTMybXAxNTdjX2RrMl9kZWZjb25m
aWcKKysrIGIvY29uZmlncy9zdG0zMm1wMTU3Y19kazJfZGVmY29uZmlnCkBAIC0zMCw3ICszMCw3
IEBAIEJSMl9UQVJHRVRfQVJNX1RSVVNURURfRklSTVdBUkU9eQogQlIyX1RBUkdFVF9BUk1fVFJV
U1RFRF9GSVJNV0FSRV9DVVNUT01fVkVSU0lPTj15CiBCUjJfVEFSR0VUX0FSTV9UUlVTVEVEX0ZJ
Uk1XQVJFX0NVU1RPTV9WRVJTSU9OX1ZBTFVFPSJ2Mi41IgogQlIyX1RBUkdFVF9BUk1fVFJVU1RF
RF9GSVJNV0FSRV9QTEFURk9STT0ic3RtMzJtcDEiCi1CUjJfVEFSR0VUX0FSTV9UUlVTVEVEX0ZJ
Uk1XQVJFX0FERElUSU9OQUxfVkFSSUFCTEVTPSJTVE0zMk1QX1NETU1DPTEgQUFSQ0gzMl9TUD1z
cF9taW4gRFRCX0ZJTEVfTkFNRT1zdG0zMm1wMTU3Yy1kazIuZHRiIgorQlIyX1RBUkdFVF9BUk1f
VFJVU1RFRF9GSVJNV0FSRV9BRERJVElPTkFMX1ZBUklBQkxFUz0iU1RNMzJNUF9TRE1NQz0xIEFB
UkNIMzJfU1A9c3BfbWluIERUQl9GSUxFX05BTUU9c3RtMzJtcDE1N2MtZGsyLmR0YiBFPTAiCiBC
UjJfVEFSR0VUX0FSTV9UUlVTVEVEX0ZJUk1XQVJFX0lNQUdFUz0iKi5zdG0zMiIKIEJSMl9UQVJH
RVRfQVJNX1RSVVNURURfRklSTVdBUkVfTkVFRFNfRFRDPXkKIEJSMl9UQVJHRVRfVUJPT1Q9eQot
LSAKMi4zOS4yCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8v
bGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
