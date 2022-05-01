Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A43EDC433EF
	for <buildroot@archiver.kernel.org>; Sun,  1 May 2022 00:07:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3EF434031B;
	Sun,  1 May 2022 00:07:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ei0nHvyV6PAl; Sun,  1 May 2022 00:07:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 14D2640302;
	Sun,  1 May 2022 00:07:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3E7231BF951
 for <buildroot@lists.busybox.net>; Sun,  1 May 2022 00:07:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2CBEC81A5C
 for <buildroot@lists.busybox.net>; Sun,  1 May 2022 00:07:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TooijAssx7rJ for <buildroot@lists.busybox.net>;
 Sun,  1 May 2022 00:07:53 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd15177.aruba.it (smtpcmd15177.aruba.it [62.149.156.177])
 by smtp1.osuosl.org (Postfix) with ESMTP id D644581A24
 for <buildroot@buildroot.org>; Sun,  1 May 2022 00:07:52 +0000 (UTC)
Received: from localhost.localdomain ([146.241.34.210])
 by Aruba Outgoing Smtp  with ESMTPSA
 id kx7vn10JCQDqNkx7vn7Z1e; Sun, 01 May 2022 02:07:51 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1651363671; bh=u9+NO4iA388zrTKd2chX+vzjeMdJgA4KRJlEOlzrQFw=;
 h=From:To:Subject:Date:MIME-Version;
 b=jfq3TLTARxg3guELvLCkUtw8rf1qRmHoTa51pw6s29CVnfzVEQSwMFL9wrWC+7Eiu
 bC80xjqD2Zltcx3e21Ey69utXtidbCDnRMkMnOtp8qTAYn6Yy3erKaQSWucwYzCUPn
 VIOnAiJiCp4U/cxxc2pFwwQP/JY71CGXphai5RWMNGFFlYbmSxGaC3eVC9pMIKDgNi
 J9IJYDazaLkjU5wfVWBexhmoZ7UCnUzz83nUG6wIFPzGztQekntZo93JQ/5Nc74T91
 Bbg06jP5O3CCcQwPmfsqaOEyg/5AHumtShEM1a6UqWucgVJ5Q0bAZLvkdOhwIAt3n7
 v79BqhP/ntxxw==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sun,  1 May 2022 02:07:50 +0200
Message-Id: <20220501000750.1569310-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfFxHifRtEeeZTFUhpPQeUWuqWoS/ut/u8++B4hTk+bzq+T9ron2eHcpoiKAKNOpmoKz6XkO0pbIVs78Ixzpz4PEQqyU4cK+EGC8EUYt1YANgX/ZkY+Gj
 LkO9oGruQHW9P76f91xT2oSfyFbXvXdMsp3K3zVCjtNhPP0WEdP7ID43rz+ZPmp8lJa2HyypEw3rYc6Z31aKK7jtZoRDtmY3liHkDQExstHQ8hvGpUdTujE3
 UFoYkiBkzR1HjCml2CdQ9FLjlus4Mww0BaG95DgECDsu9U/dW6Z4ejL/Fl699fuLSRzOX/P4NqLGBmtvVc62JQ==
Subject: [Buildroot] [PATCH] package/libnss: bump to version 3.78
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/libnss/libnss.hash | 4 ++--
 package/libnss/libnss.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libnss/libnss.hash b/package/libnss/libnss.hash
index 04e81e6b84..0c06495f5e 100644
--- a/package/libnss/libnss.hash
+++ b/package/libnss/libnss.hash
@@ -1,4 +1,4 @@
-# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_77_RTM/src/SHA256SUMS
-sha256  825edf5a2fd35b788a23ff80face591f82919ae3ad2b8f77d424a450d618dedd  nss-3.77.tar.gz
+# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_78_RTM/src/SHA256SUMS
+sha256  f455f341e787c1167328e80a84f77b9a557d595066dda6486a1874d72da68800  nss-3.78.tar.gz
 # Locally calculated
 sha256  a20c1a32d1f8102432360b42e932869f7c11c7cdbacf9cac554c422132af47f4  nss/COPYING
diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
index 7568ec67ed..540092dfcf 100644
--- a/package/libnss/libnss.mk
+++ b/package/libnss/libnss.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNSS_VERSION = 3.77
+LIBNSS_VERSION = 3.78
 LIBNSS_SOURCE = nss-$(LIBNSS_VERSION).tar.gz
 LIBNSS_SITE = https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_$(subst .,_,$(LIBNSS_VERSION))_RTM/src
 LIBNSS_DISTDIR = dist
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
