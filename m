Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C806EB64DD
	for <buildroot@archiver.kernel.org>; Fri, 21 Jul 2023 21:32:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B53DF40128;
	Fri, 21 Jul 2023 21:32:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B53DF40128
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rmFmuO0ObPus; Fri, 21 Jul 2023 21:32:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DDE8041892;
	Fri, 21 Jul 2023 21:32:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DDE8041892
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 23ACA1BF983
 for <buildroot@lists.busybox.net>; Fri, 21 Jul 2023 21:32:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F1DE340128
 for <buildroot@lists.busybox.net>; Fri, 21 Jul 2023 21:32:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F1DE340128
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AvKoQ28ty_jy for <buildroot@lists.busybox.net>;
 Fri, 21 Jul 2023 21:32:35 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 32E3F4185F
 for <buildroot@buildroot.org>; Fri, 21 Jul 2023 21:32:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 32E3F4185F
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1EA267FB2C; Fri, 21 Jul 2023 21:32:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 21 Jul 2023 23:31:22 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9613092610729177f060bea62708fe3d81c0536b
X-Git-Newrev: 771fa83920c593fd89593fda1a8a276d2ed8b3a2
X-Patchwork-Hint: ignore
Message-Id: <20230721213235.1EA267FB2C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/kodi: disable clang support
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

commit: https://git.buildroot.net/buildroot/commit/?id=771fa83920c593fd89593fda1a8a276d2ed8b3a2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When present kodi tries to use the target binary of clang-format
https://github.com/xbmc/xbmc/blob/master/cmake/modules/buildtools/FindClangFormat.cmake
causing a build error.

To fix the problem disable clang-format support.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/kodi/kodi.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/kodi/kodi.mk b/package/kodi/kodi.mk
index 7cbc1df40a..aff272d014 100644
--- a/package/kodi/kodi.mk
+++ b/package/kodi/kodi.mk
@@ -78,6 +78,7 @@ KODI_CONF_OPTS += \
 	-DENABLE_INTERNAL_SPDLOG=OFF \
 	-DKODI_DEPENDSBUILD=OFF \
 	-DENABLE_GOLD=OFF \
+	-DCLANG_FORMAT_EXECUTABLE=OFF \
 	-DHOST_CAN_EXECUTE_TARGET=FALSE \
 	-DNATIVEPREFIX=$(HOST_DIR) \
 	-DDEPENDS_PATH=$(STAGING_DIR)/usr \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
