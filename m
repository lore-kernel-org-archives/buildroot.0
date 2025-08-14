Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9061ACA0EE4
	for <buildroot@archiver.kernel.org>; Thu, 14 Aug 2025 19:56:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 620A180DBA;
	Thu, 14 Aug 2025 19:56:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k2d8w8A6AhIm; Thu, 14 Aug 2025 19:56:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D933A80D43
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D933A80D43;
	Thu, 14 Aug 2025 19:56:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1C08C1BA
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 19:56:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4231640467
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 19:56:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9Pg9G1mbTeno for <buildroot@buildroot.org>;
 Thu, 14 Aug 2025 19:56:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9D27140485
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9D27140485
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 19:56:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9B00A87407; Thu, 14 Aug 2025 19:56:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 14 Aug 2025 09:26:10 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 6058704b1ddf4ce2a939aeec835b86047d7cd84f
X-Git-Newrev: c407ccec92b359382b1eef42312e61c40d9b91b3
X-Patchwork-Hint: ignore
Message-Id: <20250814195611.9B00A87407@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/libhtp: security
 bump to v0.5.51
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

commit: https://git.buildroot.net/buildroot/commit/?id=c407ccec92b359382b1eef42312e61c40d9b91b3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

For more information on the release, see:
 - https://github.com/OISF/libhtp/releases/tag/0.5.51
 - https://github.com/OISF/libhtp/releases/tag/0.5.50
 - https://github.com/OISF/libhtp/compare/0.5.49...0.5.51

This fixes the following vulnerability:

- CVE-2025-53537

    LibHTP is a security-aware parser for the HTTP protocol and its
    related bits and pieces. In versions 0.5.50 and below, there is a
    traffic-induced memory leak that can starve the process of memory,
    leading to loss of visibility. To workaround this issue, set
    `suricata.yaml app-layer.protocols.http.libhtp.default-config.lzma-
    enabled` to false. This issue is fixed in version 0.5.51.

For more information, see:
  - https://www.cve.org/CVERecord?id=CVE-2025-53537
  - https://github.com/OISF/libhtp/security/advisories/GHSA-v3qq-h8mh-vph7

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 0e450a0b0837e74d1378c25c1254dfc3696c3262)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/libhtp/libhtp.hash | 2 +-
 package/libhtp/libhtp.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libhtp/libhtp.hash b/package/libhtp/libhtp.hash
index 2e93586f7a..11105f8586 100644
--- a/package/libhtp/libhtp.hash
+++ b/package/libhtp/libhtp.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  214395f8b42011154e133dfb4e94d15e4e3e3e12535e744a4c1eec8687d12c18  libhtp-0.5.49.tar.gz
+sha256  699475c2e512d5af05312e808f1f759a5d3c4cb154e73d82eaa6906ceacfaeb4  libhtp-0.5.51.tar.gz
 sha256  87c93904e5434c81622ea690c2b90097b9f162aaa92a96542649a157dbf98d15  LICENSE
diff --git a/package/libhtp/libhtp.mk b/package/libhtp/libhtp.mk
index bb6559bc92..a986a79f1d 100644
--- a/package/libhtp/libhtp.mk
+++ b/package/libhtp/libhtp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBHTP_VERSION = 0.5.49
+LIBHTP_VERSION = 0.5.51
 LIBHTP_SITE = $(call github,OISF,libhtp,$(LIBHTP_VERSION))
 LIBHTP_LICENSE = BSD-3-Clause
 LIBHTP_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
