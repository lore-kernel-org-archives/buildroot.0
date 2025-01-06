Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7EE8E77188
	for <buildroot@archiver.kernel.org>; Mon,  6 Jan 2025 22:20:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7C5EC404B6;
	Mon,  6 Jan 2025 22:20:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DenlvmjlcmQF; Mon,  6 Jan 2025 22:20:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6FAD7406E8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6FAD7406E8;
	Mon,  6 Jan 2025 22:20:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id EDB95F1E
 for <buildroot@buildroot.org>; Mon,  6 Jan 2025 22:20:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DA3EA60604
 for <buildroot@buildroot.org>; Mon,  6 Jan 2025 22:20:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x97xavjToowN for <buildroot@buildroot.org>;
 Mon,  6 Jan 2025 22:20:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0E998605B7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0E998605B7
 for <buildroot@buildroot.org>; Mon,  6 Jan 2025 22:20:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E713C83BBF; Mon,  6 Jan 2025 22:20:49 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Mon, 6 Jan 2025 23:19:33 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: da9adec1491eefc618aab610615fe293899845fd
X-Git-Newrev: 8c93f0c1f51a32f3e68761104e512123490b515e
X-Patchwork-Hint: ignore
Message-Id: <20250106222049.E713C83BBF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/arm-gnu-toolchain: drop prompt for
 _SUPPORTS option
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

commit: https://git.buildroot.net/buildroot/commit/?id=8c93f0c1f51a32f3e68761104e512123490b515e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The _SUPPORTS option should be blind: it represents a restriction that
we certainly do not want to allow the user to lift by manually enabling
that option...

Fixes: 65f268e21cbe (package/arm-gnu-toolchain: add
       BR2_PACKAGE_HOST_ARM_GNU_TOOLCHAIN_SUPPORTS)

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Bryce Johnson <bryce@redpinelabs.com>
Cc: Suniel Mahesh <sunil@amarulasolutions.com>
Reviewed-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/arm-gnu-toolchain/Config.in.host | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/arm-gnu-toolchain/Config.in.host b/package/arm-gnu-toolchain/Config.in.host
index dfd30e5223..de8ff8c005 100644
--- a/package/arm-gnu-toolchain/Config.in.host
+++ b/package/arm-gnu-toolchain/Config.in.host
@@ -1,4 +1,4 @@
 config BR2_PACKAGE_HOST_ARM_GNU_TOOLCHAIN_SUPPORTS
-	bool "host arm-gnu-toolchain"
+	bool
 	default y if BR2_HOSTARCH = "aarch64"
 	default y if BR2_HOSTARCH = "x86_64"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
