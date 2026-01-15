Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12735CCF2D4
	for <buildroot@archiver.kernel.org>; Mon, 19 Jan 2026 10:00:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DAEFD80AD2;
	Mon, 19 Jan 2026 10:00:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fHSyzuVbImCV; Mon, 19 Jan 2026 10:00:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 25BBE81BD4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768816842;
	bh=Ji33quSC6HJyLa8m9froP6eTSA6h3eR/RNXUlTwehsk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=hDhuct6Be2uZKpD7QrMcrhRRgWd7TjjNfq7A4MVz9WMNSmopgo2oHwJCPGqEjAvAo
	 mmumGlMYMGP2N4MZQ55SrV7Xtjy9+Ja+OdTyNP3VP13l+PpyAQiAwa2tOxGXXvBgAB
	 A8J/8+k6M5XjqwkdsSeLmlJWXilQo8oH0qvGFb4ME7cNz31n7aMMKOr3u8p6LMzVMo
	 7fhjWDNFU9YAFkEeT7ZjBdFwYteu/4Lb2oJYrP9XCmLBijZGaLbPj1JkSaZXzVvGxm
	 xlVMORjIujLJXIbHTFTdWh3yc20ZwbFaesQfs4hzkW0SkdQH98aXwdnxk1iaHDrllO
	 mHcUMINUFRjew==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 25BBE81BD4;
	Mon, 19 Jan 2026 10:00:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 391C5160
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 10:00:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 28E1381BD4
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 10:00:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7MCprxZp1p0U for <buildroot@buildroot.org>;
 Mon, 19 Jan 2026 10:00:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4943980AD2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4943980AD2
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 10:00:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 39509885CF; Mon, 19 Jan 2026 10:00:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 15 Jan 2026 09:10:48 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: 9527a010f2f4aa1680bfef307c9c94b93c5e2d7d
X-Git-Newrev: 69d6fd1be521a90a97f2c7724c9a9a681f01d9e2
X-Patchwork-Hint: ignore
Message-Id: <20260119100040.39509885CF@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x]
 configs/beagleboneai_defconfig: fix whitespace
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

commit: https://git.buildroot.net/buildroot/commit/?id=69d6fd1be521a90a97f2c7724c9a9a681f01d9e2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.11.x

Signed-off-by: Philip Molloy <philip.molloy@analog.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 18655efbd5eab0fe8e9f5fd208647de04715cd9b)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 board/beagleboard/beagleboneai/genimage.cfg | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/beagleboard/beagleboneai/genimage.cfg b/board/beagleboard/beagleboneai/genimage.cfg
index 8aefd76ef8..02e61bc9be 100644
--- a/board/beagleboard/beagleboneai/genimage.cfg
+++ b/board/beagleboard/beagleboneai/genimage.cfg
@@ -19,7 +19,7 @@ image sdcard.img {
 	partition u-boot {
 		partition-type = 0xC
 		bootable = "true"
-                image = "boot.vfat"
+		image = "boot.vfat"
 	}
 
 	partition rootfs {
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
