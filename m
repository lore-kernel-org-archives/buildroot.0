Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE83AD43341
	for <buildroot@archiver.kernel.org>; Thu, 11 Dec 2025 19:30:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A7CA940E93;
	Thu, 11 Dec 2025 19:30:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xjQGi8y4mCO8; Thu, 11 Dec 2025 19:30:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CB01141138
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765481406;
	bh=aF997fnTcRL5T3Ny/uXJpL2kUQDS8nzYmlVf4uLGii8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=fs/SHSZNat57gr1HsZdTBEVzCHF6wx26qs4Rzyc5/ncAiNOEyvV2nBsNhhug3Hcyu
	 bkTH46wJHOZUalBmU67SlJzQHqJqIccNrqjV+oUn6Ka3DWqYixmirIGDfbS0ha9j/G
	 JIBks/WuZppQQFOeT4QubSgfhiOXCGCpxj11T3bDvOFNFdqRU7B/65U3WG4oT5O4Qd
	 Ys6fNrfURAsNAik1AmrdA5OB8vLZd5mQRCjw/GAfLGfoTdjgMgXg3za0wJmVT12fJI
	 7m4xD2xEnVhOBJQ0MNqKYNJ4/FlUV/Dl+y5CuSZ41ahlziyeb2vMTH1vlVzTSGETWM
	 xCdZFtUq6z06w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CB01141138;
	Thu, 11 Dec 2025 19:30:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0AD5A2C1
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:29:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 47CC340E93
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:29:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n_0Sd0u-3SBd for <buildroot@buildroot.org>;
 Thu, 11 Dec 2025 19:29:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 748D8410C4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 748D8410C4
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:29:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 73B0C86BE5; Thu, 11 Dec 2025 19:29:54 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 11 Dec 2025 10:56:47 +0100
X-Git-Refname: refs/heads/2025.08.x
X-Git-Oldrev: 05f367ee24ad1f6b4e4e1ff6311bc9e284fc2839
X-Git-Newrev: e63a7375a544273e74d22acbf7a9a8d0e60522b5
X-Patchwork-Hint: ignore
Message-Id: <20251211192954.73B0C86BE5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.08.x] package/mosh: update SITE
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

commit: https://git.buildroot.net/buildroot/commit/?id=e63a7375a544273e74d22acbf7a9a8d0e60522b5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.08.x

Old URL returns 404, update SITE according to https://mosh.org/

Fixes:
https://autobuild.buildroot.net/results/c1c/c1cf4568c82deb118aad0171bda356c7f59f17dd/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 9c12266739c52b0754ad1e185307273faa851b0d)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/mosh/mosh.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/mosh/mosh.mk b/package/mosh/mosh.mk
index 3c41a17401..bc1f382a9f 100644
--- a/package/mosh/mosh.mk
+++ b/package/mosh/mosh.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 MOSH_VERSION = 1.4.0
-MOSH_SITE = https://mosh.org
+MOSH_SITE = https://github.com/mobile-shell/mosh/releases/download/mosh-$(MOSH_VERSION)
 MOSH_DEPENDENCIES = zlib ncurses protobuf host-pkgconf
 MOSH_LICENSE = GPL-3.0+ with exception
 MOSH_LICENSE_FILES = COPYING COPYING.iOS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
