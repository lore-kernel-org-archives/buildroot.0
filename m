Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FC3DEB64DD
	for <buildroot@archiver.kernel.org>; Tue, 25 Jul 2023 19:10:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B363C61105;
	Tue, 25 Jul 2023 19:10:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B363C61105
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dGcMvZ46LfLJ; Tue, 25 Jul 2023 19:10:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 005D360FA6;
	Tue, 25 Jul 2023 19:10:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 005D360FA6
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D17621BF83B
 for <buildroot@lists.busybox.net>; Tue, 25 Jul 2023 19:10:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AB6BE82097
 for <buildroot@lists.busybox.net>; Tue, 25 Jul 2023 19:10:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AB6BE82097
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tskvRnYpU2hC for <buildroot@lists.busybox.net>;
 Tue, 25 Jul 2023 19:10:21 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id F07D182040
 for <buildroot@buildroot.org>; Tue, 25 Jul 2023 19:10:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F07D182040
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DD82482940; Tue, 25 Jul 2023 19:10:20 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 25 Jul 2023 21:06:02 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7c46330cb646393a7d02ef7a73c0db74d44b28aa
X-Git-Newrev: cd59fde23489d6afae5d16934eb243729bde07c3
X-Patchwork-Hint: ignore
Message-Id: <20230725191020.DD82482940@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/fluent-but: fix symbol name
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

commit: https://git.buildroot.net/buildroot/commit/?id=cd59fde23489d6afae5d16934eb243729bde07c3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The symbol for Aarch64 big-endian, as added by 9b19030f3f75
(package/fluent-bit: rework wasm handling), is misspelled.

Fixes: 9b19030f3f75

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/fluent-bit/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/fluent-bit/Config.in b/package/fluent-bit/Config.in
index 9ffde5b315..dec40c4371 100644
--- a/package/fluent-bit/Config.in
+++ b/package/fluent-bit/Config.in
@@ -15,7 +15,7 @@ if BR2_PACKAGE_FLUENT_BIT
 
 config BR2_PACKAGE_FLUENT_BIT_WASM_ARCH
 	string
-	default "AARCH64"    if BR2_aarch64 || BR2_aarch64be
+	default "AARCH64"    if BR2_aarch64 || BR2_aarch64_be
 	default "ARC"        if BR2_arcle || BR2_arceb
 	default "ARM"        if BR2_arm || BR2_armeb
 	default "MIPS"       if BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
