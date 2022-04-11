Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B09CC433F5
	for <buildroot@archiver.kernel.org>; Mon, 11 Apr 2022 09:46:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 22D644160B;
	Mon, 11 Apr 2022 09:46:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UXqtZEjSlFmz; Mon, 11 Apr 2022 09:46:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E84F84152B;
	Mon, 11 Apr 2022 09:46:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3EF831BF9AD
 for <buildroot@lists.busybox.net>; Mon, 11 Apr 2022 09:46:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2C7CB40930
 for <buildroot@lists.busybox.net>; Mon, 11 Apr 2022 09:46:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vqG4KpfwF76U for <buildroot@lists.busybox.net>;
 Mon, 11 Apr 2022 09:46:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 793F04059C
 for <buildroot@buildroot.org>; Mon, 11 Apr 2022 09:46:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id E994883984; Mon, 11 Apr 2022 09:36:36 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 11 Apr 2022 11:42:02 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 74399277a5a077973b3b86e5f9dde4b93f056f86
X-Git-Newrev: 1424a67d0a8279a126f4bd87accbd5de8718be2b
X-Patchwork-Hint: ignore
Message-Id: <20220411093636.E994883984@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/spice: needs C++
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

commit: https://git.buildroot.net/buildroot/commit/?id=1424a67d0a8279a126f4bd87accbd5de8718be2b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

spice needs C++ since bump to version 0.15.0 in commit
b784f1bc0fc3ac33a20549069a81ff98260b58e9 and
https://github.com/freedesktop/spice/commit/e6e6ded681ff154f236f260f071389c4c8c0d944:

configure: error: *** A compiler with support for C++11 language features is required.

Fixes:
 - http://autobuild.buildroot.org/results/4e0dc43c28d45176cccf573fb56ea9690192f754

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 35be926c97836989d6cecbc7ecb49f9c9bd46eba)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/spice/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/spice/Config.in b/package/spice/Config.in
index 2241b55b3d..ca5c562ca1 100644
--- a/package/spice/Config.in
+++ b/package/spice/Config.in
@@ -1,12 +1,14 @@
-comment "spice server needs a toolchain w/ wchar, threads"
+comment "spice server needs a toolchain w/ wchar, threads, C++"
 	depends on BR2_i386 || BR2_x86_64
-	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_INSTALL_LIBSTDCPP
 
 config BR2_PACKAGE_SPICE
 	bool "spice server"
 	depends on BR2_i386 || BR2_x86_64
 	depends on BR2_USE_WCHAR # libglib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
+	depends on BR2_INSTALL_LIBSTDCPP
 	select BR2_PACKAGE_JPEG
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_OPENSSL
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
