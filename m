Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9924C77B7C
	for <buildroot@archiver.kernel.org>; Sun,  7 May 2023 21:36:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7292F417D2;
	Sun,  7 May 2023 21:36:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7292F417D2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id epjMARniYu9E; Sun,  7 May 2023 21:36:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A76FD4177A;
	Sun,  7 May 2023 21:36:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A76FD4177A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AA0931BF2C4
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 21:35:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 83F54613F0
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 21:35:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 83F54613F0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CAY3HigVxQs8 for <buildroot@lists.busybox.net>;
 Sun,  7 May 2023 21:35:52 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C25A360F47
 for <buildroot@buildroot.org>; Sun,  7 May 2023 21:35:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C25A360F47
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B0688860B1; Sun,  7 May 2023 21:35:52 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 7 May 2023 23:34:43 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cf39b596e7a8256700eb0957d5ba22661b492243
X-Git-Newrev: fe0e4bf560273d104fc10b4b9b402fba5538d726
X-Patchwork-Hint: ignore
Message-Id: <20230507213552.B0688860B1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Config.in.legacy: add entry for
 optee-benchmark
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

commit: https://git.buildroot.net/buildroot/commit/?id=fe0e4bf560273d104fc10b4b9b402fba5538d726
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit cf39b596e7a8 (package/optee-benchmark: remove deprecated package)
forgot to add a legacy entry.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 Config.in.legacy | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Config.in.legacy b/Config.in.legacy
index bce780e26e..2a710c30dc 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,12 @@ endif
 
 comment "Legacy options removed in 2023.05"
 
+config BR2_PACKAGE_OPTEE_BENCHMARK
+	bool "optee-benchmark has been removed"
+	select BR2_LEGACY
+	help
+	  optee-benchmark is no longer maintained upstream.
+
 config BR2_PACAKGE_OPENFPGALOADER_CMSIS
 	bool "openfpgaloader cmsis option name fixed"
 	select BR2_LEGACY
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
