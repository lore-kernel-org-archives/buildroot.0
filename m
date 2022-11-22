Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93F88C4332F
	for <buildroot@archiver.kernel.org>; Tue, 22 Nov 2022 17:15:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1082F81E80;
	Tue, 22 Nov 2022 17:15:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1082F81E80
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id l7enCEUI4CkJ; Tue, 22 Nov 2022 17:15:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4871C8176D;
	Tue, 22 Nov 2022 17:15:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4871C8176D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 45B591BF82F
 for <buildroot@lists.busybox.net>; Tue, 22 Nov 2022 17:15:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 29ED74187A
 for <buildroot@lists.busybox.net>; Tue, 22 Nov 2022 17:15:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 29ED74187A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lnhy899quHUf for <buildroot@lists.busybox.net>;
 Tue, 22 Nov 2022 17:15:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 38695415E1
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp4.osuosl.org (Postfix) with ESMTP id 38695415E1
 for <buildroot@buildroot.org>; Tue, 22 Nov 2022 17:15:07 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 25E521FB;
 Tue, 22 Nov 2022 09:15:12 -0800 (PST)
Received: from localhost.localdomain (unknown [10.57.7.34])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 077423F73D;
 Tue, 22 Nov 2022 09:15:04 -0800 (PST)
From: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@arm.com>
To: buildroot@buildroot.org
Date: Tue, 22 Nov 2022 17:05:44 +0100
Message-Id: <20221122160544.121691-1-vincent.stehle@arm.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] boot/edk2: fix the build for arm sgi575
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
Cc: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhlIGVkazIgcGFja2FnZSBjYW4gYmUgY29uZmlndXJlZCBmb3IgcGxhdGZvcm0gQXJtIFNnaTU3
NSBidXQgdGhpcyBkb2VzCm5vdCBidWlsZCBjb3JyZWN0bHkuIEFkZCB0aGUgbmVjZXNzYXJ5IGRl
ZmluaXRpb25zIHRvIGZpeCB0aGUgYnVpbGQuCgpTaWduZWQtb2ZmLWJ5OiBWaW5jZW50IFN0ZWhs
w6kgPHZpbmNlbnQuc3RlaGxlQGFybS5jb20+CkNjOiBEaWNrIE9sc3NvbiA8aGlAc2VuemlsbGEu
aW8+Ci0tLQoKCkhpLAoKVGhpcyBpcyBvbmx5IGJ1aWxkLXRlc3RlZC4KCkFsdGVybmF0aXZlbHkg
d2UgY291bGQgcmVtb3ZlIHRoZSBCUjJfVEFSR0VUX0VESzJfUExBVEZPUk1fQVJNX1NHSTU3NSBm
cm9tIHRoZQpDb25maWcuaW4gZmlsZSBjb21wbGV0ZWx5IGlmIHRoaXMgaXMgcHJlZmVycmVkLiBK
dXN0IGxldCBtZSBrbm93IGFuZCBJIHdpbGwKc2VuZCBhIHBhdGNoLgoKQmVzdCByZWdhcmRzLApW
aW5jZW50LgoKCiBib290L2VkazIvZWRrMi5tayB8IDYgKysrKysrCiAxIGZpbGUgY2hhbmdlZCwg
NiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvYm9vdC9lZGsyL2VkazIubWsgYi9ib290L2Vk
azIvZWRrMi5tawppbmRleCA1Y2JkOWQxNTJlNy4uN2Q4NzY1YzMxMDggMTAwNjQ0Ci0tLSBhL2Jv
b3QvZWRrMi9lZGsyLm1rCisrKyBiL2Jvb3QvZWRrMi9lZGsyLm1rCkBAIC03NSw2ICs3NSwxMiBA
QCBFREsyX1BBQ0tBR0VfTkFNRSA9IEFybVZpcnRQa2cKIEVESzJfUExBVEZPUk1fTkFNRSA9IEFy
bVZpcnRRZW11S2VybmVsCiBFREsyX0JVSUxEX0RJUiA9ICQoRURLMl9QTEFURk9STV9OQU1FKS0k
KEVESzJfQVJDSCkKIAorZWxzZSBpZmVxICgkKEJSMl9UQVJHRVRfRURLMl9QTEFURk9STV9BUk1f
U0dJNTc1KSx5KQorRURLMl9BUkNIID0gQUFSQ0g2NAorRURLMl9QQUNLQUdFX05BTUUgPSBQbGF0
Zm9ybS9BUk0vU2dpUGtnL1NnaTU3NQorRURLMl9QTEFURk9STV9OQU1FID0gU2dpNTc1CitFREsy
X0JVSUxEX0RJUiA9ICQoRURLMl9QTEFURk9STV9OQU1FKQorCiBlbHNlIGlmZXEgKCQoQlIyX1RB
UkdFVF9FREsyX1BMQVRGT1JNX0FSTV9WRVhQUkVTU19GVlBfQUFSQ0g2NCkseSkKIEVESzJfQVJD
SCA9IEFBUkNINjQKIEVESzJfUEFDS0FHRV9OQU1FID0gUGxhdGZvcm0vQVJNL1ZFeHByZXNzUGtn
Ci0tIAoyLjM1LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6
Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
