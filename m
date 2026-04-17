Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1413AF436B7
	for <buildroot@archiver.kernel.org>; Fri, 17 Apr 2026 15:22:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BE6CD60E1F;
	Fri, 17 Apr 2026 15:22:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xYyaQwbf6vg3; Fri, 17 Apr 2026 15:22:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CA58D60E31
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776439374;
	bh=otRILMhVhepGNBJ8/YfQsagv8Ju7mVwa/6NtDWj+WTM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=OcsORs3Nrf17b/t3uG/zUmkffzWwULgflWEQ6U4rU90pooAjX/OM98cjwCKafw969
	 zxhGtHq5BleN/LeHX24D13gcxSNKyoKq5MPdkF641bZ2CcZRfH5dKyv6qz3s6aaej9
	 E41C4pD1GklmGKRK+8oBO8/dpjtzce7yh/8BFOiqe7nwc0UdLQktbkgDCZjC9Qseok
	 XBZaKxRRQcLnuE4yG9Isjzd1t7QbipZzF2rd5/ngnzfRFLfN9ElagpoZc18iPpYLzi
	 u0XRqKVGdi1IcwZcHqNA2H0jBoeYTrK51CuMK2qQX54aL0ypZvyXdsb1Ts9W1NvHkR
	 ywsM3ZPy8wEaQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CA58D60E31;
	Fri, 17 Apr 2026 15:22:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 47826396
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 15:22:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8B59E60E1F
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 15:22:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uFcSiDKixbMT for <buildroot@buildroot.org>;
 Fri, 17 Apr 2026 15:22:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D466260E26
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D466260E26
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 15:22:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8468D81DDB; Fri, 17 Apr 2026 15:22:46 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 17 Apr 2026 17:21:10 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: e714e38a87092d5cf288d7d6855411910a1a1ba8
X-Git-Newrev: a9d1714fb286ac546d080a2d95a76eb0cb99fb27
X-Patchwork-Hint: ignore
Message-Id: <20260417152246.8468D81DDB@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] package/libpng: security
 bump to version 1.6.57
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/a9d1714fb286ac546d080a2d95a76eb0cb99fb27
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

https://github.com/pnggroup/libpng/blob/v1.6.57/ANNOUNCE

Fixes CVE-2026-34757:
https://github.com/pnggroup/libpng/security/advisories/GHSA-6fr7-g8h7-v645

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit ad5faa474cfd8d79a67e884c8b5fa67223385c11)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/libpng/libpng.hash | 6 +++---
 package/libpng/libpng.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libpng/libpng.hash b/package/libpng/libpng.hash
index ae28eee087..977f8fcca4 100644
--- a/package/libpng/libpng.hash
+++ b/package/libpng/libpng.hash
@@ -1,5 +1,5 @@
-# From https://sourceforge.net/projects/libpng/files/libpng16/1.6.56/
-sha1  71eb3636e60b6ea66f2f670cdf1f7160b7a1fa8b  libpng-1.6.56.tar.xz
+# From https://sourceforge.net/projects/libpng/files/libpng16/1.6.57/
+sha1  866fb81e3355088bb885bb4ded39093ef80eb686  libpng-1.6.57.tar.xz
 # Locally computed:
-sha256  f7d8bf1601b7804f583a254ab343a6549ca6cf27d255c302c47af2d9d36a6f18  libpng-1.6.56.tar.xz
+sha256  d10c20d7171569804cae8dfc13ba6dcd0662c41ed39d43d4d429314aafb10a80  libpng-1.6.57.tar.xz
 sha256  bdb0a645ea18c60507d0368379b1ac5474b92255fcc2d115e07486a7672ba526  LICENSE
diff --git a/package/libpng/libpng.mk b/package/libpng/libpng.mk
index 7c5bc35a77..0081406300 100644
--- a/package/libpng/libpng.mk
+++ b/package/libpng/libpng.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBPNG_VERSION = 1.6.56
+LIBPNG_VERSION = 1.6.57
 LIBPNG_SERIES = 16
 LIBPNG_SOURCE = libpng-$(LIBPNG_VERSION).tar.xz
 LIBPNG_SITE = https://downloads.sourceforge.net/project/libpng/libpng$(LIBPNG_SERIES)/$(LIBPNG_VERSION)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
