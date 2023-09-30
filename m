Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E89B8E7735F
	for <buildroot@archiver.kernel.org>; Sat, 30 Sep 2023 09:22:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8107683D95;
	Sat, 30 Sep 2023 09:22:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8107683D95
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SlioKK-uFF5a; Sat, 30 Sep 2023 09:21:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9EF9A83DA4;
	Sat, 30 Sep 2023 09:21:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9EF9A83DA4
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A35EF1BF2F9
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 09:21:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8C40483DA4
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 09:21:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8C40483DA4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JOCMlXDTT5VS for <buildroot@lists.busybox.net>;
 Sat, 30 Sep 2023 09:21:53 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DD0EA83D95
 for <buildroot@buildroot.org>; Sat, 30 Sep 2023 09:21:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DD0EA83D95
Received: by mail.gandi.net (Postfix) with ESMTPA id 24F6340006;
 Sat, 30 Sep 2023 09:21:51 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 30 Sep 2023 11:21:47 +0200
Message-ID: <20230930092150.526483-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1696065711;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=SQZbH1eYH8fyq16kw7dfQyC/ycVbIRuiVfv4EXKAQUM=;
 b=AiIaV7b8hTmT4O885LX6vkeos4FCLTQ1CuVv41T40q9/MZ6suMr4SGm1puy1X8SOA1q2dq
 AIfrup6TmRxIiciI51L8F+jJrddXdpFdYenPDSdvwIrYSBjCFIGC6O+oT94npXeI9zgKB/
 wJ/DIhQsnRE6SMC9+R4HhqR+qGaMiAamCsKuZ/+lub2Kow8i/r25fWrRL8elPTe9PvQ2UM
 pYy8alLjiquVMpWMJXiEBZq6RiYSZP1iiAxgL6W1aM/l3r64iFbSTOuVIBx1VQFD+Lw2Tq
 VN4l/NVcXFAZv8qi//+EuRodygEtEJff5haas4g6d+zk9T+kF2U47F5TRGA6Dw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=AiIaV7b8
Subject: [Buildroot] [PATCH] docs/website/association.html: move
 buildroot-association to Gitlab
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhlIGJ1aWxkcm9vdC1hc3NvY2lhdGlvbiByZXBvc2l0b3J5IHVzZWQgdG8gYmUgaG9zdGVkIG9u
IEdpdGh1YiwgdGhlbgp3YXMgY2xvc2VkIGZvciBzb21lIGJhbmtpbmcgaXNzdWVzLiBXZSdyZSBu
b3cgbWFraW5nIGl0IHB1YmxpYyBhZ2FpbiwKYnV0IG9uIEdpdGxhYiBsaWtlIHRoZSByZXN0IG9m
IEJ1aWxkcm9vdC4KClNpZ25lZC1vZmYtYnk6IFRob21hcyBQZXRhenpvbmkgPHRob21hcy5wZXRh
enpvbmlAYm9vdGxpbi5jb20+Ci0tLQogZG9jcy93ZWJzaXRlL2Fzc29jaWF0aW9uLmh0bWwgfCAx
MiArKysrKystLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDYgZGVsZXRp
b25zKC0pCgpkaWZmIC0tZ2l0IGEvZG9jcy93ZWJzaXRlL2Fzc29jaWF0aW9uLmh0bWwgYi9kb2Nz
L3dlYnNpdGUvYXNzb2NpYXRpb24uaHRtbAppbmRleCAwMjE1Zjg1ODc0Li5kYTczM2M1MDEzIDEw
MDY0NAotLS0gYS9kb2NzL3dlYnNpdGUvYXNzb2NpYXRpb24uaHRtbAorKysgYi9kb2NzL3dlYnNp
dGUvYXNzb2NpYXRpb24uaHRtbApAQCAtMzIsMjEgKzMyLDIxIEBACiAJICA8L3VsPgogCiAJICA8
cD5UaGUgYnlsYXdzIG9mIHRoZSBhc3NvY2lhdGlvbiBhcmUgYXZhaWxhYmxlCi0JICBpbiA8YSBo
cmVmPSJodHRwczovL3Jhdy5naXRodWJ1c2VyY29udGVudC5jb20vYnVpbGRyb290L2J1aWxkcm9v
dC1hc3NvY2lhdGlvbi9tYXN0ZXIvc3RhdHV0c19mci50eHQiPkZyZW5jaDwvYT4KKwkgIGluIDxh
IGhyZWY9Imh0dHBzOi8vZ2l0bGFiLmNvbS9idWlsZHJvb3Qub3JnL2J1aWxkcm9vdC1hc3NvY2lh
dGlvbi8tL3Jhdy9tYXN0ZXIvc3RhdHV0c19mci50eHQiPkZyZW5jaDwvYT4KIAkgIChvZmZpY2lh
bCkgYW5kCi0JICBpbiA8YSBocmVmPSJodHRwczovL2dpdGh1Yi5jb20vYnVpbGRyb290L2J1aWxk
cm9vdC1hc3NvY2lhdGlvbi9ibG9iL21hc3Rlci9zdGF0dXRlc19lbi50eHQiPkVuZ2xpc2g8L2E+
CisJICBpbiA8YSBocmVmPSJodHRwczovL2dpdGxhYi5jb20vYnVpbGRyb290Lm9yZy9idWlsZHJv
b3QtYXNzb2NpYXRpb24vLS9yYXcvbWFzdGVyL3N0YXR1dGVzX2VuLnR4dCI+RW5nbGlzaDwvYT4K
IAkgICh1bm9mZmljaWFsIHRyYW5zbGF0aW9uKS4gVGhlIGFzc29jaWF0aW9uIHdhcyBkZWNsYXJl
ZCBvbgogCSAgTWFyY2ggMTQsIDIwMTYgdG8gdGhlIDxlbT5QcsOpZmVjdHVyZSBkZSBIYXV0ZS1H
YXJvbm5lPC9lbT4KIAkgIChGcmFuY2UpIGFuZCBpcyByZWdpc3RlcmVkIHVuZGVyIHRoZSBuwrBX
MzEzMDI0Mjc4LiBTZWUgdGhpcwotCSAgb2ZmaWNpYWwgPGEgaHJlZj0iaHR0cHM6Ly9naXRodWIu
Y29tL2J1aWxkcm9vdC9idWlsZHJvb3QtYXNzb2NpYXRpb24vYmxvYi9tYXN0ZXIvcGRmL1JlY2Vw
aXNzZV9DUi5wZGYiPnJlY2VpcHQ8L2E+CisJICBvZmZpY2lhbCA8YSBocmVmPSJodHRwczovL2dp
dGxhYi5jb20vYnVpbGRyb290Lm9yZy9idWlsZHJvb3QtYXNzb2NpYXRpb24vLS9yYXcvbWFzdGVy
L3BkZi9SZWNlcGlzc2VfQ1IucGRmIj5yZWNlaXB0PC9hPgogCSAgZnJvbSB0aGUgRnJlbmNoIGF1
dGhvcml0aWVzLjwvcD4KIAogCSAgPHA+T3VyIGFjY291bnRpbmcgaXMgZnVsbHkgcHVibGljLCBp
bmNsdWRpbmcgdGhlIGJhbmsKIAkgIGFjY291bnQgc3VtbWFyaWVzLAotCSAgc2VlIDxhIGhyZWY9
Imh0dHBzOi8vZ2l0aHViLmNvbS9idWlsZHJvb3QvYnVpbGRyb290LWFzc29jaWF0aW9uL3RyZWUv
bWFzdGVyL2FjY291bnRpbmciPmFjY291bnRpbmc8L2E+LiBOdW1lcm91cworCSAgc2VlIDxhIGhy
ZWY9Imh0dHBzOi8vZ2l0bGFiLmNvbS9idWlsZHJvb3Qub3JnL2J1aWxkcm9vdC1hc3NvY2lhdGlv
bi8tL3RyZWUvbWFzdGVyL2FjY291bnRpbmciPmFjY291bnRpbmc8L2E+LiBOdW1lcm91cwogCSAg
b3RoZXIgYWRtaW5pc3RyYXRpdmUgZG9jdW1lbnRzIHJlbGF0ZWQgdG8gdGhlIGFzc29jaWF0aW9u
CiAJICBhcmUgYXZhaWxhYmxlIG9uCi0JICBpdHMgPGEgaHJlZj0iaHR0cHM6Ly9naXRodWIuY29t
L2J1aWxkcm9vdC9idWlsZHJvb3QtYXNzb2NpYXRpb24vIj5HaXRodWIKKwkgIGl0cyA8YSBocmVm
PSJodHRwczovL2dpdGxhYi5jb20vYnVpbGRyb290Lm9yZy9idWlsZHJvb3QtYXNzb2NpYXRpb24v
Ij5HaXRodWIKIAkgIHJlcG9zaXRvcnk8L2E+PC9wPgogCTwvZGl2PgogICAgICAgPC9kaXY+CkBA
IC02OCw3ICs2OCw3IEBACiAKIAkgIDxwPk9uY2UgdGhlIG1lbWJlcnNoaXAgZmVlIGlzIHJlY2Vp
dmVkLCBpdCB3aWxsIGJlIGxpc3RlZCBpbgogCSAgdGhlCi0JICBhc3NvY2lhdGlvbiA8YSBocmVm
PSJodHRwczovL2dpdGh1Yi5jb20vYnVpbGRyb290L2J1aWxkcm9vdC1hc3NvY2lhdGlvbi90cmVl
L21hc3Rlci9hY2NvdW50aW5nIj5hY2NvdW50aW5nPC9hPgorCSAgYXNzb2NpYXRpb24gPGEgaHJl
Zj0iaHR0cHM6Ly9naXRsYWIuY29tL2J1aWxkcm9vdC5vcmcvYnVpbGRyb290LWFzc29jaWF0aW9u
Ly0vdHJlZS9tYXN0ZXIvYWNjb3VudGluZyI+YWNjb3VudGluZzwvYT4KIAkgIGZpbGVzLCB3aGlj
aCBzZXJ2ZSBhcyB0aGUgb2ZmaWNpYWwgbGlzdCBvZgogCSAgbWVtYmVycy4gVGhlcmVmb3JlLCBt
ZW1iZXJzIGFjY2VwdCB0aGF0IHRoZWlyIG5hbWUgYW5kIHRoZQogCSAgYW1vdW50IG9mIHRoZWly
IG1lbWJlcnNoaXAgZmVlIGlzIG1hZGUgcHVibGljLjwvcD4KLS0gCjIuNDEuMAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcg
bGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcv
bWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
