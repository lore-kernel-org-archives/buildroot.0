Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 483CBC433EF
	for <buildroot@archiver.kernel.org>; Sun,  9 Jan 2022 22:35:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DCEF74045E;
	Sun,  9 Jan 2022 22:35:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YcoL2hpFT3Gf; Sun,  9 Jan 2022 22:35:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C1E9F40439;
	Sun,  9 Jan 2022 22:35:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 26CD31BF41C
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 22:35:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 123CA40303
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 22:35:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pVSH4IdEWWMq for <buildroot@lists.busybox.net>;
 Sun,  9 Jan 2022 22:35:07 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6BC2C40302
 for <buildroot@buildroot.org>; Sun,  9 Jan 2022 22:35:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id F177C82B53; Sun,  9 Jan 2022 22:28:51 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 9 Jan 2022 23:34:56 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b7a00b39bca0df9737890145b7f59b9c1c3d2e4c
X-Git-Newrev: fb9a65d98b128c1b06069013e0ab874779ef5228
X-Patchwork-Hint: ignore
Message-Id: <20220109222851.F177C82B53@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libvirt: drop C++ comment
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

commit: https://git.buildroot.net/buildroot/commit/?id=fb9a65d98b128c1b06069013e0ab874779ef5228
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit f81242ae4fb64ab85af5d38e70246222276552ae forgot to drop C++
comment

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libvirt/Config.in | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/package/libvirt/Config.in b/package/libvirt/Config.in
index b91b8e2c1c..af0fc36aea 100644
--- a/package/libvirt/Config.in
+++ b/package/libvirt/Config.in
@@ -56,9 +56,6 @@ config BR2_PACKAGE_LIBVIRT_DAEMON
 	  Build the libvirt daemon (libvirtd) otherwise build only the
 	  utility programs.
 
-comment "libvirtd needs a toolchain w/ C++"
-	depends on !BR2_INSTALL_LIBSTDCPP && !BR2_PACKAGE_NETCAT_OPENBSD
-
 # Stateful drivers are useful only when building the daemon.
 if BR2_PACKAGE_LIBVIRT_DAEMON
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
