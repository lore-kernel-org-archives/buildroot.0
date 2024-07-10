Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C25B3C3DA41
	for <buildroot@archiver.kernel.org>; Wed, 10 Jul 2024 21:13:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 93D3C6066E;
	Wed, 10 Jul 2024 21:13:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cWuZvM2AF4an; Wed, 10 Jul 2024 21:13:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B3D5860672
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B3D5860672;
	Wed, 10 Jul 2024 21:13:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F1CAA1BF292
 for <buildroot@lists.busybox.net>; Wed, 10 Jul 2024 21:13:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DD34F81F7D
 for <buildroot@lists.busybox.net>; Wed, 10 Jul 2024 21:13:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RDkURKyebCrk for <buildroot@lists.busybox.net>;
 Wed, 10 Jul 2024 21:13:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A200180C65
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A200180C65
 for <buildroot@buildroot.org>; Wed, 10 Jul 2024 21:13:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9A31584723; Wed, 10 Jul 2024 21:13:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 10 Jul 2024 23:13:20 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e9f949d4831e9b1568cbfc0ed31a76f5f1fb2372
X-Git-Newrev: 62103be918e7a155749b1b3b680a9e4ecba6af87
X-Patchwork-Hint: ignore
Message-Id: <20240710211349.9A31584723@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libssh: select
 BR2_PACKAGE_LIBOPENSSL_ENGINES
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=62103be918e7a155749b1b3b680a9e4ecba6af87
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This fixes link time errors, undefined references to various ENGINE_*
functions in case libopenssl backend is used.

Fixes:

  http://autobuild.buildroot.net/results/5bb845be7f861dc3540a8dc618ccd1a0a759f2d5/

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libssh/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libssh/Config.in b/package/libssh/Config.in
index 1f271a692e..eaec754414 100644
--- a/package/libssh/Config.in
+++ b/package/libssh/Config.in
@@ -36,6 +36,7 @@ config BR2_PACKAGE_LIBSSH_LIBGCRYPT
 config BR2_PACKAGE_LIBSSH_OPENSSL
 	bool "openssl"
 	depends on BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_LIBOPENSSL_ENGINES
 
 endchoice
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
