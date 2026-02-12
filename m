Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB726EF99D3
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 19:36:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 83E6A40AF1;
	Fri, 13 Feb 2026 19:36:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BtQSdJX5NloW; Fri, 13 Feb 2026 19:36:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 72910402FD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771011365;
	bh=iVmuiXg5SnBSlSv8ro8W/IgtjT0C1CB8AtgMGKds2TI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=UWDvP6clHKAG6z3rfFDBzFIb1BsJH4u7ge3WbG4qCrI2QduhsQd/IdYBhkZn/PC4C
	 tsGxkh6l/0kC2c7BHnvSrIQHxx4RKbtaNcx+NgGZyoyGCh8+/Bzy3Sa1QxMLv+EoMe
	 Pcw1D7E1n0kPnXDB6lS1X8OWIhlB5PhEKd8QYSMWIU8atuGcp+LeN7BQ4EO8XHaQJx
	 1kZxdcaOd2nBq8zLhhnEZWj9g/8arrwIHpqp5Ce2phjjBQk/bAadUydqn7sb5oBIIa
	 Cf7ZH3EDwwSDxpjjQ0tl/i/mQKR1LUQWiA0M9h9TooW85tVQ7u5IkhwTUuxMbI3qzo
	 XI8NVEPvCXnfw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 72910402FD;
	Fri, 13 Feb 2026 19:36:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 18048283
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:35:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6848384533
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:35:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LaT-Gj94GFxu for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 19:35:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4BE3A844BE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4BE3A844BE
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:35:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3BB14811EA; Fri, 13 Feb 2026 19:35:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 12 Feb 2026 14:04:50 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: ae7e57a9622474534f5e67af7750c1b0ccb9ff4f
X-Git-Newrev: bee356b41839847b4c7230aaab88af59ab4034d1
X-Patchwork-Hint: ignore
Message-Id: <20260213193526.3BB14811EA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/libvpx: security
 bump to version 1.16.0
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/bee356b41839847b4c7230aaab88af59ab4034d1
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Brings additional optimizations and bugfixes:

Fix to heap buffer overflow in vp9_deblock, vp9_post_proc_frame, and
vp9_pack_bitstream.

Fix to integer overflow in vp9_highbd_post_proc, vp9_rc_regulate_q,
tiny_ssim, and vp9_calc_pframe_target_size_one_pass_cbr.

Fix to use-of-uninitialized-value in vp9_highbd_post_proc, mfqe, and
vp8_datarate_test.

Fix to out-of-bounds in log_tile_cols_from_picsize_level.
Fix to double free on initialization failure in vpx_codec_enc_init_multi.
Fix to division-by-zero crash in vpxenc with 0 FPS numerator input.
Fix to various build failures for Arm/SVE2, macOS cross-compilation, and
Xcode 16.

https://chromium.googlesource.com/webm/libvpx/+/refs/tags/v1.16.0

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 7e5a961eb0b74399d81518ef3865c32b118ea6da)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/libvpx/libvpx.hash | 2 +-
 package/libvpx/libvpx.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libvpx/libvpx.hash b/package/libvpx/libvpx.hash
index 1082721f1a..33d15fe108 100644
--- a/package/libvpx/libvpx.hash
+++ b/package/libvpx/libvpx.hash
@@ -1,4 +1,4 @@
 # Locally computed:
-sha256  26fcd3db88045dee380e581862a6ef106f49b74b6396ee95c2993a260b4636aa  libvpx-1.15.2.tar.gz
+sha256  7a479a3c66b9f5d5542a4c6a1b7d3768a983b1e5c14c60a9396edc9b649e015c  libvpx-1.16.0.tar.gz
 sha256  8267348d5af1262c11d1a08de2f5afc77457755f1ac658627dd9acf71011d615  LICENSE
 sha256  cc3273e0694ea5896145e0677699b53471b03ea43021ddc50e7923fbb9f5023c  PATENTS
diff --git a/package/libvpx/libvpx.mk b/package/libvpx/libvpx.mk
index 4f4144f4ff..d6b84ffec3 100644
--- a/package/libvpx/libvpx.mk
+++ b/package/libvpx/libvpx.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBVPX_VERSION = 1.15.2
+LIBVPX_VERSION = 1.16.0
 LIBVPX_SITE = $(call github,webmproject,libvpx,v$(LIBVPX_VERSION))
 LIBVPX_LICENSE = BSD-3-Clause
 LIBVPX_LICENSE_FILES = LICENSE PATENTS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
