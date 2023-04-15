Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C929CC77B70
	for <buildroot@archiver.kernel.org>; Sat, 15 Apr 2023 17:10:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 578CD84333;
	Sat, 15 Apr 2023 17:10:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 578CD84333
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OgQFvRtUnpwi; Sat, 15 Apr 2023 17:10:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8BDA4842E2;
	Sat, 15 Apr 2023 17:10:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8BDA4842E2
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A81071C40A7
 for <buildroot@lists.busybox.net>; Sat, 15 Apr 2023 17:10:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8E4C3405CF
 for <buildroot@lists.busybox.net>; Sat, 15 Apr 2023 17:10:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8E4C3405CF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WICUewKtl91r for <buildroot@lists.busybox.net>;
 Sat, 15 Apr 2023 17:10:08 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9CD9F40184
 for <buildroot@buildroot.org>; Sat, 15 Apr 2023 17:10:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9CD9F40184
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 89A21841A0; Sat, 15 Apr 2023 17:10:07 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 15 Apr 2023 19:08:44 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: dcf91582637044e9137424752b1ea52e51b99358
X-Git-Newrev: 53baedf9126cf14f8ef80d4170ad9e9f1667fd65
X-Patchwork-Hint: ignore
Message-Id: <20230415171007.89A21841A0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/xr819-xradio: bump version
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

commit: https://git.buildroot.net/buildroot/commit/?id=53baedf9126cf14f8ef80d4170ad9e9f1667fd65
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

With introduction of vmap'ed stacks to ARM in Linux v5.18, stack
parameters can no longer be used for DMA. So pull the latest xradio
changes that fix the driver and make it work with vmap'ed stacks
in new kernels.

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/xr819-xradio/xr819-xradio.hash | 2 +-
 package/xr819-xradio/xr819-xradio.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/xr819-xradio/xr819-xradio.hash b/package/xr819-xradio/xr819-xradio.hash
index 60185db736..8676f065f8 100644
--- a/package/xr819-xradio/xr819-xradio.hash
+++ b/package/xr819-xradio/xr819-xradio.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  2b297fbcc9b5ed190bcfff9f6f808c170632ac3d69dbd92156a7f4f57142dec9  xr819-xradio-005f28cfe9e20b7f2dfd9d32d38ee97060dc707f.tar.gz
+sha256  93388424f1f136db541ce056be017f2f0f6688278ac15a88bef34da8f12ffea6  xr819-xradio-119cad7d07aef6973dd44e4dae74d4c9defd06a2.tar.gz
 # Locally computed
 sha256  db296f2f7f35bca3a174efb0eb392b3b17bd94b341851429a3dff411b1c2fc73  LICENSE
diff --git a/package/xr819-xradio/xr819-xradio.mk b/package/xr819-xradio/xr819-xradio.mk
index e5daaa6051..66c08e7921 100644
--- a/package/xr819-xradio/xr819-xradio.mk
+++ b/package/xr819-xradio/xr819-xradio.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XR819_XRADIO_VERSION = 005f28cfe9e20b7f2dfd9d32d38ee97060dc707f
+XR819_XRADIO_VERSION = 119cad7d07aef6973dd44e4dae74d4c9defd06a2
 XR819_XRADIO_SITE = $(call github,fifteenhex,xradio,$(XR819_XRADIO_VERSION))
 XR819_XRADIO_LICENSE = GPL-2.0
 XR819_XRADIO_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
