Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D0D3C0218A
	for <buildroot@archiver.kernel.org>; Sat,  1 Feb 2025 12:38:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6B59E60650;
	Sat,  1 Feb 2025 12:38:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i6iW9M3HVgVU; Sat,  1 Feb 2025 12:38:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 790E160670
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 790E160670;
	Sat,  1 Feb 2025 12:38:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8ADD512A
 for <buildroot@buildroot.org>; Sat,  1 Feb 2025 12:38:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8572560650
 for <buildroot@buildroot.org>; Sat,  1 Feb 2025 12:38:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wh0C58nrY_VP for <buildroot@buildroot.org>;
 Sat,  1 Feb 2025 12:38:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9BDF560670
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9BDF560670
 for <buildroot@buildroot.org>; Sat,  1 Feb 2025 12:38:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8C918861EC; Sat,  1 Feb 2025 12:38:39 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 1 Feb 2025 13:33:15 +0100
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: d63647b8b5193126dd018942ed8da8489d365c3c
X-Git-Newrev: 5b5ee3de7127a8a21516ba60b263df471de26285
X-Patchwork-Hint: ignore
Message-Id: <20250201123839.8C918861EC@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/openjpeg:
 security bump to version 2.5.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=5b5ee3de7127a8a21516ba60b263df471de26285
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Fixes the following security issues:

- CVE-2024-56826: A flaw was found in the OpenJPEG project.  A heap buffer
  overflow condition may be triggered when certain options are specified
  while using the opj_decompress utility.  This can lead to an application
  crash or other undefined behavior.

  https://access.redhat.com/security/cve/CVE-2024-56826

- CVE-2024-56827: A flaw was found in the OpenJPEG project.  A heap buffer
  overflow condition may be triggered when certain options are specified
  while using the opj_decompress utility.  This can lead to an application
  crash or other undefined behavior.

  https://access.redhat.com/security/cve/CVE-2024-56827

Release notes: https://github.com/uclouvain/openjpeg/blob/v2.5.3/NEWS.md

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 3bfa5ebcbf34800367a89b63aa548643e51297b4)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/openjpeg/openjpeg.hash | 2 +-
 package/openjpeg/openjpeg.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/openjpeg/openjpeg.hash b/package/openjpeg/openjpeg.hash
index 1e72054724..1992d5ca6a 100644
--- a/package/openjpeg/openjpeg.hash
+++ b/package/openjpeg/openjpeg.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  90e3896fed910c376aaf79cdd98bdfdaf98c6472efd8e1debf0a854938cbda6a  openjpeg-2.5.2.tar.gz
+sha256  368fe0468228e767433c9ebdea82ad9d801a3ad1e4234421f352c8b06e7aa707  openjpeg-2.5.3.tar.gz
 sha256  a6af136f3e15038a666b61f376612a07d9a4e48cb7c01adbf3e33b3f14ab49b6  LICENSE
diff --git a/package/openjpeg/openjpeg.mk b/package/openjpeg/openjpeg.mk
index e7cb7505e9..275659cd3c 100644
--- a/package/openjpeg/openjpeg.mk
+++ b/package/openjpeg/openjpeg.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENJPEG_VERSION = 2.5.2
+OPENJPEG_VERSION = 2.5.3
 OPENJPEG_SITE = $(call github,uclouvain,openjpeg,v$(OPENJPEG_VERSION))
 OPENJPEG_LICENSE = BSD-2-Clause
 OPENJPEG_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
