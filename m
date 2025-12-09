Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A218D3B98F
	for <buildroot@archiver.kernel.org>; Tue,  9 Dec 2025 18:28:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 569BB40A82;
	Tue,  9 Dec 2025 18:28:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4KSTkN4DVSkd; Tue,  9 Dec 2025 18:28:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B436640A3F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765304911;
	bh=buixwX1n70OGLEthvFy1nb51jcSvdK4N2cM4ympqcF8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=PWiI3ct9BJe4nluy89kof8n/3GzeZOJtRD68vq8PQ41zw9nc3xdwguynPyiH5yIYN
	 yXOuFregkaM/W2DXje/s5ZBccbo2cTxPLYuw4zb9I0uRM/De5fLH1ycEWnoTAL7s8B
	 1V4NM0DsUP81ay/CPoqukFbijfyaf0vEDQsCEMWMXrsHI4QFAxfxCowhrFLm+afE1i
	 ixkm20jGvc9/wep/H0Jl5x+boJ3RplqgZjVm8OK+d1J5kZ7zaowg07l3o/7srxpWt6
	 +wnCka8Jiup0BwdPrYpk4IqlIoE31nen/c2cG7IDg/UcUMsYTH+mbJxkGwOURVkSWr
	 4bCNXNPlvkWyA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B436640A3F;
	Tue,  9 Dec 2025 18:28:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 17D1E237
 for <buildroot@buildroot.org>; Tue,  9 Dec 2025 18:28:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BC82C60A35
 for <buildroot@buildroot.org>; Tue,  9 Dec 2025 18:28:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7hry362D59UV for <buildroot@buildroot.org>;
 Tue,  9 Dec 2025 18:28:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CE63F608D0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id CE63F608D0
 for <buildroot@buildroot.org>; Tue,  9 Dec 2025 18:28:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C03C586968; Tue,  9 Dec 2025 18:28:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 9 Dec 2025 19:24:58 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: b464afb37920beb8fdd84c87eacec16b8a825d2d
X-Git-Newrev: c6e914819774212e79be19f62706f653b9646f11
X-Patchwork-Hint: ignore
Message-Id: <20251209182817.C03C586968@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/igh-ethercat: bump
 version to 1.6.8
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=c6e914819774212e79be19f62706f653b9646f11
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Release notes:
https://gitlab.com/etherlab.org/ethercat/-/blob/1.6.8/NEWS.md

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/igh-ethercat/igh-ethercat.hash | 2 +-
 package/igh-ethercat/igh-ethercat.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/igh-ethercat/igh-ethercat.hash b/package/igh-ethercat/igh-ethercat.hash
index daa9aca8d0..9f1172464b 100644
--- a/package/igh-ethercat/igh-ethercat.hash
+++ b/package/igh-ethercat/igh-ethercat.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  3fa09d623c2a9488bc6c40072b080ef719a4e78d89e30cc0ddbaabacd4875e37  igh-ethercat-1.6.3.tar.gz
+sha256  e9b97d4a8c3a1224fe9119ada448f4024bacea2ca940a811073170e42d828b76  igh-ethercat-1.6.8.tar.gz
 sha256  231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c  COPYING
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LESSER
diff --git a/package/igh-ethercat/igh-ethercat.mk b/package/igh-ethercat/igh-ethercat.mk
index 1d93d473da..03f004d2b4 100644
--- a/package/igh-ethercat/igh-ethercat.mk
+++ b/package/igh-ethercat/igh-ethercat.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IGH_ETHERCAT_VERSION = 1.6.3
+IGH_ETHERCAT_VERSION = 1.6.8
 IGH_ETHERCAT_SITE = $(call gitlab,etherlab.org,ethercat,$(IGH_ETHERCAT_VERSION))
 IGH_ETHERCAT_LICENSE = GPL-2.0 (IgH EtherCAT master), LGPL-2.1 (libraries)
 IGH_ETHERCAT_LICENSE_FILES = COPYING COPYING.LESSER
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
