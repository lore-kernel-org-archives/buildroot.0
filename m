Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CC33C3DA5D
	for <buildroot@archiver.kernel.org>; Sun, 21 Jul 2024 16:19:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0A513605F8;
	Sun, 21 Jul 2024 16:19:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7v-PWnflGk9q; Sun, 21 Jul 2024 16:19:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1389560631
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1389560631;
	Sun, 21 Jul 2024 16:19:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7687A1BF321
 for <buildroot@lists.busybox.net>; Sun, 21 Jul 2024 16:19:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7103A60631
 for <buildroot@lists.busybox.net>; Sun, 21 Jul 2024 16:19:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vgs-2LvMx8wq for <buildroot@lists.busybox.net>;
 Sun, 21 Jul 2024 16:19:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A8AFE605F8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id A8AFE605F8
 for <buildroot@buildroot.org>; Sun, 21 Jul 2024 16:19:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9576D81470; Sun, 21 Jul 2024 16:19:10 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 21 Jul 2024 18:17:53 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ade6e41831c2b1f82028dda9744c6b64907e20ef
X-Git-Newrev: 161c25aee11650a4a6b22ca2a88fa0f84ee6b357
X-Patchwork-Hint: ignore
Message-Id: <20240721161910.9576D81470@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/micropython: adjust name in
 description
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
Content-Type: multipart/mixed; boundary="===============8309613525785036213=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8309613525785036213==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=161c25aee11650a4a6b22ca2a88fa0f84ee6b357
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Change the name from "Micro Python" (two words) to "MicroPython"
(camelcase), to match the official website and documentation.

Signed-off-by: J. Neuschäfer <j.neuschaefer@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
 

--===============8309613525785036213==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8309613525785036213==--
