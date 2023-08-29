Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 394DEC83F12
	for <buildroot@archiver.kernel.org>; Tue, 29 Aug 2023 17:03:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E2FB141559;
	Tue, 29 Aug 2023 17:03:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E2FB141559
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6uCvY_vW86h4; Tue, 29 Aug 2023 17:03:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F173C41558;
	Tue, 29 Aug 2023 17:03:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F173C41558
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7E3D21BF3EA
 for <buildroot@lists.busybox.net>; Tue, 29 Aug 2023 17:03:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 57F7D4152A
 for <buildroot@lists.busybox.net>; Tue, 29 Aug 2023 17:03:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 57F7D4152A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lXTH774N8g7K for <buildroot@lists.busybox.net>;
 Tue, 29 Aug 2023 17:03:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 89A764154D
 for <buildroot@buildroot.org>; Tue, 29 Aug 2023 17:03:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 89A764154D
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 779808649C; Tue, 29 Aug 2023 17:03:09 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 29 Aug 2023 18:46:40 +0200
X-Git-Refname: refs/heads/2023.05.x
X-Git-Oldrev: c2019a9f186837e5613696a34f65bd8db7757acf
X-Git-Newrev: 867a993aeaebfa54c7154c872dcfcda1e2cf0737
X-Patchwork-Hint: ignore
Message-Id: <20230829170309.779808649C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.05.x] package/kodi: disable
 clang support
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

commit: https://git.buildroot.net/buildroot/commit/?id=867a993aeaebfa54c7154c872dcfcda1e2cf0737
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.05.x

When present kodi tries to use the target binary of clang-format
https://github.com/xbmc/xbmc/blob/master/cmake/modules/buildtools/FindClangFormat.cmake
causing a build error.

To fix the problem disable clang-format support.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 771fa83920c593fd89593fda1a8a276d2ed8b3a2)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/kodi/kodi.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/kodi/kodi.mk b/package/kodi/kodi.mk
index 70ed270555..0a76f8a4db 100644
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
