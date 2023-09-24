Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13E17CE7A8A
	for <buildroot@archiver.kernel.org>; Sun, 24 Sep 2023 19:09:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C270A60ADE;
	Sun, 24 Sep 2023 19:09:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C270A60ADE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GNjvUP-ZiLvq; Sun, 24 Sep 2023 19:09:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EF12560E50;
	Sun, 24 Sep 2023 19:09:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EF12560E50
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EC5261BF2A9
 for <buildroot@lists.busybox.net>; Sun, 24 Sep 2023 19:05:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 54DE9819D2
 for <buildroot@lists.busybox.net>; Sun, 24 Sep 2023 19:05:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 54DE9819D2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dQppRlyTFAC3 for <buildroot@lists.busybox.net>;
 Sun, 24 Sep 2023 19:05:52 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id BCA5E81A23
 for <buildroot@buildroot.org>; Sun, 24 Sep 2023 19:05:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BCA5E81A23
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BB090875A9; Sun, 24 Sep 2023 19:05:52 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 24 Sep 2023 20:46:04 +0200
X-Git-Refname: refs/heads/2023.05.x
X-Git-Oldrev: de8bec014bc7d65dc4bd74404a74030366588284
X-Git-Newrev: b6354a5744f930870cf7e9eb450cd725ef4b2fb0
X-Patchwork-Hint: ignore
Message-Id: <20230924190552.BB090875A9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.05.x] package/hwloc: security
 bump to version 2.9.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=b6354a5744f930870cf7e9eb450cd725ef4b2fb0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.05.x

Fix CVE-2022-47022: An issue was discovered in open-mpi hwloc 2.1.0
allows attackers to cause a denial of service or other unspecified
impacts via glibc-cpuset in topology-linux.c.

https://github.com/open-mpi/hwloc/blob/hwloc-2.9.3/NEWS
https://github.com/open-mpi/hwloc/compare/hwloc-2.9.2...hwloc-2.9.3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 7a85e0797f67a21140eab5f667156c816ff4a6ef)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/hwloc/hwloc.hash | 4 ++--
 package/hwloc/hwloc.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/hwloc/hwloc.hash b/package/hwloc/hwloc.hash
index d40315a3af..8010b857f0 100644
--- a/package/hwloc/hwloc.hash
+++ b/package/hwloc/hwloc.hash
@@ -1,5 +1,5 @@
 # From https://www.open-mpi.org/software/hwloc/v2.9/
-sha1  be2a4f299c0da7670d39724986268bfa3fac6aee  hwloc-2.9.2.tar.bz2
-sha256  0a87fdf677f8b00b567d229b6320bf6b25c693edaa43e0b85268d999d6b060cf  hwloc-2.9.2.tar.bz2
+sha1  76b49087619b46d71e18bd1131d35a5ccf5de791  hwloc-2.9.3.tar.bz2
+sha256  5c4062ce556f6d3451fc177ffb8673a2120f81df6835dea6a21a90fbdfff0dec  hwloc-2.9.3.tar.bz2
 # Locally computed
 sha256  d79a936a42f3c6cb7c8375a023d43f4435f4664d3a5a2ea6b4623cff83c7fc06  COPYING
diff --git a/package/hwloc/hwloc.mk b/package/hwloc/hwloc.mk
index 6f3b8069e6..8fe9e648a7 100644
--- a/package/hwloc/hwloc.mk
+++ b/package/hwloc/hwloc.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 HWLOC_VERSION_MAJOR = 2.9
-HWLOC_VERSION = $(HWLOC_VERSION_MAJOR).2
+HWLOC_VERSION = $(HWLOC_VERSION_MAJOR).3
 HWLOC_SOURCE = hwloc-$(HWLOC_VERSION).tar.bz2
 HWLOC_SITE = https://download.open-mpi.org/release/hwloc/v$(HWLOC_VERSION_MAJOR)
 HWLOC_LICENSE = BSD-3-Clause
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
