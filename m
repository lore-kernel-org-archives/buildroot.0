Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45416C83F2C
	for <buildroot@archiver.kernel.org>; Sat,  2 Sep 2023 22:14:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 70C5081464;
	Sat,  2 Sep 2023 22:14:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 70C5081464
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DzeLN94cySlP; Sat,  2 Sep 2023 22:14:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BAE878143F;
	Sat,  2 Sep 2023 22:14:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BAE878143F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 60FF41BF3F2
 for <buildroot@lists.busybox.net>; Sat,  2 Sep 2023 22:14:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 43F4F60F28
 for <buildroot@lists.busybox.net>; Sat,  2 Sep 2023 22:14:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 43F4F60F28
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mYle9h6sS7YQ for <buildroot@lists.busybox.net>;
 Sat,  2 Sep 2023 22:14:30 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D246D60C02
 for <buildroot@buildroot.org>; Sat,  2 Sep 2023 22:14:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D246D60C02
Received: by mail.gandi.net (Postfix) with ESMTPA id A2A8D240003;
 Sat,  2 Sep 2023 22:14:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun,  3 Sep 2023 00:14:24 +0200
Message-ID: <20230902221425.3577627-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1693692867;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=FxaejHLfBI5wCXRrpjppy9dDh+jcwVWSjBnF9mck1sk=;
 b=Y9BA8XYTWguvF4j6dbhrXG+OPaZ9nIoF1iCXA9FZS6y/gaubh9lkXiZSiAMG+yhOcU7V0S
 dymnNEnKfDA5mLDZ8IcAEQdAo7SY2SsvBZUuEgLND4cxzwn/TjtRnr1hX9VO1zscrwtHIy
 WNT94IM+ZYddjZh6AgHI9e/nN6vT9ODUMLOMhVYxMRhlDuJIjus02lrGIV13o+akY2/S6W
 X04bGyJ8O0ToxIcwGXDcy3uTM72cY4Pi/xg4DeKO8bX57iILKlovRAWqtnLe24RpN7k0HC
 VouojxmA32YEFEvLQlT5kiuFJaWjXonmq1YNpmreeDRyDY06SFKJIbA4VFo+hw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Y9BA8XYT
Subject: [Buildroot] [PATCH] package/python-pip: ignore CVE-2018-20225
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
Cc: Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

See https://security-tracker.debian.org/tracker/CVE-2018-20225 for the
rationale of ignoring this CVE. Things basically work as intended.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-pip/python-pip.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/python-pip/python-pip.mk b/package/python-pip/python-pip.mk
index 35ad7bede2..040767930e 100644
--- a/package/python-pip/python-pip.mk
+++ b/package/python-pip/python-pip.mk
@@ -12,6 +12,9 @@ PYTHON_PIP_LICENSE = MIT
 PYTHON_PIP_LICENSE_FILES = LICENSE.txt
 PYTHON_PIP_CPE_ID_VENDOR = pypa
 PYTHON_PIP_CPE_ID_PRODUCT = pip
+# Disputed CVE: things work as designed, and only affects the
+# --extra-index-url option. This CVE will never be fixed.
+PYTHON_PIP_IGNORE_CVES += CVE-2018-20225
 
 $(eval $(python-package))
 $(eval $(host-python-package))
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
