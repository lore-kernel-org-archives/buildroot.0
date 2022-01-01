Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3789DC433EF
	for <buildroot@archiver.kernel.org>; Sat,  1 Jan 2022 10:08:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CCC6B60E24;
	Sat,  1 Jan 2022 10:08:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uX3tsLH4AUzz; Sat,  1 Jan 2022 10:08:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 341C760E1B;
	Sat,  1 Jan 2022 10:08:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6C1181BF5A4
 for <buildroot@lists.busybox.net>; Sat,  1 Jan 2022 10:08:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5AC688140B
 for <buildroot@lists.busybox.net>; Sat,  1 Jan 2022 10:08:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5Bh_EPIH1_eY for <buildroot@lists.busybox.net>;
 Sat,  1 Jan 2022 10:08:14 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id CC94381402
 for <buildroot@buildroot.org>; Sat,  1 Jan 2022 10:08:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id B232F817FB; Sat,  1 Jan 2022 10:02:18 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 1 Jan 2022 11:07:52 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ae54331db305f30c6c958ca64d9e6c63b7ae9e50
X-Git-Newrev: d18582d94152f541beab4478deded4053c554bc1
X-Patchwork-Hint: ignore
Message-Id: <20220101100218.B232F817FB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ogre: disable csharp
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

commit: https://git.buildroot.net/buildroot/commit/?id=d18582d94152f541beab4478deded4053c554bc1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Disable csharp to avoid the following build failure with python since
bump to version 1.12.12 in commit
4e814227caa0a5d190e36cd5174239fe5c627279 and
https://github.com/OGRECave/ogre/commit/3fd839c76a153e614c9e3131ff9959234099e749:

/bin/sh: 1: mcs: not found

Fixes:
 - http://autobuild.buildroot.org/results/5f384dbed8e5241f91072bfffa54ba6b9c509751

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Acked-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/ogre/ogre.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/ogre/ogre.mk b/package/ogre/ogre.mk
index 72c96cb33a..72fd616c0c 100644
--- a/package/ogre/ogre.mk
+++ b/package/ogre/ogre.mk
@@ -33,6 +33,7 @@ OGRE_CXXFLAGS = $(TARGET_CXXFLAGS) -DGLEW_NO_GLU
 # Disable java and nvidia cg support.
 # Disable imgui overlay to avoid extra download from CMake.
 OGRE_CONF_OPTS = -DOGRE_BUILD_DEPENDENCIES=OFF \
+	-DOGRE_BUILD_COMPONENT_CSHARP=OFF \
 	-DOGRE_BUILD_COMPONENT_JAVA=OFF \
 	-DOGRE_BUILD_PLUGIN_CG=OFF \
 	-DOGRE_BUILD_COMPONENT_OVERLAY_IMGUI=OFF \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
