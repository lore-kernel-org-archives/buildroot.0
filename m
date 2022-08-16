Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BB95C32772
	for <buildroot@archiver.kernel.org>; Tue, 16 Aug 2022 08:36:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C0FC260F39;
	Tue, 16 Aug 2022 08:36:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C0FC260F39
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QX2V0G5aQqwd; Tue, 16 Aug 2022 08:36:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CFF7560F2E;
	Tue, 16 Aug 2022 08:36:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CFF7560F2E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E05991BF2A4
 for <buildroot@lists.busybox.net>; Tue, 16 Aug 2022 08:35:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CE78860E39
 for <buildroot@lists.busybox.net>; Tue, 16 Aug 2022 08:35:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CE78860E39
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uCfhQ9snpzVy for <buildroot@lists.busybox.net>;
 Tue, 16 Aug 2022 08:35:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1B1B760E58
 for <buildroot@buildroot.org>; Tue, 16 Aug 2022 08:35:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1B1B760E58
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id E25C48773E; Tue, 16 Aug 2022 08:20:38 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 16 Aug 2022 10:18:02 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: 3628685a288ea0ad7248acab8ca884154ab6b4aa
X-Git-Newrev: 4a6308d9c69350910d4e4687a6324ae3a5aca399
X-Patchwork-Hint: ignore
Message-Id: <20220816082038.E25C48773E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x] package/netsniff-ng: fix
 spurious space and tab
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

commit: https://git.buildroot.net/buildroot/commit/?id=4a6308d9c69350910d4e4687a6324ae3a5aca399
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

Fix spurious space and tab added by commit
b0f98d5800b288500752ef51b969d9a3cb92e897

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 76a6008b8a21f45fb8355861421cd84d1d24eda9)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/netsniff-ng/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/netsniff-ng/Config.in b/package/netsniff-ng/Config.in
index 6b043362ba..bbb4172cd3 100644
--- a/package/netsniff-ng/Config.in
+++ b/package/netsniff-ng/Config.in
@@ -30,5 +30,5 @@ endif
 
 comment "netsniff-ng needs a toolchain w/ threads, headers >= 3.0"
 	depends on BR2_PACKAGE_LIBURCU_ARCH_SUPPORTS
-	depends on !BR2_TOOLCHAIN_HAS_THREADS  || \
-			!BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
