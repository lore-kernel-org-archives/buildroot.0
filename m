Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF902C3DA6D
	for <buildroot@archiver.kernel.org>; Tue, 20 May 2025 20:57:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B49CA81E81;
	Tue, 20 May 2025 20:57:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ggr7njozkulP; Tue, 20 May 2025 20:57:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 066E381DE1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 066E381DE1;
	Tue, 20 May 2025 20:57:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 48F23D4
 for <buildroot@buildroot.org>; Tue, 20 May 2025 20:57:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4684140B4B
 for <buildroot@buildroot.org>; Tue, 20 May 2025 20:57:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vTc9dhRQhvG9 for <buildroot@buildroot.org>;
 Tue, 20 May 2025 20:57:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8644D40AD9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8644D40AD9
 for <buildroot@buildroot.org>; Tue, 20 May 2025 20:57:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7680B874F6; Tue, 20 May 2025 20:57:22 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Tue, 20 May 2025 22:50:59 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e5b4518319201d2391411e290c61672590f72d98
X-Git-Newrev: bd28e7a22c85a4ba981995181bf1b0020c372e0e
X-Patchwork-Hint: ignore
Message-Id: <20250520205722.7680B874F6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/casync-nano: enable OpenSSL
 ChaCha20 support
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=bd28e7a22c85a4ba981995181bf1b0020c372e0e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When building against OpenSSL, ensure the ChaCha20 algorithm is enabled,
which is needed by this package.

Fixes: https://autobuild.buildroot.org/results/3cb/3cb58229dfb47e79c50b4b52ca57b3f56a945ed7

Signed-off-by: Florian Larysch <fl@n621.de>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/casync-nano/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/casync-nano/Config.in b/package/casync-nano/Config.in
index 8ba80e4ce6..e0e555eda3 100644
--- a/package/casync-nano/Config.in
+++ b/package/casync-nano/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_CASYNC_NANO
 	bool "casync-nano"
 	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_LIBOPENSSL_ENABLE_CHACHA if BR2_PACKAGE_LIBOPENSSL
 	select BR2_PACKAGE_ZSTD
 	select BR2_PACKAGE_LIBCURL
 	help
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
