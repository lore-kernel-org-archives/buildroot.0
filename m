Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3005EB64DD
	for <buildroot@archiver.kernel.org>; Tue, 18 Jul 2023 22:18:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4D21860FE0;
	Tue, 18 Jul 2023 22:18:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4D21860FE0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mCRL9WR97T8c; Tue, 18 Jul 2023 22:18:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9DEB96103B;
	Tue, 18 Jul 2023 22:18:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9DEB96103B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 135111BF2CA
 for <buildroot@lists.busybox.net>; Tue, 18 Jul 2023 22:18:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DF23B6104B
 for <buildroot@lists.busybox.net>; Tue, 18 Jul 2023 22:18:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DF23B6104B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mN1yepu7j7fr for <buildroot@lists.busybox.net>;
 Tue, 18 Jul 2023 22:18:34 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D4DC36105B
 for <buildroot@buildroot.org>; Tue, 18 Jul 2023 22:18:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D4DC36105B
Received: from fli4l.lan.fli4l (p54a1b341.dip0.t-ipconnect.de [84.161.179.65])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 0A954A4C024D
 for <buildroot@buildroot.org>; Wed, 19 Jul 2023 00:18:32 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:51698)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qLt1b-0001VR-2d
 for buildroot@buildroot.org; Wed, 19 Jul 2023 00:18:31 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed, 19 Jul 2023 00:18:31 +0200
Message-Id: <20230718221831.3070494-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1689718712;
 bh=MBbsWPq7eR5MwEv2pvuxeGwMClA7FAaViHhRRJpBTRQ=;
 h=From:To:Subject:Date:From;
 b=sFp6gWqdRgpdVKPAoceX9rlg0w3yfh7997u3Nqro2aaECeAGBaPTkT/w2wLOoMjik
 KWwrc/p4iMzIZ1KUoXqwnjzh5+Iawq4UF9773NAD3aIQnv8BgcwWVo0r3VxDFcxmds
 ZfXlK0AKshZOD7Gl05rHLNlBZcC3JlgXZcc23SPtB0Fc/OkSaxLp3T5HWYzg4BAK2x
 G69a4IqvrD0kxICfumhhUjlUvOPfl2fv1UuOBXYzIG7lVB9QpBN8CnWf+5DU5L6JPi
 CZBDTl7mzH8bwyWlxe5N5g9kpwVdXbjSiBtZ0yXnWfVOmPwKj4czkbux8+Z9vQtEJ5
 8uo1O2yO3byKA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=sFp6gWqd
Subject: [Buildroot] [PATCH 1/1] package/kodi: disable clang support
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

When present kodi tries to use the target binary of clang-format
https://github.com/xbmc/xbmc/blob/master/cmake/modules/buildtools/FindClangFormat.cmake
causing a build error.

To fix the problem disable clang-format support.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/kodi/kodi.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/kodi/kodi.mk b/package/kodi/kodi.mk
index 561f0d2e3a..4fe6ea46cc 100644
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
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
