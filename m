Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4FDFCCF2D1
	for <buildroot@archiver.kernel.org>; Mon, 19 Jan 2026 10:00:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 849DB81D46;
	Mon, 19 Jan 2026 10:00:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Fxs5tBAlgM02; Mon, 19 Jan 2026 10:00:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 87D2081CBA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768816845;
	bh=gGegW9fpiEhTlPxwOFH54d7Sr/Pz+4ZDJHlSn1L2QRs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Qql0bGH9LRaYgiMXp7HKXGSbCw6dvHz1Jq3t8eGpmXWkYSYHYiiUHzB2Pw1GAS8hc
	 WCvMlUPwl5L+dFTv6ociBkQOtN4RQm4rDljAeZfhrDcyLESpPXnn1tUl2ekMi9R9rM
	 D8jvLGvyCY6xy8MyF+q+f+e4rl5Wog4kkuSQpsg3vin26et0j2ZRzKLZGuuE6kjup4
	 cp+sHgGhOUBoE/fxqvCm6ol0zGqTwnjr4nbeKUaPRTyJoZk/R8UqNRnBZ85EZhqF4l
	 g0WRy+MI+pscY0JulZlFmDP0kZi7JEFGUTZpsHEiNRN5y4O73HYNzkBj560g6UKg+y
	 yqpzhksIRADlA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 87D2081CBA;
	Mon, 19 Jan 2026 10:00:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 57BBD160
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 10:00:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 477FB406E0
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 10:00:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pDD4im1U_HPk for <buildroot@buildroot.org>;
 Mon, 19 Jan 2026 10:00:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7B218406D3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7B218406D3
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 10:00:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6BDBC88600; Mon, 19 Jan 2026 10:00:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 15 Jan 2026 09:15:10 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: f89a71d3066d205642530d98c0544569cb07c957
X-Git-Newrev: aa290648ea8b62f017ab2d0f6b3336d548f6c059
X-Patchwork-Hint: ignore
Message-Id: <20260119100040.6BDBC88600@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/libgtk4: remove
 schema compile hook
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

commit: https://git.buildroot.net/buildroot/commit/?id=aa290648ea8b62f017ab2d0f6b3336d548f6c059
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.11.x

Dropping the need for this package to compile any schemas as the
libglib2 package (a dependency) already handles this during target
finalization.

Signed-off-by: James Knight <git@jdknight.me>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 2fb684fd68dce4b16102baed6fc2578f35ff7959)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/libgtk4/libgtk4.mk | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/package/libgtk4/libgtk4.mk b/package/libgtk4/libgtk4.mk
index 5d3341a95d..0d86835609 100644
--- a/package/libgtk4/libgtk4.mk
+++ b/package/libgtk4/libgtk4.mk
@@ -80,12 +80,6 @@ else
 LIBGTK4_CONF_OPTS += -Dbuild-demos=false -Dbuild-examples=false
 endif
 
-define LIBGTK4_COMPILE_GLIB_SCHEMAS
-	$(HOST_DIR)/bin/glib-compile-schemas \
-		$(TARGET_DIR)/usr/share/glib-2.0/schemas
-endef
-LIBGTK4_POST_INSTALL_TARGET_HOOKS += LIBGTK4_COMPILE_GLIB_SCHEMAS
-
 # here, we build a native gtk4-update-icon-cache as host-libgtk4
 
 HOST_LIBGTK4_DEPENDENCIES = \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
