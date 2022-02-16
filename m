Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFE54C433F5
	for <buildroot@archiver.kernel.org>; Wed, 16 Feb 2022 13:14:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 52660832C7;
	Wed, 16 Feb 2022 13:14:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0bXL-ZVJEQ7l; Wed, 16 Feb 2022 13:14:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9EC7C83280;
	Wed, 16 Feb 2022 13:14:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 182531BF5A6
 for <buildroot@lists.busybox.net>; Wed, 16 Feb 2022 13:14:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 046CA40525
 for <buildroot@lists.busybox.net>; Wed, 16 Feb 2022 13:14:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nb6TCbmSXK2r for <buildroot@lists.busybox.net>;
 Wed, 16 Feb 2022 13:14:35 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D496440125
 for <buildroot@buildroot.org>; Wed, 16 Feb 2022 13:14:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id D2780821A9; Wed, 16 Feb 2022 13:06:55 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 16 Feb 2022 14:14:17 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 91f241b8e967d114076cd4e5533213b8f2fb27ce
X-Git-Newrev: 8bb2db8cb1ec1ad4580ccd939dfa62bd84fa3011
X-Patchwork-Hint: ignore
Message-Id: <20220216130655.D2780821A9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qt5/qt5location: remove unused
 qt5location-mapboxgl
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

commit: https://git.buildroot.net/buildroot/commit/?id=8bb2db8cb1ec1ad4580ccd939dfa62bd84fa3011
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This was only needed when the mapboxgl submodule was a separate
package(was never included in buildroot only a patch series).

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/qt5/qt5location/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/qt5/qt5location/Config.in b/package/qt5/qt5location/Config.in
index b811f9a590..3d91adaf1f 100644
--- a/package/qt5/qt5location/Config.in
+++ b/package/qt5/qt5location/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_QT5LOCATION
 	bool "qt5location"
 	select BR2_PACKAGE_QT5BASE_GUI
-	select BR2_PACKAGE_QT5LOCATION_MAPBOXGL
 	help
 	  Qt is a cross-platform application and UI framework for
 	  developers using C++.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
