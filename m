Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E271C7619A
	for <buildroot@archiver.kernel.org>; Wed,  5 Apr 2023 20:09:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D0F3A812D8;
	Wed,  5 Apr 2023 20:09:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D0F3A812D8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hiHrb-EId6oQ; Wed,  5 Apr 2023 20:09:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3077C8139E;
	Wed,  5 Apr 2023 20:09:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3077C8139E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 181EC1BF364
 for <buildroot@lists.busybox.net>; Wed,  5 Apr 2023 20:09:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E5FE660F17
 for <buildroot@lists.busybox.net>; Wed,  5 Apr 2023 20:09:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E5FE660F17
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6rFPrMPCznLj for <buildroot@lists.busybox.net>;
 Wed,  5 Apr 2023 20:09:02 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2EED060F3A
 for <buildroot@buildroot.org>; Wed,  5 Apr 2023 20:09:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2EED060F3A
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1C213838B6; Wed,  5 Apr 2023 20:09:02 +0000 (UTC)
From: Arnout Vandecappelle <arnout@mind.be>
To: buildroot@buildroot.org
Date: Wed, 5 Apr 2023 22:08:35 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0d8d348826aa59b8fb922d3e970fb769aeb0cdb7
X-Git-Newrev: 64fa94f72fc9e57642c85ae1bad399e7dfd213e1
X-Patchwork-Hint: ignore
Message-Id: <20230405200902.1C213838B6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/kexec: introduce
 BR2_PACKAGE_KEXEC_ARCH_SUPPORTS
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

commit: https://git.buildroot.net/buildroot/commit/?id=64fa94f72fc9e57642c85ae1bad399e7dfd213e1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This makes it easier for other packages to add the arch dependency.

Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/kexec/Config.in | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/package/kexec/Config.in b/package/kexec/Config.in
index 90a7bc2672..54026284da 100644
--- a/package/kexec/Config.in
+++ b/package/kexec/Config.in
@@ -1,9 +1,14 @@
-config BR2_PACKAGE_KEXEC
-	bool "kexec"
+config BR2_PACKAGE_KEXEC_ARCH_SUPPORTS
+	bool
+	default y
 	depends on BR2_i386 || BR2_x86_64 || BR2_arm || BR2_armeb || \
 		BR2_mips || BR2_mips64 || BR2_mipsel || BR2_mips64el || \
 		BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le || \
 		BR2_sh4 || BR2_sh4a || BR2_aarch64 || BR2_s390x
+
+config BR2_PACKAGE_KEXEC
+	bool "kexec"
+	depends on BR2_PACKAGE_KEXEC_ARCH_SUPPORTS
 	help
 	  Kexec is a user space utility for loading another kernel
 	  and asking the currently running kernel to do something with
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
