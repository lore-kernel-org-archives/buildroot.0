Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD492C61DA3
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 21:09:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5E8D442AB1;
	Mon, 20 Feb 2023 21:09:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5E8D442AB1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vDnpFXN3hGU9; Mon, 20 Feb 2023 21:09:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0B6DF42AC0;
	Mon, 20 Feb 2023 21:09:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0B6DF42AC0
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4192D1BF8C7
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5B5A040C0F
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:51:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5B5A040C0F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sxpCQMDTJp8a for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:51:50 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4FF7140AA5
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:51:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4FF7140AA5
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 490E386494; Mon, 20 Feb 2023 20:51:50 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 13 Nov 2022 15:58:46 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 0910ada70b7194596c6ace0cb06b303173c13de7
X-Git-Newrev: a0d1c6288a9adfb54dc9d98b8c4f5531eb4c9cba
X-Patchwork-Hint: ignore
Message-Id: <20230220205150.490E386494@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/mdio-tools: needs fork
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

commit: https://git.buildroot.net/buildroot/commit/?id=a0d1c6288a9adfb54dc9d98b8c4f5531eb4c9cba
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Fix the following build failure raised since the addition of the package
in commit 8fdf8731e727dc5c2d4080d7a56e1d71dc25e533:

mdio.c: In function 'mdio_modprobe':
mdio.c:738:15: error: implicit declaration of function 'fork' [-Werror=implicit-function-declaration]
  738 |         pid = fork();
      |               ^~~~

Fixes:
 - http://autobuild.buildroot.org/results/c53aaeaa34dd4d6d9a57da196687beecaeed9fe2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Reviewed-by: Joachim Wiberg <troglobit@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/mdio-tools/Config.in | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/mdio-tools/Config.in b/package/mdio-tools/Config.in
index f24c1a6974..237f4454cc 100644
--- a/package/mdio-tools/Config.in
+++ b/package/mdio-tools/Config.in
@@ -1,12 +1,15 @@
 comment "mdio-tools needs a Linux kernel to be built"
+	depends on BR2_USE_MMU
 	depends on !BR2_LINUX_KERNEL
 
 comment "mdio-tools needs a toolchain w/ headers >= 5.1"
+	depends on BR2_USE_MMU
 	depends on BR2_LINUX_KERNEL
 	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_1
 
 config BR2_PACKAGE_MDIO_TOOLS
 	bool "mdio-tools"
+	depends on BR2_USE_MMU # fork()
 	depends on BR2_LINUX_KERNEL
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_1
 	select BR2_PACKAGE_LIBMNL
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
