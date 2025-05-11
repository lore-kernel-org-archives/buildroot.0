Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7BF6C3ABC3
	for <buildroot@archiver.kernel.org>; Sun, 11 May 2025 16:13:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4CFA9408EC;
	Sun, 11 May 2025 16:13:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ufjQDqtz0ssV; Sun, 11 May 2025 16:13:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 62A26408C8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 62A26408C8;
	Sun, 11 May 2025 16:13:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9BB8B17D
 for <buildroot@buildroot.org>; Sun, 11 May 2025 16:13:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 80CA7608FD
 for <buildroot@buildroot.org>; Sun, 11 May 2025 16:13:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nZ3i2SMHbxN6 for <buildroot@buildroot.org>;
 Sun, 11 May 2025 16:13:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A01E5608D3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A01E5608D3
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A01E5608D3
 for <buildroot@buildroot.org>; Sun, 11 May 2025 16:13:54 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b54c.dip0.t-ipconnect.de [84.161.181.76])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 36552A4C0778
 for <buildroot@buildroot.org>; Sun, 11 May 2025 18:13:40 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:59004)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1uE9J5-000000003qn-27IX
 for buildroot@buildroot.org; Sun, 11 May 2025 16:13:39 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 11 May 2025 18:13:37 +0200
Message-Id: <20250511161339.3195042-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250511161339.3195042-1-bernd@kuhls.net>
References: <20250511161339.3195042-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202412041019; t=1746980020;
 bh=IdSUQdD2wOdQYscjAE1Km+7+cr6FQDZFYllIffOY61I=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=dCerrzP1vq3JI5SNgYCNFip0hwRWlIdp06oYjND/0ufLVTzc36oxYo6GabiCrCsca
 7S781NYb/CzoFn5jr778QDBQdtaw4tC592Y5GjCOX9bmqcHBdERpqL8kE4b7WeDxjZ
 23W6BZRuSRKPWxjPbObKZRDaiNW332pwKKHDkG6LXYPpdjTvIQwuLDDpuRRvTqPDZ7
 Ob7mVZfvITN+jtOrjgvfcxh98NumIaj5kBh3/HG4oTu/6M98TOC4+KuZpSjbtz5Ffo
 arWt7j9M/qEMtfmJ8tUKlz75gHV42mjpZL4bniPA7Asl0sPApQrcbYNbdA1thzOh+W
 K9bBMyDr6bp+A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202412041019 header.b=dCerrzP1
Subject: [Buildroot] [PATCH 2/4] package/intel-mediadriver: bump version to
 25.2.1
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

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/intel-mediadriver/intel-mediadriver.hash | 2 +-
 package/intel-mediadriver/intel-mediadriver.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/intel-mediadriver/intel-mediadriver.hash b/package/intel-mediadriver/intel-mediadriver.hash
index 8b8f157f8d..9409e11a0d 100644
--- a/package/intel-mediadriver/intel-mediadriver.hash
+++ b/package/intel-mediadriver/intel-mediadriver.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  6339bba3168102f5a608f447076c9efb2a8194e847a9dac219fbc13324192a76  intel-media-25.1.4.tar.gz
+sha256  fc7ffad0ef83979247ae641b0382816129387a0dc29822dd4a78f5bc990c1b1f  intel-media-25.2.1.tar.gz
 sha256  74979d5aaee78b8da82e3aafd415a216b6131dfff6d95d6930927c8a4e3bded3  LICENSE.md
diff --git a/package/intel-mediadriver/intel-mediadriver.mk b/package/intel-mediadriver/intel-mediadriver.mk
index a54b559e3f..8dd6d0e5ef 100644
--- a/package/intel-mediadriver/intel-mediadriver.mk
+++ b/package/intel-mediadriver/intel-mediadriver.mk
@@ -6,7 +6,7 @@
 
 # based on https://software.intel.com/en-us/articles/build-and-debug-open-source-media-stack
 
-INTEL_MEDIADRIVER_VERSION = 25.1.4
+INTEL_MEDIADRIVER_VERSION = 25.2.1
 INTEL_MEDIADRIVER_SITE = https://github.com/intel/media-driver/archive
 INTEL_MEDIADRIVER_SOURCE= intel-media-$(INTEL_MEDIADRIVER_VERSION).tar.gz
 INTEL_MEDIADRIVER_LICENSE = MIT, BSD-3-Clause
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
