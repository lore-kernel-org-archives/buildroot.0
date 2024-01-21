Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91355C47DAF
	for <buildroot@archiver.kernel.org>; Sun, 21 Jan 2024 16:55:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0F82D60ADD;
	Sun, 21 Jan 2024 16:55:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0F82D60ADD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rkiNtm9I7GDO; Sun, 21 Jan 2024 16:55:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6547160AD1;
	Sun, 21 Jan 2024 16:55:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6547160AD1
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8505C1BF37C
 for <buildroot@lists.busybox.net>; Sun, 21 Jan 2024 16:55:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6C3CC82670
 for <buildroot@lists.busybox.net>; Sun, 21 Jan 2024 16:55:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6C3CC82670
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UeQV1EmZPavC for <buildroot@lists.busybox.net>;
 Sun, 21 Jan 2024 16:55:51 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 443FA8266A
 for <buildroot@buildroot.org>; Sun, 21 Jan 2024 16:55:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 443FA8266A
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2DF55863E7; Sun, 21 Jan 2024 16:55:51 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 21 Jan 2024 17:55:20 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4316a4c08110da89966952bea3a37881178e296f
X-Git-Newrev: 3825cc8a38d8cb5cf1d27557b890db099e81b39c
X-Patchwork-Hint: ignore
Message-Id: <20240121165551.2DF55863E7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/criu: disable on aarch64_be
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

commit: https://git.buildroot.net/buildroot/commit/?id=3825cc8a38d8cb5cf1d27557b890db099e81b39c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

armv8a aarch64_be raises the following build failure since the addition
of the package in commit 3e4b479f39c15ffdf307ec8395d856680c727204:

Error (compel/arch/aarch64/src/lib/handle-elf-host.c:30): Unsupported Elf format detected

Fixes:
 - http://autobuild.buildroot.org/results/8eaa881a926d138a0bfd3f1076246088994e883f
 - http://autobuild.buildroot.org/results/8de9b4d6b26e06f6b4457a31366bdc0d8a8c34ae

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/criu/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/criu/Config.in b/package/criu/Config.in
index 4c295acf4f..a5adc0cedd 100644
--- a/package/criu/Config.in
+++ b/package/criu/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_CRIU_ARCH_SUPPORTS
 	default y if BR2_ARM_CPU_ARMV6
 	default y if BR2_ARM_CPU_ARMV7A
 	default y if BR2_ARM_CPU_ARMV7M
-	default y if BR2_ARM_CPU_ARMV8A
+	default y if BR2_ARM_CPU_ARMV8A && !BR2_aarch64_be
 	default y if BR2_aarch64
 	default y if BR2_x86_64
 	default y if BR2_powerpc64le # Only support powerpc64 with LE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
