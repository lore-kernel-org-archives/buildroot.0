Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89D22EF99D0
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 19:40:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5A9CD845D6;
	Fri, 13 Feb 2026 19:40:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HA1OHAs1zYHa; Fri, 13 Feb 2026 19:40:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6FA538491E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771011602;
	bh=hKvvLG4znE/T4phnB01GzRqSe+rqrzFwJ3/8avFjWiU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=VgwGzSGDoahz+Cwz0RGiyeeqCHwEIQsf1LZXsGPX63BF3ECRnzNP9Jyo95ApCwQFl
	 YtNCY5NfwUqhLlX5AjWUzHrw0RPb6v3cRb4GBU3LYifeYd0dFRebLLdAxL2sr4cX+F
	 dHAeRFTasmh6G+q7OQzuAkbE33Zu+5pUzfO/DK2acahqeAikj2RUt9F3UnPzmlKZny
	 XQjH8RX5pw/OKEDimXDRrjvGj4EMWpJRc8OYi/l4+lbGkjy3K5SXT+FWRmQQsF4j86
	 6v7vv0i+ZaXYUljAQY2llh+7jjojq8LASNKUUMcN4WWKzvIe3Vk6vMByf8j/4UtV75
	 1G920k4skx5zA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6FA538491E;
	Fri, 13 Feb 2026 19:40:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id A3C5269
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:38:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 120E6413C7
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LAesNRdYpcUB for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 19:37:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1D127412E7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1D127412E7
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 124FA7FB72; Fri, 13 Feb 2026 19:37:06 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 13 Feb 2026 20:33:59 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: c90ce3bff68927309cf1223551fa3b2dacf0d1b9
X-Git-Newrev: 51f30ea2a1e234d0720b71d820dac56d4b134ad2
X-Patchwork-Hint: ignore
Message-Id: <20260213193706.124FA7FB72@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/sane-airscan:
 needs C++
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/51f30ea2a1e234d0720b71d820dac56d4b134ad2
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.11.x

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
(cherry picked from commit 759f5d5a1779e7d6fb3a3e10c8f41f9fda89f049)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
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
