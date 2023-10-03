Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7879AE75457
	for <buildroot@archiver.kernel.org>; Tue,  3 Oct 2023 12:43:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 181AA4209A;
	Tue,  3 Oct 2023 12:43:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 181AA4209A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zn58ArwoBjrm; Tue,  3 Oct 2023 12:43:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E2BF541F3F;
	Tue,  3 Oct 2023 12:43:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E2BF541F3F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E65451BF352
 for <buildroot@lists.busybox.net>; Tue,  3 Oct 2023 12:43:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CCE3F82470
 for <buildroot@lists.busybox.net>; Tue,  3 Oct 2023 12:43:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CCE3F82470
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id q4qGpLXrWQWu for <buildroot@lists.busybox.net>;
 Tue,  3 Oct 2023 12:43:38 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8A65F82446
 for <buildroot@buildroot.org>; Tue,  3 Oct 2023 12:43:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8A65F82446
Received: from fli4l.lan.fli4l (p54a1b0e1.dip0.t-ipconnect.de [84.161.176.225])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id A24B5A4C1040
 for <buildroot@buildroot.org>; Tue,  3 Oct 2023 14:43:36 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:46284)
 by fli4l.lan.fli4l with esmtp (Exim 4.96.1)
 (envelope-from <bernd@kuhls.net>) id 1qnekS-0002mk-1L
 for buildroot@buildroot.org; Tue, 03 Oct 2023 14:43:36 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue,  3 Oct 2023 14:43:36 +0200
Message-Id: <20231003124336.2837869-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1696337016;
 bh=MUuqrljI6LkVN5n1R0HeWKYpmg+RO7RkDkNOeUJI8wk=;
 h=From:To:Subject:Date:From;
 b=tIR8UMNaKOKlOOQyXvSOuxh83SlDg6N+o54RmvPdu8OoyB9N/y6ssN8i9XTfuqL4k
 7VlZqeDIwrJMgGxjx+W9OHEUAJ2HvZy+dh6on70r0YpKLMI0bY/BuLkc8n7sVLsvzI
 D4rZcYU6jXoiTRV5QDNjt6Uy8nJDwn8IyJko49keyAZszJhRTarmda4+HwoZ+eyZko
 ytvOd5QpGoXlocx58hSwigpVisICcJwgGXoW+F0LpiQrp7r9JVWsMrDsJo9gAUQKri
 iXNN0c7X2r0uUKfneFOHgEwqyH/PomvH6C9tuiVgXUDmI3sQJ6vlgKlo5rV6sBga8b
 1o0hI/w+b5Tnw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=tIR8UMNa
Subject: [Buildroot] [PATCH 1/1] package/libcodec2: bump version to 1.2.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes: https://github.com/drowe67/codec2/releases/tag/1.2.0

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libcodec2/libcodec2.hash | 2 +-
 package/libcodec2/libcodec2.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libcodec2/libcodec2.hash b/package/libcodec2/libcodec2.hash
index edaa275bbc..828efa3e4d 100644
--- a/package/libcodec2/libcodec2.hash
+++ b/package/libcodec2/libcodec2.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  44015b071968d98ee326012c498db6a8308bed1a7a914ecb6d4d8e2a354a4611  libcodec2-1.1.1.tar.gz
+sha256  cbccae52b2c2ecc5d2757e407da567eb681241ff8dadce39d779a7219dbcf449  libcodec2-1.2.0.tar.gz
 sha256  9ebb6f82b7380a62ac74c5f0322c88e6744dedf2ebe1f54d6f088282b39844bf  COPYING
diff --git a/package/libcodec2/libcodec2.mk b/package/libcodec2/libcodec2.mk
index 295dd8983f..5fc190aefd 100644
--- a/package/libcodec2/libcodec2.mk
+++ b/package/libcodec2/libcodec2.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBCODEC2_VERSION = 1.1.1
-LIBCODEC2_SITE = $(call github,drowe67,codec2,v$(LIBCODEC2_VERSION))
+LIBCODEC2_VERSION = 1.2.0
+LIBCODEC2_SITE = $(call github,drowe67,codec2,$(LIBCODEC2_VERSION))
 LIBCODEC2_LICENSE = LGPL-2.1
 LIBCODEC2_LICENSE_FILES = COPYING
 LIBCODEC2_INSTALL_STAGING = YES
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
