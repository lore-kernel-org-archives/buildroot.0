Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D21A4D6E2B2
	for <buildroot@archiver.kernel.org>; Thu, 18 Dec 2025 16:44:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A890E61221;
	Thu, 18 Dec 2025 16:44:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lhAhhbYA55ts; Thu, 18 Dec 2025 16:44:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B499661214
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766076256;
	bh=hUjikromDHvsrlUAgYjdv8rmfT5kYZeotSE3z3khFjY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=MQvFG8qgTHW16uLqO+3zOK2X+eahzrBstThtOySIQ0ym/xHRvqKKKdksutHTMkAvq
	 dii4KzHalYcm02uh67f3L1cBSDx8nndpIHdBaC7Qq849tJJWVPpPXJw6pBaZ2h5A9C
	 dpF3vxmyryIHEFvsV95Djuw46sos2LowGEVcxbYaCsfFTc8pS6WxGfcxspkrRrcbwW
	 ZfWmlpVdg/rXyRwKtIuxtAe+0DjzUnyncKmi/wGh3IcRXA4GBfa1hiGJoR5V+Wi2g2
	 XRT1p95+V/hgzlM4Y9aMdt8dmsvDmLVk+EcUt0/JUbQKDdbqQqkLbhA3gLpt+ACNsH
	 qUDd8VOYnufKg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B499661214;
	Thu, 18 Dec 2025 16:44:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id C055E361
 for <buildroot@buildroot.org>; Thu, 18 Dec 2025 16:44:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A0CEA83E74
 for <buildroot@buildroot.org>; Thu, 18 Dec 2025 16:44:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8cRWFKTuT7Ha for <buildroot@buildroot.org>;
 Thu, 18 Dec 2025 16:43:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D23C883E75
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D23C883E75
 for <buildroot@buildroot.org>; Thu, 18 Dec 2025 16:43:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D02B2873D6; Thu, 18 Dec 2025 16:43:58 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 18 Dec 2025 17:01:25 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: 6e99889c74b971e2909156d6ab8e4d3cf7e9e9ba
X-Git-Newrev: 6425628a87527f99a73d0e1b892b5553b8bd9c1d
X-Patchwork-Hint: ignore
Message-Id: <20251218164358.D02B2873D6@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/rtl8821au: bump
 to version 2025-12-13
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

commit: https://git.buildroot.net/buildroot/commit/?id=6425628a87527f99a73d0e1b892b5553b8bd9c1d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.11.x

With Kernel >= 6.18 introduced in [1] rtl8821au fails at build
time with error:

    core/rtw_security.c:2008:13: error: conflicting types for 'sha256_init'; have 'void(struct sha256_state_rtk *)'

Fixes:
https://autobuild.buildroot.org/results/bc0ec5fe3acb37740b54eb1af1fe5d9284c87cf2/

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/a06d79862a60d3c8d5ddd6a9ab12b5ccdd91984c

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
[Julien: add details in commit log]
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit d75b8c5b7501c4b9a4b85df531d6e19c159a7934)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/rtl8821au/rtl8821au.hash | 2 +-
 package/rtl8821au/rtl8821au.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rtl8821au/rtl8821au.hash b/package/rtl8821au/rtl8821au.hash
index 29b4d46f8e..ca5f9f15df 100644
--- a/package/rtl8821au/rtl8821au.hash
+++ b/package/rtl8821au/rtl8821au.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  fe9840003e9481cf9fce3a5ed3f5b985615f862abc1b8d51fe6de7da9e4943c9  rtl8821au-dfe6801adb9b3a5572260ab308d3b69522992814.tar.gz
+sha256  1d9f87c7a30d54f67cb09e98a436565ba9c64a28feca95205f66212d8833836c  rtl8821au-bb26b6b06c47b79c17426ef186f44a608dbed7a0.tar.gz
 sha256  640d90f6ee401241ff62834d0d1b33f83049e99b8bfdfa04ed1b0a1635dde3e7  LICENSE
diff --git a/package/rtl8821au/rtl8821au.mk b/package/rtl8821au/rtl8821au.mk
index 734b427019..4e7aee4204 100644
--- a/package/rtl8821au/rtl8821au.mk
+++ b/package/rtl8821au/rtl8821au.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RTL8821AU_VERSION = dfe6801adb9b3a5572260ab308d3b69522992814
+RTL8821AU_VERSION = bb26b6b06c47b79c17426ef186f44a608dbed7a0
 RTL8821AU_SITE = $(call github,benetti-engineering,rtl8821au,$(RTL8821AU_VERSION))
 RTL8821AU_LICENSE = GPL-2.0
 RTL8821AU_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
