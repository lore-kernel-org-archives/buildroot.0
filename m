Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2793AFF885A
	for <buildroot@archiver.kernel.org>; Mon,  4 May 2026 14:49:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ECFF241CD0;
	Mon,  4 May 2026 14:49:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x8cPRk41L3Pu; Mon,  4 May 2026 14:49:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2E7D241CD1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777906143;
	bh=M007GwT7m5gUqnK00SCdLdp8DQI8ffr046u8+WRbEiI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=MPKI3/XJvxNuDrmjQS1Y5aqC1u+MG2ImYAtukR2LCbUejHskJb5tZGS8n40/UbW8+
	 oUGZaPk/RcQ98sTGWBjvYkX5Q2rfZrBFdxnbwEtj0s+mevszIc/potvw/mdfVPGCqe
	 AiFxSDc9p/nNu+nwrkq76j+4D0Mmkyt2Injxn60V/6+BiHSRpehdyhPq2SeOUpfihB
	 On8w+YpSILxLG5uTOr+tXMjT92NWZ/5r9oAfakYafiBdikZTK7FS+Y86T0MWvAStu4
	 od2030uYmsJ+CW2FDHH3g7s7d+Rd4hk0Doj1OI9ccnzBFQoOFk96spZCGuQELn5lzV
	 DxEH7xG52KvpQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2E7D241CD1;
	Mon,  4 May 2026 14:49:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 37CA725D
 for <buildroot@buildroot.org>; Mon,  4 May 2026 14:48:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1C777615D7
 for <buildroot@buildroot.org>; Mon,  4 May 2026 14:48:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f-mxetqwpvKm for <buildroot@buildroot.org>;
 Mon,  4 May 2026 14:48:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0487F615D0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0487F615D0
 for <buildroot@buildroot.org>; Mon,  4 May 2026 14:48:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DC7EF8423F; Mon,  4 May 2026 14:48:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 30 Apr 2026 14:10:54 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: 72be0787299cd5be0cb91c0f29db2c2d2bbfb245
X-Git-Newrev: ce727d0f751e54a1ad9749aba31f0f33ed01ad9f
X-Patchwork-Hint: ignore
Message-Id: <20260504144848.DC7EF8423F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] package/libpng: bump to
 version 1.6.58
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/ce727d0f751e54a1ad9749aba31f0f33ed01ad9f
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

https://github.com/pnggroup/libpng/blob/v1.6.58/ANNOUNCE
"Fixed a regression introduced in version 1.6.56 [...]"

A backport to LTS branches should be considered.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit bc73ca37ef42ee9576ce89b301d4d138646e2878)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
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
