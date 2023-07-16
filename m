Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 874C1EB64DD
	for <buildroot@archiver.kernel.org>; Sun, 16 Jul 2023 16:22:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3092E40141;
	Sun, 16 Jul 2023 16:22:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3092E40141
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ssAiRtUlP0Aw; Sun, 16 Jul 2023 16:22:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 56963405E9;
	Sun, 16 Jul 2023 16:22:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 56963405E9
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5A7D11BF2F8
 for <buildroot@lists.busybox.net>; Sun, 16 Jul 2023 16:21:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 215D640903
 for <buildroot@lists.busybox.net>; Sun, 16 Jul 2023 16:21:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 215D640903
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VrwStU0buTGN for <buildroot@lists.busybox.net>;
 Sun, 16 Jul 2023 16:21:42 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E1079408F6
 for <buildroot@buildroot.org>; Sun, 16 Jul 2023 16:21:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E1079408F6
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C0D8C86E8E; Sun, 16 Jul 2023 16:21:41 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 16 Jul 2023 18:17:20 +0200
X-Git-Refname: refs/heads/2023.05.x
X-Git-Oldrev: 76dd7489f23d96f739116c5cf9a425d20a76d57b
X-Git-Newrev: 095d4bbdafd35becbc143cc1caf18c88fabe8f73
X-Patchwork-Hint: ignore
Message-Id: <20230716162141.C0D8C86E8E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.05.x] package/rygel: fix
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

commit: https://git.buildroot.net/buildroot/commit/?id=095d4bbdafd35becbc143cc1caf18c88fabe8f73
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.05.x

Move the comment out of the if-clause and include the python3 dependency

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit e539853fc31a8228a2ad86eca243fd6b4ade0cff)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/rygel/Config.in | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/rygel/Config.in b/package/rygel/Config.in
index 30e8430537..e160068a55 100644
--- a/package/rygel/Config.in
+++ b/package/rygel/Config.in
@@ -52,12 +52,12 @@ comment "gstreamer1 needs gst1-editing-services"
 
 endchoice
 
-comment "rygel needs a glibc toolchain w/ wchar, threads, gcc >= 4.9, host gcc >= 8"
+endif # BR2_PACKAGE_RYGEL
+
+comment "rygel needs python3 and a glibc toolchain w/ wchar, threads, gcc >= 4.9, host gcc >= 8"
 	depends on BR2_USE_MMU
 	depends on BR2_PACKAGE_GOBJECT_INTROSPECTION_ARCH_SUPPORTS
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
 		!BR2_TOOLCHAIN_USES_GLIBC || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
-		!BR2_HOST_GCC_AT_LEAST_8
-
-endif # BR2_PACKAGE_RYGEL
+		!BR2_HOST_GCC_AT_LEAST_8 || !BR2_PACKAGE_PYTHON3
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
