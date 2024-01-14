Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C6B8C4707B
	for <buildroot@archiver.kernel.org>; Sun, 14 Jan 2024 21:37:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0BF12822CA;
	Sun, 14 Jan 2024 21:37:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0BF12822CA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BXRwJ6qfU8G6; Sun, 14 Jan 2024 21:37:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CAB27822EF;
	Sun, 14 Jan 2024 21:37:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CAB27822EF
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9EDE71BF297
 for <buildroot@lists.busybox.net>; Sun, 14 Jan 2024 21:37:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 77DA060BDC
 for <buildroot@lists.busybox.net>; Sun, 14 Jan 2024 21:37:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 77DA060BDC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hv21R7UvLFMr for <buildroot@lists.busybox.net>;
 Sun, 14 Jan 2024 21:37:48 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9353460BCC
 for <buildroot@buildroot.org>; Sun, 14 Jan 2024 21:37:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9353460BCC
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 813508617B; Sun, 14 Jan 2024 21:37:48 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 14 Jan 2024 22:22:29 +0100
X-Git-Refname: refs/heads/2023.11.x
X-Git-Oldrev: c8d49d4960e6bd0d968e860d5f23f49e28b4f34a
X-Git-Newrev: a9e949d89ae52d02320c61db912cee191d47617a
X-Patchwork-Hint: ignore
Message-Id: <20240114213748.813508617B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.11.x] package/criu: add C++
 comment
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=a9e949d89ae52d02320c61db912cee191d47617a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.11.x

Commit 3e4b479f39c15ffdf307ec8395d856680c727204 forgot to add C++
comment

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit b66ce2631c3ecb2c6d63c0a632bc2124ac95b251)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/criu/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/criu/Config.in b/package/criu/Config.in
index fc0da823b3..4c295acf4f 100644
--- a/package/criu/Config.in
+++ b/package/criu/Config.in
@@ -43,9 +43,9 @@ config BR2_PACKAGE_CRIU
 
 	  https://criu.org/Main_Page
 
-comment "criu needs a glibc or musl toolchain w/ threads, gcc >= 8, headers >= 4.18, dynamic library, wchar"
+comment "criu needs a glibc or musl toolchain w/ threads, gcc >= 8, headers >= 4.18, C++, dynamic library, wchar"
 	depends on BR2_PACKAGE_CRIU_ARCH_SUPPORTS
 	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_8 || !BR2_TOOLCHAIN_HAS_THREADS \
 		|| !BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_18 \
-		|| BR2_TOOLCHAIN_USES_UCLIBC \
+		|| BR2_TOOLCHAIN_USES_UCLIBC || !BR2_INSTALL_LIBSTDCPP \
 		|| BR2_STATIC_LIBS || !BR2_USE_WCHAR
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
