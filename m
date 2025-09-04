Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10194CA101C
	for <buildroot@archiver.kernel.org>; Thu,  4 Sep 2025 16:33:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E067940576;
	Thu,  4 Sep 2025 16:33:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Rtf3UO1xyiT5; Thu,  4 Sep 2025 16:33:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 20E9440578
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 20E9440578;
	Thu,  4 Sep 2025 16:33:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3BD4DB69
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 16:33:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A7A544009C
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 16:33:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Hx880R189WCQ for <buildroot@buildroot.org>;
 Thu,  4 Sep 2025 16:33:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5B17E4005E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5B17E4005E
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 16:33:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 49A3987E99; Thu,  4 Sep 2025 16:33:34 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 4 Sep 2025 08:51:02 +0200
X-Git-Refname: refs/heads/2025.05.x
X-Git-Oldrev: c685f32fb114d18261ff120c53135e140ccc9b7f
X-Git-Newrev: 07bbf4bc5321a771920d907234513fa6a7e17a55
X-Patchwork-Hint: ignore
Message-Id: <20250904163334.49A3987E99@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.05.x] package/libde265:
 security bump to version 1.0.16
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

commit: https://git.buildroot.net/buildroot/commit/?id=07bbf4bc5321a771920d907234513fa6a7e17a55
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.05.x

Release notes:
https://github.com/strukturag/libde265/releases/tag/v1.0.16

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 9323d69afbef49675aa2af935658079e714db7d8)
[thomas: this fixes CVE-2024-389{49,50}]
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/libde265/libde265.hash | 2 +-
 package/libde265/libde265.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libde265/libde265.hash b/package/libde265/libde265.hash
index a21a8a1265..efd48d13aa 100644
--- a/package/libde265/libde265.hash
+++ b/package/libde265/libde265.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  00251986c29d34d3af7117ed05874950c875dd9292d016be29d3b3762666511d  libde265-1.0.15.tar.gz
+sha256  b92beb6b53c346db9a8fae968d686ab706240099cdd5aff87777362d668b0de7  libde265-1.0.16.tar.gz
 sha256  02cc1585a20677992e0ba578fa692635dc193735f2691dc81de924b51c4e8020  COPYING
diff --git a/package/libde265/libde265.mk b/package/libde265/libde265.mk
index 62c22246aa..3d9b96134f 100644
--- a/package/libde265/libde265.mk
+++ b/package/libde265/libde265.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBDE265_VERSION = 1.0.15
+LIBDE265_VERSION = 1.0.16
 LIBDE265_SITE = https://github.com/strukturag/libde265/releases/download/v$(LIBDE265_VERSION)
 LIBDE265_LICENSE = LGPL-3.0+
 LIBDE265_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
