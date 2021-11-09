Return-Path: <SRS0=D8Yb=P4=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B02BC433EF
	for <buildroot@archiver.kernel.org>; Tue,  9 Nov 2021 08:21:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 53418611AF
	for <buildroot@archiver.kernel.org>; Tue,  9 Nov 2021 08:21:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 53418611AF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 288514031F;
	Tue,  9 Nov 2021 08:21:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GxrHy1G8CAxF; Tue,  9 Nov 2021 08:21:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D8EA940327;
	Tue,  9 Nov 2021 08:21:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6B4751BF3B9
 for <buildroot@lists.busybox.net>; Tue,  9 Nov 2021 08:20:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5B20280DE9
 for <buildroot@lists.busybox.net>; Tue,  9 Nov 2021 08:20:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4WZgjyMft1If for <buildroot@lists.busybox.net>;
 Tue,  9 Nov 2021 08:20:32 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8747780DE6
 for <buildroot@buildroot.org>; Tue,  9 Nov 2021 08:20:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 4770E8B76C; Tue,  9 Nov 2021 08:16:38 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 9 Nov 2021 09:07:36 +0100
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: c5dbfa0f83d7c86c94fe3a9145b97b551173791b
X-Git-Newrev: e8231e5b88a8168331b3c0f06a2f4ec16eddf02e
X-Patchwork-Hint: ignore
Message-Id: <20211109081638.4770E8B76C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/systemd: enable
 selinux xdg module for refpolicy
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

commit: https://git.buildroot.net/buildroot/commit/?id=e8231e5b88a8168331b3c0f06a2f4ec16eddf02e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Without the selinux xgd module enabled by systemd package, refpolicy
fail to build due to policy/modules/system/systemd.te [1]

policy/modules/system/systemd.te:288:ERROR 'attribute xdg_config_type is not declared' at token ';' on line 508447:

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/1710552468
https://gitlab.com/buildroot.org/buildroot/-/jobs/1710552470

[1] https://github.com/SELinuxProject/refpolicy/blob/RELEASE_2_20210908/policy/modules/system/systemd.te#L288

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Adam Duskett <aduskett@gmail.com>
Cc: Antoine Tenart <atenart@kernel.org>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit d51189ffe50fab00d36778a53d28c9d5cb34ae42)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/systemd/systemd.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 63831dc54f..c80248c953 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -19,7 +19,7 @@ SYSTEMD_DEPENDENCIES = \
 	util-linux-libs \
 	$(TARGET_NLS_DEPENDENCIES)
 
-SYSTEMD_SELINUX_MODULES = systemd udev
+SYSTEMD_SELINUX_MODULES = systemd udev xdg
 
 SYSTEMD_PROVIDES = udev
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
