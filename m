Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31065EF06E2
	for <buildroot@archiver.kernel.org>; Sun,  8 Feb 2026 13:16:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D5DD76072F;
	Sun,  8 Feb 2026 13:16:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pTWLxrLX1Lgk; Sun,  8 Feb 2026 13:16:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 06D8F6075F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770556584;
	bh=5e0mrjW1uiKBCIpvT4yTh1Rm7cgdWsq9T6uSJKrXQ9w=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=sBJHnwTRgKKfMDJzvncoSxvq0PgkaVPh6ejr3vMdShKsHHvYKyeX9kPpMqSCs/777
	 fGOSPI8hYKM4zrUWyQhvxvf8yKc67tmevBTODZpRqLLu9uFXbvwlUq6QjvIgkZKkd3
	 zs82LyT5kYTUFiagSrvzOBwzlgKHMyXH/E9r68UmJr1RPnLlFRNEzG9WTQL0BVoRv2
	 Er3lJBpiIXcOPFpNVffNZ5wcVQ7asYeAWQsKMvS4+59wnzi4pUgc4GM9dNTEXDI2Fu
	 bzuoYpjfJTElOQEpRUO+PZDXHNfdxpZRaCIlYBC7bYUUL1PgLl7WTXQdDyIAtEGVhy
	 3vuNHe5sCJdEA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 06D8F6075F;
	Sun,  8 Feb 2026 13:16:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id E9E7F2A2
 for <buildroot@buildroot.org>; Sun,  8 Feb 2026 13:16:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C8010409AB
 for <buildroot@buildroot.org>; Sun,  8 Feb 2026 13:16:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VzqdXRUhAQnf for <buildroot@buildroot.org>;
 Sun,  8 Feb 2026 13:16:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0AEF8409A1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0AEF8409A1
 for <buildroot@buildroot.org>; Sun,  8 Feb 2026 13:16:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C922E86B91; Sun,  8 Feb 2026 13:16:19 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 8 Feb 2026 13:44:48 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f18b4289d7391bce788a8ff3fea7be82e18c4b8f
X-Git-Newrev: 759f5d5a1779e7d6fb3a3e10c8f41f9fda89f049
X-Patchwork-Hint: ignore
Message-Id: <20260208131619.C922E86B91@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sane-airscan: needs C++
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/759f5d5a1779e7d6fb3a3e10c8f41f9fda89f049
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

When the sane-airscan package was introduced in
f78280bf262ceb1c1abbdade9de77fcc4add74ae the dependency to c++ was not
added to the package.

The source directory fuzzer/ contains c++ files:
https://github.com/alexpevzner/sane-airscan/tree/master/fuzzer

meson.build requires c++:
https://github.com/alexpevzner/sane-airscan/blob/0.99.33/meson.build#L1

Fixes:
https://autobuild.buildroot.net/results/830/830374dcce8f29ad336cf8060bda552119c8377a/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/sane-airscan/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/sane-airscan/Config.in b/package/sane-airscan/Config.in
index b7cf224741..2324a3f661 100644
--- a/package/sane-airscan/Config.in
+++ b/package/sane-airscan/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_SANE_AIRSCAN
 	bool "sane-airscan"
+	depends on BR2_INSTALL_LIBSTDCPP
 	depends on !BR2_STATIC_LIBS # avahi, gnutls, sane-backends
 	depends on BR2_TOOLCHAIN_HAS_THREADS # avahi, dbus
 	depends on BR2_USE_WCHAR # avahi, gnutls
@@ -23,7 +24,7 @@ config BR2_PACKAGE_SANE_AIRSCAN
 
 	  https://github.com/alexpevzner/sane-airscan
 
-comment "sane-airscan needs a toolchain w/ wchar, dynamic library, threads"
+comment "sane-airscan needs a toolchain w/ wchar, dynamic library, threads, C++"
 	depends on BR2_USE_MMU
 	depends on !BR2_USE_WCHAR || BR2_STATIC_LIBS || \
-		!BR2_TOOLCHAIN_HAS_THREADS
+		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
