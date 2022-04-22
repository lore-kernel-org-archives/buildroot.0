Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26FAEC433F5
	for <buildroot@archiver.kernel.org>; Fri, 22 Apr 2022 21:49:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 90185419D6;
	Fri, 22 Apr 2022 21:49:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BXnVjWw7-59K; Fri, 22 Apr 2022 21:49:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AE19C4197A;
	Fri, 22 Apr 2022 21:49:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B43B71BF336
 for <buildroot@lists.busybox.net>; Fri, 22 Apr 2022 21:49:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id ACFDC61375
 for <buildroot@lists.busybox.net>; Fri, 22 Apr 2022 21:49:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=igalia.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XQk36CXOu2nl for <buildroot@lists.busybox.net>;
 Fri, 22 Apr 2022 21:49:36 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EE059612FD
 for <buildroot@buildroot.org>; Fri, 22 Apr 2022 21:49:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=PNIySUF6bX2X55J4Au5I+xpjOihLSfNNMVXqWOTDYEE=; b=VDy9P3iN0IkQgzdY7+17NTP4Zw
 ioDkDEXwkuIci1bOePX2YUYPeX8TqGoocLnM2Bccu5F4pyM1QXNk7ne0Eqgglh7x+ndFT8GF/yFrb
 nXlhFT1u/uSL/OfuI1nByCoNrwUIUsK3HXUDXSMUuy9GN/iBZ/zJi2iKPbXhJ0lCKaIkAj0z45vT6
 goxc9SdVC30M8354nGhMlx08isIMewbasevd3Axoae6jsjT7343n4j0C6R6E8FTluDOZTv+MFoetG
 nl1aO7BuI4ykjG0dvvQ4J6SWjFsQUjMJAqrmPyANR7qqpz6Y2L7BZD15VMhYQKQJoJOj8J7HfFCd4
 ZNegtqTg==;
Received: from 91-153-34-227.elisa-laajakaista.fi ([91.153.34.227] helo=kodama)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA512__AES_256_GCM:256) (Exim)
 id 1ni19f-0003SJ-OX; Fri, 22 Apr 2022 23:49:31 +0200
Received: from localhost (kodama [local])
 by kodama (OpenSMTPD) with ESMTPA id f37912cb;
 Fri, 22 Apr 2022 21:49:19 +0000 (UTC)
From: Adrian Perez de Castro <aperez@igalia.com>
To: buildroot@buildroot.org
Date: Sat, 23 Apr 2022 00:49:16 +0300
Message-Id: <20220422214919.367067-1-aperez@igalia.com>
X-Mailer: git-send-email 2.36.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 0/3] Update wlroots to the latest release
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
Cc: Adrian Perez de Castro <aperez@igalia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi,

This is a small patch set which brings wlroots library to its most recent
version, fixing the cage compositor with a backported patch (as there is
no newer release yet). I am adding one additional patch that enables the
new Vulkan renderer when any of Mesa's Vulkan drivers is selected, too.

I don't expect the two first patches of the set to be controversial, but
dunno about the Vulkan one. If there are doubts, I suppose the first two
could be merged anyway, leaving the other out for further discussion.

One more thing: With wlroots 0.15.x it is finally possible to disable building
the accelerated renderers (GLESv2, Vulkan) and have only the software based
one (Pixman) built into wlroots. Currently I do not have the need for such a
configuration, and therefore I am not planning to send a patch to allow that
for now. On the other hand, if anyone wanted to try writing the patch, I would
be more than happy to review it :-)

Cheers,
-Adrian


Adrian Perez de Castro (3):
  package/wlroots: bump to version 0.15.1
  package/cage: add upstream patch for wlroots 0.15.x
  package/wlroots: enable vulkan renderer if possible

 .../cage/0001-Upgrade-to-wlroots-0.15.patch   | 312 ++++++++++++++++++
 package/wlroots/Config.in                     |   2 +-
 package/wlroots/wlroots.hash                  |   4 +-
 package/wlroots/wlroots.mk                    |  29 +-
 4 files changed, 332 insertions(+), 15 deletions(-)
 create mode 100644 package/cage/0001-Upgrade-to-wlroots-0.15.patch

-- 
2.36.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
