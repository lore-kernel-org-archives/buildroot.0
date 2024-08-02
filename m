Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45AC1C3DA4A
	for <buildroot@archiver.kernel.org>; Fri,  2 Aug 2024 21:35:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7DC02606B8;
	Fri,  2 Aug 2024 21:35:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8_PeaFywXfaZ; Fri,  2 Aug 2024 21:35:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D52786130B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D52786130B;
	Fri,  2 Aug 2024 21:35:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0A2E51BF990
 for <buildroot@lists.busybox.net>; Fri,  2 Aug 2024 21:35:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 041C240D0B
 for <buildroot@lists.busybox.net>; Fri,  2 Aug 2024 21:35:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lUrk8CsdIBJI for <buildroot@lists.busybox.net>;
 Fri,  2 Aug 2024 21:35:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EF16E40BF7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id EF16E40BF7
 for <buildroot@buildroot.org>; Fri,  2 Aug 2024 21:35:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D891F83C23; Fri,  2 Aug 2024 21:35:33 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 2 Aug 2024 23:31:08 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9696d277565159029e74efb9eae16b4a670bf945
X-Git-Newrev: b88d2b51a4bd2d825d71730bde934dc9991fc6cf
X-Patchwork-Hint: ignore
Message-Id: <20240802213533.D891F83C23@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gpsd: fix comment about wchar
 requirement
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

commit: https://git.buildroot.net/buildroot/commit/?id=b88d2b51a4bd2d825d71730bde934dc9991fc6cf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The comment does not follow the coding style, so update it appropriately.

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Cc: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
