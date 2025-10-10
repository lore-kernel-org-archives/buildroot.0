Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4E83CCD185
	for <buildroot@archiver.kernel.org>; Fri, 10 Oct 2025 16:23:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7398B84777;
	Fri, 10 Oct 2025 16:23:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UySiw3sCUVNR; Fri, 10 Oct 2025 16:23:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7697B84760
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7697B84760;
	Fri, 10 Oct 2025 16:23:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5D9DC226
 for <buildroot@buildroot.org>; Fri, 10 Oct 2025 16:23:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4367E40F27
 for <buildroot@buildroot.org>; Fri, 10 Oct 2025 16:23:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lkDZk3JsTLPI for <buildroot@buildroot.org>;
 Fri, 10 Oct 2025 16:23:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5B3F340F06
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5B3F340F06
 for <buildroot@buildroot.org>; Fri, 10 Oct 2025 16:23:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 54A4F86F4B; Fri, 10 Oct 2025 16:23:30 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 10 Oct 2025 18:18:33 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fe0df1157c4ce3548a93625faa3ca1f9c7ae8814
X-Git-Newrev: 43b8f57afdc145eadf114eb089c9c6aa1162cdb9
X-Patchwork-Hint: ignore
Message-Id: <20251010162330.54A4F86F4B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/selinux-python: install modules to
 site-packages dir
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

commit: https://git.buildroot.net/buildroot/commit/?id=43b8f57afdc145eadf114eb089c9c6aa1162cdb9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

/usr/lib/python$(PYTHON3_VERSION_MAJOR) is for the standard library,
additional modules like this should go to site-packages.

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/selinux-python/selinux-python.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/selinux-python/selinux-python.mk b/package/selinux-python/selinux-python.mk
index 635d5945a4..27ff12ad06 100644
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
