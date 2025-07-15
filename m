Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F80BC83F38
	for <buildroot@archiver.kernel.org>; Thu, 17 Jul 2025 20:22:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5BF1A60813;
	Thu, 17 Jul 2025 20:22:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zA-uzJlyOGoe; Thu, 17 Jul 2025 20:22:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 812FD607BA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 812FD607BA;
	Thu, 17 Jul 2025 20:22:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 10A69226
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 20:22:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1013460813
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 20:22:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m80_Ia3kCjaF for <buildroot@buildroot.org>;
 Thu, 17 Jul 2025 20:22:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 87DA06085B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 87DA06085B
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 20:22:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 854EC8670B; Thu, 17 Jul 2025 20:22:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 15 Jul 2025 18:35:02 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 1124ffcd17052bf01f2b8cecefecbac7af7fb540
X-Git-Newrev: 13c5d154e749f95094e664f9a37c489fc9743af7
X-Patchwork-Hint: ignore
Message-Id: <20250717202236.854EC8670B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/libhtp: security
 bump to version 0.5.49
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=13c5d154e749f95094e664f9a37c489fc9743af7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Fixes a potential Denial of Service as described in [1].
Release notes:
https://github.com/OISF/libhtp/releases/tag/0.5.49

Fixes:
https://www.cve.org/CVERecord?id=CVE-2024-45797

[1] https://github.com/OISF/libhtp/security/advisories/GHSA-rqqp-24ch-248f

Signed-off-by: Tim Soubry <tim.soubry@mind.be>
[Julien: add link to fixed CVE]
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 3cf709e3312b5ceb4933a953a897e38014978c86)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/libhtp/libhtp.hash | 2 +-
 package/libhtp/libhtp.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libhtp/libhtp.hash b/package/libhtp/libhtp.hash
index 1809bc93a3..2e93586f7a 100644
--- a/package/libhtp/libhtp.hash
+++ b/package/libhtp/libhtp.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  7f0719732fd0c82f9915e3df27e31548798590ad624fbad24f58b50885248ab8  libhtp-0.5.48.tar.gz
+sha256  214395f8b42011154e133dfb4e94d15e4e3e3e12535e744a4c1eec8687d12c18  libhtp-0.5.49.tar.gz
 sha256  87c93904e5434c81622ea690c2b90097b9f162aaa92a96542649a157dbf98d15  LICENSE
diff --git a/package/libhtp/libhtp.mk b/package/libhtp/libhtp.mk
index 8735f593d9..bb6559bc92 100644
--- a/package/libhtp/libhtp.mk
+++ b/package/libhtp/libhtp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBHTP_VERSION = 0.5.48
+LIBHTP_VERSION = 0.5.49
 LIBHTP_SITE = $(call github,OISF,libhtp,$(LIBHTP_VERSION))
 LIBHTP_LICENSE = BSD-3-Clause
 LIBHTP_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
