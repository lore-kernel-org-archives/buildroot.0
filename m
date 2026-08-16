Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1600FC5B572
	for <buildroot@archiver.kernel.org>; Sun, 16 Aug 2026 09:23:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2080F80E6E;
	Sun, 16 Aug 2026 09:23:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LR52mY6kxvnz; Sun, 16 Aug 2026 09:23:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4FF0C80ED0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786872235;
	bh=YElAAZIje9zn6rLVBsl07J5aGewdrs/1LAMnwMac3LE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=V3Xk9ZmNsy6UVfU2dcbq+Hs7RvRRLfQWyOtg2FQ0HzdB0Wq30j6iu4R9F1yCi6bsU
	 NOtW5SOjWA/yM70vH+nT8xgo3Xzprs9w8O9zUHoweGqcz2bR8EHWQHRxdl1Mrs65cU
	 pRGI/Ew4ZhIER+6CorwpJnD49SKweUxcHL5G3dej5pmycvSyu8AwYaJq0MQqu2QG48
	 Tw6nvhyQTrTO91pUSezhryczzBfMKJy0/WZ13QllqtKHaPCWdEtOYU8Tt96dsTPX1M
	 US1+5rI97xvBslYGABiFHBJL7gUL6wJTXXh2S59qE3fPQ+k3ncaTuSPIYYAeT147Z6
	 Nq7kIRy+euCbA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4FF0C80ED0;
	Sun, 16 Aug 2026 09:23:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 86847334
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 09:23:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 844574009C
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 09:23:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uzZaG7mA7W8v for <buildroot@buildroot.org>;
 Sun, 16 Aug 2026 09:23:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D0F394005C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D0F394005C
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 09:23:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E48D28DA54; Sun, 16 Aug 2026 09:23:01 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 16 Aug 2026 11:04:37 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 054358ba9ba40323494eb225e4f2a7d6ac552172
X-Git-Newrev: f1f7f6d77600a5b9a30c6d6a196825ab1d58282f
X-Patchwork-Hint: ignore
Message-Id: <20260816092301.E48D28DA54@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libffi: bump version to 3.8.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/f1f7f6d77600a5b9a30c6d6a196825ab1d58282f
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/libffi/libffi/releases/tag/v3.8.0

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libffi/libffi.hash | 4 ++--
 package/libffi/libffi.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libffi/libffi.hash b/package/libffi/libffi.hash
index 5f34afd392..2a98652d2d 100644
--- a/package/libffi/libffi.hash
+++ b/package/libffi/libffi.hash
@@ -1,4 +1,4 @@
-# From https://github.com/libffi/libffi/releases/tag/v3.7.1
-sha256  d5e9a6638ddbd2513ddb54518eb67e4bbe6fa707bcc01c10f6212f0a088d819d  libffi-3.7.1.tar.gz
+# From https://github.com/libffi/libffi/releases/tag/v3.8.0
+sha256  7da3e2d9a171eb0a038f592ecad3ff2bb2550f3496d87b3b29ad0cf4430c0db4  libffi-3.8.0.tar.gz
 # License files, locally calculated
 sha256  17b64dc60f3b6897a60f971e288b973f655c2edcdf08b25f3c3dd5549857881c  LICENSE
diff --git a/package/libffi/libffi.mk b/package/libffi/libffi.mk
index c24ce22c84..e022304193 100644
--- a/package/libffi/libffi.mk
+++ b/package/libffi/libffi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBFFI_VERSION = 3.7.1
+LIBFFI_VERSION = 3.8.0
 LIBFFI_SITE = \
 	https://github.com/libffi/libffi/releases/download/v$(LIBFFI_VERSION)
 LIBFFI_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
