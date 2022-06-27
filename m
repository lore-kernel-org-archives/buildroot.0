Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D69C1C43334
	for <buildroot@archiver.kernel.org>; Mon, 27 Jun 2022 20:14:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5393F4150E;
	Mon, 27 Jun 2022 20:14:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5393F4150E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PRi20IZupjXO; Mon, 27 Jun 2022 20:14:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1B1D0410D1;
	Mon, 27 Jun 2022 20:14:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1B1D0410D1
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CECEB1BF9B5
 for <buildroot@lists.busybox.net>; Mon, 27 Jun 2022 20:13:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AA63F829A9
 for <buildroot@lists.busybox.net>; Mon, 27 Jun 2022 20:13:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AA63F829A9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xUCJqV-pgntT for <buildroot@lists.busybox.net>;
 Mon, 27 Jun 2022 20:13:47 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 997B0828B5
 for <buildroot@buildroot.org>; Mon, 27 Jun 2022 20:13:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 997B0828B5
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 6FAC58752F; Mon, 27 Jun 2022 20:01:09 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 27 Jun 2022 22:12:42 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c660a163198018bb7f2e9f16d9628dab4a3cd01e
X-Git-Newrev: 154727350ee1959651b8e933f692b81fc5c24022
X-Patchwork-Hint: ignore
Message-Id: <20220627200109.6FAC58752F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qemu: add qemu host tools
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

commit: https://git.buildroot.net/buildroot/commit/?id=154727350ee1959651b8e933f692b81fc5c24022
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Always build host qemu-tools e.g. qemu-img.
https://qemu.readthedocs.io/en/latest/tools/index.html

Signed-off-by: Thomas Devoogdt <thomas.devoogdt@gmail.com>
Reviewed-by: Thomas Huth <huth@tuxfamily.org>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/qemu/qemu.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index 290186ec4e..9e1bec3836 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -390,6 +390,7 @@ define HOST_QEMU_CONFIGURE_CMDS
 		--disable-vnc-jpeg \
 		--disable-vnc-png \
 		--disable-vnc-sasl \
+		--enable-tools \
 		$(HOST_QEMU_OPTS)
 endef
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
