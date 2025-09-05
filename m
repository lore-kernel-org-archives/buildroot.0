Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8CB1CAC581
	for <buildroot@archiver.kernel.org>; Mon,  8 Sep 2025 10:59:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9EC8B4156C;
	Mon,  8 Sep 2025 10:59:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hPzmbA1NNDv0; Mon,  8 Sep 2025 10:59:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D797041A5A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D797041A5A;
	Mon,  8 Sep 2025 10:59:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id D6A921D9
 for <buildroot@buildroot.org>; Mon,  8 Sep 2025 10:59:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C8A9F61C3A
 for <buildroot@buildroot.org>; Mon,  8 Sep 2025 10:59:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t_QvzNkKF6nj for <buildroot@buildroot.org>;
 Mon,  8 Sep 2025 10:59:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1AC116175B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1AC116175B
 for <buildroot@buildroot.org>; Mon,  8 Sep 2025 10:59:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 191F983B4D; Mon,  8 Sep 2025 10:59:18 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 5 Sep 2025 17:24:31 +0200
X-Git-Refname: refs/heads/2025.05.x
X-Git-Oldrev: d2b306ae1af03d75e3acb7664eaffc802828a2d5
X-Git-Newrev: 79809551fbf039c734e62d17d4f5de2a7793aac4
X-Patchwork-Hint: ignore
Message-Id: <20250908105918.191F983B4D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.05.x] package/proftpd: bump to
 version 1.3.8d
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

commit: https://git.buildroot.net/buildroot/commit/?id=79809551fbf039c734e62d17d4f5de2a7793aac4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.05.x

Bugfix release, fixing the following issues:

1.3.8d - Released 14-Mar-2025
--------------------------------
- Issue 1855 - Use of HideNoAccess for SFTP sessions can lead to segfault
  and/or unexpected behavior.
- Issue 1876 - SFTP channel allocations can lead to high memory utilization
  over time.

1.3.8c - Released 11-Dec-2024
--------------------------------
- Issue 1770 - Using FTPS after upgrading from 1.3.8a to 1.3.8b leads to crash.
- Issue 1785 - Bad handling of lack of extended attributes leads to SFTP out of
  memory error.
- Issue 1529 - mod_sftp_sql logs "header value too long" due to unexpected key
  header text.
- Issue 1839 - SSH ECDSA host key algorithms not be used as expected despite
  configuring appropriate key.
- Issue 1840 - RADIUS Message-Authenticator verification failed with ProFTPD
  mod_radius.
- Issue 1830 - Supplemental group inheritance grants unintended access to
  GID 0 due to lack of supplemental groups from mod_sql.

https://github.com/proftpd/proftpd/blob/1.3.8/NEWS

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 90be04d4d31c1f5dfec9cb5822fe016a4b4b9608)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/proftpd/proftpd.hash | 2 +-
 package/proftpd/proftpd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/proftpd/proftpd.hash b/package/proftpd/proftpd.hash
index 5a7d153a31..88b5906945 100644
--- a/package/proftpd/proftpd.hash
+++ b/package/proftpd/proftpd.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  183ab7c6107de271a2959ff268f55c9b6c76b2cf0029e6584fccc019686601e0  proftpd-1.3.8b.tar.gz
+sha256  42ba40d8d5a5a9f28c9dcd7f15aa6b5368fe5efceaacb999041311b170f076d5  proftpd-1.3.8d.tar.gz
 sha256  391a473d755c29b5326fb726326ff3c37e42512f53a8f5789fc310232150bf80  COPYING
diff --git a/package/proftpd/proftpd.mk b/package/proftpd/proftpd.mk
index 025fc46e45..84a499a5c0 100644
--- a/package/proftpd/proftpd.mk
+++ b/package/proftpd/proftpd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PROFTPD_VERSION = 1.3.8b
+PROFTPD_VERSION = 1.3.8d
 PROFTPD_SITE = https://github.com/proftpd/proftpd/archive/v$(PROFTPD_VERSION)
 PROFTPD_LICENSE = GPL-2.0+
 PROFTPD_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
