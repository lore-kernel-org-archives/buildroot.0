Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EA05F483EC
	for <buildroot@archiver.kernel.org>; Mon, 23 Mar 2026 19:48:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2162E608E6;
	Mon, 23 Mar 2026 19:48:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hJAYjrvot83r; Mon, 23 Mar 2026 19:48:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 57CEA608EA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774295293;
	bh=WDxQfiec9g0LlCTZ8su1lCGFqY0OaNaTR7UD9zeYmsw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=YZgdR6W/MrmepOjYh/TOLZG+vlLyNuxd3bO2xY9nLfEyD57hkGvxUvjTgIDJEG5UQ
	 bkGP/F2rZuRTfaslvl5+iuVVqk8gH8U2jpotDoHxJVZMt5x7PxjeBMUBiGj+pi6xvp
	 bHWEyzt3j+w8LomzwG+PoocxeZ2F/8dC/+CrTqfDBrKmaof/p1+XdHo5Gqqka9OOJN
	 mE81lBKTHnjRl88ihFNup3/n5CL1EcQBs5aqBUk9mZ4oT6k/gGY8ilWBRqosPSyBHf
	 CWrnRdq++2C6GoeG8T+oFzg5tBQ/+q034a/0vAh/MwPrg6xaOXn5ylLVtLmymgdZjM
	 ZJZLGEHIhV0Tw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 57CEA608EA;
	Mon, 23 Mar 2026 19:48:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 993FD356
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 19:47:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7F103608B1
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 19:47:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qqD3vAAQdcpL for <buildroot@buildroot.org>;
 Mon, 23 Mar 2026 19:47:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AF37260894
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id AF37260894
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 19:47:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0E4AF84C9A; Mon, 23 Mar 2026 19:47:46 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 22 Mar 2026 12:26:01 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2942fd80790579511eb26aede562ee5bfc1ae2af
X-Git-Newrev: 72711087f22990261b58cf5780219ff1d61e9cda
X-Patchwork-Hint: ignore
Message-Id: <20260323194746.0E4AF84C9A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/kodi-pvr-zattoo: bump version to
 21.0.6-Omega
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/72711087f22990261b58cf5780219ff1d61e9cda
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/rbuehlma/pvr.zattoo/releases/tag/21.0.6-Omega

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/kodi-pvr-zattoo/kodi-pvr-zattoo.hash | 2 +-
 package/kodi-pvr-zattoo/kodi-pvr-zattoo.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-pvr-zattoo/kodi-pvr-zattoo.hash b/package/kodi-pvr-zattoo/kodi-pvr-zattoo.hash
index e4930b9fb5..ecec000e3d 100644
--- a/package/kodi-pvr-zattoo/kodi-pvr-zattoo.hash
+++ b/package/kodi-pvr-zattoo/kodi-pvr-zattoo.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  b9bf700f0ee93f0d6b87952e9420e277c384cf0d3b07dc2849f5496304104af9  kodi-pvr-zattoo-21.0.5-Omega.tar.gz
+sha256  f6df1fa29ec3778f591281f57190099bf5a510c293c711ea978497556765352f  kodi-pvr-zattoo-21.0.6-Omega.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-pvr-zattoo/kodi-pvr-zattoo.mk b/package/kodi-pvr-zattoo/kodi-pvr-zattoo.mk
index 8171939c60..2de33b26b5 100644
--- a/package/kodi-pvr-zattoo/kodi-pvr-zattoo.mk
+++ b/package/kodi-pvr-zattoo/kodi-pvr-zattoo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_ZATTOO_VERSION = 21.0.5-Omega
+KODI_PVR_ZATTOO_VERSION = 21.0.6-Omega
 KODI_PVR_ZATTOO_SITE = $(call github,rbuehlma,pvr.zattoo,$(KODI_PVR_ZATTOO_VERSION))
 KODI_PVR_ZATTOO_LICENSE = GPL-2.0+
 KODI_PVR_ZATTOO_LICENSE_FILES = LICENSE.md
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
