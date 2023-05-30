Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FAEEC77B7A
	for <buildroot@archiver.kernel.org>; Tue, 30 May 2023 19:45:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C4B5A41864;
	Tue, 30 May 2023 19:45:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C4B5A41864
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7RcUBwro1Y3o; Tue, 30 May 2023 19:45:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 343BF417BA;
	Tue, 30 May 2023 19:45:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 343BF417BA
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 100151BF35F
 for <buildroot@lists.busybox.net>; Tue, 30 May 2023 19:44:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E8CD241718
 for <buildroot@lists.busybox.net>; Tue, 30 May 2023 19:44:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E8CD241718
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QGevSan8JzEQ for <buildroot@lists.busybox.net>;
 Tue, 30 May 2023 19:44:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id BBAA641726
 for <buildroot@buildroot.org>; Tue, 30 May 2023 19:44:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BBAA641726
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AAB7886A93; Tue, 30 May 2023 19:44:24 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 30 May 2023 21:40:06 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: fcc906241d326d9c5e5bf39e86c1762f50bb6c12
X-Git-Newrev: 387d2d12f33939d9eb86f7abe849110b63dfc703
X-Patchwork-Hint: ignore
Message-Id: <20230530194424.AAB7886A93@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/ncurses: security
 bump to 6.4.20230429
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

commit: https://git.buildroot.net/buildroot/commit/?id=387d2d12f33939d9eb86f7abe849110b63dfc703
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Update to 6.4 and use latest snapshot to fix CVE-2023-29491.
COPYING has been changed in snapshot 20230107 to update the year [0].
Update CVE version to major.minor.snapshot, as NVD uses the snapshot date as patch version [1].

[0]: https://github.com/ThomasDickey/ncurses-snapshots/commit/eedb756850fdddcd2767d488ed5ea323d40b37ec
[1]: https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe:2.3:a:gnu:ncurses

Signed-off-by: Daniel Lang <dalang@gmx.at>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit aee4f42ba07c603bbc7cf16b18f9706029ab5d74)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ncurses/ncurses.hash | 4 ++--
 package/ncurses/ncurses.mk   | 9 +++------
 2 files changed, 5 insertions(+), 8 deletions(-)

diff --git a/package/ncurses/ncurses.hash b/package/ncurses/ncurses.hash
index c96bf77bce..a5f83c8725 100644
--- a/package/ncurses/ncurses.hash
+++ b/package/ncurses/ncurses.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  4057d800ee96623ae70d06b05b2dadb481a80c030e4968aa5d9bcea4439441da  ncurses-6.3-20221224.tar.gz
+sha256  004603a9b3ec51599ef0a0089482004ee3d33b0240d87ce17b6f77525b51fb4e  ncurses-6.4-20230429.tar.gz
 # Locally computed
-sha256  63de87399e9fc8860236082b6b0520e068e9eb1fad0ebd30202aa30bb6f690ac  COPYING
+sha256  0413b2f4ea863194c174673032f0fca84f1ea1ed4eed6476baea68c075a631ce  COPYING
diff --git a/package/ncurses/ncurses.mk b/package/ncurses/ncurses.mk
index 73e3c3feb8..4753da299c 100644
--- a/package/ncurses/ncurses.mk
+++ b/package/ncurses/ncurses.mk
@@ -5,8 +5,8 @@
 ################################################################################
 
 # When there is no snapshost yet for a new version, set it to the empty string
-NCURSES_VERSION_MAJOR = 6.3
-NCURSES_SNAPSHOT_DATE = 20221224
+NCURSES_VERSION_MAJOR = 6.4
+NCURSES_SNAPSHOT_DATE = 20230429
 NCURSES_VERSION = $(NCURSES_VERSION_MAJOR)$(if $(NCURSES_SNAPSHOT_DATE),-$(NCURSES_SNAPSHOT_DATE))
 NCURSES_VERSION_GIT = $(subst .,_,$(subst -,_,$(NCURSES_VERSION)))
 NCURSES_SITE = $(call github,ThomasDickey,ncurses-snapshots,v$(NCURSES_VERSION_GIT))
@@ -15,12 +15,9 @@ NCURSES_DEPENDENCIES = host-ncurses
 NCURSES_LICENSE = MIT with advertising clause
 NCURSES_LICENSE_FILES = COPYING
 NCURSES_CPE_ID_VENDOR = gnu
-NCURSES_CPE_ID_VERSION = $(NCURSES_VERSION_MAJOR)
+NCURSES_CPE_ID_VERSION = $(NCURSES_VERSION_MAJOR)$(if $(NCURSES_SNAPSHOT_DATE),.$(NCURSES_SNAPSHOT_DATE))
 NCURSES_CONFIG_SCRIPTS = ncurses$(NCURSES_LIB_SUFFIX)6-config
 
-# Fixed since snapshot 20220416
-NCURSES_IGNORE_CVES += CVE-2022-29458
-
 NCURSES_CONF_OPTS = \
 	--without-cxx \
 	--without-cxx-binding \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
