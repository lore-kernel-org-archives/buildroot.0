Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97348CCD1AB
	for <buildroot@archiver.kernel.org>; Wed, 22 Oct 2025 16:37:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6BA1F613C2;
	Wed, 22 Oct 2025 16:37:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gB8EL6sxjCSS; Wed, 22 Oct 2025 16:37:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 811806125B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 811806125B;
	Wed, 22 Oct 2025 16:37:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 624F343F
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 16:36:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0E33441014
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 16:36:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JpDrwAzSqwzx for <buildroot@buildroot.org>;
 Wed, 22 Oct 2025 16:36:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C78D04114D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C78D04114D
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 16:36:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C58C087722; Wed, 22 Oct 2025 16:36:34 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 22 Oct 2025 18:35:43 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: eb8e5161f9c399f78d830e8239069f97977c1388
X-Git-Newrev: de8924dc6c5ececb7ca356abe086945393280a98
X-Patchwork-Hint: ignore
Message-Id: <20251022163634.C58C087722@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/selinux-python:
 install modules to site-packages dir
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=de8924dc6c5ececb7ca356abe086945393280a98
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

/usr/lib/python$(PYTHON3_VERSION_MAJOR) is for the standard library,
additional modules like this should go to site-packages.

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 43b8f57afdc145eadf114eb089c9c6aa1162cdb9)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/selinux-python/selinux-python.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/selinux-python/selinux-python.mk b/package/selinux-python/selinux-python.mk
index 3ea461b37e..d29e21cc9b 100644
--- a/package/selinux-python/selinux-python.mk
+++ b/package/selinux-python/selinux-python.mk
@@ -14,7 +14,7 @@ SELINUX_PYTHON_MAKE_OPTS += \
 	$(TARGET_CONFIGURE_OPTS) \
 	ARCH="$(BR2_ARCH)" \
 	LIBDIR="$(STAGING_DIR)/usr/lib" \
-	PYTHONLIBDIR="usr/lib/python$(PYTHON3_VERSION_MAJOR)"
+	PYTHONLIBDIR="usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages"
 
 ifeq ($(BR2_PACKAGE_SELINUX_PYTHON_AUDIT2ALLOW),y)
 SELINUX_PYTHON_DEPENDENCIES += checkpolicy
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
