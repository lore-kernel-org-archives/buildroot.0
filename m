Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2620EEB57E
	for <buildroot@archiver.kernel.org>; Thu,  1 Jan 2026 10:47:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8C6FD60A97;
	Thu,  1 Jan 2026 10:47:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rEeIoYy3lvlH; Thu,  1 Jan 2026 10:46:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C608A60791
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767264419;
	bh=ahELygrbqnFSNsVyj5ir8teb1xTu132tS/PZulUFD+g=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=pSir9txDyBhjQwIyccFH9Q/10ei9li9664W7TgsaMmgY5StcQb1vn9SgbiG7x88dQ
	 ipcZAagBFdWtuc3ompstU2te0BjLg0u3aTvBplp6iZTIh9NyShWZHDmW86+oITlgT9
	 mI0OE6con1+gmmZKMhZZDaQPEglGkKwAwOhK3NySQCojrjgusaiIqOJgiUSqXwxapI
	 sQGIbfYcMS0u4+Fwn85dwqiWPBxfabZl+CJgNcf7SovwVTkRLnqX1S2OpL+7Yyo4Fg
	 2CA590uwJLzG49IZ/HSJS52qL2TsMTyC0r0nKzw9LxPU8QdYYDLGvOoby5S2g2EYLe
	 ftF34DTrsZPxQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C608A60791;
	Thu,  1 Jan 2026 10:46:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id DCEFA19D
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 10:46:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CED0F81360
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 10:46:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mpfjiNAQrmnK for <buildroot@buildroot.org>;
 Thu,  1 Jan 2026 10:46:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B76128131A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B76128131A
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 10:46:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9DC2687CED; Thu,  1 Jan 2026 10:46:57 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 1 Jan 2026 11:33:54 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fa7d482ffbaf760a873737179a1a86cc26c85622
X-Git-Newrev: 394e9881a51f0c0b2e86043b49c009ba7706a207
X-Patchwork-Hint: ignore
Message-Id: <20260101104657.9DC2687CED@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/feh: bump to 3.11.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=394e9881a51f0c0b2e86043b49c009ba7706a207
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog:
https://github.com/derf/feh/blob/3.11.2/ChangeLog

COPYING hash updated with this commit:
https://github.com/derf/feh/commit/e4eebe54d5ebca968d0d9643eb15a0ee407d1e70

Signed-off-by: Pierre-Yves Kerbrat <pkerbrat@free.fr>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/feh/feh.hash | 4 ++--
 package/feh/feh.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/feh/feh.hash b/package/feh/feh.hash
index f86a7ef6d7..61c35e6386 100644
--- a/package/feh/feh.hash
+++ b/package/feh/feh.hash
@@ -1,3 +1,3 @@
 # Locally calculated after checking pgp signature
-sha256  5426e2799770217af1e01c2e8c182d9ca8687d84613321d8ab4a66fe4041e9c8  feh-3.10.3.tar.bz2
-sha256  881f1b901b5b99bce372fd9498106724a1ea52450f7bfc6fc1cce6736a2faf4d  COPYING
+sha256  020f8bce84c709333dcc6ec5fff36313782e0b50662754947c6585d922a7a7b2  feh-3.11.2.tar.bz2
+sha256  c07900c3c11294d8dea3c592092aa41fda3789f58fa009910695de0ba2570aeb  COPYING
diff --git a/package/feh/feh.mk b/package/feh/feh.mk
index be3b67aff9..340418e570 100644
--- a/package/feh/feh.mk
+++ b/package/feh/feh.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FEH_VERSION = 3.10.3
+FEH_VERSION = 3.11.2
 FEH_SOURCE = feh-$(FEH_VERSION).tar.bz2
 FEH_SITE = https://feh.finalrewind.org
 FEH_DEPENDENCIES = imlib2 libpng xlib_libXt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
