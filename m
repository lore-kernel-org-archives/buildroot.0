Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4005CD3439
	for <buildroot@archiver.kernel.org>; Mon,  4 May 2026 14:48:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BAC21410D2;
	Mon,  4 May 2026 14:48:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CN7rhu71AXvj; Mon,  4 May 2026 14:48:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C5AD441CC3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777906136;
	bh=v8gV6fYLaap5gUIunljHQN6dE+y7AdgmrwBwaNWvRFo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=K95ZLxj7Wgw9WBwYp3pNnrb7Ne0DNxQjG8BiuqJG9FohFQ2IfiAdF3FvMbE+72vCb
	 KZK8F9t4lVOy7Z2tZrMWQ02rILnLzmbayhyrIjdd95yeNOr+lHCZgbIoHZt39r1MjH
	 tk8N1wPwzFrMoWw9xnsVU9KNW4BhBwvgvzqbjM9ob75Qvzz8u41urx9Azh691EW8Qd
	 T6FElJhOT3Bo0/mkPr9TFMsH71jU2XPdSpNGAZIZVeVrwUw2c0BptS+/bg3YrbcD6g
	 E+ckJc5tJM0G31Vgss5H+OvMnbtjLEkz6wOl5FtJH5PcO9IPrqNObbK7ybj6f4WhnV
	 TmrDVffNAbXvg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C5AD441CC3;
	Mon,  4 May 2026 14:48:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 53A7B30A
 for <buildroot@buildroot.org>; Mon,  4 May 2026 14:48:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 51F24846CD
 for <buildroot@buildroot.org>; Mon,  4 May 2026 14:48:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aqf6UGUR2Q9s for <buildroot@buildroot.org>;
 Mon,  4 May 2026 14:48:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 63419846C5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 63419846C5
 for <buildroot@buildroot.org>; Mon,  4 May 2026 14:48:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 45D6B8435A; Mon,  4 May 2026 14:48:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 30 Apr 2026 14:08:58 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: 1b2573e946f6b639ab6ad69886a458e51e4cef49
X-Git-Newrev: d36db25ccc5febe7aeb8de79d82406000011575a
X-Patchwork-Hint: ignore
Message-Id: <20260504144843.45D6B8435A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] DEVELOPERS: remove
 Clayton Shotwell, e-mail bounces
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d36db25ccc5febe7aeb8de79d82406000011575a
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

<clayton.shotwell@collins.com>: host
    mxb-00105402.gslb.gpphosted.com[67.231.155.145] said: 550 5.1.1 User
    Unknown (in reply to RCPT TO command)

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 6774a1e4c8442d187ce6839d9a1b6dc3d04d684c)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 DEVELOPERS | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index f7ab670a9c..482b0f3d68 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -696,19 +696,6 @@ F:	package/perl-sys-mmap/
 F:	package/perl-time-parsedate/
 F:	package/perl-x10/
 
-N:	Clayton Shotwell <clayton.shotwell@collins.com>
-F:	package/audit/
-F:	package/checkpolicy/
-F:	package/cpio/
-F:	package/libcgroup/
-F:	package/libee/
-F:	package/libestr/
-F:	package/liblogging/
-F:	package/libselinux/
-F:	package/libsemanage/
-F:	package/libsepol/
-F:	package/policycoreutils/
-
 N:	Colin Foster <colin.foster@in-advantage.com>
 F:	package/python-tftpy/
 F:	package/rauc-hawkbit-updater/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
