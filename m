Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E118CEACEF
	for <buildroot@archiver.kernel.org>; Mon, 17 Nov 2025 17:08:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C56D660DE9;
	Mon, 17 Nov 2025 17:08:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A6DNC-5WKO0T; Mon, 17 Nov 2025 17:08:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E8D0F60F72
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E8D0F60F72;
	Mon, 17 Nov 2025 17:08:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0C113D5
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 17:08:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E614D83D4D
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 17:07:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zjRNmpuDMbmC for <buildroot@buildroot.org>;
 Mon, 17 Nov 2025 17:07:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=theo.lebrun@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 08BED83D4C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 08BED83D4C
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 08BED83D4C
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 17:07:58 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id BE3DB4E41728
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 17:07:55 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 95BBF606B9
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 17:07:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id E403510371894; Mon, 17 Nov 2025 18:07:54 +0100 (CET)
Date: Mon, 17 Nov 2025 18:07:52 +0100
MIME-Version: 1.0
Message-Id: <20251117-gitignore-brmake-log-v1-1-a77ec4bb1db2@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAGdWG2kC/4WNQQ6CMBBFr0JmbY1DSjGuvIdh0cJQJkLHtIRoS
 O9u5QIu30v++zskikwJbtUOkTZOLKEAniroJxs8KR4KQ32pG0RsleeVfZBIysXFPknN4tWg3Wj
 QNK22Fsr0FWnk95F9dIUnTqvEz/Gy4c/+CW6oUDl0Tls0V2P03YmsM4dzLwt0OecvtLDg47oAA
 AA=
X-Change-ID: 20251117-gitignore-brmake-log-d4bf616574aa
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1763399275; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding; bh=dKr1U9I/YXn4QouVe3kEo5DM0i38imkwHrG6Vk6T3I4=;
 b=FQ6306u0Wn/9J4WNkI/prGdMoa4Wnbdpe3iA28jaSkAoL31VEkEvDiwnbd2VkYn7OWpbp0
 lQUVz9J5BtQ5LkqCicjAi2AmfhENc8bdFEYZYGi/2wJTH6iYpiJXUjmL7ozlPd7179xc9c
 1JdL3ko1iFI075gb+rgvutkdJ2RHSNj/pjqwBjl8XIyZjZ/+D2AjItMU2dYA1hITyIvT1L
 iAExnDnzhIbfq9kSsZjzHY8VQmTh7yxmjN0fWHoj+VWKLVRpe1NAOMinufy6sltgYFdyaI
 KNSX331qolhr3uo7mYf/mkqL2uUHzO5f+aIX6k+Ek9/LCFsyBT3Sq6Q38zyfcQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=FQ6306u0
Subject: [Buildroot] [PATCH] gitignore: ignore utils/brmake log output named
 `br.log`
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
From: =?utf-8?q?Th=C3=A9o_Lebrun_via_buildroot?= <buildroot@buildroot.org>
Reply-To: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhlIGB1dGlscy9icm1ha2VgIHRvb2wgcnVucyBgbWFrZSBhbGxgIHdpdGggbG9ncyBwdXQgaW50
byBgYnIubG9nYC4KVGhhdCBmaWxlIGlzIHRoZXJlZm9yZSB0aGUgcmVzdWx0IG9mIGEgYnVpbGQg
YW5kIGNvbW1pdHRpbmcgaXQgbmV2ZXIKbWFrZXMgc2Vuc2UsIG5laXRoZXIgdXBzdHJlYW0gbm9y
IG9uIGFueSBvdGhlciByZW1vdGUvYnJhbmNoLgoKICAgIOKfqSBnaXQgc3RhdHVzIC0tc2hvcnQK
ICAgIOKfqSBtYWtlIGJlYWdsZWJvbmVfZGVmY29uZmlnCiAgICDin6kgLi91dGlscy9icm1ha2UK
ICAgIOKfqSBnaXQgc3RhdHVzIC0tc2hvcnQKICAgID8/IGJyLmxvZwoKQWRkIGEgbmV3IGAvYnIu
bG9nYCBlbnRyeSBpbiB0aGUgcm9vdCBgLmdpdGlnbm9yZWAgZmlsZS4KQXBwZW5kIHRvIHRoZSBl
bmQgYmVjYXVzZSBubyBvcmRlcmluZyBsb2dpYyB3YXMgZm91bmQuCgpTaWduZWQtb2ZmLWJ5OiBU
aMOpbyBMZWJydW4gPHRoZW8ubGVicnVuQGJvb3RsaW4uY29tPgotLS0KIC5naXRpZ25vcmUgfCAx
ICsKIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQoKZGlmZiAtLWdpdCBhLy5naXRpZ25v
cmUgYi8uZ2l0aWdub3JlCmluZGV4IGVjNTc2OGQwNTMuLmZiMjBiMDNkYWYgMTAwNjQ0Ci0tLSBh
Ly5naXRpZ25vcmUKKysrIGIvLmdpdGlnbm9yZQpAQCAtMTMsMyArMTMsNCBAQAogKi5yZWoKICp+
CiAqLnB5YworL2JyLmxvZwoKLS0tCmJhc2UtY29tbWl0OiA4Y2NlZTJiZTIyMTc3MmY2ZDQ1NmZk
ODUyYjIzN2FkYjdmNWJiZTUxCmNoYW5nZS1pZDogMjAyNTExMTctZ2l0aWdub3JlLWJybWFrZS1s
b2ctZDRiZjYxNjU3NGFhCgpCZXN0IHJlZ2FyZHMsCi0tIApUaMOpbyBMZWJydW4gPHRoZW8ubGVi
cnVuQGJvb3RsaW4uY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpo
dHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
