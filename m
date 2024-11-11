Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BC89D3ABF4
	for <buildroot@archiver.kernel.org>; Mon, 11 Nov 2024 20:46:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1F9C8401C2;
	Mon, 11 Nov 2024 20:46:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Qq6WtwbdTLGD; Mon, 11 Nov 2024 20:46:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F35EB401CF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id F35EB401CF;
	Mon, 11 Nov 2024 20:46:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 84FBDD8F
 for <buildroot@buildroot.org>; Mon, 11 Nov 2024 20:46:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 71EC8606E6
 for <buildroot@buildroot.org>; Mon, 11 Nov 2024 20:46:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id URRqV2pGq1H8 for <buildroot@buildroot.org>;
 Mon, 11 Nov 2024 20:46:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A424E606F8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id A424E606F8
 for <buildroot@buildroot.org>; Mon, 11 Nov 2024 20:46:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9A07D8612B; Mon, 11 Nov 2024 20:46:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 11 Nov 2024 21:41:21 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 77fcce23c6d91ed492fac35a215af1bf46ad34a3
X-Git-Newrev: 122a5e252911b2ebd84d59d802e7b28b2a499f24
X-Patchwork-Hint: ignore
Message-Id: <20241111204643.9A07D8612B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/usbredir: fix package homepage URL
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

commit: https://git.buildroot.net/buildroot/commit/?id=122a5e252911b2ebd84d59d802e7b28b2a499f24
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The current homepage URL [1] redirects to its https and ends up to
a HTTP 404 not found error. This commit fixes the issue by replacing
it with the new URL [2].

[1] http://www.spice-space.org/page/UsbRedir
[2] https://www.spice-space.org/usbredir.html

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
