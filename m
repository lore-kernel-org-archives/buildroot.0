Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33CD3C7EE31
	for <buildroot@archiver.kernel.org>; Thu, 26 Jun 2025 19:49:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ED87041962;
	Thu, 26 Jun 2025 19:49:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FEMQ9tUCYcoX; Thu, 26 Jun 2025 19:49:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 47EF841968
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 47EF841968;
	Thu, 26 Jun 2025 19:49:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6E1CA154
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 19:49:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2BAC441959
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 19:49:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XwXqRmwnmNdq for <buildroot@buildroot.org>;
 Thu, 26 Jun 2025 19:49:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3904A41961
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3904A41961
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 19:49:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 371208467F; Thu, 26 Jun 2025 19:49:22 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 24 Jun 2025 20:41:05 +0200
X-Git-Refname: refs/heads/2025.05.x
X-Git-Oldrev: b057dce157c814b57f40b70db37ffd58bf7ad856
X-Git-Newrev: 8d9eecf60a72d27a1289b2d616ee5f9bff7b1fc9
X-Patchwork-Hint: ignore
Message-Id: <20250626194922.371208467F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.05.x] package/lpac: needs
 libqmi for optional support of libqrtr-glib
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=8d9eecf60a72d27a1289b2d616ee5f9bff7b1fc9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.05.x

Buildroot commit dad998a8070bc07838f78453fcb7906fefab22ba added this
package but forgot to select libqmi for optional support of libqrtr-glib.

Fixes:
https://autobuild.buildroot.net/results/95e/95e30d1031912efa200edb9c7b926a31f0abe32f/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 03be706382dc03ff800c6dbd3363a4746f97d6c2)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/lpac/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/lpac/Config.in b/package/lpac/Config.in
index 6cfe11cc67..c754da96d9 100644
--- a/package/lpac/Config.in
+++ b/package/lpac/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_LPAC
 	depends on !BR2_STATIC_LIBS # pcsc-lite
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # pcsc-lite
 	select BR2_PACKAGE_PCSC_LITE
+	select BR2_PACKAGE_LIBQMI if BR2_PACKAGE_LIBQRTR_GLIB
 	help
 	  C-based eUICC LPA.
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
