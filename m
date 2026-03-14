Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3D7C10854B2
	for <buildroot@archiver.kernel.org>; Sat, 14 Mar 2026 22:11:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 57EE360F80;
	Sat, 14 Mar 2026 22:11:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BIUdT4Q4Bjfa; Sat, 14 Mar 2026 22:11:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7CEAA60F88
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773526292;
	bh=3f/DQABlJlG2o5h30ZP/+Ah1BCw6wJlqAzOUVE6Cq/A=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=JWHru4+KjYjutE18USkuluz3Qi3P8dCez/AZ9bIB5lDrTJ3XsV7mJfNqnAreLWasJ
	 7lITTjm9wpY/LUT1+ipyDSp1wBGJ4WdJGRxMkVRJdyU9vwVXi5GA1vJsSoQ6bashzY
	 OTmV1y2PMjgUzl8+GpuYYVgUrPdCVjrWuc/tZfPYrAZBZ/xu6S/TW/Oe2iuR87ZHde
	 /e+q995OGO+dggXQew3RnCB2ewXCzQLKqn943Oez1frRQ2Gvo6PJ4nfxkesv0g2djD
	 7MRZwmB9DTjct79170EbzQCvowYDUVAuQ6Puod7pFT7BQX1edcMYJ0oHDzcF6AAjGD
	 /zU+FripqVWbw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7CEAA60F88;
	Sat, 14 Mar 2026 22:11:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id E45A2118
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 22:11:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CA57B40519
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 22:11:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u73t9dSEK-rm for <buildroot@buildroot.org>;
 Sat, 14 Mar 2026 22:11:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 28967404B8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 28967404B8
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 22:11:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5183785E77; Sat, 14 Mar 2026 22:11:30 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 14 Mar 2026 22:57:02 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cc80c554154edf9aec9d65a49f72f685c5f21b4c
X-Git-Newrev: bdeb0d0a3208e97645e9f7771d53c14e5fb441b8
X-Patchwork-Hint: ignore
Message-Id: <20260314221130.5183785E77@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/flashrom: bump version to 1.7.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/bdeb0d0a3208e97645e9f7771d53c14e5fb441b8
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/flashrom/flashrom/blob/v1.7.0/doc/release_notes/v_1_6.rst
https://github.com/flashrom/flashrom/blob/v1.7.0/doc/release_notes/v_1_7.rst

Renamed license file and updated license hash due to upstream commit:
https://github.com/flashrom/flashrom/commit/4b370bebb7bcd45274d5734e736a2e2c90d4d307

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/flashrom/flashrom.hash | 4 ++--
 package/flashrom/flashrom.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/flashrom/flashrom.hash b/package/flashrom/flashrom.hash
index 0e1faf34e7..4ffb34720d 100644
--- a/package/flashrom/flashrom.hash
+++ b/package/flashrom/flashrom.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  3f4dc7878e962e165b7eba73104d4e61231f9d4e838eb47df6ca3d87060a2aa5  flashrom-1.5.1.tar.gz
-sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
+sha256  c5a8892158bd749aadfee6e114eec268130cdd8c2027fd1ddf44273755b07b59  flashrom-1.7.0.tar.gz
+sha256  e51c99ee054c216999e7a8db04a2e7a6b39915dccc8a58e54b48a720e0c4158a  COPYING.rst
diff --git a/package/flashrom/flashrom.mk b/package/flashrom/flashrom.mk
index f253c5f9d8..8e1fb47905 100644
--- a/package/flashrom/flashrom.mk
+++ b/package/flashrom/flashrom.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-FLASHROM_VERSION = 1.5.1
+FLASHROM_VERSION = 1.7.0
 FLASHROM_SITE = $(call github,flashrom,flashrom,v$(FLASHROM_VERSION))
 FLASHROM_LICENSE = GPL-2.0+
-FLASHROM_LICENSE_FILES = COPYING
+FLASHROM_LICENSE_FILES = COPYING.rst
 FLASHROM_INSTALL_STAGING = YES
 FLASHROM_CONF_OPTS = \
 	-Dclassic_cli=enabled \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
