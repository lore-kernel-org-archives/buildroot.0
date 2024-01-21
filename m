Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68E5CC47422
	for <buildroot@archiver.kernel.org>; Sun, 21 Jan 2024 19:13:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BEDFF40136;
	Sun, 21 Jan 2024 19:13:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BEDFF40136
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eVnE6hfy5bsA; Sun, 21 Jan 2024 19:13:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E0A2940142;
	Sun, 21 Jan 2024 19:13:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E0A2940142
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 30BED1BF3C9
 for <buildroot@lists.busybox.net>; Sun, 21 Jan 2024 19:13:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 170AE813F6
 for <buildroot@lists.busybox.net>; Sun, 21 Jan 2024 19:13:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 170AE813F6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RFxUpAQckody for <buildroot@lists.busybox.net>;
 Sun, 21 Jan 2024 19:13:39 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9DA8881397
 for <buildroot@buildroot.org>; Sun, 21 Jan 2024 19:13:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9DA8881397
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 86BF0863EF; Sun, 21 Jan 2024 19:13:39 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 21 Jan 2024 20:12:12 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3825cc8a38d8cb5cf1d27557b890db099e81b39c
X-Git-Newrev: d59705cd383229eced90e0c8acc5e187b01991c2
X-Patchwork-Hint: ignore
Message-Id: <20240121191339.86BF0863EF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/highway: fix package license
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=d59705cd383229eced90e0c8acc5e187b01991c2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
