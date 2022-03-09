Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BA72C433F5
	for <buildroot@archiver.kernel.org>; Wed,  9 Mar 2022 20:30:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 44F05418C3;
	Wed,  9 Mar 2022 20:30:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cNCvhYEedJEf; Wed,  9 Mar 2022 20:30:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5AEA4418BE;
	Wed,  9 Mar 2022 20:30:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 08AC61BF9C2
 for <buildroot@lists.busybox.net>; Wed,  9 Mar 2022 20:30:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EA7C2405CE
 for <buildroot@lists.busybox.net>; Wed,  9 Mar 2022 20:30:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Fl4ip60XnL4L for <buildroot@lists.busybox.net>;
 Wed,  9 Mar 2022 20:30:33 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 27B9740521
 for <buildroot@buildroot.org>; Wed,  9 Mar 2022 20:30:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id E2A0983979; Wed,  9 Mar 2022 20:22:04 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 9 Mar 2022 21:29:43 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 97f3c1fee2165cc0c1c17cb9c0ef03027ef40f82
X-Git-Newrev: f6f3de83940ed4ff2bc2a5fec0cd2add93ebf635
X-Patchwork-Hint: ignore
Message-Id: <20220309202204.E2A0983979@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/oprofile: add s390x support
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

commit: https://git.buildroot.net/buildroot/commit/?id=f6f3de83940ed4ff2bc2a5fec0cd2add93ebf635
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

s390x is supported since at least 2003 (see ChangeLog-2003)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/oprofile/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/oprofile/Config.in b/package/oprofile/Config.in
index cce2cfdab8..eca43d7ac3 100644
--- a/package/oprofile/Config.in
+++ b/package/oprofile/Config.in
@@ -5,7 +5,7 @@ config BR2_PACKAGE_OPROFILE_ARCH_SUPPORTS
 	depends on BR2_arceb || BR2_arcle || BR2_arm || BR2_armeb || \
 		BR2_aarch64 || BR2_aarch64_be || BR2_i386 || BR2_mips || \
 		BR2_mipsel || BR2_mips64 || BR2_mips64el || BR2_powerpc || \
-		BR2_powerpc64 || BR2_powerpc64le || BR2_sh || \
+		BR2_powerpc64 || BR2_powerpc64le || BR2_s390x || BR2_sh || \
 		BR2_sparc || BR2_sparc64 || BR2_x86_64
 
 config BR2_PACKAGE_OPROFILE_NEEDS_LIBPFM4
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
