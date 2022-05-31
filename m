Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 266BAC433F5
	for <buildroot@archiver.kernel.org>; Tue, 31 May 2022 20:26:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7EDE584005;
	Tue, 31 May 2022 20:26:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fI7l6YqmjL8U; Tue, 31 May 2022 20:26:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 78F1384012;
	Tue, 31 May 2022 20:26:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1B3131BF844
 for <buildroot@lists.busybox.net>; Tue, 31 May 2022 20:26:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0970A40439
 for <buildroot@lists.busybox.net>; Tue, 31 May 2022 20:26:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EmcMyQC7_nJA for <buildroot@lists.busybox.net>;
 Tue, 31 May 2022 20:26:04 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd15177.aruba.it (smtpcmd15177.aruba.it [62.149.156.177])
 by smtp2.osuosl.org (Postfix) with ESMTP id AF8F14014A
 for <buildroot@buildroot.org>; Tue, 31 May 2022 20:26:03 +0000 (UTC)
Received: from localhost.localdomain ([146.241.66.179])
 by Aruba Outgoing Smtp  with ESMTPSA
 id w8RDnZtttXOlAw8REn1aQT; Tue, 31 May 2022 22:26:01 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1654028761; bh=j1u25OpSs3bFciR5kJhxeVCeSQdvtsP+d8Lt2meJl54=;
 h=From:To:Subject:Date:MIME-Version;
 b=Xb6eA5h2KW4qxgeAddx7gx5vtr+L3EUCTj2FqIwh9XtS89W+tm9aBe0FZ5o9B9iCP
 Ae3vCEkHpLJeTMQxzNP8/6UYOX7xXfVOZBj1yT+IJQ29ll+oSUb+ZJFHpr6ojUCylF
 wk10mmA+WrExSGC6VPc7C78xDti9VXzbuBEMb/0121Xpv71qjh7KuSrFOCxAGpOX6Q
 VP35t2o0zauCRTuTQgO7VsfwV6xI9meEzHPmdyF3bTFC6KWcGw+Z/MWgn7mPvNNPye
 8e0xiCzrTX02Zr6vetZGqKk8o9O8LWoXzQItoq7lflu5tRYvtQnSh+P0Bo3p1SVNAq
 mGpkEnE4NB7yQ==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Tue, 31 May 2022 22:25:59 +0200
Message-Id: <20220531202559.1541903-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfF6dtW+tF6qJ+kK2JDq7ig+/F79doXL2jzfizZYxNX/PBW3CpgfPAjPhSbo7WzbDaljzvRQygKX0CqBpMVxkPvBAtBFRXqSrEUab54/iy+9y2RQDSIUX
 ED0PacTlTtfut2jTG5zU9RPx0bW5OkVA5/jlfBj8oEhqOgOEtMCmmi2zN5FZgFqa/QWvVZAl6j2l8tpeLGxP3phmhsv87zJX5XK69WOgP5srfiugrL7ggLFW
 l3aV3NPtaLsl1FC9BI5ZqnjjP3DCJULSz1mlJlKklnnT0HpeH5gMSr8uFSL0RXIL3wE/ovA0AP5wOfUybkltYw==
Subject: [Buildroot] [for-next PATCH] package/libnss: bump version to 3.79
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
index 0c06495f5e..f7da9ccfdc 100644
--- a/package/libnss/libnss.hash
+++ b/package/libnss/libnss.hash
@@ -1,4 +1,4 @@
-# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_78_RTM/src/SHA256SUMS
-sha256  f455f341e787c1167328e80a84f77b9a557d595066dda6486a1874d72da68800  nss-3.78.tar.gz
+# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_79_RTM/src/SHA256SUMS
+sha256  ebdf2d6a96613b6fe70ad579e9f983e0e94e0110171cfb2999db633d3394a514  nss-3.79.tar.gz
 # Locally calculated
 sha256  a20c1a32d1f8102432360b42e932869f7c11c7cdbacf9cac554c422132af47f4  nss/COPYING
diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
index 0d0f1d84b9..70f53a9140 100644
--- a/package/libnss/libnss.mk
+++ b/package/libnss/libnss.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNSS_VERSION = 3.78
+LIBNSS_VERSION = 3.79
 LIBNSS_SOURCE = nss-$(LIBNSS_VERSION).tar.gz
 LIBNSS_SITE = https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_$(subst .,_,$(LIBNSS_VERSION))_RTM/src
 LIBNSS_DISTDIR = dist
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
