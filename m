Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31F1FC43217
	for <buildroot@archiver.kernel.org>; Mon, 30 May 2022 21:45:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B292141C1A;
	Mon, 30 May 2022 21:45:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gcMuzq2Drx03; Mon, 30 May 2022 21:45:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9833841B4B;
	Mon, 30 May 2022 21:45:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1BAE21BF276
 for <buildroot@lists.busybox.net>; Mon, 30 May 2022 21:45:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0B086840A2
 for <buildroot@lists.busybox.net>; Mon, 30 May 2022 21:45:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jMq5sZXo1AKu for <buildroot@lists.busybox.net>;
 Mon, 30 May 2022 21:45:01 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 723B78409D
 for <buildroot@buildroot.org>; Mon, 30 May 2022 21:45:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 69ED086835; Mon, 30 May 2022 21:33:27 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 30 May 2022 23:44:47 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2d8a4e1fdd0ce07e9db009819e59eeb01225f129
X-Git-Newrev: ceb3dae264fa1bf4b4806dbc1507582c74eb36b1
X-Patchwork-Hint: ignore
Message-Id: <20220530213327.69ED086835@busybox.osuosl.org>
Subject: [Buildroot] [git commit] board/qemu/ppc-bamboo: use path to vmlinux
 image for copy and paste users
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

commit: https://git.buildroot.net/buildroot/commit/?id=ceb3dae264fa1bf4b4806dbc1507582c74eb36b1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 board/qemu/ppc-bamboo/readme.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/qemu/ppc-bamboo/readme.txt b/board/qemu/ppc-bamboo/readme.txt
index 0b70d2fa54..53d1970698 100644
--- a/board/qemu/ppc-bamboo/readme.txt
+++ b/board/qemu/ppc-bamboo/readme.txt
@@ -1,5 +1,5 @@
 Run the emulation with:
 
-qemu-system-ppc -nographic -M bamboo -kernel vmlinux -net nic,model=virtio-net-pci -net user # qemu_ppc_bamboo_defconfig
+qemu-system-ppc -nographic -M bamboo -kernel output/images/vmlinux -net nic,model=virtio-net-pci -net user # qemu_ppc_bamboo_defconfig
 
 The login prompt will appear in the terminal that started Qemu.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
