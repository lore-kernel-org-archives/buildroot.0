Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5EAAC433EF
	for <buildroot@archiver.kernel.org>; Sun, 12 Dec 2021 22:35:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A6A2741DCF;
	Sun, 12 Dec 2021 22:35:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id L1qbLDg71h2Q; Sun, 12 Dec 2021 22:35:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 10C3841DC7;
	Sun, 12 Dec 2021 22:35:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E121C1BF337
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 22:34:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D0BED850B2
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 22:34:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3Edxhg8DKUOQ for <buildroot@lists.busybox.net>;
 Sun, 12 Dec 2021 22:34:56 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd0871.aruba.it (smtpcmd0871.aruba.it [62.149.156.71])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5537D850AD
 for <buildroot@buildroot.org>; Sun, 12 Dec 2021 22:34:56 +0000 (UTC)
Received: from localhost.localdomain ([146.241.138.59])
 by Aruba Outgoing Smtp  with ESMTPSA
 id wXQjmvmjCAiELwXQkms70j; Sun, 12 Dec 2021 23:34:54 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1639348494; bh=ujdyjTHSUKcIcUaqFmNXbXcrrhpmkCCcevvPyNwIq+w=;
 h=From:To:Subject:Date:MIME-Version;
 b=A4OnX1jYBMq5xU+TOWUqYtR+iyH/tiUqWA4cfT7iKnCTYcc1/lESgTG/+tegrYIt6
 MaSFqYeBj/tdyS4HMvBSydcVB/cr7In0fZKFmSyVEdgwEpzV0zJIJZF3GtWGYOmafr
 Hu1e/DW/7YA2146gd79iGkzodnZIwz1w9e7/rRwdJjs5LMLlm6qXgx4zqKlEtpaLbE
 GrJ5iZdbl12hWWihjkGVUuTZSCFDmJOZ19cqdbHopIy0MWQTFO+NYPGOyrCsYJQC4g
 l1ImzJouVlnmtcILaD3cRAWXBPQhCAT9VCBc1qKq767rUCgDBvqvBx8MX88tgu9k2u
 ZT0L1/oklEBiQ==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sun, 12 Dec 2021 23:34:52 +0100
Message-Id: <20211212223452.317122-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfPKDXkiFG/nWK9ZI9BOcD8gHkVvS8zaLA7owxPfPC0Z0ryi4Qu64+LeKOLAuKFRKVZM0r5fT18kbWjwWsmCbd0kXDYQnQ/moo11wFaXraDwVm8rIU1rn
 L0ha9i5wl8IeNV9hiJ0sF3CtS/v+Jke1W/ScHya+GI8moYmq9NxyThdwql93ObqSfLGA4NS71r+ZgoVMLc+9rtg0FfBm7sMjYsak9PhrazGTn+qJVW6OttOF
 RYjTt3iEARs0F81DXFCyBVVg8sicrKGY2+TRBUEygAw=
Subject: [Buildroot] [PATCH] package/harfbuzz: bump to version 3.2.0
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/harfbuzz/harfbuzz.hash | 2 +-
 package/harfbuzz/harfbuzz.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/harfbuzz/harfbuzz.hash b/package/harfbuzz/harfbuzz.hash
index d5a376830a..1615933a6e 100644
--- a/package/harfbuzz/harfbuzz.hash
+++ b/package/harfbuzz/harfbuzz.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  4056b1541dd8bbd8ec29207fe30e568805c0705515632d7fec53a94399bc7945  harfbuzz-3.1.2.tar.xz
+sha256  0ada50a1c199bb6f70843ab893c55867743a443b84d087d54df08ad883ebc2cd  harfbuzz-3.2.0.tar.xz
 sha256  4345e1735f8bc6d812fed5180cabb5a5e88a4109d332652f2a45c13cfa5ee692  COPYING
diff --git a/package/harfbuzz/harfbuzz.mk b/package/harfbuzz/harfbuzz.mk
index 97b28ce236..67eab359c6 100644
--- a/package/harfbuzz/harfbuzz.mk
+++ b/package/harfbuzz/harfbuzz.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HARFBUZZ_VERSION = 3.1.2
+HARFBUZZ_VERSION = 3.2.0
 HARFBUZZ_SITE = https://github.com/harfbuzz/harfbuzz/releases/download/$(HARFBUZZ_VERSION)
 HARFBUZZ_SOURCE = harfbuzz-$(HARFBUZZ_VERSION).tar.xz
 HARFBUZZ_LICENSE = MIT, ISC (ucdn library)
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
