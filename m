Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71ED2CCA470
	for <buildroot@archiver.kernel.org>; Tue,  7 Oct 2025 17:49:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E7FEC607AC;
	Tue,  7 Oct 2025 17:49:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F-ysvgJ3UJDY; Tue,  7 Oct 2025 17:49:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 272B8607B8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 272B8607B8;
	Tue,  7 Oct 2025 17:49:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id EA973119
 for <buildroot@buildroot.org>; Tue,  7 Oct 2025 17:49:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DC13F607AD
 for <buildroot@buildroot.org>; Tue,  7 Oct 2025 17:49:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cZe8pCLFd9EG for <buildroot@buildroot.org>;
 Tue,  7 Oct 2025 17:49:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.57;
 helo=smtpcmd0757.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org DB4396078B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DB4396078B
Received: from smtpcmd0757.aruba.it (smtpcmd0757.aruba.it [62.149.156.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DB4396078B
 for <buildroot@buildroot.org>; Tue,  7 Oct 2025 17:49:10 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id 6BoBvMw2VlGps6BoBvpxfR; Tue, 07 Oct 2025 19:49:08 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 James Hilliard <james.hilliard1@gmail.com>
Date: Tue,  7 Oct 2025 19:49:07 +0200
Message-ID: <20251007174907.2414724-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfMmSzeCaGORr/WFyIQo7+75kZV19HqmFSZShvnYu9a8hbaBv5hRMLszKKF57YhjuSLINxs3OEMoxQok11/dXdTqiRt/isjVk4dPdf8xiOyh5eFB88FqF
 vv7lrRDMpRYVSmdzrw63xZY8JzizChMFGJnQit9RPdMCKbioYGrfm+YvtlZJzVHwQSOAQN81Hl2YMzpjNQt0DiLVz/ar3bhuYT2dYHbVam46Rh1wq+0yd5dA
 GPT9/zpr+QZGylxxkn8maxCwvlKvpWq2239ChhAWkDZEBiXzXAiXccqP2nBprh8Gy0+ogKEHAs/w5WmWK0J4RQ==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1759859348; bh=2kHqCg+39boqPUsMn8XfJJgacPAzvIjZuUvBKP19UA4=;
 h=From:To:Subject:Date:MIME-Version;
 b=QGYpqSBXnyskQZfK6bB2WNU25J9bP6wh4wbx9JFB/dI+mOO6KR6FcBhzcvW8VpY5m
 efe5Yib+75JyBWPfjP4UEPwvq1fRCrO7hiprPx1N2cwrcCeOc61zNGeYQp1REo2++0
 v6IB3LDSbpgA3I4w6YaTGFc58LgsMML7p0u6blZrkpYR/e+MV1vBLRSMDJEknjHytE
 vFERczUXNLTHiVtDm6+NajIown3yWX6/rMredAYEX/OEEqU3PqZORXeDGmQFoHrlyX
 JqAUzTeXhXgZyjb6R5fcfaLP0iiS+BdOacMERjsh0ecnB0K1vHaHy8VTtsNJz750r8
 SGZW/dX9FLAxQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=QGYpqSBX
Subject: [Buildroot] [PATCH] package/rtl8192eu: bump to 2025-08-12 version
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This version allows to build with Linux 6.17.

Fixes:
still not occured.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/rtl8192eu/rtl8192eu.hash | 2 +-
 package/rtl8192eu/rtl8192eu.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rtl8192eu/rtl8192eu.hash b/package/rtl8192eu/rtl8192eu.hash
index 847a0d4fc6..42055cb194 100644
--- a/package/rtl8192eu/rtl8192eu.hash
+++ b/package/rtl8192eu/rtl8192eu.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256  6cb82ae3c5c5cf783b9150035459ecb4a13aaa614d0a8bb3ab938d54f4feeb74  rtl8192eu-0a170fe9a9cd75ea4df3c209fa4a02f9858483e5.tar.gz
+sha256  19e1686d6841f572d3274c96e3e4b66544027d559f5d4da528d8c8510f7d34e6  rtl8192eu-ee928d5dc065f328043711c271eb54f008e6245c.tar.gz
diff --git a/package/rtl8192eu/rtl8192eu.mk b/package/rtl8192eu/rtl8192eu.mk
index ebd376c475..d96389edf0 100644
--- a/package/rtl8192eu/rtl8192eu.mk
+++ b/package/rtl8192eu/rtl8192eu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RTL8192EU_VERSION = 0a170fe9a9cd75ea4df3c209fa4a02f9858483e5
+RTL8192EU_VERSION = ee928d5dc065f328043711c271eb54f008e6245c
 RTL8192EU_SITE = $(call github,clnhub,rtl8192eu-linux,$(RTL8192EU_VERSION))
 RTL8192EU_LICENSE = GPL-2.0
 
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
