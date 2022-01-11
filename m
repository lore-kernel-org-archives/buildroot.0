Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F01A6C433EF
	for <buildroot@archiver.kernel.org>; Tue, 11 Jan 2022 20:44:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 802E183E69;
	Tue, 11 Jan 2022 20:44:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FEAXpUCHGwEU; Tue, 11 Jan 2022 20:44:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D5B6183E65;
	Tue, 11 Jan 2022 20:44:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2AE691BF989
 for <buildroot@lists.busybox.net>; Tue, 11 Jan 2022 20:44:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 181CE4057C
 for <buildroot@lists.busybox.net>; Tue, 11 Jan 2022 20:44:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9GxCwIOVexqV for <buildroot@lists.busybox.net>;
 Tue, 11 Jan 2022 20:44:38 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3682B4016A
 for <buildroot@buildroot.org>; Tue, 11 Jan 2022 20:44:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 6EEF7834DC; Tue, 11 Jan 2022 20:38:18 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Tue, 11 Jan 2022 21:44:33 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8ac0775130426e1ebc6d291bb3b131e19afc92fa
X-Git-Newrev: 0662d0ec61e83581a96f162bb32637c01304a47d
X-Patchwork-Hint: ignore
Message-Id: <20220111203818.6EEF7834DC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qemu: add support for PPC970
 processors
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
Content-Type: multipart/mixed; boundary="===============6944229556164524426=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6944229556164524426==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=0662d0ec61e83581a96f162bb32637c01304a47d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

PPC970 processors are well supported by the QEMU pseries and macbook
machines. The latest debian 11 (big endian) runs with SMP. Re-add
support.

Fixes: efc67deef38c ("qemu: remove support for some PowerPC processors in host qemu")
Signed-off-by: Cédric Le Goater <clg@kaod.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/qemu/Config.in.host | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/qemu/Config.in.host b/package/qemu/Config.in.host
index df5d921125..f9cdb9b703 100644
--- a/package/qemu/Config.in.host
+++ b/package/qemu/Config.in.host
@@ -22,7 +22,7 @@ config BR2_PACKAGE_HOST_QEMU_ARCH_SUPPORTS
 	default y if BR2_xtensa
 	default y if BR2_x86_64
 	depends on !BR2_x86_steamroller && !BR2_x86_core_avx2
-	depends on !BR2_powerpc_620 && !BR2_powerpc_630 && !BR2_powerpc_970
+	depends on !BR2_powerpc_620 && !BR2_powerpc_630
 
 config BR2_PACKAGE_HOST_QEMU_SYSTEM_ARCH_SUPPORTS
 	bool

--===============6944229556164524426==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6944229556164524426==--
