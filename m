Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 812B2D12D4C
	for <buildroot@archiver.kernel.org>; Sun, 10 Nov 2024 18:00:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 32F536060C;
	Sun, 10 Nov 2024 18:00:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5seo9ZbLEdOh; Sun, 10 Nov 2024 18:00:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 21DC46060E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 21DC46060E;
	Sun, 10 Nov 2024 18:00:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id D5C84DAC
 for <buildroot@buildroot.org>; Sun, 10 Nov 2024 18:00:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B6E1480EA7
 for <buildroot@buildroot.org>; Sun, 10 Nov 2024 18:00:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mcR2Qh4eXZKl for <buildroot@buildroot.org>;
 Sun, 10 Nov 2024 18:00:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 815B680EA9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 815B680EA9
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 815B680EA9
 for <buildroot@buildroot.org>; Sun, 10 Nov 2024 18:00:22 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 61962B0051E;
 Sun, 10 Nov 2024 19:00:17 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>, Julien Olivain <ju.o@free.fr>
Date: Sun, 10 Nov 2024 19:00:11 +0100
Message-ID: <20241110180011.442932-1-ju.o@free.fr>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1731261619;
 bh=Ym61S3QM1laa6lEvWq1T5lZYvgSIbFIgERnGim5TqyM=;
 h=From:To:Cc:Subject:Date:From;
 b=kHnYb29xpn3+NpRb/NmqRT+VzZ0v0U8QAW6rF1ilEJeP2Vn4dFWzMb/1mNbUs3mAm
 QBQwijMxOgdCTRfL5CSCbAnksJyroMMcClPHPZ1uWDUHNt52QdCtsGh7oy/QcM5LJR
 A0HTB785E9Ykoj/3i9LflNBKEoGwRiC9sO2nPjGMR/pQIlcVqb0YfA9YiZCn8TvXxj
 XLe8OPYTSdCUSPMJx+RgP2qtKEmj4KqpRswDTjbPqx6hkVrsQUn3uif5ixo9MMJrYJ
 9SGDS8ntGDy36G3XS9t4XmdYgAPJBLiMdkuXEkOpwDQfP5rEXiXqbyhqQdEy3Th0Zo
 C5SZMR1TPmOgQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=kHnYb29x
Subject: [Buildroot] [PATCH 1/1] package/usbredir: bump version to 0.14.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For change log, see [1].

This commit also updates the _SITE to the URL published on the
homepage [2]. The main motivation is to use HTTPS.

This commit also adds a comment in the hash file about the pgp
signature verification.

[1] https://gitlab.freedesktop.org/spice/usbredir/-/blob/usbredir-0.14.0/ChangeLog.md
[2] https://www.spice-space.org/usbredir.html

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Patch tested in:
https://gitlab.com/jolivain/buildroot/-/pipelines/1535441761
---
 package/usbredir/usbredir.hash | 8 ++++++--
 package/usbredir/usbredir.mk   | 4 ++--
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/package/usbredir/usbredir.hash b/package/usbredir/usbredir.hash
index 577e08efba..2be6301281 100644
--- a/package/usbredir/usbredir.hash
+++ b/package/usbredir/usbredir.hash
@@ -1,5 +1,9 @@
-# https://spice-space.org/download/usbredir/usbredir-0.13.0.tar.xz.sha256sum
-sha256  4ba6faa02c0ae6deeb4c53883d66ab54b3a5899bead42ce4ded9568b9a7dc46e  usbredir-0.13.0.tar.xz
+# Hash from:
+# https://www.spice-space.org/download/usbredir/usbredir-0.14.0.tar.xz.sha256sum
+# After checking pgp signature:
+# https://www.spice-space.org/download/usbredir/usbredir-0.14.0.tar.xz.sig
+# with key 206D3B352F566F3B0E6572E997D9123DE37A484F
+sha256  924dfb5c78328fae45a4c93a01bc83bb72c1310abeed119109255627a8baa332  usbredir-0.14.0.tar.xz
 
 # Hash for license files
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/usbredir/usbredir.mk b/package/usbredir/usbredir.mk
index 325e7313aa..aefe51b6c4 100644
--- a/package/usbredir/usbredir.mk
+++ b/package/usbredir/usbredir.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-USBREDIR_VERSION = 0.13.0
+USBREDIR_VERSION = 0.14.0
 USBREDIR_SOURCE = usbredir-$(USBREDIR_VERSION).tar.xz
-USBREDIR_SITE = http://spice-space.org/download/usbredir
+USBREDIR_SITE = https://www.spice-space.org/download/usbredir
 USBREDIR_LICENSE = LGPL-2.1+ (libraries)
 USBREDIR_LICENSE_FILES = COPYING.LIB
 USBREDIR_INSTALL_STAGING = YES
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
