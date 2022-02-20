Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01691C433EF
	for <buildroot@archiver.kernel.org>; Sun, 20 Feb 2022 21:29:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A1BBE402C5;
	Sun, 20 Feb 2022 21:29:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bVe3eWPSH3w5; Sun, 20 Feb 2022 21:29:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D9382402E2;
	Sun, 20 Feb 2022 21:29:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C96FA1BF3D7
 for <buildroot@lists.busybox.net>; Sun, 20 Feb 2022 21:29:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C61C760AAB
 for <buildroot@lists.busybox.net>; Sun, 20 Feb 2022 21:29:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2IHdEwftzE7e for <buildroot@lists.busybox.net>;
 Sun, 20 Feb 2022 21:29:17 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 136AA606F5
 for <buildroot@buildroot.org>; Sun, 20 Feb 2022 21:29:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 3CA33821A5; Sun, 20 Feb 2022 21:21:27 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 20 Feb 2022 22:27:23 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 46390b3a7c47420b7523b8f18276f3ccd49940c7
X-Git-Newrev: 3c10bb052d94cb9d96881344d149a29a6bfb73b5
X-Patchwork-Hint: ignore
Message-Id: <20220220212127.3CA33821A5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/zfs: replace PYTHON_VERSION_MAJOR
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

commit: https://git.buildroot.net/buildroot/commit/?id=3c10bb052d94cb9d96881344d149a29a6bfb73b5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Replace PYTHON_VERSION_MAJOR by PYTHON3_VERSION_MAJOR now that python2
has been dropped. It should be noted that PYTHON_SITE_PKG was wrongly
set since the addition of the package in commit
4470bc9914d730383db86f58bc86fb09739622dc

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/zfs/zfs.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/zfs/zfs.mk b/package/zfs/zfs.mk
index 6b542f5c05..dbda8aceb4 100644
--- a/package/zfs/zfs.mk
+++ b/package/zfs/zfs.mk
@@ -44,7 +44,7 @@ ZFS_CONF_ENV += \
 	PYTHON_CPPFLAGS="`$(STAGING_DIR)/usr/bin/python3-config --includes`" \
 	PYTHON_LIBS="`$(STAGING_DIR)/usr/bin/python3-config --ldflags`" \
 	PYTHON_EXTRA_LIBS="`$(STAGING_DIR)/usr/bin/python3-config --libs --embed`" \
-	PYTHON_SITE_PKG="/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages"
+	PYTHON_SITE_PKG="/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages"
 ZFS_CONF_OPTS += --enable-pyzfs
 else
 ZFS_CONF_OPTS += --disable-pyzfs --without-python
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
