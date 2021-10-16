Return-Path: <SRS0=a1j9=PE=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA761C433EF
	for <buildroot@archiver.kernel.org>; Sat, 16 Oct 2021 07:11:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 48A8E6108E
	for <buildroot@archiver.kernel.org>; Sat, 16 Oct 2021 07:11:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 48A8E6108E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C09E56067F;
	Sat, 16 Oct 2021 07:11:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gXMc-yud4nrf; Sat, 16 Oct 2021 07:11:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 25A586068B;
	Sat, 16 Oct 2021 07:11:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2FAAA1BF369
 for <buildroot@lists.busybox.net>; Sat, 16 Oct 2021 07:11:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1DA40401D1
 for <buildroot@lists.busybox.net>; Sat, 16 Oct 2021 07:11:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0ewWJcO0pS-E for <buildroot@lists.busybox.net>;
 Sat, 16 Oct 2021 07:10:57 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8FCC5400BE
 for <buildroot@buildroot.org>; Sat, 16 Oct 2021 07:10:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 1F39887F39; Sat, 16 Oct 2021 07:07:59 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 16 Oct 2021 09:08:45 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 20243e6691fa3975dbec8ddd21dc26a39623fc87
X-Git-Newrev: ef00789e0dd4738df49ad0930b238d5a67262dd5
X-Patchwork-Hint: ignore
Message-Id: <20211016070759.1F39887F39@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/dtbocfg: add missing comment about
 kernel dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=ef00789e0dd4738df49ad0930b238d5a67262dd5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit b00b9c865d21 (package/dtbocfg: depends on kernel) forgot to add a
comment when the kernel is not enabled.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Cc: Herve Codina <herve.codina@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/dtbocfg/Config.in | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/dtbocfg/Config.in b/package/dtbocfg/Config.in
index 862dc0ccc5..35e318061e 100644
--- a/package/dtbocfg/Config.in
+++ b/package/dtbocfg/Config.in
@@ -7,3 +7,6 @@ config BR2_PACKAGE_DTBOCFG
 	  as a userspace API of Device Tree Overlay.
 
 	  https://github.com/ikwzm/dtbocfg
+
+comment "dtbocfg needs a Linux kernel to be built"
+	depends on !BR2_LINUX_KERNEL
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
