Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56847FF8850
	for <buildroot@archiver.kernel.org>; Fri, 24 Apr 2026 21:41:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1B6E34097F;
	Fri, 24 Apr 2026 21:41:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Wjd2BdICq_uH; Fri, 24 Apr 2026 21:41:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 317F940980
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777066900;
	bh=NJjQODzcKS3NWAlm7e0u1Ed43RVAd1a+RO9KD1TOXqA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=XITbte2VlgAZOeKHlbYZjeUdWAKPxWUXJ8Y9t3vJzi1z4DM3zuRj2odk0XGr4akMa
	 yQp9Xyl4RbyXvm0w5/DiIe4yoXFoZOEHl5oSQhleIBwi76UxRiHmXo5BGkqNNIxb1m
	 EmqYG2WG1Kc3FSWOZNB5BufQ4yV/8qYf5D9aHwDsP1gsP7yB6Xho4NA0OBg2c7uLpC
	 wKyV0wBJN2tpG4DLh2i04Lzy2c9vYgQrhpeiEfeFJ4WPCEwz7XREOiaEAFkC82Nxea
	 byFLnPtsNKS383VAeEemLDNcoRmDU738babQSowdzLlTVOSpju9vShp2UWPFKaLN6G
	 gfapL5uG3n3WA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 317F940980;
	Fri, 24 Apr 2026 21:41:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 208FA2DF
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 21:41:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B35F760688
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 21:41:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6ty516gCzOcH for <buildroot@buildroot.org>;
 Fri, 24 Apr 2026 21:41:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6C16C605BA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6C16C605BA
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 21:41:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2167E832DB; Fri, 24 Apr 2026 21:41:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 24 Apr 2026 23:31:29 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5e917c3a81f131a0d8555a81a43fe106b11bda02
X-Git-Newrev: a7d76a7ab3915ffb62eaf95ffa9f4de491652861
X-Patchwork-Hint: ignore
Message-Id: <20260424214135.2167E832DB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/neon: bump version to 0.37.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/a7d76a7ab3915ffb62eaf95ffa9f4de491652861
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/notroj/neon/blob/0.37.1/NEWS

Updated license hash due to a copyright year bump:
https://github.com/notroj/neon/commit/dc575f32f479895762548bdeb0b4ff81e929047f

This bump depends on the bump of davfs2 to 1.7.3.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/neon/neon.hash | 4 ++--
 package/neon/neon.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/neon/neon.hash b/package/neon/neon.hash
index d773b0f316..c5964ba669 100644
--- a/package/neon/neon.hash
+++ b/package/neon/neon.hash
@@ -1,6 +1,6 @@
 # Locally computed
-sha256  659a5cc9cea05e6e7864094f1e13a77abbbdbab452f04d751a8c16a9447cf4b8  neon-0.33.0.tar.gz
+sha256  a99b7262525a454d1065cf76dd17240fd808dfc4ef15636990ff83a5d0d9e740  neon-0.37.1.tar.gz
 # Hash for license files
-sha256  6c4f5d59a60a66cc970642c0f3799cf03b40a81c9dccbc4a254f20487d143f74  README.md
+sha256  a982d694ca4b8c3ae8b05bf07c701e7e8c7013a416356caa0746354d2d86c7e1  README.md
 sha256  d7bf9d064ac3e5840f9dd02422b7eeec4f1fd03f37fadbd043602be5e882304f  src/COPYING.LIB
 sha256  91df39d1816bfb17a4dda2d3d2c83b1f6f2d38d53e53e41e8f97ad5ac46a0cad  test/COPYING
diff --git a/package/neon/neon.mk b/package/neon/neon.mk
index 39abbaef48..71bad567a1 100644
--- a/package/neon/neon.mk
+++ b/package/neon/neon.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NEON_VERSION = 0.33.0
+NEON_VERSION = 0.37.1
 NEON_SITE = https://notroj.github.io/neon
 NEON_LICENSE = LGPL-2.0+ (library), GPL-2.0+ (manual and tests)
 NEON_LICENSE_FILES = src/COPYING.LIB test/COPYING README.md
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
