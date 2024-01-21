Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39F04C47422
	for <buildroot@archiver.kernel.org>; Sun, 21 Jan 2024 18:37:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C6AE360B0B;
	Sun, 21 Jan 2024 18:37:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C6AE360B0B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FlhZoOm_iGmB; Sun, 21 Jan 2024 18:37:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1684160ABE;
	Sun, 21 Jan 2024 18:37:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1684160ABE
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9C0BA1BF427
 for <buildroot@lists.busybox.net>; Sun, 21 Jan 2024 18:37:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7508240160
 for <buildroot@lists.busybox.net>; Sun, 21 Jan 2024 18:37:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7508240160
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1Zy1UZLUcoto for <buildroot@lists.busybox.net>;
 Sun, 21 Jan 2024 18:37:38 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 615B840142
 for <buildroot@buildroot.org>; Sun, 21 Jan 2024 18:37:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 615B840142
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:64fe:9015:874f:9d44])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 842F913F8BA;
 Sun, 21 Jan 2024 19:37:35 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 21 Jan 2024 19:37:28 +0100
Message-ID: <20240121183728.50314-1-ju.o@free.fr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1705862256;
 bh=xDUVtg2ARN4O34Pg7uC8TGLxS7j5p+XBhUQx4WwaG1I=;
 h=From:To:Cc:Subject:Date:From;
 b=lgpbRsEgAmThSQRbT8oigGBxR0ya/GjXWOxQ99qrep9sDN+AY7D8CTQpaNpBbUgCQ
 8vbZINc8cQ4isZ9EduugVvXgC1hRasfzdOr8cgumDseIeqviVQ79zIbIzhr3aMvbZl
 N/Jthq7VxH9wdLuGvRLLljqgoV+dQGfUUjndJH0XhNYCJYWiESdmfru5PMs9SlOJmn
 9ZkEj7gr3ohjz5ne62bVTQJt2rqv7nE7XGz3+9xtACcNKlxJ6vI6aX6iRmjnzKVrRs
 fYQTuuArveJp7iJud+fQmB+8pDZpLRZZZQwyCkiLxAdBO5jH6D5f2dL/A7jVYHjaFp
 ooNIkYIjK8vbg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=lgpbRsEg
Subject: [Buildroot] [PATCH 1/1] package/highway: fix package license
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
Cc: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit 0db3c08daf "package/highway: bump to version 1.0.7" updated the
package, but forgot to update the legal information accordingly.

Highway was relicensed from "Apache-2.0" (only) to dual "Apache-2.0 or
BSD-3-Clause" in upstream commit [1]. This commit was first included
in Highway version 1.0.6. See [2].

This commit updates _LICENSE, _LICENSE_FILES and adds the new license
hash.

[1] https://github.com/google/highway/commit/92a7139f88e534378fb2525abb919ac79d894f82
[2] https://github.com/google/highway/releases/tag/1.0.6

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/highway/highway.hash | 1 +
 package/highway/highway.mk   | 4 ++--
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/highway/highway.hash b/package/highway/highway.hash
index 55b1bca774..3cb497f20a 100644
--- a/package/highway/highway.hash
+++ b/package/highway/highway.hash
@@ -1,3 +1,4 @@
 # Locally computed:
 sha256  5434488108186c170a5e2fca5e3c9b6ef59a1caa4d520b008a9b8be6b8abe6c5  highway-1.0.7.tar.gz
 sha256  43070e2d4e532684de521b885f385d0841030efa2b1a20bafb76133a5e1379c1  LICENSE
+sha256  6dcc159f448e3aca73a15e355d0a6735ca3fd224abe637e0b7437dce2d24f765  LICENSE-BSD3
diff --git a/package/highway/highway.mk b/package/highway/highway.mk
index 692794959a..bb87e5fc0d 100644
--- a/package/highway/highway.mk
+++ b/package/highway/highway.mk
@@ -6,8 +6,8 @@
 
 HIGHWAY_VERSION = 1.0.7
 HIGHWAY_SITE = $(call github,google,highway,$(HIGHWAY_VERSION))
-HIGHWAY_LICENSE = Apache-2.0
-HIGHWAY_LICENSE_FILES = LICENSE
+HIGHWAY_LICENSE = Apache-2.0 or BSD-3-Clause
+HIGHWAY_LICENSE_FILES = LICENSE LICENSE-BSD3
 HIGHWAY_INSTALL_STAGING = YES
 
 HIGHWAY_CXXFLAGS = $(TARGET_CXXFLAGS)
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
