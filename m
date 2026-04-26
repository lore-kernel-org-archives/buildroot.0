Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41A66FF885E
	for <buildroot@archiver.kernel.org>; Sun, 26 Apr 2026 17:03:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DC3F061C61;
	Sun, 26 Apr 2026 17:03:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mEDpbMfHK3_H; Sun, 26 Apr 2026 17:03:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1BB6C61C5A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777223024;
	bh=Ye/n84kAt7/WihliR4TWItWYTxcq9Xi007ruARnuwPQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=icN7/otzzSDIxs3TIrvZtERY4T3w2TtiNoazinBMHHZidSfHwYvU3zYtc5/eJoZja
	 7AivAsEOZqNa/XnvaXLotcUlA0o3v1xoy60Bn6Tlzn7WkzJXzmLZQVPsx00av7YU0T
	 Bv7P3J0Gg1I5SlZKHFsFIrW8Ybh+hJ1tyNQhTrBDP/pm8BB1AIJehFCP7m+xN5NtOb
	 bI5BRKIAD1LgZrTOYPa4ddLmDTHn+wh+Srsv9sitWDwyP7nDySMfiJYyeLWyMIB1WS
	 FEdxUZ++kVd1Wb/5Mecbj/qwm5hP9RlsQOV6DpKqimscR4sFvmXYSoTixiy98dIW+o
	 ZXtrvuJwQrDbQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1BB6C61C5A;
	Sun, 26 Apr 2026 17:03:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 98B501B8
 for <buildroot@buildroot.org>; Sun, 26 Apr 2026 17:03:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 92A4361C5A
 for <buildroot@buildroot.org>; Sun, 26 Apr 2026 17:03:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dfgxi_XE1K_R for <buildroot@buildroot.org>;
 Sun, 26 Apr 2026 17:03:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AE67A61C54
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id AE67A61C54
 for <buildroot@buildroot.org>; Sun, 26 Apr 2026 17:03:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6150A836D1; Sun, 26 Apr 2026 17:03:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 26 Apr 2026 19:01:29 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c0af256522464f00b7653c334c9483085282d97b
X-Git-Newrev: bc73ca37ef42ee9576ce89b301d4d138646e2878
X-Patchwork-Hint: ignore
Message-Id: <20260426170341.6150A836D1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libpng: bump to version 1.6.58
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/bc73ca37ef42ee9576ce89b301d4d138646e2878
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/pnggroup/libpng/blob/v1.6.58/ANNOUNCE
"Fixed a regression introduced in version 1.6.56 [...]"

A backport to LTS branches should be considered.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libpng/libpng.hash | 6 +++---
 package/libpng/libpng.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libpng/libpng.hash b/package/libpng/libpng.hash
index 977f8fcca4..c387ffbf02 100644
--- a/package/libpng/libpng.hash
+++ b/package/libpng/libpng.hash
@@ -1,5 +1,5 @@
-# From https://sourceforge.net/projects/libpng/files/libpng16/1.6.57/
-sha1  866fb81e3355088bb885bb4ded39093ef80eb686  libpng-1.6.57.tar.xz
+# From https://sourceforge.net/projects/libpng/files/libpng16/1.6.58/
+sha1  6263409a6907d180e7b990827ca84ee944c6cc17  libpng-1.6.58.tar.xz
 # Locally computed:
-sha256  d10c20d7171569804cae8dfc13ba6dcd0662c41ed39d43d4d429314aafb10a80  libpng-1.6.57.tar.xz
+sha256  28eb403f51f0f7405249132cecfe82ea5c0ef97f1b32c5a65828814ae0d34775  libpng-1.6.58.tar.xz
 sha256  bdb0a645ea18c60507d0368379b1ac5474b92255fcc2d115e07486a7672ba526  LICENSE
diff --git a/package/libpng/libpng.mk b/package/libpng/libpng.mk
index 0081406300..96afc684db 100644
--- a/package/libpng/libpng.mk
+++ b/package/libpng/libpng.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBPNG_VERSION = 1.6.57
+LIBPNG_VERSION = 1.6.58
 LIBPNG_SERIES = 16
 LIBPNG_SOURCE = libpng-$(LIBPNG_VERSION).tar.xz
 LIBPNG_SITE = https://downloads.sourceforge.net/project/libpng/libpng$(LIBPNG_SERIES)/$(LIBPNG_VERSION)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
