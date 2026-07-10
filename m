Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 395C6C44506
	for <buildroot@archiver.kernel.org>; Fri, 10 Jul 2026 16:44:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 81D3960A47;
	Fri, 10 Jul 2026 16:44:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sgwBJwMyFkD4; Fri, 10 Jul 2026 16:44:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1B24F606F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783701853;
	bh=esYweuTTJ5yXOVb8XXEtXboAjpApBX4Mjd7xDP6sqGY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=KdCAsxXBeB4VNqgljXIyuSrZwkXM7eOsR7CUwCLpTKgYyGskupXs8ORoTdotFEYPq
	 LNWWVZUSm/twweXYPJ2WT0Tpzk4YH/F9rxoDQgrqBASl7YAQm+aQaq9Eb5hitcVZzc
	 bc4yPwd9JK5N9zuDyvO6Bdh2BVs14OuBxEgod0hkxYuWnVEq6oEjNORehpTM2CvCzS
	 HIwht8yi58uDaIemdn7pIsjx+obY5pNkXImh1Zs7mgRojgEFzj6dZ3sGlB8FAxFt4g
	 2TgRXplFFxv4Cw8B8w7Fg6Xpj5axV4SUXKQamRhb4yvZl8zqg2/yqqaCqmc48F2qBu
	 uZPjZMf9AiD0w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1B24F606F8;
	Fri, 10 Jul 2026 16:44:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9DDBAFD1
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 16:44:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 84788409DB
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 16:44:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YQvOPgaaqQhV for <buildroot@buildroot.org>;
 Fri, 10 Jul 2026 16:44:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ABF32409D5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id ABF32409D5
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 16:44:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C1F42886A2; Fri, 10 Jul 2026 16:43:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 10 Jul 2026 18:42:25 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e33010926ccb94cfd4b8c635b56a3e287183c4bf
X-Git-Newrev: b4c690d22029fbba59d31d02fbf392d9f7cbe654
X-Patchwork-Hint: ignore
Message-Id: <20260710164336.C1F42886A2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libva: bump version to 2.24.1
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b4c690d22029fbba59d31d02fbf392d9f7cbe654
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/intel/libva/blob/2.24.1/NEWS

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libva/libva.hash | 2 +-
 package/libva/libva.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libva/libva.hash b/package/libva/libva.hash
index 2d7e8b7ee8..918230e1c0 100644
--- a/package/libva/libva.hash
+++ b/package/libva/libva.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  b10aceb30e93ddf13b2030eb70079574ba437be9b3b76065caf28a72c07e23e7  libva-2.23.0.tar.gz
+sha256  0b4a3649ee8d683b9cce2ef094df4fb039d276c0cef7e49337c43d3b297b9f42  libva-2.24.1.tar.gz
 sha256  c86a782ee845b52472dae9b9d79fb915d333628ac0efe49cdce63644814931de  COPYING
diff --git a/package/libva/libva.mk b/package/libva/libva.mk
index f41a0c00ff..9f044293d8 100644
--- a/package/libva/libva.mk
+++ b/package/libva/libva.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBVA_VERSION = 2.23.0
+LIBVA_VERSION = 2.24.1
 LIBVA_SITE = $(call github,intel,libva,$(LIBVA_VERSION))
 LIBVA_LICENSE = MIT
 LIBVA_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
