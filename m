Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FDA7C0015E
	for <buildroot@archiver.kernel.org>; Sat,  5 Aug 2023 23:04:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AD4EA4094C;
	Sat,  5 Aug 2023 23:04:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AD4EA4094C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5CGLlIdAWhT2; Sat,  5 Aug 2023 23:04:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8A8AC4092C;
	Sat,  5 Aug 2023 23:04:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8A8AC4092C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4F1FD1BF591
 for <buildroot@lists.busybox.net>; Sat,  5 Aug 2023 23:04:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5F2EE404CC
 for <buildroot@lists.busybox.net>; Sat,  5 Aug 2023 23:04:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5F2EE404CC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IK00td5-ApJx for <buildroot@lists.busybox.net>;
 Sat,  5 Aug 2023 23:04:37 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A8C9640576
 for <buildroot@buildroot.org>; Sat,  5 Aug 2023 23:04:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A8C9640576
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:64fe:9015:874f:9d44])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id A5C7713F87F;
 Sun,  6 Aug 2023 01:04:30 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun,  6 Aug 2023 01:04:09 +0200
Message-ID: <20230805230410.107850-1-ju.o@free.fr>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1691276673;
 bh=9Unbyk56LTYp+AD0jHdWgIjF35SnS3Gt+rL3csdaPyI=;
 h=From:To:Cc:Subject:Date:From;
 b=l1FnxNyUwF3IjAZQ+yk1SUxYhwS2LJ0qOdjTRS4V7Tvo74XW+XR3F7YdR+9ty10Ev
 Ps/hjVZrQQsbNboIud5Giu6xv/pBwzHXykfk3ULAle5N06Dvd4vutUCAmyaVlib9/2
 lxyQFTbRlOIUl6rtpYicnlyDHaRjt1vA7n50Du78BJr0oINCHAjcwavfLPxMhgPlRI
 NeqLsPM+Bk+OL0c4+dZB8eOPrFNHEtgDN8xQ0EydXaEF2+vnkJGTvtPLT0BouB+mqH
 0LXGx0S5UDqWkQF13Lu0lufrUoMDEmZqEN2OIL54RQa7RQ1f1aqTB4AIH5vkgtk7bj
 fiGMTQ7AUiJ/A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=l1FnxNyU
Subject: [Buildroot] [PATCH 1/2] package/acpica: remove HARDWARE_NAME make
 variable override
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

The HARDWARE_NAME Makefile variable was removed few years ago in
upstream (by Thomas). See [1].

This commit was first included in tag R01_19_17 (version 20170119).
See the change log [2].

This patch removes occurences of this HARDWARE_NAME, since it's now
undeeded. There is no change in the behavior of this build recipe.

[1] https://github.com/acpica/acpica/commit/0ba20f5f86d41bbe442eaeb426d13d25181fa512
[2] https://github.com/acpica/acpica/blob/R01_19_17/documents/changes.txt#L26

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/acpica/acpica.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/acpica/acpica.mk b/package/acpica/acpica.mk
index 81f7d8e103..b932941369 100644
--- a/package/acpica/acpica.mk
+++ b/package/acpica/acpica.mk
@@ -14,7 +14,7 @@ HOST_ACPICA_DEPENDENCIES = host-bison host-flex
 
 define ACPICA_BUILD_CMDS
 	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) \
-		HARDWARE_NAME=$(BR2_ARCH) HOST=_LINUX CC="$(TARGET_CC)" \
+		HOST=_LINUX CC="$(TARGET_CC)" \
 		NOWERROR=TRUE \
 		all
 endef
@@ -27,7 +27,7 @@ endef
 
 define ACPICA_INSTALL_TARGET_CMDS
 	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) \
-		HARDWARE_NAME=$(BR2_ARCH) DESTDIR="$(TARGET_DIR)" \
+		DESTDIR="$(TARGET_DIR)" \
 		INSTALLFLAGS=-m755 install
 endef
 
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
