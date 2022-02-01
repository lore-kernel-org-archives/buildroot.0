Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7606C433F5
	for <buildroot@archiver.kernel.org>; Tue,  1 Feb 2022 17:34:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 42C7B82BE5;
	Tue,  1 Feb 2022 17:34:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5FRhS5UzJUzR; Tue,  1 Feb 2022 17:33:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 90C518133A;
	Tue,  1 Feb 2022 17:33:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 001151BF396
 for <buildroot@lists.busybox.net>; Tue,  1 Feb 2022 17:33:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E2525402AC
 for <buildroot@lists.busybox.net>; Tue,  1 Feb 2022 17:33:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KNIgnFJ0Otm3 for <buildroot@lists.busybox.net>;
 Tue,  1 Feb 2022 17:33:55 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd12131.aruba.it (smtpcmd12131.aruba.it [62.149.156.131])
 by smtp4.osuosl.org (Postfix) with ESMTP id 90424402A1
 for <buildroot@buildroot.org>; Tue,  1 Feb 2022 17:33:55 +0000 (UTC)
Received: from localhost.localdomain ([146.241.179.156])
 by Aruba Outgoing Smtp  with ESMTPSA
 id Ex2Pnexn1QUuPEx2Pnix90; Tue, 01 Feb 2022 18:33:54 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1643736834; bh=FPy+ugJq0/eIPtXsd36qX1DZqm3vCkvJ3AFhcWoiJdE=;
 h=From:To:Subject:Date:MIME-Version;
 b=JF/ZR+vuejyLFyWW5NBBIjNikcIkQr3hH8VU8cBlyIiJOSpp2bQTrdr63htaOYpsN
 +6EYWy0fqL8lsJW4OoRuJBY8auR8qG7ePmf9GEp7+EXA+DsA7BMmeG1ABPvF+6+aK2
 gjslmQM23nJlYsX5VQtvH9/bmXkoBxbH+ysLL20s5Gg+IuWjQN2WIPF2H+wCclzbSD
 s5pOIIxNS/UoLqDm3hMPCVHYV7w4sZA6qBz3tlYbJ8gvYsxAbSHzSpEjTPQZaqHcj+
 IiRgCaXDi7qhIWz6NjdsFNqo8YKmn7SArJh1v3mIuCI7bRoDBWwvE68xub/3qK3I4d
 s0/7whaqfC60w==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Tue,  1 Feb 2022 18:33:51 +0100
Message-Id: <20220201173352.160244-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfBEB0BSxL9ncuBD1RiMjWz8sE+Xvn1bg1r/Zf/Yqh7IMPr3nE4Qj9Cw17l2M2mh9vseGkhjZc9j6x4R2li+Q8lcArF9Xcz5p1/Er68K944yMyIlyiOeH
 vxh3qFpQLrkFUuts+bCiwuuzEFgPwM+Lr6KDjSuoo76638nogPHJTEK9McIXGcmoS6j/aAluNjAb7x80dz9HBY2THCE2ZDMXXJxQ2lLkNoHKIoMkK1Fa8eyZ
 SPUFxY76XnSscHIoFkAFI17pwUxPxqJ16d+2REjc4UeHUVEa6DsPHN1cRoqskXYQ
Subject: [Buildroot] [PATCH 1/2] package/cryptsetup: bump version to 2.4.3
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
 Martin Hicks <mort@bork.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/cryptsetup/cryptsetup.hash | 2 +-
 package/cryptsetup/cryptsetup.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/cryptsetup/cryptsetup.hash b/package/cryptsetup/cryptsetup.hash
index b3bb859bdc..dce2686d31 100644
--- a/package/cryptsetup/cryptsetup.hash
+++ b/package/cryptsetup/cryptsetup.hash
@@ -1,4 +1,4 @@
 # From https://www.kernel.org/pub/linux/utils/cryptsetup/v2.4/sha256sums.asc
-sha256  170cc2326a9daeeeb578579176bd10d4a60ee5c4fc5bc69018ce67dafc540b9c  cryptsetup-2.4.2.tar.xz
+sha256  fc0df945188172264ec5bf1d0bda08264fadc8a3f856d47eba91f31fe354b507  cryptsetup-2.4.3.tar.xz
 sha256  45670cce8b6a0ddd66c8016cd8ccef6cd71f35717cbacc7f1e895b3855207b33  COPYING
 sha256  8c33cc37871654ec7ed87e6fbb896c8cf33ef5ef05b1611a5aed857596ffafa5  COPYING.LGPL
diff --git a/package/cryptsetup/cryptsetup.mk b/package/cryptsetup/cryptsetup.mk
index 9cfd647ac6..2e06047c56 100644
--- a/package/cryptsetup/cryptsetup.mk
+++ b/package/cryptsetup/cryptsetup.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 CRYPTSETUP_VERSION_MAJOR = 2.4
-CRYPTSETUP_VERSION = $(CRYPTSETUP_VERSION_MAJOR).2
+CRYPTSETUP_VERSION = $(CRYPTSETUP_VERSION_MAJOR).3
 CRYPTSETUP_SOURCE = cryptsetup-$(CRYPTSETUP_VERSION).tar.xz
 CRYPTSETUP_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/cryptsetup/v$(CRYPTSETUP_VERSION_MAJOR)
 CRYPTSETUP_DEPENDENCIES = \
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
