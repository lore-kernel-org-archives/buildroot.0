Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED069D30CC4
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 20:59:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C046F40D20;
	Tue, 13 Jan 2026 20:59:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X1cKiGJ8cjQR; Tue, 13 Jan 2026 20:59:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C846640D21
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768337966;
	bh=uKVlzK2AV+Vcc6uGEf1MJERtZoth9iVjKyiwJB2nMS4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=JKkKKbEjPiBMxTb5qA77rE3xciD7cxEpK1Sf1F+wYOY+6WCFsvJDQ+TBdyfQpwZf2
	 bNURbh338v1yEs53FqQ/YmJlVevf04/1kJhOcVxiEamcdYus6/bmtiCTUvytfo6ddS
	 NknsFM2Uz5GLyUkzifnLmG0z+RnmHhmN3Xkz4dtoF/aicHSc8dvDJ+N8ab+3375DBZ
	 n1hEkIu90kTg/rGtPp5bGC1gBERWINwJUwSGhklSqzpLab2LzQFckftab1I/892E4q
	 kjhixPcSSGmSDiH1snqiOq/xK0MQKgcNXG/40p2UUxQH86ue94PlZJZ6aNWvILdUdw
	 K6MpbRNLiANTQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C846640D21;
	Tue, 13 Jan 2026 20:59:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 602BD231
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:59:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7F842407C4
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:58:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IRfrGTJtorFQ for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 20:58:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2C1EB40795
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2C1EB40795
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:58:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 29F3C80F55; Tue, 13 Jan 2026 20:58:47 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 13 Jan 2026 21:37:22 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0259107f8825ee53e75f8e59d8747c03b3f261ef
X-Git-Newrev: dc7079a4ca1ed827fb300f4225f4ce13ee09f97e
X-Patchwork-Hint: ignore
Message-Id: <20260113205847.29F3C80F55@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xlib_libXau: bump version to
 1.0.12
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

commit: https://git.buildroot.net/buildroot/commit/?id=dc7079a4ca1ed827fb300f4225f4ce13ee09f97e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://lists.x.org/archives/xorg-announce/2024-December/003570.html

Switched _SITE to URL mentioned in latest release notes.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/x11r7/xlib_libXau/xlib_libXau.hash | 6 +++---
 package/x11r7/xlib_libXau/xlib_libXau.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/x11r7/xlib_libXau/xlib_libXau.hash b/package/x11r7/xlib_libXau/xlib_libXau.hash
index 8d2a6ff43c..799fd39efa 100644
--- a/package/x11r7/xlib_libXau/xlib_libXau.hash
+++ b/package/x11r7/xlib_libXau/xlib_libXau.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2022-December/003284.html
-sha256  f3fa3282f5570c3f6bd620244438dbfbdd580fc80f02f549587a0f8ab329bbeb  libXau-1.0.11.tar.xz
-sha512  f56abba3bef3fdd4739dfa69367a4251b5fab7c89194c9aece9efa66b9ebbf0736690cc9bd654aab19d9db377e4b9a5268c9c020b3d293bb5351bff5fe75a4dd  libXau-1.0.11.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2024-December/003570.html
+sha256  74d0e4dfa3d39ad8939e99bda37f5967aba528211076828464d2777d477fc0fb  libXau-1.0.12.tar.xz
+sha512  4bbe8796f4a14340499d5f75046955905531ea2948944dfc3d6069f8b86c1710042bfc7918d459320557883e6631359d48e6173c69c62ff572314e864ff97c5e  libXau-1.0.12.tar.xz
 # Locally computed
 sha256  56abe29bb1d9806a9e04fa9f80fed2c0f18027594df3f098148d814aef6bddfa  COPYING
diff --git a/package/x11r7/xlib_libXau/xlib_libXau.mk b/package/x11r7/xlib_libXau/xlib_libXau.mk
index 0e9f79d38d..9473abdf48 100644
--- a/package/x11r7/xlib_libXau/xlib_libXau.mk
+++ b/package/x11r7/xlib_libXau/xlib_libXau.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XLIB_LIBXAU_VERSION = 1.0.11
+XLIB_LIBXAU_VERSION = 1.0.12
 XLIB_LIBXAU_SOURCE = libXau-$(XLIB_LIBXAU_VERSION).tar.xz
-XLIB_LIBXAU_SITE = http://xorg.freedesktop.org/releases/individual/lib
+XLIB_LIBXAU_SITE = https://xorg.freedesktop.org/archive/individual/lib
 XLIB_LIBXAU_LICENSE = MIT
 XLIB_LIBXAU_LICENSE_FILES = COPYING
 XLIB_LIBXAU_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
