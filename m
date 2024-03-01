Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BDB6C5475B
	for <buildroot@archiver.kernel.org>; Fri,  1 Mar 2024 21:04:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4EB308376D;
	Fri,  1 Mar 2024 21:04:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id k_CmXjRQOx2T; Fri,  1 Mar 2024 21:04:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 636CF838C9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 636CF838C9;
	Fri,  1 Mar 2024 21:04:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0FA941BF2EF
 for <buildroot@lists.busybox.net>; Fri,  1 Mar 2024 21:04:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1FB5E610DB
 for <buildroot@lists.busybox.net>; Fri,  1 Mar 2024 21:04:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IM9eXy-xlAWW for <buildroot@lists.busybox.net>;
 Fri,  1 Mar 2024 21:04:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1921E61AEF
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1921E61AEF
 for <buildroot@buildroot.org>; Fri,  1 Mar 2024 21:04:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F376F87E1A; Fri,  1 Mar 2024 21:04:10 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 1 Mar 2024 22:01:19 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0073b3631f1b18a050506326061365e62756324c
X-Git-Newrev: 2d5e2a87760467595f7086d89671563f61fd3acb
X-Patchwork-Hint: ignore
Message-Id: <20240301210410.F376F87E1A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libxml2: security bump to version
 2.12.5
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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

commit: https://git.buildroot.net/buildroot/commit/?id=2d5e2a87760467595f7086d89671563f61fd3acb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix CVE-2024-25062: An issue was discovered in libxml2 before 2.11.7 and
2.12.x before 2.12.5. When using the XML Reader interface with DTD
validation and XInclude expansion enabled, processing crafted XML
documents can lead to an xmlValidatePopElement use-after-free.

https://gitlab.gnome.org/GNOME/libxml2/-/blob/v2.12.5/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libxml2/libxml2.hash | 4 ++--
 package/libxml2/libxml2.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libxml2/libxml2.hash b/package/libxml2/libxml2.hash
index 670ff80a41..959887ab0e 100644
--- a/package/libxml2/libxml2.hash
+++ b/package/libxml2/libxml2.hash
@@ -1,4 +1,4 @@
-# From https://download.gnome.org/sources/libxml2/2.12/libxml2-2.12.3.sha256sum
-sha256  8c8f1092340a89ff32bc44ad5c9693aff9bc8a7a3e161bb239666e5d15ac9aaa  libxml2-2.12.3.tar.xz
+# From https://download.gnome.org/sources/libxml2/2.12/libxml2-2.12.5.sha256sum
+sha256  a972796696afd38073e0f59c283c3a2f5a560b5268b4babc391b286166526b21  libxml2-2.12.5.tar.xz
 # License files, locally calculated
 sha256  7fb0a66f3989f9bd5c7e5438a3de02cd4a7a47dde0aea2f7ea2ba2ff454ee6a4  Copyright
diff --git a/package/libxml2/libxml2.mk b/package/libxml2/libxml2.mk
index 1893206ccb..6070c07b03 100644
--- a/package/libxml2/libxml2.mk
+++ b/package/libxml2/libxml2.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBXML2_VERSION_MAJOR = 2.12
-LIBXML2_VERSION = $(LIBXML2_VERSION_MAJOR).3
+LIBXML2_VERSION = $(LIBXML2_VERSION_MAJOR).5
 LIBXML2_SOURCE = libxml2-$(LIBXML2_VERSION).tar.xz
 LIBXML2_SITE = \
 	https://download.gnome.org/sources/libxml2/$(LIBXML2_VERSION_MAJOR)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
