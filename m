Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9F1FCD3439
	for <buildroot@archiver.kernel.org>; Mon,  4 May 2026 14:48:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8342D41C8A;
	Mon,  4 May 2026 14:48:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 722zRky3kS6G; Mon,  4 May 2026 14:48:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A688441C8D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777906123;
	bh=eU4M4EOHO3uXJ3QkNniGmlMSnaxs2Fc9EtauQ95AzyM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=WXb/oqzXbCAiUG9St660Qa8S6NgdTXv+HG/HLXOBXjgibx3bXvqSvKWbWpZuUHDHx
	 sayOGRjAYqd8SFn4Ci4NgrGRZMpwASxOuSxYku3UHyZ0uaLlZE1EjGr24dNU0yRfpw
	 Jwy31qgejh2MetJW9W4H6IF9KtHlQ9kf0MU0Jg8vYxz6PEAP7YUG0wEaT/gYlu9Ev8
	 yCdNCL4nKVaFtNHZO7DCaVD8PYAsWHhGc+7tTwCt1tyEiE1OKfvGlFI/n+zXV1M7RO
	 /bUWtXzCzOMdKUOLM49ISmZzeweiA3oIT9c8W6T9/lxQVRJktAW6e2yXiT6O3o5Ag+
	 gz87HymS8lg/Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A688441C8D;
	Mon,  4 May 2026 14:48:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0A9C230A
 for <buildroot@buildroot.org>; Mon,  4 May 2026 14:48:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F138041C66
 for <buildroot@buildroot.org>; Mon,  4 May 2026 14:48:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HZnMmuu_op1U for <buildroot@buildroot.org>;
 Mon,  4 May 2026 14:48:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2D89A41C7D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2D89A41C7D
 for <buildroot@buildroot.org>; Mon,  4 May 2026 14:48:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0247B84367; Mon,  4 May 2026 14:48:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 30 Apr 2026 13:51:28 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: c83584617406dbd4904034d70d16426b8fd2dc6d
X-Git-Newrev: 94e54141f918784a1c8d9bbb5ca6383310fedff5
X-Patchwork-Hint: ignore
Message-Id: <20260504144839.0247B84367@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] package/libspdm: security
 bump version to 3.8.2
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/94e54141f918784a1c8d9bbb5ca6383310fedff5
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

https://github.com/DMTF/libspdm/releases/tag/3.8.2

This release brings a fix for the security issues described in
https://github.com/DMTF/libspdm/security/advisories/GHSA-j54w-759w-xj3m
https://github.com/DMTF/libspdm/security/advisories/GHSA-m4wc-xmvg-369f

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 80898249b7e06d409a8a9cd433d687ce24c5224f)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/libspdm/libspdm.hash | 2 +-
 package/libspdm/libspdm.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libspdm/libspdm.hash b/package/libspdm/libspdm.hash
index 1c7b6b3158..0e281a5471 100644
--- a/package/libspdm/libspdm.hash
+++ b/package/libspdm/libspdm.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  2184a586bfe030218c6f336750d0fb0c3747fcfb0ed8af9a921bccb567029671  libspdm-3.8.1.tar.gz
+sha256  8d53d5072540ff86ffe496d83b83f49c82792883738bd23ae6ad41fe7c773edf  libspdm-3.8.2.tar.gz
 sha256  8c891ecf439cca84ceab33fc819c029a72c198f31818aa53a3788a0553841d6e  LICENSE.md
diff --git a/package/libspdm/libspdm.mk b/package/libspdm/libspdm.mk
index f76262c77b..fc3eea424e 100644
--- a/package/libspdm/libspdm.mk
+++ b/package/libspdm/libspdm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBSPDM_VERSION = 3.8.1
+LIBSPDM_VERSION = 3.8.2
 LIBSPDM_SITE = $(call github,DMTF,libspdm,$(LIBSPDM_VERSION))
 LIBSPDM_LICENSE = BSD-3-Clause
 LIBSPDM_LICENSE_FILES = LICENSE.md
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
