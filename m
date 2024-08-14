Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAD76C3DA4A
	for <buildroot@archiver.kernel.org>; Wed, 14 Aug 2024 18:07:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7368F40111;
	Wed, 14 Aug 2024 18:07:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0CQJYsBf6sqv; Wed, 14 Aug 2024 18:07:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2EC8340C1D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2EC8340C1D;
	Wed, 14 Aug 2024 18:07:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 400831BF574
 for <buildroot@lists.busybox.net>; Wed, 14 Aug 2024 18:07:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1CB2F81355
 for <buildroot@lists.busybox.net>; Wed, 14 Aug 2024 18:07:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vVwhqjXof9p7 for <buildroot@lists.busybox.net>;
 Wed, 14 Aug 2024 18:07:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EB961810C9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id EB961810C9
 for <buildroot@buildroot.org>; Wed, 14 Aug 2024 18:07:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E2FD881376; Wed, 14 Aug 2024 18:07:24 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 14 Aug 2024 20:00:08 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2a547e2c424ac08d8741dc557aee968f1b659735
X-Git-Newrev: a631d5b3da2db55f3209546bb6a8bf0c67924cb6
X-Patchwork-Hint: ignore
Message-Id: <20240814180724.E2FD881376@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qt6tools: fix missing host-qt6base
 dependency
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1017432308847477747=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1017432308847477747==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=a631d5b3da2db55f3209546bb6a8bf0c67924cb6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This adds the host dependency host-qt6base as host-qt6tools requires the
Qt cmake modules to be installed.

Fixes:

	$ make qt6tools
	(...)
	CMake Error at CMakeLists.txt:21 (find_package):
	  Could not find a package configuration file provided by "Qt6" (requested
	  version 6.7.2) with any of the following names:

	    Qt6Config.cmake
	    qt6-config.cmake

	  Add the installation prefix of "Qt6" to CMAKE_PREFIX_PATH or set "Qt6_DIR"
	  to a directory containing one of the above files.  If "Qt6" provides a
	  separate development package or SDK, be sure it has been installed.

Signed-off-by: Gaël PORTAY <gael.portay@rtone.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/qt6/qt6tools/qt6tools.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/qt6/qt6tools/qt6tools.mk b/package/qt6/qt6tools/qt6tools.mk
index d996f75b34..09c986cfc6 100644
--- a/package/qt6/qt6tools/qt6tools.mk
+++ b/package/qt6/qt6tools/qt6tools.mk
@@ -41,5 +41,7 @@ ifeq ($(BR2_PACKAGE_QT6DECLARATIVE),y)
 QT6TOOLS_DEPENDENCIES += qt6declarative
 endif
 
+HOST_QT6TOOLS_DEPENDENCIES = host-qt6base
+
 $(eval $(cmake-package))
 $(eval $(host-cmake-package))

--===============1017432308847477747==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1017432308847477747==--
