Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AE7EC00140
	for <buildroot@archiver.kernel.org>; Thu, 18 Aug 2022 06:18:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F13F761142;
	Thu, 18 Aug 2022 06:18:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F13F761142
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id m6wzilWPtHiC; Thu, 18 Aug 2022 06:18:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A82266112A;
	Thu, 18 Aug 2022 06:18:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A82266112A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2F69F1BF3FC
 for <buildroot@lists.busybox.net>; Thu, 18 Aug 2022 06:17:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 08D4060808
 for <buildroot@lists.busybox.net>; Thu, 18 Aug 2022 06:17:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 08D4060808
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8kyGL79xTQbq for <buildroot@lists.busybox.net>;
 Thu, 18 Aug 2022 06:17:17 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E7AA86112A
 for <buildroot@buildroot.org>; Thu, 18 Aug 2022 06:17:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E7AA86112A
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 6A00187707; Thu, 18 Aug 2022 06:02:41 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 18 Aug 2022 08:13:17 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: 6ebd1890ca6f94a2971cdf1ab90e1d30123aa490
X-Git-Newrev: a5c9f8f27118ff5b3392abb6863d02dd94b67655
X-Patchwork-Hint: ignore
Message-Id: <20220818060241.6A00187707@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x] package/glibc: Config.in:
 fix typo
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

commit: https://git.buildroot.net/buildroot/commit/?id=a5c9f8f27118ff5b3392abb6863d02dd94b67655
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

compatibiltiy -> compatibility

Signed-off-by: Christian Stewart <christian@paral.in>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit c00fda3c59bfa216a8111ed3c281ce214c9f5242)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/glibc/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/glibc/Config.in b/package/glibc/Config.in
index 56f7299568..f535f9f6eb 100644
--- a/package/glibc/Config.in
+++ b/package/glibc/Config.in
@@ -49,7 +49,7 @@ config BR2_PACKAGE_GLIBC
 	  https://www.gnu.org/software/libc/
 
 config BR2_PACKAGE_GLIBC_KERNEL_COMPAT
-	bool "Enable compatibiltiy shims to run on older kernels"
+	bool "Enable compatibility shims to run on older kernels"
 	help
 	  Say 'y' here if you plan on running your system on a kernel
 	  older than the version used for the toolchain headers.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
