Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F21ECA1002
	for <buildroot@archiver.kernel.org>; Thu,  4 Sep 2025 16:12:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D816E8075B;
	Thu,  4 Sep 2025 16:12:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QvWgssZcDNV3; Thu,  4 Sep 2025 16:12:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 12DB88074C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 12DB88074C;
	Thu,  4 Sep 2025 16:12:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4077EB69
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 16:12:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 32A2440059
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 16:12:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m1e6iB7l2_eG for <buildroot@buildroot.org>;
 Thu,  4 Sep 2025 16:12:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7921240051
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7921240051
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 16:12:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6763C87F41; Thu,  4 Sep 2025 16:12:10 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 4 Sep 2025 17:45:10 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bbb0164de08f761a3399c961700db44befff5c70
X-Git-Newrev: b73204ed110e388e370550f0ca6e838243a15713
X-Patchwork-Hint: ignore
Message-Id: <20250904161210.6763C87F41@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rtl8188eu: fix build failure with
 linux 6.16
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=b73204ed110e388e370550f0ca6e838243a15713
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump to version 2025-09-03 on branch v5.2.2.4 to fix build failure with
Linux 6.16.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/rtl8188eu/rtl8188eu.hash | 2 +-
 package/rtl8188eu/rtl8188eu.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rtl8188eu/rtl8188eu.hash b/package/rtl8188eu/rtl8188eu.hash
index 204ee9406b..1c14791802 100644
--- a/package/rtl8188eu/rtl8188eu.hash
+++ b/package/rtl8188eu/rtl8188eu.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  e1e39a5e2682b799ec113e4d7db4b4e30259ab7d2525add8a1530da87ced0fdc  rtl8188eu-702a90b02edca722cc0d139260ba02c23f406333.tar.gz
+sha256  39e9891433cb5d3a4b1b3ec3bdc8f4e1f11892da7ab69be356616625b1230400  rtl8188eu-c3104bd094970dd5944e2b28141b552630933bde.tar.gz
 sha256  af8067302947c01fd9eee72befa54c7e3ef8a48fecde7fd71277f2290b2bf0f7  COPYING
diff --git a/package/rtl8188eu/rtl8188eu.mk b/package/rtl8188eu/rtl8188eu.mk
index 6161ffd5d6..cfe048b514 100644
--- a/package/rtl8188eu/rtl8188eu.mk
+++ b/package/rtl8188eu/rtl8188eu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RTL8188EU_VERSION = 702a90b02edca722cc0d139260ba02c23f406333
+RTL8188EU_VERSION = c3104bd094970dd5944e2b28141b552630933bde
 RTL8188EU_SITE = $(call github,benetti-engineering,rtl8188eu,$(RTL8188EU_VERSION))
 RTL8188EU_LICENSE = GPL-2.0, proprietary (rtl8188eufw.bin firmware blob)
 RTL8188EU_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
