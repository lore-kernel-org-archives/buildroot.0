Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A190C7619A
	for <buildroot@archiver.kernel.org>; Wed,  5 Apr 2023 20:09:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F095A8219A;
	Wed,  5 Apr 2023 20:09:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F095A8219A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zK9eoLIOz7dG; Wed,  5 Apr 2023 20:09:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3918A82182;
	Wed,  5 Apr 2023 20:09:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3918A82182
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4FFFA1C2BCF
 for <buildroot@lists.busybox.net>; Wed,  5 Apr 2023 20:09:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3738560F17
 for <buildroot@lists.busybox.net>; Wed,  5 Apr 2023 20:09:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3738560F17
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UO4ludjbp_8p for <buildroot@lists.busybox.net>;
 Wed,  5 Apr 2023 20:09:02 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 35A7660F3E
 for <buildroot@buildroot.org>; Wed,  5 Apr 2023 20:09:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 35A7660F3E
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 245C7838B7; Wed,  5 Apr 2023 20:09:02 +0000 (UTC)
From: Arnout Vandecappelle <arnout@mind.be>
To: buildroot@buildroot.org
Date: Wed, 5 Apr 2023 22:08:36 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 64fa94f72fc9e57642c85ae1bad399e7dfd213e1
X-Git-Newrev: 3d7557d80f5c9a2f1bf9889ef03566fa84b23f85
X-Patchwork-Hint: ignore
Message-Id: <20230405200902.245C7838B7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/kexec: add m68k support
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

commit: https://git.buildroot.net/buildroot/commit/?id=3d7557d80f5c9a2f1bf9889ef03566fa84b23f85
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

kexec supports m68k since commit
027413d822fd57dd39d2d2afab1484bc6b6b84f9 in v2.0.5

Signed-off-by: Laurent Vivier <laurent@vivier.eu>
Reviewed-by: Thomas Huth <huth@tuxfamily.org>
[Arnout:
 - Split off in a separate commit.
]
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/kexec/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/kexec/Config.in b/package/kexec/Config.in
index 54026284da..836d740788 100644
--- a/package/kexec/Config.in
+++ b/package/kexec/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_KEXEC_ARCH_SUPPORTS
 	depends on BR2_i386 || BR2_x86_64 || BR2_arm || BR2_armeb || \
 		BR2_mips || BR2_mips64 || BR2_mipsel || BR2_mips64el || \
 		BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le || \
-		BR2_sh4 || BR2_sh4a || BR2_aarch64 || BR2_s390x
+		BR2_sh4 || BR2_sh4a || BR2_aarch64 || BR2_s390x || BR2_m68k
 
 config BR2_PACKAGE_KEXEC
 	bool "kexec"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
