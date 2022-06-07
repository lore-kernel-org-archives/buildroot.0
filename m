Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA508C433EF
	for <buildroot@archiver.kernel.org>; Tue,  7 Jun 2022 09:41:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8E887613FF;
	Tue,  7 Jun 2022 09:41:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BbDwcQh1BrC2; Tue,  7 Jun 2022 09:41:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 59F0F613F5;
	Tue,  7 Jun 2022 09:41:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CB0B21BF2A9
 for <buildroot@lists.busybox.net>; Tue,  7 Jun 2022 09:41:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B6AAE416F8
 for <buildroot@lists.busybox.net>; Tue,  7 Jun 2022 09:41:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UioC-5Ma_ZLM for <buildroot@lists.busybox.net>;
 Tue,  7 Jun 2022 09:41:32 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D161641772
 for <buildroot@buildroot.org>; Tue,  7 Jun 2022 09:41:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id A583184DBA; Tue,  7 Jun 2022 09:29:41 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 7 Jun 2022 11:40:53 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 5785591a4c6c7275c83affd90bdddbf04e7f9c51
X-Git-Newrev: 220e0a3d1107e08e0644dd66d838a86375306bf6
X-Patchwork-Hint: ignore
Message-Id: <20220607092941.A583184DBA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] board/qemu/ppc-bamboo:
 use path to vmlinux image for copy and paste users
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

commit: https://git.buildroot.net/buildroot/commit/?id=220e0a3d1107e08e0644dd66d838a86375306bf6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit ceb3dae264fa1bf4b4806dbc1507582c74eb36b1)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
