Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C254C0015E
	for <buildroot@archiver.kernel.org>; Wed,  9 Aug 2023 20:54:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DC72660B73;
	Wed,  9 Aug 2023 20:54:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DC72660B73
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RHEA73o1OwXm; Wed,  9 Aug 2023 20:54:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3E17A60757;
	Wed,  9 Aug 2023 20:54:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3E17A60757
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9C9B71BF3EB
 for <buildroot@lists.busybox.net>; Wed,  9 Aug 2023 20:54:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 732F740891
 for <buildroot@lists.busybox.net>; Wed,  9 Aug 2023 20:54:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 732F740891
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gnX87C4AIPFZ for <buildroot@lists.busybox.net>;
 Wed,  9 Aug 2023 20:54:54 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 24F454086B
 for <buildroot@buildroot.org>; Wed,  9 Aug 2023 20:54:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 24F454086B
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:64fe:9015:874f:9d44])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id AA97713F89D;
 Wed,  9 Aug 2023 22:54:48 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Wed,  9 Aug 2023 22:54:32 +0200
Message-ID: <20230809205434.312601-1-ju.o@free.fr>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1691614491;
 bh=+59BNyZtqc3NheLDSSDGdDaJ2pdcN4xfpeZZ4rzoWSI=;
 h=From:To:Cc:Subject:Date:From;
 b=pb65loQxb31AygTa3AylTB5om97T9SAnKUDUjbGDNTclg4bZyBRj69Xv03UR8IXCL
 iua1f/8LZ1aEjAQlMmBj8YdDwp9k9Jdeha4zcv4zkn2cxP4e3E09g8fzw4wEx48Gn4
 S+fqcUtQqiJFulCdHuI6lulcVNDYbtAyXg8YA3XWDC+k0PkZcqcgON4uWdMUHodx1H
 FMObcVebwoDRoP5Px+fXMq35zPZ3ZxEd65RrjsaM4lT9gP1N/BpNI+S7FUhr/Bwn98
 /uxCafhpHXrdSqqwo9uWCyZ66LZWADBIzrK9tvU1QZRCSBrMKwKyXlgWaR8yksPFtA
 7/77p2Rf1+MUA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=pb65loQx
Subject: [Buildroot] [PATCH next 1/3] package/kmscube: bump to latest commit
 ea6c5d1e
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
Cc: Julien Olivain <ju.o@free.fr>, Fabio Estevam <festevam@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changes since commit 4660a7dc, see:
https://gitlab.freedesktop.org/mesa/kmscube/-/commits/ea6c5d1eeefbfb0a1c27ab74a6e4621f1d9adf4c

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/kmscube/kmscube.hash | 2 +-
 package/kmscube/kmscube.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kmscube/kmscube.hash b/package/kmscube/kmscube.hash
index cb7abd48ea..e5ca6e72ec 100644
--- a/package/kmscube/kmscube.hash
+++ b/package/kmscube/kmscube.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  ec135069d8bee7f4fe38cb9dc96fbbd56e0057290fa25eff8b5b314ee473c502  kmscube-4660a7dca6512b6e658759d00cff7d4ad2a2059d.tar.gz
+sha256  c7e7fd7ebcd59a5a57b717ba309a25b73e8028ed4f6bc95bd87e3b7ad5732834  kmscube-ea6c5d1eeefbfb0a1c27ab74a6e4621f1d9adf4c.tar.gz
 sha256  f622099ab0d274133f6e62d5fccfe970b61134d80ed036f45f8cf1e90c3d5a05  COPYING
diff --git a/package/kmscube/kmscube.mk b/package/kmscube/kmscube.mk
index fc9a7f6f99..699af0b6c4 100644
--- a/package/kmscube/kmscube.mk
+++ b/package/kmscube/kmscube.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KMSCUBE_VERSION = 4660a7dca6512b6e658759d00cff7d4ad2a2059d
+KMSCUBE_VERSION = ea6c5d1eeefbfb0a1c27ab74a6e4621f1d9adf4c
 KMSCUBE_SITE = https://gitlab.freedesktop.org/mesa/kmscube/-/archive/$(KMSCUBE_VERSION)
 KMSCUBE_LICENSE = MIT
 KMSCUBE_LICENSE_FILES = COPYING
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
