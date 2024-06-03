Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6526DC25B75
	for <buildroot@archiver.kernel.org>; Mon,  3 Jun 2024 17:34:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 32D1B40945;
	Mon,  3 Jun 2024 17:34:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UB_9K8-mkFfm; Mon,  3 Jun 2024 17:34:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5797340949
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5797340949;
	Mon,  3 Jun 2024 17:34:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C49891BF232
 for <buildroot@lists.busybox.net>; Mon,  3 Jun 2024 17:34:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9DFA96077C
 for <buildroot@lists.busybox.net>; Mon,  3 Jun 2024 17:34:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IZdCsXOtxaBR for <buildroot@lists.busybox.net>;
 Mon,  3 Jun 2024 17:34:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D82BC607B0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D82BC607B0
 for <buildroot@buildroot.org>; Mon,  3 Jun 2024 17:34:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CDFAD87A20; Mon,  3 Jun 2024 17:34:29 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 3 Jun 2024 19:33:34 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 1e70541c8546c215fc3b6f2dd127596cf635c572
X-Git-Newrev: 89492fe1a8cb27c49c12e85620abe182999bfc51
X-Patchwork-Hint: ignore
Message-Id: <20240603173429.CDFAD87A20@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/hidapi: fixup
 Config.in comment
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

commit: https://git.buildroot.net/buildroot/commit/?id=89492fe1a8cb27c49c12e85620abe182999bfc51
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

The Config.in comment was mentioning both "NPTL" and "threads" as
dependencies, while mentioning only the former is sufficient.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit dabd983c0d8f019a9b285bd3a1a843cbd5ed9d4d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/hidapi/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/hidapi/Config.in b/package/hidapi/Config.in
index 061c7883f7..1d3c86b677 100644
--- a/package/hidapi/Config.in
+++ b/package/hidapi/Config.in
@@ -15,7 +15,7 @@ config BR2_PACKAGE_HIDAPI
 
 	  http://github.com/libusb/hidapi/
 
-comment "hidapi needs udev /dev management and a toolchain w/ NPTL, threads, gcc >= 4.9"
+comment "hidapi needs udev /dev management and a toolchain w/ NPTL, gcc >= 4.9"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL || \
 		!BR2_PACKAGE_HAS_UDEV || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
