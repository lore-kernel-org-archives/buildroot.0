Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF1EAFA0C35
	for <buildroot@archiver.kernel.org>; Wed, 15 Apr 2026 06:21:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 733B960890;
	Wed, 15 Apr 2026 06:21:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b7hOB4QaMV3B; Wed, 15 Apr 2026 06:21:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8F3C560899
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776234072;
	bh=X9WSpibA3ZFTF3sfkOM0T+gtbr2gogg2JBH4mOB6Zno=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=rjnj2DvCnDjDsdRUYnIRwOi2p7oHU/z55hzYim0kwWoHRYSsuK//aL+v481I4F7pj
	 vpQ8keiC1rWFgPPURn8NXnGmz+lAEzXBVg7d2kOFw1Nuj3Y1OP1dBkZrG4+/OSj+u4
	 TabMqTdP2fHeCiKv/YRC1BOdU0ob2RucGE292UmzcLaGfQHmHMnShE7GvSqk42/vLj
	 k0DWnMvbeOx52jmpZ9DxpugeN8Mg84LjnrPwgzQhB/ayu1VBywFkavEjpdhFwnv7oU
	 KfVI44HjDV9Mfwqm9OSkK4AITFypGW67nloWY+lDPMt4yIr8J5DMnShqpHmI3Xihsb
	 OnLfZ3MmUQk9g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8F3C560899;
	Wed, 15 Apr 2026 06:21:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 43E10375
 for <buildroot@buildroot.org>; Wed, 15 Apr 2026 06:21:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 325A060899
 for <buildroot@buildroot.org>; Wed, 15 Apr 2026 06:21:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id txoOnRqT7ADK for <buildroot@buildroot.org>;
 Wed, 15 Apr 2026 06:21:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 030F760890
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 030F760890
 for <buildroot@buildroot.org>; Wed, 15 Apr 2026 06:21:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 97B387FF19; Wed, 15 Apr 2026 06:21:09 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 15 Apr 2026 08:17:44 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: a3ef297e0e0449ca163d6827b0c45973a1972f09
X-Git-Newrev: 7cd8b4791d9c3028d44161f6e21878802e824481
X-Patchwork-Hint: ignore
Message-Id: <20260415062109.97B387FF19@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] package/xz: security bump
 version to 5.8.3
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/7cd8b4791d9c3028d44161f6e21878802e824481
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

https://github.com/tukaani-project/xz/releases/tag/v5.8.3

Fixes CVE-2026-34743.

Switched to sha256 tarball provided by upstream.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 724635227314010518372c5bad4d37d7c58950c1)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/xz/xz.hash | 6 ++----
 package/xz/xz.mk   | 2 +-
 2 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/package/xz/xz.hash b/package/xz/xz.hash
index 99daa5e9df..488a3d55dc 100644
--- a/package/xz/xz.hash
+++ b/package/xz/xz.hash
@@ -1,7 +1,5 @@
-# Locally calculated after checking pgp signature
-# https://github.com/tukaani-project/xz/releases/download/v5.8.2/xz-5.8.2.tar.bz2.sig
-# using key 3690C240CE51B4670D30AD1C38EE757D69184620 Lasse Collin <lasse.collin@tukaani.org>
-sha256  60345d7c0b9c8d7ffa469e96898c300def3669f5047fc76219b819340839f3d8  xz-5.8.2.tar.bz2
+# From https://github.com/tukaani-project/xz/releases/tag/v5.8.3
+sha256  33bf69c0d6c698e83a68f77e6c1f465778e418ca0b3d59860d3ab446f4ac99a6  xz-5.8.3.tar.bz2
 
 # Hash for license files
 sha256  616a3ad264ce29b8f1cb97e53037b139d406899ca8d1f799651e17bfa09830b8  COPYING
diff --git a/package/xz/xz.mk b/package/xz/xz.mk
index 8aa0716b18..91eedd7a83 100644
--- a/package/xz/xz.mk
+++ b/package/xz/xz.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XZ_VERSION = 5.8.2
+XZ_VERSION = 5.8.3
 XZ_SOURCE = xz-$(XZ_VERSION).tar.bz2
 XZ_SITE = https://github.com/tukaani-project/xz/releases/download/v$(XZ_VERSION)
 XZ_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
