Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33E0ECD37B3
	for <buildroot@archiver.kernel.org>; Sun, 17 Sep 2023 10:41:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9748F41720;
	Sun, 17 Sep 2023 10:41:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9748F41720
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mFbY4hy7IRx6; Sun, 17 Sep 2023 10:41:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 900C541745;
	Sun, 17 Sep 2023 10:41:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 900C541745
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7B4D41BF20B
 for <buildroot@lists.busybox.net>; Sun, 17 Sep 2023 10:41:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 61EB360FAE
 for <buildroot@lists.busybox.net>; Sun, 17 Sep 2023 10:41:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 61EB360FAE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vehUjtmzqaF7 for <buildroot@lists.busybox.net>;
 Sun, 17 Sep 2023 10:41:37 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1408160F83
 for <buildroot@buildroot.org>; Sun, 17 Sep 2023 10:41:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1408160F83
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:64fe:9015:874f:9d44])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id D7E7B13F8B9;
 Sun, 17 Sep 2023 12:41:30 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 17 Sep 2023 12:41:24 +0200
Message-ID: <20230917104124.192919-1-ju.o@free.fr>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1694947293;
 bh=/3Z/VeqoaAsj+xH2cFQNxzFuIOuq1DR+l45CzOrNZPE=;
 h=From:To:Cc:Subject:Date:From;
 b=YfLWWQMyiz6WtMAFliq2b27SoQZMwVdhh/FCm75oSEDJMO2HeBhAUJNWv3kXpaPvW
 vuNgnsMmbi/voUjg7olBZnR0ZAzu0lPztUCEyg2CKVNtPOze8Kfp04QNJKh/F4hkUy
 nF345clXSfabG9n4/04OlyrAGOXEsL14nf3/H5VBAvPq+AnVhBxVuE9++clFuSwkvD
 r3VjX4/37m2WGE8Fj7dNUgRHI8ih+RQrOW2BMfhmDrbI9XdZJcifgCZfszKwWb3d5m
 vkMKmcWgwiARIDoNzFMRhggI9+qhUUAldzfOAj+SbDPoohAziP99Txu2HXiN3jijKu
 xUjMEFGxIUImw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=YfLWWQMy
Subject: [Buildroot] [PATCH 1/1] package/tcllib: bump to version 1.21
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
Cc: Davide Viti <zinosat@gmail.com>, Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For change log, see:
https://core.tcl-lang.org/tcllib/doc/tcllib-1-21/support/releases/history/README-1.21.txt

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Patch tested on branch master at commit 9584c80 with commands:

    make check-package
    ...
    0 warnings generated

    cat > tcllib.config <<EOF
    BR2_PACKAGE_TCL=y
    BR2_PACKAGE_TCLLIB=y
    EOF
    utils/test-pkg -c tcllib.config -p tcllib
    ...
    6 builds, 2 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed
---
 package/tcllib/tcllib.hash | 4 ++--
 package/tcllib/tcllib.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/tcllib/tcllib.hash b/package/tcllib/tcllib.hash
index fb80841998..fe0ece238e 100644
--- a/package/tcllib/tcllib.hash
+++ b/package/tcllib/tcllib.hash
@@ -1,5 +1,5 @@
-# From https://core.tcl-lang.org/tcllib/uv/tcllib-1.20.SHA256
-sha256  199e8ec7ee26220e8463bc84dd55c44965fc8ef4d4ac6e4684b2b1c03b1bd5b9  tcllib-1.20.tar.xz
+# From https://core.tcl-lang.org/tcllib/uv/tcllib-1.21.SHA256
+sha256  10c7749e30fdd6092251930e8a1aa289b193a3b7f1abf17fee1d4fa89814762f  tcllib-1.21.tar.xz
 
 # Locally computed:
 sha256  38e1f556213f4008cfd280457af57c76a1fe043dc026ece1c704c09b5f6e865c  license.terms
diff --git a/package/tcllib/tcllib.mk b/package/tcllib/tcllib.mk
index 0f60eb8aca..1f2b575b29 100644
--- a/package/tcllib/tcllib.mk
+++ b/package/tcllib/tcllib.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TCLLIB_VERSION = 1.20
+TCLLIB_VERSION = 1.21
 TCLLIB_SOURCE = tcllib-$(TCLLIB_VERSION).tar.xz
 TCLLIB_SITE = http://downloads.sourceforge.net/project/tcllib/tcllib/$(TCLLIB_VERSION)
 TCLLIB_LICENSE = TCL
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
