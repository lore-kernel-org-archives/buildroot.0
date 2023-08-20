Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7018EEE49A4
	for <buildroot@archiver.kernel.org>; Sun, 20 Aug 2023 14:57:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D0FBB82001;
	Sun, 20 Aug 2023 14:57:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D0FBB82001
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sbNgry6saCxd; Sun, 20 Aug 2023 14:57:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 19C1181F76;
	Sun, 20 Aug 2023 14:57:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 19C1181F76
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3619F1BF363
 for <buildroot@lists.busybox.net>; Sun, 20 Aug 2023 14:57:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1CB2281F76
 for <buildroot@lists.busybox.net>; Sun, 20 Aug 2023 14:57:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1CB2281F76
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PJXTWZlzXoYd for <buildroot@lists.busybox.net>;
 Sun, 20 Aug 2023 14:57:08 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EF9C181EE6
 for <buildroot@buildroot.org>; Sun, 20 Aug 2023 14:57:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EF9C181EE6
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:64fe:9015:874f:9d44])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 1A7F713F87F;
 Sun, 20 Aug 2023 16:57:03 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 20 Aug 2023 16:56:59 +0200
Message-ID: <20230820145659.1396012-1-ju.o@free.fr>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1692543425;
 bh=1J9fSseWeqoK32nx4GCRM3OrnzjeUST5pkyD24Mgop0=;
 h=From:To:Cc:Subject:Date:From;
 b=uj0Cnq4gvRvVDB2U0ynnetoqyRgagk1VH2Pfixq2WnEycBsrAE3SP5MEYobpvnx/W
 3F7o31a+/EAhp9HqOfvrCP/LzYfX//IJn6zLYQoi0323LnRg3qdZXjaPaCZrrgpXJf
 eAX7CsgCPZe26cK48lghtmmXl7J4Io3JlvBgTVwgE1A+113DQylMJtzTZr94BeJDpJ
 e63SDSnelL6hfhisJPcX+ohtqAbfASeN/nTamFmY1aA8usgRKuyLfZ98oiqpemkbR6
 L4r//ZZWsANOR+v3BiSN3+OHWMStAch/xaP+hI96kJ2DrHqYf4E/UdAlDBijMjBz/G
 4CUvxzkHi29Qg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=uj0Cnq4g
Subject: [Buildroot] [PATCH next 1/1] package/gnupg2: bump to version 2.4.3
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
Cc: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

See release announce:
https://lists.gnupg.org/pipermail/gnupg-announce/2023q3/000480.html

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Patch tested on branch next at commit 80a1e72 with commands:

    utils/test-pkg -p gnupg2
    ...
    6 builds, 2 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed

    support/testing/run-tests \
        -d dl -o output_folder \
        tests.package.test_gnupg2
    ...
    OK
---
 package/gnupg2/gnupg2.hash | 4 ++--
 package/gnupg2/gnupg2.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gnupg2/gnupg2.hash b/package/gnupg2/gnupg2.hash
index aa71881f41..4b770fa520 100644
--- a/package/gnupg2/gnupg2.hash
+++ b/package/gnupg2/gnupg2.hash
@@ -1,5 +1,5 @@
 # From https://www.gnupg.org/download/integrity_check.html
-sha1  3efd495a94dc81fd0ea8788bef6c69d1f13cedd7  gnupg-2.4.2.tar.bz2
-sha256  97eb47df8ae5a3ff744f868005a090da5ab45cb48ee9836dbf5ee739a4e5cf49  gnupg-2.4.2.tar.bz2
+sha1  79a60c8e415e3daaa33d0546398174252a56f7ac  gnupg-2.4.3.tar.bz2
+sha256  a271ae6d732f6f4d80c258ad9ee88dd9c94c8fdc33c3e45328c4d7c126bd219d  gnupg-2.4.3.tar.bz2
 # Locally calculated
 sha256  bc2d6664f6276fa0a72d57633b3ae68dc7dcb677b71018bf08c8e93e509f1357  COPYING
diff --git a/package/gnupg2/gnupg2.mk b/package/gnupg2/gnupg2.mk
index 760af3b05e..d21c1e242d 100644
--- a/package/gnupg2/gnupg2.mk
+++ b/package/gnupg2/gnupg2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GNUPG2_VERSION = 2.4.2
+GNUPG2_VERSION = 2.4.3
 GNUPG2_SOURCE = gnupg-$(GNUPG2_VERSION).tar.bz2
 GNUPG2_SITE = https://gnupg.org/ftp/gcrypt/gnupg
 GNUPG2_LICENSE = GPL-3.0+
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
