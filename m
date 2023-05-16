Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFE4EC7EE25
	for <buildroot@archiver.kernel.org>; Tue, 16 May 2023 12:50:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7A65E405AE;
	Tue, 16 May 2023 12:50:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7A65E405AE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id q1wsI3RxUHO4; Tue, 16 May 2023 12:50:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 35DA740BA0;
	Tue, 16 May 2023 12:50:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 35DA740BA0
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 72F981BF94D
 for <buildroot@lists.busybox.net>; Tue, 16 May 2023 12:50:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 55AEC41505
 for <buildroot@lists.busybox.net>; Tue, 16 May 2023 12:50:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 55AEC41505
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xo_h1kneaJMd for <buildroot@lists.busybox.net>;
 Tue, 16 May 2023 12:50:21 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 68F91414C4
 for <buildroot@buildroot.org>; Tue, 16 May 2023 12:50:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 68F91414C4
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5632D86773; Tue, 16 May 2023 12:50:21 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 16 May 2023 14:36:26 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 1b2cc4afbf9b4ba63877f81113f3b4ba92944add
X-Git-Newrev: 18ea458338358731d3e4b9fb833e70ee1a363003
X-Patchwork-Hint: ignore
Message-Id: <20230516125021.5632D86773@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/edid-decode: fix
 typo in Config.in for comment selection
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

commit: https://git.buildroot.net/buildroot/commit/?id=18ea458338358731d3e4b9fb833e70ee1a363003
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Fix typo ('!!' vs. '!') Config.in for dependencies comment selection
(introduced by commit 'package/edid-decode: bump version to 1889504',
see [1]).

[1] https://git.buildroot.net/buildroot/commit/?id=d498088fe7e1e664d4ee8d9bc54262d40227d6e5

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 0ee49d6272b7046c0d961da0b3950e0f78b89a0b)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/edid-decode/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/edid-decode/Config.in b/package/edid-decode/Config.in
index ddf1942c68..5ebecd7330 100644
--- a/package/edid-decode/Config.in
+++ b/package/edid-decode/Config.in
@@ -8,5 +8,5 @@ config BR2_PACKAGE_EDID_DECODE
 	  https://git.linuxtv.org/edid-decode.git/
 
 comment "edid-decode needs a toolchain w/ C++, gcc >= 4.7"
-	depends on !!BR2_INSTALL_LIBSTDCPP || \
+	depends on !BR2_INSTALL_LIBSTDCPP || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_7
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
