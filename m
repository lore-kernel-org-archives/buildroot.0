Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A96F3CD4F25
	for <buildroot@archiver.kernel.org>; Fri, 15 May 2026 17:47:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 837268456D;
	Fri, 15 May 2026 17:47:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L6XCIi-s2vSq; Fri, 15 May 2026 17:47:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DC20A84719
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778867240;
	bh=xT6q7aZjYLCVpVL2UDUH6eaxVvNO02vPL3Q8BXQeYvU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=kbyRCRa0yAYNr+DAVFw+wLuRUl5RBIz9g2XJ83y1txqpJaFnTLGCwrEk7aKdzfSpv
	 UQeBu13gPMnrXSpGYMo323d+pmc74KC6bDaOdKFplUmgpv2Q8gkByqnwRsBI45OFc4
	 I9lwFQMYgqGqHN0yR7s5Em+o+wgiq/lJa/G+8b/aUfG84kAb2Kq8GUIHr5Bus/VdnL
	 vBNTK7eaqA/PB8p34A6CemtOT5fxJTs3DP4fYkIVSqfdQW6xuzdteV1Q1SLKgECCgy
	 BAidFTZ/Xh34zIWkTOw+cbqIQf/p1nyUJKlKxvcPgpF+KnXqbrOwm6x0Zb4m1YDQMv
	 RSx+Moc13b5Sg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DC20A84719;
	Fri, 15 May 2026 17:47:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0382B23F
 for <buildroot@buildroot.org>; Fri, 15 May 2026 17:46:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4A66E41D4D
 for <buildroot@buildroot.org>; Fri, 15 May 2026 17:46:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qY42GAWAeiZa for <buildroot@buildroot.org>;
 Fri, 15 May 2026 17:46:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 246AD41DA2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 246AD41DA2
 for <buildroot@buildroot.org>; Fri, 15 May 2026 17:46:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 623D5863DA; Fri, 15 May 2026 17:46:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 15 May 2026 16:24:03 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: e1b39a1fd32ad33bd4e9f4ba520d6dc0922ef91a
X-Git-Newrev: 6e4668c060e55cd2786fac196621f3054e514293
X-Patchwork-Hint: ignore
Message-Id: <20260515174640.623D5863DA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] package/ffmpeg: securty
 bump version to 6.1.5
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/6e4668c060e55cd2786fac196621f3054e514293
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

Fixes: CVE-2026-30997 - FFmpeg AV1 Decoding Out-of-Bounds Read Vulnerability [1]

Full changelog: https://code.ffmpeg.org/FFmpeg/FFmpeg/src/tag/n6.1.5/Changelog

License file hash changed due to removing U+000C unicode characters in [2].

[1] https://code.ffmpeg.org/FFmpeg/FFmpeg/commit/a44ab44236a99ae26594fb3e14fe0c956210673d
[2] https://code.ffmpeg.org/FFmpeg/FFmpeg/commit/735acddb8a12e9de2fb6ad92ece4422fe5a6a02e

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
[Marcus: mention security fix, use upstream url for changelog instead of videolan mirror]
Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
(cherry picked from commit 6cd936b8e72cf26a6024a8ecfa23345bbb22a608)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/ffmpeg/ffmpeg.hash | 4 ++--
 package/ffmpeg/ffmpeg.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/ffmpeg/ffmpeg.hash b/package/ffmpeg/ffmpeg.hash
index 1ffef61309..4c489f168c 100644
--- a/package/ffmpeg/ffmpeg.hash
+++ b/package/ffmpeg/ffmpeg.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  a231e3d5742c44b1cdaebfb98ad7b6200d12763e0b6db9e1e2c5891f2c083a18  ffmpeg-6.1.4.tar.xz
+sha256  05fbe9db1f5452a3605bb1d9bf91da9d4bb08162891692e4f172b58c49109412  ffmpeg-6.1.5.tar.xz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING.GPLv2
-sha256  b634ab5640e258563c536e658cad87080553df6f34f62269a21d554844e58bfe  COPYING.LGPLv2.1
+sha256  246041b6ecf9bc32d718a62c57877c78b5eb397b6467e74ed7ae2626ab189c30  COPYING.LGPLv2.1
 sha256  cb48bf09a11f5fb576cddb0431c8f5ed0a60157a9ec942adffc13907cbe083f2  LICENSE.md
diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index 1efcbf87aa..1289cd5e72 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FFMPEG_VERSION = 6.1.4
+FFMPEG_VERSION = 6.1.5
 FFMPEG_SOURCE = ffmpeg-$(FFMPEG_VERSION).tar.xz
 FFMPEG_SITE = https://ffmpeg.org/releases
 FFMPEG_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
