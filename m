Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40AE0C6FA8F
	for <buildroot@archiver.kernel.org>; Tue, 29 Aug 2023 20:06:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E969560FCE;
	Tue, 29 Aug 2023 20:06:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E969560FCE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id w2mJtoGLbTH8; Tue, 29 Aug 2023 20:06:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3C43460F8F;
	Tue, 29 Aug 2023 20:06:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3C43460F8F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 96EDA1BF59B
 for <buildroot@lists.busybox.net>; Tue, 29 Aug 2023 20:05:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6E85281FA3
 for <buildroot@lists.busybox.net>; Tue, 29 Aug 2023 20:05:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6E85281FA3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id g0CTe9EjsRD3 for <buildroot@lists.busybox.net>;
 Tue, 29 Aug 2023 20:05:50 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9F55A8206B
 for <buildroot@buildroot.org>; Tue, 29 Aug 2023 20:05:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9F55A8206B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8F63E864AB; Tue, 29 Aug 2023 20:05:50 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 29 Aug 2023 21:59:46 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: ae370839a3e613f24da781f27d3e235b23f8181a
X-Git-Newrev: fc77f89211bfa3b0bbb121895acbbdbecd5d72f0
X-Patchwork-Hint: ignore
Message-Id: <20230829200550.8F63E864AB@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/supertuxkart: fix
 build with bluetooth enabled
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

commit: https://git.buildroot.net/buildroot/commit/?id=fc77f89211bfa3b0bbb121895acbbdbecd5d72f0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

The wiiuse code force an out-of-tree build:
https://github.com/supertuxkart/stk-code/blob/master/lib/wiiuse/cmake/cmake-4.0.0-modules/RequireOutOfSourceBuild.cmake#L41

Fixes a build error not yet caught by the autobuilders:

-- Configuring WiiUse version 0.15.5
CMake Error at lib/wiiuse/cmake/cmake-4.0.0-modules/RequireOutOfSourceBuild.cmake:41 (message):
  You must set a binary directory that is different from your source
  directory.  You might consider

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit d1e79b4c95b9ae0590f5a2155517934daaef59f1)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/supertuxkart/supertuxkart.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/supertuxkart/supertuxkart.mk b/package/supertuxkart/supertuxkart.mk
index 1f9ad4102b..6bdd512eac 100644
--- a/package/supertuxkart/supertuxkart.mk
+++ b/package/supertuxkart/supertuxkart.mk
@@ -44,6 +44,7 @@ SUPERTUXKART_CONF_OPTS = -DBUILD_SHARED_LIBS=OFF \
 ifeq ($(BR2_PACKAGE_BLUEZ5_UTILS),y)
 SUPERTUXKART_DEPENDENCIES += bluez5_utils
 SUPERTUXKART_CONF_OPTS += -DUSE_WIIUSE=ON -DUSE_SYSTEM_WIIUSE=ON
+SUPERTUXKART_SUPPORTS_IN_SOURCE_BUILD = NO
 else
 # Wiimote support relies on bluez5.
 SUPERTUXKART_CONF_OPTS += -DUSE_WIIUSE=OFF
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
