Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22FB8C02192
	for <buildroot@archiver.kernel.org>; Mon,  3 Feb 2025 11:44:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E4E436084C;
	Mon,  3 Feb 2025 11:44:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NJhiVU7pxNn0; Mon,  3 Feb 2025 11:44:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1D2546085E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1D2546085E;
	Mon,  3 Feb 2025 11:44:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2C30B1A1
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 11:44:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0FF3D60878
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 11:44:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GiOu1ZCEz4eG for <buildroot@buildroot.org>;
 Mon,  3 Feb 2025 11:44:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F303D6084C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id F303D6084C
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 11:44:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EC7DD868B7; Mon,  3 Feb 2025 11:44:21 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 3 Feb 2025 12:43:33 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 38e63800f6a33d7294fe8b2573432062f11c6537
X-Git-Newrev: 5bb4fdf4f18c414775a075a4f9ec49f7d316ff11
X-Patchwork-Hint: ignore
Message-Id: <20250203114421.EC7DD868B7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/criu: remove redundant select
 BR2_PACKAGE_HOST_PYTHON3
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=5bb4fdf4f18c414775a075a4f9ec49f7d316ff11
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

BR2_PACKAGE_HOST_PYTHON3 is now selected by python3 itself, which is a
direct dependency. The select was only needed to be able to select
BR2_PACKAGE_HOST_PYTHON3_SSL.

Remove the redundant `select BR2_PACKAGE_HOST_PYTHON3`.

Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/criu/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/criu/Config.in b/package/criu/Config.in
index fc6897c4d0..63ab926f56 100644
--- a/package/criu/Config.in
+++ b/package/criu/Config.in
@@ -26,7 +26,6 @@ config BR2_PACKAGE_CRIU
 	depends on BR2_INSTALL_LIBSTDCPP # protobuf
 	depends on BR2_TOOLCHAIN_HAS_THREADS # protobuf, libnl
 	depends on BR2_USE_WCHAR # libbsd
-	select BR2_PACKAGE_HOST_PYTHON3
 	select BR2_PACKAGE_HOST_PYTHON3_SSL
 	select BR2_PACKAGE_PROTOBUF
 	select BR2_PACKAGE_PROTOBUF_C
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
