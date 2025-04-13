Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2F1CC3DA6D
	for <buildroot@archiver.kernel.org>; Mon, 19 May 2025 10:49:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8E2D5840C9;
	Mon, 19 May 2025 10:49:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oYMJYrcvHrY7; Mon, 19 May 2025 10:49:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B0E79840CA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B0E79840CA;
	Mon, 19 May 2025 10:49:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 044C4E4
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:41:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 63453412EE
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:39:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LVEFjm_7puxt for <buildroot@buildroot.org>;
 Mon, 19 May 2025 10:39:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5FBBE40734
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5FBBE40734
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:39:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 54F1A83B63; Mon, 19 May 2025 10:39:49 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 13 Apr 2025 11:33:49 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 88e4af822effd3877efea7534c8941fb7b8986da
X-Git-Newrev: 06f3d593f65cc52baddadf2c55e582f7310b2ede
X-Patchwork-Hint: ignore
Message-Id: <20250519103949.54F1A83B63@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/qoriq-rcw: bump
 version to lf-6.12.3-1.0.0-2-g45e6925
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

commit: https://git.buildroot.net/buildroot/commit/?id=06f3d593f65cc52baddadf2c55e582f7310b2ede
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Technically, this is lf-6.12.3-1.0.0 plus a few patches on top (the
current master branch). Change log:

45e692536904 rcw: ls1028a: Add configuration for audio codec usage
3c51083d0cdf lx2160asi: e100g1_split.rcw: fix parse error

The second patch is necessary to fix a build error which was signalled
previously here on the lists:
https://lore.kernel.org/buildroot/20250318213839.17470-1-vjardin@free.fr/

Signed-off-by: Vladimir Oltean <olteanv@gmail.com>
[Julien: switch _VERSION to use git describe syntax]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/qoriq-rcw/qoriq-rcw.hash | 2 +-
 package/qoriq-rcw/qoriq-rcw.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/qoriq-rcw/qoriq-rcw.hash b/package/qoriq-rcw/qoriq-rcw.hash
index b9316582ff..35e39efd1f 100644
--- a/package/qoriq-rcw/qoriq-rcw.hash
+++ b/package/qoriq-rcw/qoriq-rcw.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  bfb992fcb396894874143257b53d14394ada48df0771f7edb55324fa932bbcdc  qoriq-rcw-lf-6.6.52-2.2.0.tar.gz
+sha256  f99ef0620dc49c6a0b9d03958cdb8a3e559907351fccd4814fd37b80d1324e97  qoriq-rcw-lf-6.12.3-1.0.0-2-g45e6925.tar.gz
 sha256  68f4b15ecc085729419bc60ca6eeadca5af0237bbfec791e8a79da9c943d42e9  LICENSE
diff --git a/package/qoriq-rcw/qoriq-rcw.mk b/package/qoriq-rcw/qoriq-rcw.mk
index c536a12373..512c4ce491 100644
--- a/package/qoriq-rcw/qoriq-rcw.mk
+++ b/package/qoriq-rcw/qoriq-rcw.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QORIQ_RCW_VERSION = lf-6.6.52-2.2.0
+QORIQ_RCW_VERSION = lf-6.12.3-1.0.0-2-g45e6925
 QORIQ_RCW_SITE = $(call github,nxp-qoriq,rcw,$(QORIQ_RCW_VERSION))
 QORIQ_RCW_LICENSE = BSD-3-Clause
 QORIQ_RCW_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
