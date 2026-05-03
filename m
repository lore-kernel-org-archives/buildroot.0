Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BDA6FF886F
	for <buildroot@archiver.kernel.org>; Sun,  3 May 2026 16:12:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4774740D6D;
	Sun,  3 May 2026 16:12:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rl8QwCAHH_Xv; Sun,  3 May 2026 16:12:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6D753414BF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777824764;
	bh=PLxF6AH95Sx+oAVDU18mv0sG75/3s0i5CHNOnmT9Oc4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=SNW8fGFyZRtjjIXvi4Uoy4PWpnni44ik/c9x/fi0b5cj0+E1MsY9cp0ljnQoszC4R
	 7RF3dlEFbEl5h9uAwY3LqvuKA8mWUvs54oIQikn3ANGim8sH38mgqCE3w8YNA0bsy5
	 H90AXlY9JpcFtq6QrPxT+dnTR0O0lIS4Gh/iVTvHvfuypjcg+gVx1i6jjOPR950BJt
	 9htctiu+ueSaCpHkH6HcROHuATfJb1p0ls47YIIWdloqwLpoO6ItGLJBh+zqGvtSNp
	 dd6N+5rCz4gASbuZ0/WjN39BPd/hETJt/h2B6ixfWu+SSm7UPcFgx8I1X1RTdtuiBv
	 e901WNATfo3UA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6D753414BF;
	Sun,  3 May 2026 16:12:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id DA583204
 for <buildroot@buildroot.org>; Sun,  3 May 2026 16:12:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CC2EB40747
 for <buildroot@buildroot.org>; Sun,  3 May 2026 16:12:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gHkSgrKTb07M for <buildroot@buildroot.org>;
 Sun,  3 May 2026 16:12:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0E077406FA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0E077406FA
 for <buildroot@buildroot.org>; Sun,  3 May 2026 16:12:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B8D2084048; Sun,  3 May 2026 16:12:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 3 May 2026 18:10:32 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d4d46b275ce6ac61558e8c3fcb1e2191b16c2454
X-Git-Newrev: 5657229086de7977533aec298922f0ce1b7a1745
X-Patchwork-Hint: ignore
Message-Id: <20260503161241.B8D2084048@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/dillo: bump to 3.3.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/5657229086de7977533aec298922f0ce1b7a1745
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Update to 3.3.0, see here for a changelog:
https://dillo-browser.org/release/3.3.0/

Update to use new homepage. Project is moving to their own
infrastructure.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
[Julien: remove DILLO_SOURCE to fix check-package error]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/dillo/Config.in  | 2 +-
 package/dillo/dillo.hash | 2 +-
 package/dillo/dillo.mk   | 5 ++---
 3 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/dillo/Config.in b/package/dillo/Config.in
index 1ebab8ab3f..1eea18e144 100644
--- a/package/dillo/Config.in
+++ b/package/dillo/Config.in
@@ -12,7 +12,7 @@ config BR2_PACKAGE_DILLO
 
 	  Enable openssl package to gain https support.
 
-	  https://dillo-browser.github.io/
+	  https://dillo-browser.org/
 
 comment "dillo needs a toolchain w/ C++"
 	depends on BR2_PACKAGE_XORG7 && BR2_USE_MMU
diff --git a/package/dillo/dillo.hash b/package/dillo/dillo.hash
index 50559bf857..c6b863c9ef 100644
--- a/package/dillo/dillo.hash
+++ b/package/dillo/dillo.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  1066ed42ea7fe0ce19e79becd029c651c15689922de8408e13e70bb5701931bf  dillo-3.2.0.tar.bz2
+sha256  db1863261d5efbd27b090e430c88064082b891cea1edf7a14e234cca51754f60  dillo-3.3.0.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/dillo/dillo.mk b/package/dillo/dillo.mk
index ce8660c6cb..6c8e638e8a 100644
--- a/package/dillo/dillo.mk
+++ b/package/dillo/dillo.mk
@@ -4,9 +4,8 @@
 #
 ################################################################################
 
-DILLO_VERSION = 3.2.0
-DILLO_SOURCE = dillo-$(DILLO_VERSION).tar.bz2
-DILLO_SITE = https://github.com/dillo-browser/dillo/releases/download/v$(DILLO_VERSION)
+DILLO_VERSION = 3.3.0
+DILLO_SITE = https://dillo-browser.org/release/$(DILLO_VERSION)
 DILLO_LICENSE = GPL-3.0+
 DILLO_LICENSE_FILES = COPYING
 DILLO_DEPENDENCIES = fltk zlib \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
