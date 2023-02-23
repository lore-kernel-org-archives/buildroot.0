Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92D27C61DA4
	for <buildroot@archiver.kernel.org>; Thu, 23 Feb 2023 20:17:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3475681490;
	Thu, 23 Feb 2023 20:17:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3475681490
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SlgZeOXXivKK; Thu, 23 Feb 2023 20:17:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6F19F8148B;
	Thu, 23 Feb 2023 20:17:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6F19F8148B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 30A4A1BF3E0
 for <buildroot@lists.busybox.net>; Thu, 23 Feb 2023 20:17:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0A9B760AE6
 for <buildroot@lists.busybox.net>; Thu, 23 Feb 2023 20:17:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0A9B760AE6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yisQj8QZNKFc for <buildroot@lists.busybox.net>;
 Thu, 23 Feb 2023 20:17:53 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 361A560AD6
Received: from server1.martb.eu (server1.martb.eu [195.201.128.12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 361A560AD6
 for <buildroot@buildroot.org>; Thu, 23 Feb 2023 20:17:53 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 23 Feb 2023 21:17:33 +0100
Message-Id: <20230223201733.222573-1-contact@martb.dev>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=martb.dev; s=mail; t=1677183471;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=hloeVhmVIVT6G6K4RyZr8FW+WmZv/X9Tl4IjR6+sVQE=;
 b=zwYvz1z6h6C7K2UAEuxAtcAcJaLQJUSjUFs6r72GouXZ+bbFvfNCl1R9pc8VDXZDygy9X7
 exKumfzulvEIMi43O81aGSb8qWvczI/Xe8s3M7lYm112bEwh7CH1CKgf93Cf9dnbJBbldv
 c47tEdii8UhaWdIXlRZ6Ptuqf7ChDks=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=martb.dev header.i=@martb.dev
 header.a=rsa-sha256 header.s=mail header.b=zwYvz1z6
X-Mailman-Original-Authentication-Results: ORIGINATING;
 auth=pass smtp.auth=martin@familie-boeh.de smtp.mailfrom=contact@martb.dev
Subject: [Buildroot] [PATCH 1/1] package/gr-osmosdr: add missing
 host-python-six dependency to python support
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
From: =?utf-8?q?Martin_B=C3=B6h_via_buildroot?= <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Martin=20B=C3=B6h?= <contact@martb.dev>
Cc: =?UTF-8?q?Martin=20B=C3=B6h?= <contact@martb.dev>,
 Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T3Ntb3NkciBmYWlsZWQgdG8gYnVpbGQgZG9jcyB3aGVuIHB5dGhvbiBzdXBwb3J0IGlzIGVuYWJs
ZWQuClsgNDElXSBDb3B5aW5nIG9zbW9zZHIgZG9jc3RyaW5nIHRlbXBsYXRlcyBhcyBweWJpbmQg
aGVhZGVycyAuLi4KVHJhY2ViYWNrIChtb3N0IHJlY2VudCBjYWxsIGxhc3QpOgogIEZpbGUgIi9o
b21lL21hcnRiL1NjaHJlaWJ0aXNjaC9EaXNjb1NBVC9zYXRvcy9vdXRwdXQvYnVpbGQvZ3Itb3Nt
b3Nkci0wLjIuNC9kb2NzL2RveHlnZW4vdXBkYXRlX3B5ZG9jLnB5IiwgbGluZSAyMiwgaW4gPG1v
ZHVsZT4KICAgIGZyb20gZG94eXhtbCBpbXBvcnQgRG94eUluZGV4LCBEb3h5Q2xhc3MsIERveHlG
cmllbmQsIERveHlGdW5jdGlvbiwgRG94eUZpbGUKICBGaWxlICIvaG9tZS9tYXJ0Yi9TY2hyZWli
dGlzY2gvRGlzY29TQVQvc2F0b3Mvb3V0cHV0L2J1aWxkL2dyLW9zbW9zZHItMC4yLjQvZG9jcy9k
b3h5Z2VuL2RveHl4bWwvX19pbml0X18ucHkiLCBsaW5lIDY5LCBpbiA8bW9kdWxlPgogICAgZnJv
bSAuZG94eWluZGV4IGltcG9ydCBEb3h5SW5kZXgsIERveHlGdW5jdGlvbiwgRG94eVBhcmFtLCBE
b3h5Q2xhc3MsIERveHlGaWxlLCBEb3h5TmFtZXNwYWNlLCBEb3h5R3JvdXAsIERveHlGcmllbmQs
IERveHlPdGhlcgogIEZpbGUgIi9ob21lL21hcnRiL1NjaHJlaWJ0aXNjaC9EaXNjb1NBVC9zYXRv
cy9vdXRwdXQvYnVpbGQvZ3Itb3Ntb3Nkci0wLjIuNC9kb2NzL2RveHlnZW4vZG94eXhtbC9kb3h5
aW5kZXgucHkiLCBsaW5lIDMxLCBpbiA8bW9kdWxlPgogICAgZnJvbSAuZ2VuZXJhdGVkIGltcG9y
dCBpbmRleAogIEZpbGUgIi9ob21lL21hcnRiL1NjaHJlaWJ0aXNjaC9EaXNjb1NBVC9zYXRvcy9v
dXRwdXQvYnVpbGQvZ3Itb3Ntb3Nkci0wLjIuNC9kb2NzL2RveHlnZW4vZG94eXhtbC9nZW5lcmF0
ZWQvaW5kZXgucHkiLCBsaW5lIDEzLCBpbiA8bW9kdWxlPgogICAgZnJvbSAuIGltcG9ydCBjb21w
b3VuZAogIEZpbGUgIi9ob21lL21hcnRiL1NjaHJlaWJ0aXNjaC9EaXNjb1NBVC9zYXRvcy9vdXRw
dXQvYnVpbGQvZ3Itb3Ntb3Nkci0wLjIuNC9kb2NzL2RveHlnZW4vZG94eXhtbC9nZW5lcmF0ZWQv
Y29tcG91bmQucHkiLCBsaW5lIDE1LCBpbiA8bW9kdWxlPgogICAgZnJvbSAuIGltcG9ydCBjb21w
b3VuZHN1cGVyIGFzIHN1cGVybW9kCiAgRmlsZSAiL2hvbWUvbWFydGIvU2NocmVpYnRpc2NoL0Rp
c2NvU0FUL3NhdG9zL291dHB1dC9idWlsZC9nci1vc21vc2RyLTAuMi40L2RvY3MvZG94eWdlbi9k
b3h5eG1sL2dlbmVyYXRlZC9jb21wb3VuZHN1cGVyLnB5IiwgbGluZSAxNSwgaW4gPG1vZHVsZT4K
ICAgIGltcG9ydCBzaXgKTW9kdWxlTm90Rm91bmRFcnJvcjogTm8gbW9kdWxlIG5hbWVkICdzaXgn
Cm1ha2VbMl06ICoqKiBbcHl0aG9uL2JpbmRpbmdzL0NNYWtlRmlsZXMvb3Ntb3Nkcl9kb2NzdHJp
bmdzLmRpci9idWlsZC5tYWtlOjczOiBweXRob24vYmluZGluZ3MvZG9jc3RyaW5nX3N0YXR1c10g
RmVobGVyIDEKbWFrZVsxXTogKioqIFtDTWFrZUZpbGVzL01ha2VmaWxlMjozMzI6IHB5dGhvbi9i
aW5kaW5ncy9DTWFrZUZpbGVzL29zbW9zZHJfZG9jc3RyaW5ncy5kaXIvYWxsXSBGZWhsZXIgMgoK
U2lnbmVkLW9mZi1ieTogTWFydGluIELDtmggPGNvbnRhY3RAbWFydGIuZGV2PgotLS0KIHBhY2th
Z2UvZ3Itb3Ntb3Nkci9nci1vc21vc2RyLm1rIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5z
ZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9nci1vc21vc2Ry
L2dyLW9zbW9zZHIubWsgYi9wYWNrYWdlL2dyLW9zbW9zZHIvZ3Itb3Ntb3Nkci5tawppbmRleCA4
OTkwN2MxYmFhLi5iOTZhMzJhMjIxIDEwMDY0NAotLS0gYS9wYWNrYWdlL2dyLW9zbW9zZHIvZ3It
b3Ntb3Nkci5taworKysgYi9wYWNrYWdlL2dyLW9zbW9zZHIvZ3Itb3Ntb3Nkci5tawpAQCAtMjQs
NyArMjQsNyBAQCBHUl9PU01PU0RSX0lOU1RBTExfU1RBR0lORyA9IFlFUwogCiBpZmVxICgkKEJS
Ml9QQUNLQUdFX0dSX09TTU9TRFJfUFlUSE9OKSx5KQogR1JfT1NNT1NEUl9DT05GX09QVFMgKz0g
LURFTkFCTEVfUFlUSE9OPU9OCi1HUl9PU01PU0RSX0RFUEVOREVOQ0lFUyArPSBweXRob24zCitH
Ul9PU01PU0RSX0RFUEVOREVOQ0lFUyArPSBweXRob24zIGhvc3QtcHl0aG9uLXNpeAogZWxzZQog
R1JfT1NNT1NEUl9DT05GX09QVFMgKz0gLURFTkFCTEVfUFlUSE9OPU9GRgogZW5kaWYKLS0gCjIu
MzkuMgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVp
bGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3Rz
LmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
