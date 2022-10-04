Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92602C433F5
	for <buildroot@archiver.kernel.org>; Tue,  4 Oct 2022 19:56:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 406D64036F;
	Tue,  4 Oct 2022 19:56:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 406D64036F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8v_zPDGMb3Kw; Tue,  4 Oct 2022 19:56:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 78CB040217;
	Tue,  4 Oct 2022 19:56:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 78CB040217
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7E1DF1BF405
 for <buildroot@lists.busybox.net>; Tue,  4 Oct 2022 19:54:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9EDA3815AD
 for <buildroot@lists.busybox.net>; Tue,  4 Oct 2022 19:54:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9EDA3815AD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id W18xeRWHvQbD for <buildroot@lists.busybox.net>;
 Tue,  4 Oct 2022 19:54:51 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DDAA881551
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DDAA881551
 for <buildroot@buildroot.org>; Tue,  4 Oct 2022 19:54:50 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::225])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id 3C24DD2F6C
 for <buildroot@buildroot.org>; Tue,  4 Oct 2022 19:51:06 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 2DBC11C0004;
 Tue,  4 Oct 2022 19:50:59 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peko@dell.be.48ers.dk>)
 id 1ofnwQ-003uTE-ID; Tue, 04 Oct 2022 21:50:58 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue,  4 Oct 2022 21:50:39 +0200
Message-Id: <20221004195039.931947-11-peter@korsgaard.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221004195039.931947-1-peter@korsgaard.com>
References: <20221004195039.931947-1-peter@korsgaard.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 11/11] friendlyarm_nanopi_r2s_defconfig: specify
 kernel headers version
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
Cc: Gilles Talis <gilles.talis@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The defconfigs uses a 5.16 kernel, so specify 5.16 kernel headers to match.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/friendlyarm_nanopi_r2s_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/friendlyarm_nanopi_r2s_defconfig b/configs/friendlyarm_nanopi_r2s_defconfig
index ce252a5d76..284b28ec31 100644
--- a/configs/friendlyarm_nanopi_r2s_defconfig
+++ b/configs/friendlyarm_nanopi_r2s_defconfig
@@ -1,6 +1,7 @@
 BR2_aarch64=y
 BR2_cortex_a53=y
 BR2_ARM_FPU_VFPV4=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_16=y
 BR2_TARGET_GENERIC_HOSTNAME="rk3328-nanopi-r2s"
 BR2_TARGET_GENERIC_ISSUE="Welcome to Nanopi R2S RK3328"
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/friendlyarm/nanopi-r2s/post-build.sh"
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
