Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28814C7618B
	for <buildroot@archiver.kernel.org>; Tue, 14 Mar 2023 21:57:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CB37540B61;
	Tue, 14 Mar 2023 21:57:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CB37540B61
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3IpQihI0JuDt; Tue, 14 Mar 2023 21:57:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E0AC840B56;
	Tue, 14 Mar 2023 21:57:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E0AC840B56
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E5E401BF38B
 for <buildroot@lists.busybox.net>; Tue, 14 Mar 2023 21:57:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C08F940B5A
 for <buildroot@lists.busybox.net>; Tue, 14 Mar 2023 21:57:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C08F940B5A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KNQtxBkXq0MA for <buildroot@lists.busybox.net>;
 Tue, 14 Mar 2023 21:57:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A83AA403D6
 for <buildroot@buildroot.org>; Tue, 14 Mar 2023 21:57:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A83AA403D6
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9792F87339; Tue, 14 Mar 2023 21:57:28 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 14 Mar 2023 22:54:00 +0100
X-Git-Refname: refs/heads/2022.11.x
X-Git-Oldrev: 458a78b4dd5b8b6f8486a770cb535e111ad1808f
X-Git-Newrev: 0cafa277ed9b0d4daf9c3c45f1188976941243da
X-Patchwork-Hint: ignore
Message-Id: <20230314215728.9792F87339@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.11.x] boot/mxs-bootlets: fix
 build without any bootstream
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

commit: https://git.buildroot.net/buildroot/commit/?id=0cafa277ed9b0d4daf9c3c45f1188976941243da
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.11.x

Fix the following build failure raised since the addition of the package
in commit 2a636d15217cd326b4546e7017538c7a9e9d399c:

sed -i 's,[^ *]power_prep.*;,\tpower_prep="/home/autobuild/autobuild/instance-9/output-1/build/mxs-bootlets-10.12.01/power_prep/power_prep";,' /home/autobuild/autobuild/instance-9/output-1/build/mxs-bootlets-10.12.01/
sed: couldn't edit /home/autobuild/autobuild/instance-9/output-1/build/mxs-bootlets-10.12.01/: not a regular file

Fixes:
 - http://autobuild.buildroot.org/results/b4b26f6b02fd1991f46eba5db240e5050b96d333

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 8c4435190773195fc5d1a97f819e1160f4bd52ca)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 boot/mxs-bootlets/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/boot/mxs-bootlets/Config.in b/boot/mxs-bootlets/Config.in
index b3e392afa8..8f9334b610 100644
--- a/boot/mxs-bootlets/Config.in
+++ b/boot/mxs-bootlets/Config.in
@@ -1,6 +1,8 @@
 config BR2_TARGET_MXS_BOOTLETS
 	bool "mxs-bootlets"
 	depends on BR2_arm
+	depends on BR2_TARGET_BAREBOX || BR2_LINUX_KERNEL || \
+		BR2_TARGET_UBOOT
 	help
 	  Stage1 bootloaders for Freescale iMX23/iMX28 SoCs
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
