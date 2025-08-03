Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4D62C87FCA
	for <buildroot@archiver.kernel.org>; Sun,  3 Aug 2025 15:48:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7769D40F70;
	Sun,  3 Aug 2025 15:48:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v8ELGbFfBikQ; Sun,  3 Aug 2025 15:48:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8A3D640ED4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8A3D640ED4;
	Sun,  3 Aug 2025 15:48:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id AA68A1A2
 for <buildroot@buildroot.org>; Sun,  3 Aug 2025 15:48:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8C9B360D5E
 for <buildroot@buildroot.org>; Sun,  3 Aug 2025 15:48:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AVMu0vpl8YZM for <buildroot@buildroot.org>;
 Sun,  3 Aug 2025 15:48:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9F9CE606E0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9F9CE606E0
 for <buildroot@buildroot.org>; Sun,  3 Aug 2025 15:48:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 98E7786E1E; Sun,  3 Aug 2025 15:48:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 3 Aug 2025 17:40:04 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e834d23cd792ee57ea80f37ce01d9d50756dba1d
X-Git-Newrev: a3569f03fc13763247d4a4c2c44fee26ad9b2be9
X-Patchwork-Hint: ignore
Message-Id: <20250803154839.98E7786E1E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/iwd: bump version to 3.9
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=a3569f03fc13763247d4a4c2c44fee26ad9b2be9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog (see [1]):

  ver 3.9:
    Fix issue with Access Point mode and frequency unlocking.
    Fix issue with network configuration and BSS retry logic.
    Fix issue with handling busy notification from Access Point.
    Fix issue with handling P-192, P-224 and P-521 for SAE.

  ver 3.8:
    Fix issue with handling unit tests and missing kernel features.

  ver 3.7:
    Fix issue with handling length of EncryptedSecurity.
    Fix issue with handling empty affinities lists.
    Fix issue with handling survey scanning results.
    Fix issue with handling duplicate values in DPP URI.

  ver 3.6:
    Fix issue with handling blacklisting and roaming requests.
    Fix issue with handling CQM thresholds for FullMAC devices.
    Add support for PMKSA when using FullMAC devices.

  ver 3.5:
    Add support for option to disable blacklist handling.
    Add support for option to disable SAE for broken drivers.

  ver 3.4:
    Add support for the Test Anything Protocol.

  ver 3.3:
    Fix issue with handling External Authentication.

  ver 3.2:
    Fix issue with GCC 15 and -std=c23 build errors.
    Add support for using PMKSA over SAE if available.
    Add support for HighUtilization/StationCount thresholds.
    Add support for disabling Multicast RX option.

  ver 3.1:
    Fix issue with handling OWE transition BSS selection.
    Fix issue with handling oper class 136 starting frequency.

[1] https://git.kernel.org/pub/scm/network/wireless/iwd.git/tree/ChangeLog?h=3.9

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/iwd/iwd.hash | 2 +-
 package/iwd/iwd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/iwd/iwd.hash b/package/iwd/iwd.hash
index b0a72efd7a..22e5ac3335 100644
--- a/package/iwd/iwd.hash
+++ b/package/iwd/iwd.hash
@@ -1,5 +1,5 @@
 # From https://mirrors.edge.kernel.org/pub/linux/network/wireless/sha256sums.asc
-sha256  bd167ab368b6ba302b6c948a4f41f02d233a12e20d5094b1c0393325309f8a60  iwd-3.0.tar.xz
+sha256  0cd7dc9b32b9d6809a4a5e5d063b5c5fd279f5ad3a0bf03d7799da66df5cad45  iwd-3.9.tar.xz
 
 # License files
 sha256  ec60b993835e2c6b79e6d9226345f4e614e686eb57dc13b6420c15a33a8996e5  COPYING
diff --git a/package/iwd/iwd.mk b/package/iwd/iwd.mk
index 3a178795da..de90b2d346 100644
--- a/package/iwd/iwd.mk
+++ b/package/iwd/iwd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IWD_VERSION = 3.0
+IWD_VERSION = 3.9
 IWD_SOURCE = iwd-$(IWD_VERSION).tar.xz
 IWD_SITE = $(BR2_KERNEL_MIRROR)/linux/network/wireless
 IWD_LICENSE = LGPL-2.1+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
