Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 466C3CD37AA
	for <buildroot@archiver.kernel.org>; Tue,  3 Sep 2024 18:38:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0D02240A1A;
	Tue,  3 Sep 2024 18:38:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9-ScBduC6-op; Tue,  3 Sep 2024 18:38:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 24CDF40A25
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 24CDF40A25;
	Tue,  3 Sep 2024 18:38:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 234D51BF95D
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 18:38:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C719B80ABE
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 18:38:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Pg-mHxC3Rj4f for <buildroot@lists.busybox.net>;
 Tue,  3 Sep 2024 18:38:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 08CB980F83
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 08CB980F83
 for <buildroot@buildroot.org>; Tue,  3 Sep 2024 18:38:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E726D86ABC; Tue,  3 Sep 2024 18:38:09 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 3 Sep 2024 20:00:35 +0200
X-Git-Refname: refs/heads/2024.05.x
X-Git-Oldrev: 3455df79bcbe3f46eea04b17a0e6504cf9f2e338
X-Git-Newrev: 83112fb33fcc88062962d58ab85ec5d7bc8eca82
X-Patchwork-Hint: ignore
Message-Id: <20240903183809.E726D86ABC@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.05.x] package/gpsd: fix comment
 about wchar requirement
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

commit: https://git.buildroot.net/buildroot/commit/?id=83112fb33fcc88062962d58ab85ec5d7bc8eca82
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.05.x

The comment does not follow the coding style, so update it appropriately.

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Cc: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit b88d2b51a4bd2d825d71730bde934dc9991fc6cf)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gpsd/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gpsd/Config.in b/package/gpsd/Config.in
index 8c28c05efd..44615f4e43 100644
--- a/package/gpsd/Config.in
+++ b/package/gpsd/Config.in
@@ -84,7 +84,7 @@ config BR2_PACKAGE_GPSD_PYTHON
 	  Python libraries and tools for the gpsd service daemon
 	  including gpsfake test harness.
 
-comment "GPSD python support not available with toolchain w/o wide characters support"
+comment "python support needs a toolchain w/ wchar"
 	depends on !BR2_USE_WCHAR
 
 comment "Protocols"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
