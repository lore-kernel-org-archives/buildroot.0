Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24836C6FD1F
	for <buildroot@archiver.kernel.org>; Tue, 14 Mar 2023 21:56:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C8FE840B5C;
	Tue, 14 Mar 2023 21:56:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C8FE840B5C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JJ5k34YRvQMG; Tue, 14 Mar 2023 21:56:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F34FD40B59;
	Tue, 14 Mar 2023 21:56:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F34FD40B59
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B9B7F1BF38B
 for <buildroot@lists.busybox.net>; Tue, 14 Mar 2023 21:56:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 94EDD40B59
 for <buildroot@lists.busybox.net>; Tue, 14 Mar 2023 21:56:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 94EDD40B59
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id koHUeyVuJKrK for <buildroot@lists.busybox.net>;
 Tue, 14 Mar 2023 21:56:14 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D8C4E40B56
 for <buildroot@buildroot.org>; Tue, 14 Mar 2023 21:56:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D8C4E40B56
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C85148732A; Tue, 14 Mar 2023 21:56:14 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 14 Mar 2023 22:53:54 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: dbf4bfff6790bed0fca2e8337f28df07ecb9be7a
X-Git-Newrev: 17eec679246fb73ca49fcb5c2950af02b5f0002b
X-Patchwork-Hint: ignore
Message-Id: <20230314215614.C85148732A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] boot/mxs-bootlets: fix
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

commit: https://git.buildroot.net/buildroot/commit/?id=17eec679246fb73ca49fcb5c2950af02b5f0002b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

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
