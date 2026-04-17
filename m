Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3178EF436B7
	for <buildroot@archiver.kernel.org>; Fri, 17 Apr 2026 15:23:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6A536816FB;
	Fri, 17 Apr 2026 15:23:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yeOSV4ho6-vG; Fri, 17 Apr 2026 15:23:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 636C4818DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776439383;
	bh=ukBFIH61g6nEvUWSh8uiCkwexdZwnV1lI1PKPTtum2o=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=KnzgbJic0ZNmHznDOMwbC7nipKSHCGbMsUKJoHEvnO32N4Ls/VJfICL0/4WW6/r5f
	 B0LFdZXs0P7E3TKdl5c02UMCepAO4zMeLqlTDWqTNWAOofrNYDcroqRw4CJApl59b3
	 5YQt+VKVsLvrqQmdJKKF4SRsNBqT7WjRXj+UzBYxA+ElgXuUMJHTzTXW+yBAtzDdqU
	 HShyu+QIafZp4z77vQGDonZo5coWUO18VkMiSo3ioIuJ3zHQI68sRW6RrwN2GaWS7X
	 A7ojEiy8Rpb7uZl+pqxwHuFBJxexNTBAUp0W9q+pVG5mw1EMUwQ8U1Ngj1Ory9k0xU
	 8jW3biuP+FgJw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 636C4818DC;
	Fri, 17 Apr 2026 15:23:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2710C259
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 15:22:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6312C60E1F
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 15:22:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qxWkkBybnBgq for <buildroot@buildroot.org>;
 Fri, 17 Apr 2026 15:22:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BDDFC60E25
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id BDDFC60E25
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 15:22:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6ECEC81DD5; Fri, 17 Apr 2026 15:22:46 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 17 Apr 2026 17:21:06 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: bbfbabcc50b7b051a9fde67c0c37ce2739846c19
X-Git-Newrev: d29bfbd6a3e8b6101207971bbc127a796470647e
X-Patchwork-Hint: ignore
Message-Id: <20260417152246.6ECEC81DD5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] package/libde265:
 security bump version to 1.0.18
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d29bfbd6a3e8b6101207971bbc127a796470647e
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

https://github.com/strukturag/libde265/releases/tag/v1.0.18

https://github.com/strukturag/libde265/releases/tag/v1.0.17
Fixes CVE-2026-33164 & CVE-2026-33165.

Used sha256 tarball hash provided by upstream.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit d4b8a42fb253116befe539e5529ac4efd97ab421)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/libde265/libde265.hash | 3 ++-
 package/libde265/libde265.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/libde265/libde265.hash b/package/libde265/libde265.hash
index efd48d13aa..d977af5521 100644
--- a/package/libde265/libde265.hash
+++ b/package/libde265/libde265.hash
@@ -1,3 +1,4 @@
+# From https://github.com/strukturag/libde265/releases/tag/v1.0.18
+sha256  800478f3bf35f0621b14928ceb317579f3e8b23de4bd2aac29b6cb8be962bbd8  libde265-1.0.18.tar.gz
 # Locally computed
-sha256  b92beb6b53c346db9a8fae968d686ab706240099cdd5aff87777362d668b0de7  libde265-1.0.16.tar.gz
 sha256  02cc1585a20677992e0ba578fa692635dc193735f2691dc81de924b51c4e8020  COPYING
diff --git a/package/libde265/libde265.mk b/package/libde265/libde265.mk
index 3d9b96134f..aab86ab3d7 100644
--- a/package/libde265/libde265.mk
+++ b/package/libde265/libde265.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBDE265_VERSION = 1.0.16
+LIBDE265_VERSION = 1.0.18
 LIBDE265_SITE = https://github.com/strukturag/libde265/releases/download/v$(LIBDE265_VERSION)
 LIBDE265_LICENSE = LGPL-3.0+
 LIBDE265_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
