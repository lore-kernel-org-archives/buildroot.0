Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CC1FC43458
	for <buildroot@archiver.kernel.org>; Fri,  3 Jul 2026 14:26:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0715460ABA;
	Fri,  3 Jul 2026 14:26:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MmKyPXnHCOKx; Fri,  3 Jul 2026 14:26:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 31CA860A55
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783088807;
	bh=bk3xxaqrzUPJDrM4re0bdyXjswsVtfA38PBecEqHeEU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=L1XhRbFQnLT/jCOvNERMnK2+1YW/e9HAF3fYxhkkLlvgm9l8ZHu+56RZzs7svdxH2
	 AOC4Q/llD0+0pAabl5rWwm7pAjqIdKQOFE6GLMoqX6Y/4qBo/p9PBPkb83AZdObbeP
	 SdPW0MCGuac/N5VHHwfP28rDw5eZ4aEknEdbDplL4C5BrRtsBML2z5bJBieCnlsSAJ
	 A/XTnUDAPAx3loKX88AOgx2rF1DGTLy0gGX56QmZzwwH4SQHn4FIoK/Zy7uZ3tyDTX
	 7rO45ZVABi8qJJ/mSD9usUlbZ1B2JoXzLDbk9sO9xnPw6T2i6an9EwYbqz03YvEX6X
	 zMNTH62WkZJyw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 31CA860A55;
	Fri,  3 Jul 2026 14:26:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7BC7214F
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 14:26:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6E6C740640
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 14:26:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YsoN09LZXoI9 for <buildroot@buildroot.org>;
 Fri,  3 Jul 2026 14:26:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 868494008F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 868494008F
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 14:26:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 19DDE883A4; Fri,  3 Jul 2026 14:26:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 2 Jul 2026 21:30:23 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 04f1d0f1b9f50bb8b213da521c77cb129472501f
X-Git-Newrev: 5df5aff9caa43c896551b7c54e08114a32a3f669
X-Patchwork-Hint: ignore
Message-Id: <20260703142615.19DDE883A4@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/libarchive:
 security bump version to 3.8.8
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/5df5aff9caa43c896551b7c54e08114a32a3f669
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

https://github.com/libarchive/libarchive/releases/tag/v3.8.8
"Libarchive 3.8.8 is a security, bugfix and minor feature release."

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
(cherry picked from commit c384895981eb7d98a8ba5067566601772db0258b)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/libarchive/libarchive.hash | 6 +++---
 package/libarchive/libarchive.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libarchive/libarchive.hash b/package/libarchive/libarchive.hash
index 665259f2b6..dccb2cc4a7 100644
--- a/package/libarchive/libarchive.hash
+++ b/package/libarchive/libarchive.hash
@@ -1,6 +1,6 @@
-# From https://github.com/libarchive/libarchive/releases/tag/v3.8.7
+# From https://github.com/libarchive/libarchive/releases/tag/v3.8.8
 # After verifying the pgp signature from:
-# https://www.libarchive.de/downloads/libarchive-3.8.7.tar.xz.asc
-sha256  d3a8ba457ae25c27c84fd2830a2efdcc5b1d40bf585d4eb0d35f47e99e5d4774  libarchive-3.8.7.tar.xz
+# https://www.libarchive.de/downloads/libarchive-3.8.8.tar.xz.asc
+sha256  3873a88801da067d0528a989af06877710529d50ee8fe6f3970cbb4302efb918  libarchive-3.8.8.tar.xz
 # Locally computed:
 sha256  30e556b3959e3985d66efefec5eaac51d4995053caa1d3cffe6eb916f146f229  COPYING
diff --git a/package/libarchive/libarchive.mk b/package/libarchive/libarchive.mk
index f11f5d8f6f..23cb82f7b5 100644
--- a/package/libarchive/libarchive.mk
+++ b/package/libarchive/libarchive.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBARCHIVE_VERSION = 3.8.7
+LIBARCHIVE_VERSION = 3.8.8
 LIBARCHIVE_SOURCE = libarchive-$(LIBARCHIVE_VERSION).tar.xz
 LIBARCHIVE_SITE = https://www.libarchive.de/downloads
 LIBARCHIVE_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
