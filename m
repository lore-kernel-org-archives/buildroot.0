Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C747C5516E
	for <buildroot@archiver.kernel.org>; Thu, 30 Jul 2026 21:20:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2AC8460A94;
	Thu, 30 Jul 2026 21:20:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Qen4VGgmWZAa; Thu, 30 Jul 2026 21:20:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B6BD160B1F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785446412;
	bh=uQK0OkdAHTh/gopLz17spjk1t4yObt15zUEM79Vn/pI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=f/txH/37RLFAY1z6sQccW+rN+tc4uEf0tzYfl5MF541UOxe9ZghsqzaJLAFDCtfR+
	 a/3ibEWHRozuOLPAMG5m3BMcqIZ6bygAK/wI9SBv3+BlbuIf2k4Lzm8QOC39a7ebT1
	 S9shkLFg81aVe6loLRPL3wCkFPLAq0mWwvGovwXep9ZQN1ktd9/ThoD+UfKGp+f9HS
	 e8icZq6RGoH+PN2BAltSkZxpqoN8SrFMGpBgc4R2PKZsT4ZWqsak/1mdqfUkSgbKkh
	 JesBRt6+WjI1KMoc4oJDyuLX6xHQB0+dcDrZF2pgPYnVu23d+3T/m48tvTeC+/bW6y
	 IF+bLGb8Jztlw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B6BD160B1F;
	Thu, 30 Jul 2026 21:20:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id B995526C
 for <buildroot@buildroot.org>; Thu, 30 Jul 2026 21:19:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AB92E60644
 for <buildroot@buildroot.org>; Thu, 30 Jul 2026 21:19:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5zLHvZTcI7uI for <buildroot@buildroot.org>;
 Thu, 30 Jul 2026 21:19:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 21A6760A62
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 21A6760A62
 for <buildroot@buildroot.org>; Thu, 30 Jul 2026 21:19:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5AC5B8B676; Thu, 30 Jul 2026 21:19:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 30 Jul 2026 23:12:21 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2b4e9e0859d4c3c69c78835c0b68a2327ff3ce7f
X-Git-Newrev: 43cea41928f5934fb6c38399a12d1bbaabc88dbc
X-Patchwork-Hint: ignore
Message-Id: <20260730211915.5AC5B8B676@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/freescale-imx/imx-codec: bump to
 version 4.10.0
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
Content-Type: multipart/mixed; boundary="===============6310666273659146363=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6310666273659146363==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/43cea41928f5934fb6c38399a12d1bbaabc88dbc
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

This version is aligned with NXP Linux BSP version "LF6.12.49_2.2.0".

License hashes changed because the LA_OPT_NXP_Software_License changed
from "v56 April 2024" to "v62 May 2025".

Note: in this release, the package source archive name changed to
include a revision. This commit adds a new _REVISION variable with the
value published in the corresponding NXP BSP.

Signed-off-by: Sébastien Szymanski <sebastien.szymanski@armadeus.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/freescale-imx/imx-codec/imx-codec.hash | 8 ++++----
 package/freescale-imx/imx-codec/imx-codec.mk   | 5 +++--
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/package/freescale-imx/imx-codec/imx-codec.hash b/package/freescale-imx/imx-codec/imx-codec.hash
index 18a2cebec9..708ad2bbc8 100644
--- a/package/freescale-imx/imx-codec/imx-codec.hash
+++ b/package/freescale-imx/imx-codec/imx-codec.hash
@@ -1,5 +1,5 @@
 # locally computed
-sha256  1a41a3cad9e0f4baa904fcec896105d3474e18d13f169dad1172d5691fc11c9a  imx-codec-4.9.0.bin
-sha256  c9ee518510d72e254d62743f5098163eacdb6428c6ba4d8119afe2d12edba068  COPYING
-sha256  165f6c0eacb4d3a05289dfb79331c9a2c05207eb7a67ef28a117f246a0145428  EULA
-sha256  5832c59215fcc5ffd2566c0bb35c7e5c8181ca609f529962c2bd0606f3f12aa3  SCR-imx-codec.txt
+sha256  82242219e0d3536aeff31d9c215543bfe5541540bdb4fa8d61e83067b015e31f  imx-codec-4.10.0-464e9d8.bin
+sha256  f24daabb577ad31105a7db562bb2f4623603715cbb3c168a310564974ac2a2e9  COPYING
+sha256  bfc1c162384c8cc4d5a78c4c930a317a8c01fd2cdad11755e3b13a6004bb4961  EULA
+sha256  cb79b015cf2185bac3dde0f77de227e2d68a5e71f6b58fa2862c9459fdd08cd2  SCR-imx-codec.txt
diff --git a/package/freescale-imx/imx-codec/imx-codec.mk b/package/freescale-imx/imx-codec/imx-codec.mk
index 0cfe74df0b..baaf9c098a 100644
--- a/package/freescale-imx/imx-codec/imx-codec.mk
+++ b/package/freescale-imx/imx-codec/imx-codec.mk
@@ -4,9 +4,10 @@
 #
 ################################################################################
 
-IMX_CODEC_VERSION = 4.9.0
+IMX_CODEC_VERSION = 4.10.0
+IMX_CODEC_REVISION = 464e9d8
 IMX_CODEC_SITE = $(FREESCALE_IMX_SITE)
-IMX_CODEC_SOURCE = imx-codec-$(IMX_CODEC_VERSION).bin
+IMX_CODEC_SOURCE = imx-codec-$(IMX_CODEC_VERSION)-$(IMX_CODEC_REVISION).bin
 IMX_CODEC_INSTALL_STAGING = YES
 
 IMX_CODEC_LICENSE = NXP Semiconductor Software License Agreement, BSD-3-Clause (flac, ogg headers)

--===============6310666273659146363==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6310666273659146363==--
