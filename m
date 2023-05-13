Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38D65C77B7C
	for <buildroot@archiver.kernel.org>; Sat, 13 May 2023 08:23:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AA7B940936;
	Sat, 13 May 2023 08:23:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AA7B940936
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3zMuDR8h3S2X; Sat, 13 May 2023 08:23:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 33D204034F;
	Sat, 13 May 2023 08:23:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 33D204034F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 184561BF5DF
 for <buildroot@lists.busybox.net>; Sat, 13 May 2023 08:23:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E308640461
 for <buildroot@lists.busybox.net>; Sat, 13 May 2023 08:23:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E308640461
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4wX6y6vsD2a6 for <buildroot@lists.busybox.net>;
 Sat, 13 May 2023 08:23:36 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4CA34400AB
 for <buildroot@buildroot.org>; Sat, 13 May 2023 08:23:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4CA34400AB
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3759284725; Sat, 13 May 2023 08:23:36 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 13 May 2023 10:20:50 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b6861678e1ad19abeeddc94abaf6aafec77f5b11
X-Git-Newrev: 97064a5eaa5b235ae754dd0abe639d11a8bff0f6
X-Patchwork-Hint: ignore
Message-Id: <20230513082336.3759284725@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qemu: do not build the guest agent
 for the host
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

commit: https://git.buildroot.net/buildroot/commit/?id=97064a5eaa5b235ae754dd0abe639d11a8bff0f6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It does not make sense to build it for the host.

Signed-off-by: Carlos Santos <unixmania@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/qemu/qemu.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index acf40bd50f..e8a5388596 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -479,6 +479,7 @@ define HOST_QEMU_CONFIGURE_CMDS
 		--disable-vnc-sasl \
 		--enable-slirp \
 		--enable-tools \
+		--disable-guest-agent \
 		$(HOST_QEMU_OPTS)
 endef
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
