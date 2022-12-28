Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5730C61DA3
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 23:31:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7053A83E6D;
	Mon, 20 Feb 2023 23:31:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7053A83E6D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sioqo3Pp0MsY; Mon, 20 Feb 2023 23:31:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A222D83E4F;
	Mon, 20 Feb 2023 23:31:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A222D83E4F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CE5C31BF8C7
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:57:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E6B28617AA
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E6B28617AA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id T9yNh-YlgA8T for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:17 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 16EBF6108B
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 16EBF6108B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 075D3828C8; Mon, 20 Feb 2023 20:52:17 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 28 Dec 2022 20:50:19 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: e2468404c76e5d56d14f7e2afea8e2641f036e30
X-Git-Newrev: f603aa8514279b56f7454726c95601b31e6064dd
X-Patchwork-Hint: ignore
Message-Id: <20230220205217.075D3828C8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/slirp: add host
 variant for host-qemu
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

commit: https://git.buildroot.net/buildroot/commit/?id=f603aa8514279b56f7454726c95601b31e6064dd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Qemu 7.2 removed the slirp submodule from their sources [1]
so we have to provide slirp library as host package for
host-qemu.

[1] https://wiki.qemu.org/ChangeLog/7.2#GIT_submodules

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/slirp/slirp.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/slirp/slirp.mk b/package/slirp/slirp.mk
index 10d367587d..2ad71f13d9 100644
--- a/package/slirp/slirp.mk
+++ b/package/slirp/slirp.mk
@@ -14,4 +14,7 @@ SLIRP_CPE_ID_PRODUCT = libslirp
 SLIRP_INSTALL_STAGING = YES
 SLIRP_DEPENDENCIES = libglib2
 
+HOST_SLIRP_DEPENDENCIES = host-libglib2
+
 $(eval $(meson-package))
+$(eval $(host-meson-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
