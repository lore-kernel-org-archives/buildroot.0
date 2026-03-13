Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 154BC107BCF8
	for <buildroot@archiver.kernel.org>; Sat, 14 Mar 2026 07:49:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1FEF460EF3;
	Sat, 14 Mar 2026 07:49:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IQAn2wwCbmGz; Sat, 14 Mar 2026 07:49:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B29B260EFB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773474580;
	bh=oJJsFGrEjpjE+7vTLIYmm+gJl1NiQ7w8PszWulIVOVo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=l5oLdQZTnZ0BrnS4WotUreRwJ/amTFSlHk+HC8s+aTZXFvy3oMDNi091Y4Qb8fSGE
	 HcqFgcuiLcmt1mipP+QyLgYbo30u9qbo1fW60PW7gnYhbLk2sD3SNVg2QK/FEbtkDq
	 gKrqH4zL4UgVtqegc53P5HWUGtRiSH/qiu99SWQ4WxWRqZVSw1NovpVWhwMwX7Hju/
	 ZyQVgJjwV5ngfFej4Eexd1AF5oKmv7hFioyP1RBSojQvVaociKb3CVAAvQ8glaErvs
	 m44riYn0aIP3i0e8+ulfF4UsRhoGc+VT+ylOoWoX/p036CKd6dmp41d1/+IKvnOKHc
	 u+WIRQtBAMDpg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B29B260EFB;
	Sat, 14 Mar 2026 07:49:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id D672878A
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 07:49:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B853F60EFA
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 07:49:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v0BQKv8oo-_Q for <buildroot@buildroot.org>;
 Sat, 14 Mar 2026 07:49:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DFF4D60EF3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id DFF4D60EF3
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 07:49:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id ED6E185E16; Sat, 14 Mar 2026 07:49:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 13 Mar 2026 16:04:46 +0100
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: 60d110ac8d445266143b9b7611767720db6fb432
X-Git-Newrev: 3bfce3675049bcb4ae3674817870d85ab11dbce1
X-Patchwork-Hint: ignore
Message-Id: <20260314074935.ED6E185E16@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] package/libtpms: security
 bump version to 0.10.2
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/3bfce3675049bcb4ae3674817870d85ab11dbce1
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

https://github.com/stefanberger/libtpms/blob/v0.10.2/CHANGES

Fixes CVE-2026-21444.

Added comment to hash file about locally computed hashes.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit b1c4276c2d0fb266ccf08c03b8d50961b8f7553b)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/libtpms/libtpms.hash | 3 ++-
 package/libtpms/libtpms.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/libtpms/libtpms.hash b/package/libtpms/libtpms.hash
index f10364f36e..175e6e3af6 100644
--- a/package/libtpms/libtpms.hash
+++ b/package/libtpms/libtpms.hash
@@ -1,2 +1,3 @@
-sha256  ebc24f3191d90f6cf0b4d4200cd876db4bd224b3c565708bbea0a82ee275e0fb  libtpms-0.10.1.tar.gz
+# Locally computed
+sha256  edac03680f8a4a1c5c1d609a10e3f41e1a129e38ff5158f0c8deaedc719fb127  libtpms-0.10.2.tar.gz
 sha256  82f1e6bae374bb6a9d4f4596767fd33e499718d560de140fd9f3d402cc5e41fb  LICENSE
diff --git a/package/libtpms/libtpms.mk b/package/libtpms/libtpms.mk
index 6e5708202e..7bc69a50d6 100644
--- a/package/libtpms/libtpms.mk
+++ b/package/libtpms/libtpms.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBTPMS_VERSION = 0.10.1
+LIBTPMS_VERSION = 0.10.2
 LIBTPMS_SITE = $(call github,stefanberger,libtpms,v$(LIBTPMS_VERSION))
 LIBTPMS_LICENSE = BSD-4-Clause
 LIBTPMS_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
