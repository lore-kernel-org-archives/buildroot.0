Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D24BCC4332F
	for <buildroot@archiver.kernel.org>; Sat,  4 Nov 2023 15:12:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7F5DE40A78;
	Sat,  4 Nov 2023 15:12:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7F5DE40A78
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JEPk3Epw0Hwm; Sat,  4 Nov 2023 15:12:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3D61C40A46;
	Sat,  4 Nov 2023 15:12:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3D61C40A46
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 721F11BF584
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 15:11:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 47040822BD
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 15:11:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 47040822BD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pWyHhx-zCrLa for <buildroot@lists.busybox.net>;
 Sat,  4 Nov 2023 15:11:26 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 89075822BA
 for <buildroot@buildroot.org>; Sat,  4 Nov 2023 15:11:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 89075822BA
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 785C08666E; Sat,  4 Nov 2023 15:11:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 4 Nov 2023 16:11:11 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 11ffca6d56471070bdce292cc932e0f37d46dd43
X-Git-Newrev: 61a38c7ee0e4829592f09f84dfabc9328da1370c
X-Patchwork-Hint: ignore
Message-Id: <20231104151126.785C08666E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/zfs: enable selinux module
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=61a38c7ee0e4829592f09f84dfabc9328da1370c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/zfs/zfs.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/zfs/zfs.mk b/package/zfs/zfs.mk
index b852d8d4e2..f0461ea9ec 100644
--- a/package/zfs/zfs.mk
+++ b/package/zfs/zfs.mk
@@ -7,6 +7,7 @@
 ZFS_VERSION = 2.1.12
 ZFS_SITE = https://github.com/openzfs/zfs/releases/download/zfs-$(ZFS_VERSION)
 ZFS_PATCH = https://github.com/openzfs/zfs/commit/bc3f12bfac152a0c28951cec92340ba14f9ccee9.patch
+ZFS_SELINUX_MODULES = zfs
 ZFS_LICENSE = CDDL
 ZFS_LICENSE_FILES = LICENSE COPYRIGHT
 ZFS_CPE_ID_VENDOR = openzfs
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
