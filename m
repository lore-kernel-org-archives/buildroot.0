Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC57EEB64DC
	for <buildroot@archiver.kernel.org>; Mon,  3 Jul 2023 16:18:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6A30D81228;
	Mon,  3 Jul 2023 16:18:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6A30D81228
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KdBGjfKHVOqX; Mon,  3 Jul 2023 16:18:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A166A80DCC;
	Mon,  3 Jul 2023 16:18:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A166A80DCC
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7EE7D1BF4D8
 for <buildroot@lists.busybox.net>; Mon,  3 Jul 2023 16:18:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 58808409BD
 for <buildroot@lists.busybox.net>; Mon,  3 Jul 2023 16:18:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 58808409BD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QfbfOedNFCgP for <buildroot@lists.busybox.net>;
 Mon,  3 Jul 2023 16:18:27 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 71B24400FE
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 71B24400FE
 for <buildroot@buildroot.org>; Mon,  3 Jul 2023 16:18:27 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b71b.dip0.t-ipconnect.de [84.161.183.27])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id BA250A4C00CE
 for <buildroot@buildroot.org>; Mon,  3 Jul 2023 18:18:12 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:39106)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qGMFg-0003JT-1Y
 for buildroot@buildroot.org; Mon, 03 Jul 2023 18:18:12 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon,  3 Jul 2023 18:18:11 +0200
Message-Id: <20230703161812.40064-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1688401092;
 bh=I1y8yPhesdVAU8w0bBjeIYL6LSilkvt00utU1RQA/jA=;
 h=From:To:Subject:Date:From;
 b=r/dGG9dgvhHDNdL20L874qmzyZVNeeI/0PoQVXQ+hG5i+KHupBWN2x2oBNomio0Ku
 onQslOot82IDQTXeUlTXW0KXMn98B2mW2N6MMDHTfC8XH7cr9abdz2tGs8oecKNMIM
 XUG9yWOJQnymMfFTL9lp8IvAlTYZIsCcnzyU8+LJLSyYPZP5ysrDjFiqTtzVCWKXxr
 +ipd9WeW5B6MMCpZuEPz0gN0VmRF2hv0FxE1G3fJ+pwD1y+et63AxQFAov1liwKgWx
 Ve/e4VKldLZjjOrkaiw1UfPjETHUi9tnRodpI6vtyflFog6LGZtxDU82JxTaQNu5qM
 GEznqqCvs/KZQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=r/dGG9dg
Subject: [Buildroot] [PATCH 1/2] package/libminiupnpc: bump to version 2.2.5
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changelog:
http://miniupnp.free.fr/files/changelog.php?file=miniupnpc-2.2.5.tar.gz

Updated license hash due to reformat of license file:
https://github.com/miniupnp/miniupnp/commit/af812c877532f2432b0566633e1e539797ef9c13

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libminiupnpc/libminiupnpc.hash | 4 ++--
 package/libminiupnpc/libminiupnpc.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libminiupnpc/libminiupnpc.hash b/package/libminiupnpc/libminiupnpc.hash
index 5dca8dd6cf..db6b01f0c9 100644
--- a/package/libminiupnpc/libminiupnpc.hash
+++ b/package/libminiupnpc/libminiupnpc.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  481a5e4aede64e9ef29895b218836c3608d973e77a35b4f228ab1f3629412c4b  miniupnpc-2.2.4.tar.gz
-sha256  a0f853256954f388ce4fab5faaef6a1f5bcd5e682c3c7c70b07b7130e932a021  LICENSE
+sha256  38acd5f4602f7cf8bcdc1ec30b2d58db2e9912e5d9f5350dd99b06bfdffb517c  miniupnpc-2.2.5.tar.gz
+sha256  e143c6e207d0bb874c4be76b57689ffa408063a37a735c6dcec3dc600cb522c5  LICENSE
diff --git a/package/libminiupnpc/libminiupnpc.mk b/package/libminiupnpc/libminiupnpc.mk
index 9dc5c719a9..59b593cb36 100644
--- a/package/libminiupnpc/libminiupnpc.mk
+++ b/package/libminiupnpc/libminiupnpc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBMINIUPNPC_VERSION = 2.2.4
+LIBMINIUPNPC_VERSION = 2.2.5
 LIBMINIUPNPC_SOURCE = miniupnpc-$(LIBMINIUPNPC_VERSION).tar.gz
 LIBMINIUPNPC_SITE = http://miniupnp.free.fr/files
 LIBMINIUPNPC_INSTALL_STAGING = YES
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
