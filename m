Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C60CBC83F25
	for <buildroot@archiver.kernel.org>; Thu, 29 Aug 2024 13:42:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8895A4094A;
	Thu, 29 Aug 2024 13:42:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ExUUNz9HsliD; Thu, 29 Aug 2024 13:42:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5D31840185
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5D31840185;
	Thu, 29 Aug 2024 13:42:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 089001BF8B4
 for <buildroot@lists.busybox.net>; Thu, 29 Aug 2024 13:42:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 01CFA81E5B
 for <buildroot@lists.busybox.net>; Thu, 29 Aug 2024 13:42:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dcKtbxEYNx9J for <buildroot@lists.busybox.net>;
 Thu, 29 Aug 2024 13:42:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3D33E81DF7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3D33E81DF7
 for <buildroot@buildroot.org>; Thu, 29 Aug 2024 13:42:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 35B1B8665E; Thu, 29 Aug 2024 13:42:26 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 29 Aug 2024 15:40:45 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 29db3dd6e5d51d2450c29accbee55091b2f82036
X-Git-Newrev: 8faac43daaae56694f66d1bd4da6fb273c9f4eb5
X-Patchwork-Hint: ignore
Message-Id: <20240829134226.35B1B8665E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/micropython:
 adjust name in description
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
Content-Type: multipart/mixed; boundary="===============6388227654516422294=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6388227654516422294==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=8faac43daaae56694f66d1bd4da6fb273c9f4eb5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Change the name from "Micro Python" (two words) to "MicroPython"
(camelcase), to match the official website and documentation.

Signed-off-by: J. Neuschäfer <j.neuschaefer@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 161c25aee11650a4a6b22ca2a88fa0f84ee6b357)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/micropython/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/micropython/Config.in b/package/micropython/Config.in
index b466fbaf2d..f532b3bdb5 100644
--- a/package/micropython/Config.in
+++ b/package/micropython/Config.in
@@ -3,7 +3,7 @@ config BR2_PACKAGE_MICROPYTHON
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_STATIC_LIBS
 	help
-	  Micro Python is a lean and fast implementation of the Python
+	  MicroPython is a lean and fast implementation of the Python
 	  3 programming language that is optimised to run on a
 	  microcontroller.
 

--===============6388227654516422294==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6388227654516422294==--
