Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9049EC77B73
	for <buildroot@archiver.kernel.org>; Sat,  6 May 2023 15:35:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1EABB82010;
	Sat,  6 May 2023 15:35:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1EABB82010
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id R8e_USFuceS1; Sat,  6 May 2023 15:35:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3078A8142A;
	Sat,  6 May 2023 15:35:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3078A8142A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B77551BF36C
 for <buildroot@lists.busybox.net>; Sat,  6 May 2023 15:34:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 96C7341EF7
 for <buildroot@lists.busybox.net>; Sat,  6 May 2023 15:34:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 96C7341EF7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1rA85Ak_854D for <buildroot@lists.busybox.net>;
 Sat,  6 May 2023 15:34:42 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7085B4185A
 for <buildroot@buildroot.org>; Sat,  6 May 2023 15:34:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7085B4185A
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 58BFC85E31; Sat,  6 May 2023 15:34:42 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 6 May 2023 17:31:02 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f9c196598d58cecef769194df3c54466cf62459d
X-Git-Newrev: aee4f42ba07c603bbc7cf16b18f9706029ab5d74
X-Patchwork-Hint: ignore
Message-Id: <20230506153442.58BFC85E31@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ncurses: security bump to
 6.4.20230429
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

commit: https://git.buildroot.net/buildroot/commit/?id=aee4f42ba07c603bbc7cf16b18f9706029ab5d74
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update to 6.4 and use latest snapshot to fix CVE-2023-29491.
COPYING has been changed in snapshot 20230107 to update the year [0].
Update CVE version to major.minor.snapshot, as NVD uses the snapshot date as patch version [1].

[0]: https://github.com/ThomasDickey/ncurses-snapshots/commit/eedb756850fdddcd2767d488ed5ea323d40b37ec
[1]: https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe:2.3:a:gnu:ncurses

Signed-off-by: Daniel Lang <dalang@gmx.at>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
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
