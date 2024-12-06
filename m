Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F99FE7717D
	for <buildroot@archiver.kernel.org>; Fri,  6 Dec 2024 22:55:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 09DDD4033B;
	Fri,  6 Dec 2024 22:55:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wK1tinAoNLdX; Fri,  6 Dec 2024 22:55:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D4EC44033D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D4EC44033D;
	Fri,  6 Dec 2024 22:55:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id E18E3ECA
 for <buildroot@buildroot.org>; Fri,  6 Dec 2024 22:55:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CDC2380EAB
 for <buildroot@buildroot.org>; Fri,  6 Dec 2024 22:55:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Vae_US8odcHp for <buildroot@buildroot.org>;
 Fri,  6 Dec 2024 22:55:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D93D680ECD
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D93D680ECD
 for <buildroot@buildroot.org>; Fri,  6 Dec 2024 22:55:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C737186B3B; Fri,  6 Dec 2024 22:55:24 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 6 Dec 2024 23:26:12 +0100
X-Git-Refname: refs/heads/2024.08.x
X-Git-Oldrev: a5bf4d7b804aaa6737e81b68de0eb5c13361630b
X-Git-Newrev: a41d3d1807a8d927b2d4a4e0b4f6407584fa6770
X-Patchwork-Hint: ignore
Message-Id: <20241206225524.C737186B3B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.08.x] package/libvpl: not
 supported on mips64
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

commit: https://git.buildroot.net/buildroot/commit/?id=a41d3d1807a8d927b2d4a4e0b4f6407584fa6770
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.08.x

Although adding " || defined(__mips__)" here:
https://github.com/intel/libvpl/blob/main/api/vpl/mfxdefs.h#L71

would fix the problem, libvpl alone makes no sense and the only
dependee, intel-vpl-gpu-rt, is unsupported on mips anyway.

Fixes:
http://autobuild.buildroot.net/results/50d/50d64ab2d547c70b39e2421ee2763d8309873125/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
(cherry picked from commit 014a8201c857e81abeca026211e84f9c9353c9ba)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libvpl/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libvpl/Config.in b/package/libvpl/Config.in
index b9e9a20fd7..5a370ed2e3 100644
--- a/package/libvpl/Config.in
+++ b/package/libvpl/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_LIBVPL_ARCH_SUPPORTS
 	bool
-	default y if BR2_ARCH_IS_64
+	default y if BR2_ARCH_IS_64 && !BR2_mips64 && !BR2_mips64el
 	default y if BR2_arm
 
 config BR2_PACKAGE_LIBVPL
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
