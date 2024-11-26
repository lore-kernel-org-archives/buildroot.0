Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7B62D3B98B
	for <buildroot@archiver.kernel.org>; Tue, 26 Nov 2024 13:28:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B31E861B39;
	Tue, 26 Nov 2024 13:28:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NxyfMndJPaDC; Tue, 26 Nov 2024 13:28:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B93DC6F4A8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B93DC6F4A8;
	Tue, 26 Nov 2024 13:28:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 67A0F4961
 for <buildroot@buildroot.org>; Tue, 26 Nov 2024 13:28:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 48B1640553
 for <buildroot@buildroot.org>; Tue, 26 Nov 2024 13:28:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L9WT85xQDZSg for <buildroot@buildroot.org>;
 Tue, 26 Nov 2024 13:28:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 692C5404F7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 692C5404F7
 for <buildroot@buildroot.org>; Tue, 26 Nov 2024 13:28:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 64AF88667D; Tue, 26 Nov 2024 13:28:09 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 26 Nov 2024 14:08:16 +0100
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: e0a8550dc22ca5584fedbba7afe841ebf22c2f29
X-Git-Newrev: 2182134836d268e1df1448df1f936863cedd5979
X-Patchwork-Hint: ignore
Message-Id: <20241126132809.64AF88667D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/usbredir: fix
 package homepage URL
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

commit: https://git.buildroot.net/buildroot/commit/?id=2182134836d268e1df1448df1f936863cedd5979
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

The current homepage URL [1] redirects to its https and ends up to
a HTTP 404 not found error. This commit fixes the issue by replacing
it with the new URL [2].

[1] http://www.spice-space.org/page/UsbRedir
[2] https://www.spice-space.org/usbredir.html

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 122a5e252911b2ebd84d59d802e7b28b2a499f24)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/usbredir/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/usbredir/Config.in b/package/usbredir/Config.in
index 6de6227e5c..46ccac122d 100644
--- a/package/usbredir/Config.in
+++ b/package/usbredir/Config.in
@@ -17,7 +17,7 @@ config BR2_PACKAGE_USBREDIR
 	  Note: only the library is installed, not the utilities. Say
 	  'y' below if you want the tools too.
 
-	  http://www.spice-space.org/page/UsbRedir
+	  https://www.spice-space.org/usbredir.html
 
 if BR2_PACKAGE_USBREDIR
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
