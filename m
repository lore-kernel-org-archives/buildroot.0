Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1092C001DC
	for <buildroot@archiver.kernel.org>; Thu, 13 Jul 2023 20:20:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 55219416F0;
	Thu, 13 Jul 2023 20:20:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 55219416F0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Klq5dnJc04Ih; Thu, 13 Jul 2023 20:20:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9FDAE40B96;
	Thu, 13 Jul 2023 20:20:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9FDAE40B96
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 80B031BF3D0
 for <buildroot@lists.busybox.net>; Thu, 13 Jul 2023 20:20:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 59B6983EDC
 for <buildroot@lists.busybox.net>; Thu, 13 Jul 2023 20:20:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 59B6983EDC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VSEzxffEQ7cq for <buildroot@lists.busybox.net>;
 Thu, 13 Jul 2023 20:20:30 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D2ADB83ECA
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D2ADB83ECA
 for <buildroot@buildroot.org>; Thu, 13 Jul 2023 20:20:29 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0896.dip0.t-ipconnect.de [91.58.8.150])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id C519DA4C0160
 for <buildroot@buildroot.org>; Thu, 13 Jul 2023 22:20:24 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:36476)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qK2nY-0003ZC-0n
 for buildroot@buildroot.org; Thu, 13 Jul 2023 22:20:24 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 13 Jul 2023 22:20:24 +0200
Message-Id: <20230713202024.1662441-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1689279624;
 bh=uoIOMklHgBvMq24nYVXfHxrve4yPIyxnq6XFgZPhyMQ=;
 h=From:To:Subject:Date:From;
 b=oU+mvOi3tAz1MhAZu+hruV01GhGEWHll2SRq5n06yMY+csTaaEs+4bAshqTIHddoa
 1PGgC+gJUvWm4j88HBpE8jxzSMm11CM8DJ1RYedLyqIN0mqjIs0HoYg76pyEykUMkw
 Eo1yFa5qcgiPfFKBBD9L4NZkiqLyYGS/cIf1INZzSJ0OKJ57gqNMoMAV5lehzSdKP2
 pyVZD0yh4FUFF2I0gNrY0Yp9X2WAfm1tGLpywfh5cMUCVNPEahccJLaIfUUwYE4v+P
 BfezOQkl/q6W5cDQFsD6Q/4mQ1iazFU06q+3YnwJQFj0GG2YrepmhAC4+d1mR3+vmK
 yihS8npl4WcqQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=oU+mvOi3
Subject: [Buildroot] [PATCH 1/1] package/ghostscript: security bump version
 to 10.01.2
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

Fixes CVE-2023-36664:
https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2023-36664

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/ghostscript/ghostscript.hash | 4 ++--
 package/ghostscript/ghostscript.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/ghostscript/ghostscript.hash b/package/ghostscript/ghostscript.hash
index 30c45a5a74..2e4b6ac750 100644
--- a/package/ghostscript/ghostscript.hash
+++ b/package/ghostscript/ghostscript.hash
@@ -1,5 +1,5 @@
-# From https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs10011/SHA512SUMS
-sha512  d944be9e8aef68d1176d64c40db6fa86d55d0c9e30047f2147c02806ab61cfe9ac2cb00d4e5b218ff3c51cc6ed47ceffe1bac4dd9d4cc1760b7974f30c6c2735  ghostscript-10.01.1.tar.xz
+# From https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs10012/SHA512SUMS
+sha512  ee20f0e12f553a3d04578e71a0d45defebc71117ce4dc2c14043985bfe7348ad7f8b2fe98fc9b4f5b935ecb32e50dc340be67d6ef58190542ec6d0f9da1de380  ghostscript-10.01.2.tar.xz
 
 # Hash for license file:
 sha256  8ce064f423b7c24a011b6ebf9431b8bf9861a5255e47c84bfb23fc526d030a8b  LICENSE
diff --git a/package/ghostscript/ghostscript.mk b/package/ghostscript/ghostscript.mk
index d215afccd2..8a39d4b695 100644
--- a/package/ghostscript/ghostscript.mk
+++ b/package/ghostscript/ghostscript.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GHOSTSCRIPT_VERSION = 10.01.1
+GHOSTSCRIPT_VERSION = 10.01.2
 GHOSTSCRIPT_SOURCE = ghostscript-$(GHOSTSCRIPT_VERSION).tar.xz
 GHOSTSCRIPT_SITE = https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs$(subst .,,$(GHOSTSCRIPT_VERSION))
 GHOSTSCRIPT_LICENSE = AGPL-3.0
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
