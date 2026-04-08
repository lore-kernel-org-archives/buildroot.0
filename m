Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5110010FC441
	for <buildroot@archiver.kernel.org>; Wed,  8 Apr 2026 21:12:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 048EE6076C;
	Wed,  8 Apr 2026 21:12:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q6EmlkiNiruB; Wed,  8 Apr 2026 21:12:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 15D8360F89
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775682773;
	bh=tCJOUsSwjnIPdHmptthxtwIKmuy8HKTJlN8a1NnMG64=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=bFEa7M1jlpv9He/KM54++Hb0WOUz4HS9bOlE1OY8KSLs9eNKjEPrzZ0CgjaW34mSe
	 cEIngfB3MGzZCJFwa0bnyjKV55+0WbDbwYbQYx6qxPvsvi691uRHiElzByg0EGdiXo
	 Ue3EXo/F2/OkCO6XiA8fChmlJrxrUvdYwHxDBP2BU0hWqS+DdW1lid/FgFC/Lq7BhN
	 0fyi/pP5XAwi/P3kN7VnWdJQxSwkjIlcClGXMhK1F5Pa/oRkScMhQdBD5X5jTn1zBC
	 0YRHfW570ZzHONQx4t6TiTys3dDQ55j1QCMWE9C3Wi6ooWnVAPH8OL87wgLknF3cC0
	 8EiHzjjl8NioQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 15D8360F89;
	Wed,  8 Apr 2026 21:12:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id DE7A62C7
 for <buildroot@buildroot.org>; Wed,  8 Apr 2026 21:12:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D0099401A2
 for <buildroot@buildroot.org>; Wed,  8 Apr 2026 21:12:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qMjxWG3NKwR0 for <buildroot@buildroot.org>;
 Wed,  8 Apr 2026 21:12:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 25693400D7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 25693400D7
 for <buildroot@buildroot.org>; Wed,  8 Apr 2026 21:12:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A2C3580E15; Wed,  8 Apr 2026 21:12:50 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 8 Apr 2026 23:09:29 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b9ea86b26a84b193a782007d559c899761364b21
X-Git-Newrev: 9e93af0cec3cfab5ece5450bb65edb36d4fc70e6
X-Patchwork-Hint: ignore
Message-Id: <20260408211250.A2C3580E15@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pciutils: bump version to 3.15.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/9e93af0cec3cfab5ece5450bb65edb36d4fc70e6
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://git.kernel.org/pub/scm/utils/pciutils/pciutils.git/tree/ChangeLog?h=v3.15.0

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/pciutils/pciutils.hash | 2 +-
 package/pciutils/pciutils.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/pciutils/pciutils.hash b/package/pciutils/pciutils.hash
index 9401d046cb..fc7220f4a8 100644
--- a/package/pciutils/pciutils.hash
+++ b/package/pciutils/pciutils.hash
@@ -1,3 +1,3 @@
 # From https://www.kernel.org/pub/software/utils/pciutils/sha256sums.asc
-sha256  e7713409882813991d2269d125e40dad1f54a019a52b78b3962941c1d4a6f86f  pciutils-3.14.0.tar.xz
+sha256  c02940f430841ecf158d5d9a50007afc4d5353c8678a2455003ca0b2c4e9f5ff  pciutils-3.15.0.tar.xz
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/pciutils/pciutils.mk b/package/pciutils/pciutils.mk
index bd205b1430..ad32713d57 100644
--- a/package/pciutils/pciutils.mk
+++ b/package/pciutils/pciutils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PCIUTILS_VERSION = 3.14.0
+PCIUTILS_VERSION = 3.15.0
 PCIUTILS_SITE = $(BR2_KERNEL_MIRROR)/software/utils/pciutils
 PCIUTILS_SOURCE = pciutils-$(PCIUTILS_VERSION).tar.xz
 PCIUTILS_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
