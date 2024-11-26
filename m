Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88971D3B98B
	for <buildroot@archiver.kernel.org>; Tue, 26 Nov 2024 13:26:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4EE5C40565;
	Tue, 26 Nov 2024 13:26:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AGNZNAuLMsKg; Tue, 26 Nov 2024 13:26:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3E0744054D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3E0744054D;
	Tue, 26 Nov 2024 13:26:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0C8CB599C
 for <buildroot@buildroot.org>; Tue, 26 Nov 2024 13:26:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E0DB3403D5
 for <buildroot@buildroot.org>; Tue, 26 Nov 2024 13:26:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P8bFjL1-hhFr for <buildroot@buildroot.org>;
 Tue, 26 Nov 2024 13:26:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D2AAD403DB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D2AAD403DB
 for <buildroot@buildroot.org>; Tue, 26 Nov 2024 13:26:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BB40A86640; Tue, 26 Nov 2024 13:26:38 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 26 Nov 2024 14:07:44 +0100
X-Git-Refname: refs/heads/2024.08.x
X-Git-Oldrev: e21e65d49e23e0726750945dbd3588f3cfae4f54
X-Git-Newrev: 1b73bbbf7143e33c2a407029c45d2b927a2429c1
X-Patchwork-Hint: ignore
Message-Id: <20241126132638.BB40A86640@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.08.x] package/usbredir: fix
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

commit: https://git.buildroot.net/buildroot/commit/?id=1b73bbbf7143e33c2a407029c45d2b927a2429c1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.08.x

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
