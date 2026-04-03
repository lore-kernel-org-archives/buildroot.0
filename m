Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6008BE8537A
	for <buildroot@archiver.kernel.org>; Fri,  3 Apr 2026 17:32:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2315D608F7;
	Fri,  3 Apr 2026 17:32:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zytnP9fM1Y_J; Fri,  3 Apr 2026 17:32:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 46CBA60E9C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775237534;
	bh=4LQr4N4o/NqKwCOs2dUQ9OvB8uDthSJ4n+KJSYT/X9w=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ZAxCR42yXcCclcoh8Ar7OM7+UBXkhIM/rB8lxAzKRHvGd9GACSj+SxdDmyFGchNZo
	 ZHZi7WQoY5YgngTCp2GLdxCYfefsjyrFDLD54X7QJ4rLlKiUd//MtUkzEDYVUaCbG/
	 VJKHtl7QCaK2JBtIaK4fwAZQH5h3LHNciXx2Fi251UIN5H1wwrL5a7kigkQ6IykHMK
	 P2mXpoYRqsgAgziqJhC0fO032KksLRMlCRq9w/nLKFKFKm5YWrIysK/WS9vnW8MH6s
	 THFfr+jc0ZVHEZ61ExdcpU6aDO9PtrgLqLcuxg7gGszBgHk40iIHiZyS5XnG5+HSkb
	 guPjjuVUuY+fw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 46CBA60E9C;
	Fri,  3 Apr 2026 17:32:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3EF212CC
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 17:32:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 304A48230C
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 17:32:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LmIyQSlLDhgJ for <buildroot@buildroot.org>;
 Fri,  3 Apr 2026 17:32:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4ED3D82305
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4ED3D82305
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 17:32:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BBB98800EC; Fri,  3 Apr 2026 17:32:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 3 Apr 2026 19:31:24 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 545de5af036737a5515b3f17259ee2a12f889db3
X-Git-Newrev: d28468b921e1e86c0a46502d574e26e293844702
X-Patchwork-Hint: ignore
Message-Id: <20260403173211.BBB98800EC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/kodi-pvr-mythtv: bump version to
 21.3.3
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d28468b921e1e86c0a46502d574e26e293844702
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/janbar/pvr.mythtv/blob/21.3.3-Omega/pvr.mythtv/changelog.txt

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/kodi-pvr-mythtv/kodi-pvr-mythtv.hash | 2 +-
 package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-pvr-mythtv/kodi-pvr-mythtv.hash b/package/kodi-pvr-mythtv/kodi-pvr-mythtv.hash
index c187fb0054..dde8406aae 100644
--- a/package/kodi-pvr-mythtv/kodi-pvr-mythtv.hash
+++ b/package/kodi-pvr-mythtv/kodi-pvr-mythtv.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  47d058a9bd960ccdc3352b2fac6f4aeb7587bad50cf1daee20d643c5e64deeb2  kodi-pvr-mythtv-21.2.15-Omega.tar.gz
+sha256  8dbbc12e5b95adeda229a572e24202abda52284f59a96c30798d7d3a855f6a42  kodi-pvr-mythtv-21.3.3-Omega.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk b/package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk
index 9b1b336dfd..9ab39ac092 100644
--- a/package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk
+++ b/package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_MYTHTV_VERSION = 21.2.15-Omega
+KODI_PVR_MYTHTV_VERSION = 21.3.3-Omega
 KODI_PVR_MYTHTV_SITE = $(call github,janbar,pvr.mythtv,$(KODI_PVR_MYTHTV_VERSION))
 KODI_PVR_MYTHTV_LICENSE = GPL-2.0+
 KODI_PVR_MYTHTV_LICENSE_FILES = LICENSE.md
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
