Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3402EB64DD
	for <buildroot@archiver.kernel.org>; Sun, 16 Jul 2023 16:22:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 866F64047D;
	Sun, 16 Jul 2023 16:22:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 866F64047D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VtF0I8EoC42G; Sun, 16 Jul 2023 16:22:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D1DE2400FF;
	Sun, 16 Jul 2023 16:22:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D1DE2400FF
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7C2F61BF2F8
 for <buildroot@lists.busybox.net>; Sun, 16 Jul 2023 16:22:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 55E8281831
 for <buildroot@lists.busybox.net>; Sun, 16 Jul 2023 16:22:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 55E8281831
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id I7PT4OJKbIQM for <buildroot@lists.busybox.net>;
 Sun, 16 Jul 2023 16:22:48 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9059F817EB
 for <buildroot@buildroot.org>; Sun, 16 Jul 2023 16:22:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9059F817EB
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7FDE986EFC; Sun, 16 Jul 2023 16:22:48 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 16 Jul 2023 18:17:44 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: d69773edb42e89cb3abe078df3d85aebb163ba6a
X-Git-Newrev: f5315e59bdb59469573becc1bd80402cd3dbdf08
X-Patchwork-Hint: ignore
Message-Id: <20230716162248.7FDE986EFC@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/rygel: fix
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

commit: https://git.buildroot.net/buildroot/commit/?id=f5315e59bdb59469573becc1bd80402cd3dbdf08
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

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
