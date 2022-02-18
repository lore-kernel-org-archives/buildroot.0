Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C01EC433EF
	for <buildroot@archiver.kernel.org>; Fri, 18 Feb 2022 17:36:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 960F140499;
	Fri, 18 Feb 2022 17:36:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id apjD27KQnWTX; Fri, 18 Feb 2022 17:36:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9FEBE40360;
	Fri, 18 Feb 2022 17:36:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BBB381BF48C
 for <buildroot@lists.busybox.net>; Fri, 18 Feb 2022 17:36:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B7AE960B20
 for <buildroot@lists.busybox.net>; Fri, 18 Feb 2022 17:36:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OdV6gFMp7c7f for <buildroot@lists.busybox.net>;
 Fri, 18 Feb 2022 17:36:17 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd14161.aruba.it (smtpcmd14161.aruba.it [62.149.156.161])
 by smtp3.osuosl.org (Postfix) with ESMTP id 44D1B60B0A
 for <buildroot@buildroot.org>; Fri, 18 Feb 2022 17:36:16 +0000 (UTC)
Received: from localhost.localdomain ([146.241.188.82])
 by Aruba Outgoing Smtp  with ESMTPSA
 id L7B0nQUksNVvLL7B0nlMfr; Fri, 18 Feb 2022 18:36:15 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1645205775; bh=Zx1jbhSSiIskajVBmFrcnwZWMcUwL/uJO6Gtp+s+EYI=;
 h=From:To:Subject:Date:MIME-Version;
 b=BgRaFspuoGpkIgsFkDvH1ibIdqrir5qMpRMX3TFQT74EHZryVtyqbJoI377M8fpZz
 wCdSteMUC05xbRnKCdCRo7UwsvI+PKw7NACYIfuJwiA+ayEorw5E31WajTQTsd0NbN
 2JDLlZ8INnVxbgYUK/ile5vbRa1v9mM9zZak0HiO9t0+Pi4A9hIEeVwCgI08+6XE/N
 P7DaPEBeBCOmDrc2yGHpc/8OQbuAHW8pcfly/OEGGLllfzGV2AvBxc6EePoZ7g/7mV
 72tq577vGBfOmqx6epqS7GnkOQupEAcdwXhlpiLLjJuay60daRgUIW7L1PXbHWcKec
 xzPMfPdUpJoFw==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Fri, 18 Feb 2022 18:36:12 +0100
Message-Id: <20220218173613.315794-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfHCoV8CQPVssWmJjKQ4C4CHZgmfOx9fsWnoakLcoXcHs8FfFW1/KqNM1FkXk+QwBC7R05CSvfXjdHP8Fuv6uOZfe6HijA7SQwjRhLXupmtFmybkNE2nr
 6VZRlNnm7Tr7/bGd37O8jY9BsZ3tacnKCP2sLN7pGQ136tDluSYQ08N1MspUh8Bg3Dp5vMK0V5Oe3w1l9WtN2d3X0xvyteStCVjKMO8bwYRmD8GHixLya0F7
 9RXGfgYUN/3BF4Byidlubds/4SOvMTJHCSfNL1iLbx7I6XHIiqZrqN++PrfsgUajAwcX5+Hdzaa3nHSMdIZuqw==
Subject: [Buildroot] [PATCH] package/harfbuzz: bump to version 3.4.0
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Pierre Floury <pierre.floury@gmail.com>
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
index 61f2865563..e4674afa87 100644
--- a/package/harfbuzz/harfbuzz.hash
+++ b/package/harfbuzz/harfbuzz.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  1c13bca136c4f66658059853e2c1253f34c88f4b5c5aba6050aba7b5e0ce2503  harfbuzz-3.3.2.tar.xz
+sha256  7158a87c4db82521fc506711f0c8864115f0292d95f7136c8812c11811cdf952  harfbuzz-3.4.0.tar.xz
 sha256  4345e1735f8bc6d812fed5180cabb5a5e88a4109d332652f2a45c13cfa5ee692  COPYING
diff --git a/package/harfbuzz/harfbuzz.mk b/package/harfbuzz/harfbuzz.mk
index 1f5dfa8822..331b35c530 100644
--- a/package/harfbuzz/harfbuzz.mk
+++ b/package/harfbuzz/harfbuzz.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HARFBUZZ_VERSION = 3.3.2
+HARFBUZZ_VERSION = 3.4.0
 HARFBUZZ_SITE = https://github.com/harfbuzz/harfbuzz/releases/download/$(HARFBUZZ_VERSION)
 HARFBUZZ_SOURCE = harfbuzz-$(HARFBUZZ_VERSION).tar.xz
 HARFBUZZ_LICENSE = MIT, ISC (ucdn library)
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
