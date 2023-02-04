Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3C07C61DA4
	for <buildroot@archiver.kernel.org>; Sat,  4 Feb 2023 20:37:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4F070408F5;
	Sat,  4 Feb 2023 20:37:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4F070408F5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hkBORNSqu8-p; Sat,  4 Feb 2023 20:37:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 84DED408EC;
	Sat,  4 Feb 2023 20:37:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 84DED408EC
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C9E101BF408
 for <buildroot@lists.busybox.net>; Sat,  4 Feb 2023 20:37:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9D50560FC7
 for <buildroot@lists.busybox.net>; Sat,  4 Feb 2023 20:37:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9D50560FC7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QvQaQd5-0McX for <buildroot@lists.busybox.net>;
 Sat,  4 Feb 2023 20:37:54 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9B2AD60FAB
Received: from smtpdh18-1.aruba.it (smtpdh18-1.aruba.it [62.149.155.132])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9B2AD60FAB
 for <buildroot@buildroot.org>; Sat,  4 Feb 2023 20:37:53 +0000 (UTC)
Received: from localhost.localdomain ([146.241.66.151])
 by Aruba Outgoing Smtp  with ESMTPSA
 id OPIFpNKLLpJHIOPIFp98cx; Sat, 04 Feb 2023 21:37:51 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sat,  4 Feb 2023 21:37:50 +0100
Message-Id: <20230204203750.513283-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfFJChNL0ZbjDiF9FKFHAIeuNlf7p3jZg8sGX1Se5sl7HRobAZkHgqKlzXESIX/yxpfTUyxVZK0TK9zoYRuASjv6eZy0rfl1pAlG8jr5bOerQaJmkTn68
 o1ets/Pisd0WyridUCtl8lLD9B9NGGtsdDXOw1fzes1rEPTS/LLQ4UuIpCp5uLj9MLczGr739dmASdvdKcgwt+o2eAbx0WcZsC0hvth6R+BE61Ef+oBrCOXK
 enBfIYV09H3tZaBjjbJojgYFf2GoN7gJFeDcbpK4UaACkvQFq+ZzyVIktNc/X+07rYHPphrQGbPpGT+Fdz1Upg==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1675543071; bh=k/iTCyxuVr0+UN/5VqCpa3khgWrulS+7Mdhs95de6TE=;
 h=From:To:Subject:Date:MIME-Version;
 b=hLT21S/6PwNJkH8/VKGb3jATgFHSnSLQckL5e5CQeXEEzU08h7yIh9K9wM+Qmappj
 KvBLCnNGNry8sit48ByZmYS0atojsdQvnOKI+TAGE/5IU5f09r4EnbHE3Pad73FvEX
 i+F9VoIXmG8d/Ha8tntaUntxZkRIYBvZTydjnFpou7Ty4UaYUZ6UbEE85xSQBSVFQP
 qi8ELQCns7sKEfW+/nJkQteBu11bL5PEjyNIjeZVQJ4CQ9DUYKAskAZYkB8+7umgCu
 LmkkddDwr7wO04pEMbXIhldiC5pL0Y7HqyjIM4azCfgOnEQ8jJVi9jofmDzkbaQ+TF
 2hGFmVDLBhp2w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=hLT21S/6
Subject: [Buildroot] [PATCH] package/libfuse3: bump to version 3.13.1
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
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes:
http://autobuild.buildroot.net/results/a98/a984d275d949e8dc989870d2d2b6f6c7168d52bb/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/libfuse3/libfuse3.hash | 2 +-
 package/libfuse3/libfuse3.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libfuse3/libfuse3.hash b/package/libfuse3/libfuse3.hash
index 691bfbc9d6..f697f4ad3f 100644
--- a/package/libfuse3/libfuse3.hash
+++ b/package/libfuse3/libfuse3.hash
@@ -1,3 +1,3 @@
 # Locally calculated sha256 checksums
-sha256  224544214204eb348b548d6faa7a9bc91b053aacfc92e8b5da3f478c76ae4a03  libfuse3-3.13.0.tar.gz
+sha256  96399b09b91bc717a9e96ffea660d611e6a342547c1abd4d0e858b3dca9d5a13  libfuse3-3.13.1.tar.gz
 sha256  b8832d9caaa075bbbd2aef24efa09f8b7ab66a832812d88c602da0c7b4397fad  LICENSE
diff --git a/package/libfuse3/libfuse3.mk b/package/libfuse3/libfuse3.mk
index d94f7d3d3a..a2e9775868 100644
--- a/package/libfuse3/libfuse3.mk
+++ b/package/libfuse3/libfuse3.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBFUSE3_VERSION = 3.13.0
+LIBFUSE3_VERSION = 3.13.1
 LIBFUSE3_SITE = $(call github,libfuse,libfuse,fuse-$(LIBFUSE3_VERSION))
 LIBFUSE3_LICENSE = LGPL-2.1
 LIBFUSE3_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
