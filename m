Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1049D74945
	for <buildroot@archiver.kernel.org>; Tue, 29 Oct 2024 21:12:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6CA49810AC;
	Tue, 29 Oct 2024 21:12:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xaSwTB6lS2Vk; Tue, 29 Oct 2024 21:12:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 809B6810B0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 809B6810B0;
	Tue, 29 Oct 2024 21:12:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 41AA34EC0
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 21:12:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2FEE3810B0
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 21:12:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z3KB6P5naBnJ for <buildroot@buildroot.org>;
 Tue, 29 Oct 2024 21:12:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 65B9D810AC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 65B9D810AC
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 21:12:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5B0E584958; Tue, 29 Oct 2024 21:12:25 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 29 Oct 2024 22:11:28 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3ee7c891a0173417fbd4726928bd4d4689048b22
X-Git-Newrev: 124d333462597895be0ed251c6040636d10b7d5d
X-Patchwork-Hint: ignore
Message-Id: <20241029211225.5B0E584958@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/dlib: add missing dependency on
 wchar
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=124d333462597895be0ed251c6040636d10b7d5d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since the package was introduced in Buildroot commit
3cb185d3df237341382b03c8e6f6c5358063c721, it has been failing to build
on !wchar configurations. Let's add the missing dependency on wchar
support.

Fixes:

  https://autobuild.buildroot.org/results/f5c543bcf57181373680d0c16a1814d21b000bcf

Signed-off-by: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/dlib/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/dlib/Config.in b/package/dlib/Config.in
index 2419af967b..7862f8d074 100644
--- a/package/dlib/Config.in
+++ b/package/dlib/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_DLIB
 	bool "dlib"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_USE_WCHAR
 	help
 	  Dlib is a modern C++ toolkit containing machine learning
 	  algorithms and tools for creating complex software in C++ to
@@ -9,6 +10,7 @@ config BR2_PACKAGE_DLIB
 
 	  http://dlib.net
 
-comment "dlib needs a toolchain w/ C++, threads"
+comment "dlib needs a toolchain w/ C++, threads, wchar"
 	depends on !BR2_INSTALL_LIBSTDCPP || \
-		!BR2_TOOLCHAIN_HAS_THREADS
+		!BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_USE_WCHAR
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
