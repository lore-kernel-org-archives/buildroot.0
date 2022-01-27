Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1D32C433F5
	for <buildroot@archiver.kernel.org>; Thu, 27 Jan 2022 16:39:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 880CF84F84;
	Thu, 27 Jan 2022 16:39:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9BK8zFc-NAWS; Thu, 27 Jan 2022 16:39:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BBC6384CF9;
	Thu, 27 Jan 2022 16:39:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 992B61C1135
 for <buildroot@lists.busybox.net>; Thu, 27 Jan 2022 16:39:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 87A1B60BDB
 for <buildroot@lists.busybox.net>; Thu, 27 Jan 2022 16:39:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eCBBHVOF7vdT for <buildroot@lists.busybox.net>;
 Thu, 27 Jan 2022 16:39:17 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id DDF0460AC9
 for <buildroot@buildroot.org>; Thu, 27 Jan 2022 16:39:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id B53E482837; Thu, 27 Jan 2022 16:32:22 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 27 Jan 2022 17:38:49 +0100
X-Git-Refname: refs/heads/2021.11.x
X-Git-Oldrev: ae2a31295c010e94483031eb1c0b8539698f5959
X-Git-Newrev: 52404bc144d9ced1b2194cff1d95ffdc2110f892
X-Patchwork-Hint: ignore
Message-Id: <20220127163222.B53E482837@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.11.x] package/gnuchess:
 security bump to version 6.2.9
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

commit: https://git.buildroot.net/buildroot/commit/?id=52404bc144d9ced1b2194cff1d95ffdc2110f892
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.11.x

Fixed potential buffer overflow in pgnload and pgnreplay
(CVE-2021-30184)

https://lists.gnu.org/archive/html/info-gnu-chess/2021-07/msg00000.html
https://git.savannah.gnu.org/cgit/chess.git/tree/NEWS?h=v6.2.9

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 85aab41ef9f818216635c9b0f64bf9c20c176135)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gnuchess/gnuchess.hash | 2 +-
 package/gnuchess/gnuchess.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gnuchess/gnuchess.hash b/package/gnuchess/gnuchess.hash
index b68eb6e0ee..0248abcf71 100644
--- a/package/gnuchess/gnuchess.hash
+++ b/package/gnuchess/gnuchess.hash
@@ -1,3 +1,3 @@
 # sha256 locally computed
-sha256  d50446cda8012240321da39cddbb4df4d08458a8d538a4738882814139583847  gnuchess-6.2.8.tar.gz
+sha256  ddfcc20bdd756900a9ab6c42c7daf90a2893bf7f19ce347420ce36baebc41890  gnuchess-6.2.9.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/gnuchess/gnuchess.mk b/package/gnuchess/gnuchess.mk
index 29d3590849..630b3aefa7 100644
--- a/package/gnuchess/gnuchess.mk
+++ b/package/gnuchess/gnuchess.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GNUCHESS_VERSION = 6.2.8
+GNUCHESS_VERSION = 6.2.9
 GNUCHESS_SITE = $(BR2_GNU_MIRROR)/chess
 GNUCHESS_LICENSE = GPL-3.0+
 GNUCHESS_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
