Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5933BC636D6
	for <buildroot@archiver.kernel.org>; Wed, 22 Feb 2023 22:24:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 008DC613B8;
	Wed, 22 Feb 2023 22:24:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 008DC613B8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UZ4ouC7LYVUW; Wed, 22 Feb 2023 22:24:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2E4EC613B6;
	Wed, 22 Feb 2023 22:24:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2E4EC613B6
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 999F01BF97A
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 22:23:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 73D9D61381
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 22:23:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 73D9D61381
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9FTVos-8-jij for <buildroot@lists.busybox.net>;
 Wed, 22 Feb 2023 22:23:56 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id AE5CB612DC
 for <buildroot@buildroot.org>; Wed, 22 Feb 2023 22:23:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AE5CB612DC
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9C95686906; Wed, 22 Feb 2023 22:23:56 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 22 Feb 2023 23:23:45 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: efe2734fc58cc6bfcc8fa1b696bba81a9797efb9
X-Git-Newrev: 02a6b77ed8214d837f7d1d43b10321ec5672fea9
X-Patchwork-Hint: ignore
Message-Id: <20230222222356.9C95686906@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/optee-client: fix
 BR2_PACKAGE_OPTEE_CLIENT_TEEACL
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=02a6b77ed8214d837f7d1d43b10321ec5672fea9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix typo added by commit 917a961d9c77d5f1aaa47206add9b9ff80e74a82
resulting in the following build failure:

-- Checking for module 'uuid'
--   Package 'uuid', required by 'virtual:world', not found
CMake Error at /tmp/instance-5/output-1/per-package/optee-client/host/share/cmake-3.22/Modules/FindPkgConfig.cmake:603 (message):
  A required package was not found
Call Stack (most recent call first):
  /tmp/instance-5/output-1/per-package/optee-client/host/share/cmake-3.22/Modules/FindPkgConfig.cmake:825 (_pkg_check_modules_internal)
  CMakeLists.txt:43 (pkg_check_modules)

Fixes:
 - http://autobuild.buildroot.org/results/e1c6b5c9e841a003037045b2ff7afd9836e7c640

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/optee-client/optee-client.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/optee-client/optee-client.mk b/package/optee-client/optee-client.mk
index 311ca191b0..ef113c838f 100644
--- a/package/optee-client/optee-client.mk
+++ b/package/optee-client/optee-client.mk
@@ -27,7 +27,7 @@ OPTEE_CLIENT_CONF_OPTS += -DCFG_TEE_SUPP_PLUGINS=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_OPTEE_CLIENT_TEEACL),y)
-OPTEE_CLIENT_EXT_DEPENDENCIES += host-pkgconf util-linux
+OPTEE_CLIENT_DEPENDENCIES += host-pkgconf util-linux
 OPTEE_CLIENT_CONF_OPTS += -DWITH_TEEACL=ON
 else
 OPTEE_CLIENT_CONF_OPTS += -DWITH_TEEACL=OFF
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
