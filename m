Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6915CD8C92
	for <buildroot@archiver.kernel.org>; Tue,  9 Jun 2026 13:01:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 81F448564D;
	Tue,  9 Jun 2026 13:01:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id da1jecOctDwi; Tue,  9 Jun 2026 13:01:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EFACD8561E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781010105;
	bh=WIIa+pVTFZ3NsIuHE6KZ5YAlTfj4PzsHt8K6T+mVyQQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ZpxfNkJKCS2NG2wAarlWMV2Jzzv0+uxBJva5g1PHaqmw1HWrLgj3LjJfH4scQR6YN
	 blk3uchsLPHZGwmc9mTna8vIVJcW+6DKAgFk5f0BH9iXFGKX/r66VSwW8Si8W2KcMP
	 5CVpU/FdL8Q50vPk0fBGPEpAeGrB8UuVjtaz/FpQUau5Bx5KOK/TzarJ8OZhe0eDmx
	 akVZiFdSqaX/anSHhqhMjWuI/lqor+yQoMUxEQrkspk4rgza6eJOWG2WQX+a2EgA1r
	 DiwSH4loUIbipr4bB0xSSdpIFgpyrxJgjI874pZLEcrcOdtHU0/oV4l8qD0xfN3daa
	 +IXCBrVLNZcdA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EFACD8561E;
	Tue,  9 Jun 2026 13:01:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id CB685190
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B1FA16F691
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JfKXnThpcQkC for <buildroot@buildroot.org>;
 Tue,  9 Jun 2026 13:01:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CB0556F690
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id CB0556F690
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0549B87E7E; Tue,  9 Jun 2026 13:01:09 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 15 May 2026 11:39:43 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c522110685426cd9dc8bf246998abfb7d8b7b86a
X-Git-Newrev: 20275000f3ef1546328b595d46c3e81ec5711345
X-Patchwork-Hint: ignore
Message-Id: <20260609130109.0549B87E7E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libunwind: bump to version 1.8.3
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/20275000f3ef1546328b595d46c3e81ec5711345
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/libunwind/libunwind/releases/tag/v1.8.2
https://github.com/libunwind/libunwind/releases/tag/v1.8.3

Switched to tarball hash provided by upstream.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libunwind/libunwind.hash | 4 ++--
 package/libunwind/libunwind.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libunwind/libunwind.hash b/package/libunwind/libunwind.hash
index 512cc7b9b5..02aa2bcbd7 100644
--- a/package/libunwind/libunwind.hash
+++ b/package/libunwind/libunwind.hash
@@ -1,5 +1,5 @@
-# Locally calculated after checking pgp signature
-sha256  ddf0e32dd5fafe5283198d37e4bf9decf7ba1770b6e7e006c33e6df79e6a6157  libunwind-1.8.1.tar.gz
+# From https://github.com/libunwind/libunwind/releases/tag/v1.8.3
+sha256  be30d910e67f58d82e753231f1357f326a1a088acf126b21ff77e60aab19b90b  libunwind-1.8.3.tar.gz
 
 # Hash for license file
 sha256  6a0dbbdaec2b3136b7bf045586f4212bdf74e7af688bf9dfe9154607cf5ec156  COPYING
diff --git a/package/libunwind/libunwind.mk b/package/libunwind/libunwind.mk
index 3eb3b483d1..689902c787 100644
--- a/package/libunwind/libunwind.mk
+++ b/package/libunwind/libunwind.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBUNWIND_VERSION = 1.8.1
+LIBUNWIND_VERSION = 1.8.3
 LIBUNWIND_SITE = https://github.com/libunwind/libunwind/releases/download/v$(LIBUNWIND_VERSION)
 LIBUNWIND_INSTALL_STAGING = YES
 LIBUNWIND_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
