Return-Path: <SRS0=MwHx=PK=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30CF3C433F5
	for <buildroot@archiver.kernel.org>; Fri, 22 Oct 2021 18:50:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E4E976103E
	for <buildroot@archiver.kernel.org>; Fri, 22 Oct 2021 18:50:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E4E976103E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C357780EF5;
	Fri, 22 Oct 2021 18:50:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id drD2r0vu0h2z; Fri, 22 Oct 2021 18:50:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3D51B80ED8;
	Fri, 22 Oct 2021 18:50:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 537C11C113E
 for <buildroot@lists.busybox.net>; Fri, 22 Oct 2021 18:49:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 41FD0401C1
 for <buildroot@lists.busybox.net>; Fri, 22 Oct 2021 18:49:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZR_QKeeMibGP for <buildroot@lists.busybox.net>;
 Fri, 22 Oct 2021 18:49:39 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 731B4400F5
 for <buildroot@buildroot.org>; Fri, 22 Oct 2021 18:49:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id EEEE788482; Fri, 22 Oct 2021 18:46:25 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 22 Oct 2021 20:42:15 +0200
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 80ac968124c0b690ce09fd66df7a9d28611954c2
X-Git-Newrev: cad006e8100c8083996be892002c67c8f2b34e81
X-Patchwork-Hint: ignore
Message-Id: <20211022184625.EEEE788482@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x]
 package/wireguard-linux-compat: add missing comment about kernel dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=cad006e8100c8083996be892002c67c8f2b34e81
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Add a comment when kernel is not enabled (missing since the addition of
the package in commit de591c5c3a93a40d049a32bd79c30cc66daf5fb2)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 5eedd33368eedc22bbc542e870af677d0b3da834)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wireguard-linux-compat/Config.in | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/wireguard-linux-compat/Config.in b/package/wireguard-linux-compat/Config.in
index 5a323a35e5..4e8e95bdc3 100644
--- a/package/wireguard-linux-compat/Config.in
+++ b/package/wireguard-linux-compat/Config.in
@@ -21,6 +21,9 @@ config BR2_PACKAGE_WIREGUARD_LINUX_COMPAT
 
 	  https://www.wireguard.com
 
+comment "wireguard-linux-compat needs a Linux kernel to be built"
+	depends on !BR2_LINUX_KERNEL
+
 comment "wireguard-linux-compat needs a toolchain w/ headers >= 3.10"
 	depends on BR2_LINUX_KERNEL
 	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_10
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
