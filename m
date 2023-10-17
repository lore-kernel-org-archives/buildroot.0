Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E4F1CDB474
	for <buildroot@archiver.kernel.org>; Tue, 17 Oct 2023 14:42:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8D93C41E24;
	Tue, 17 Oct 2023 14:42:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8D93C41E24
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nq-_RT5ILUvU; Tue, 17 Oct 2023 14:42:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EA53441E0A;
	Tue, 17 Oct 2023 14:42:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EA53441E0A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 834131BF300
 for <buildroot@lists.busybox.net>; Tue, 17 Oct 2023 14:42:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5B0D041E0A
 for <buildroot@lists.busybox.net>; Tue, 17 Oct 2023 14:42:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5B0D041E0A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IoFi3DBGBLHi for <buildroot@lists.busybox.net>;
 Tue, 17 Oct 2023 14:42:54 +0000 (UTC)
X-Greylist: delayed 505 seconds by postgrey-1.37 at util1.osuosl.org;
 Tue, 17 Oct 2023 14:42:54 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 01A1841E06
Received: from dd5108.kasserver.com (dd5108.kasserver.com [85.13.130.47])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 01A1841E06
 for <buildroot@buildroot.org>; Tue, 17 Oct 2023 14:42:53 +0000 (UTC)
Received: from wslxew206.ultratronik.de (mail.ultratronik.de [82.100.224.114])
 by dd5108.kasserver.com (Postfix) with ESMTPA id A049C52411A5;
 Tue, 17 Oct 2023 16:34:26 +0200 (CEST)
From: Andreas Naumann <anaumann@ultratronik.de>
To: buildroot@buildroot.org
Date: Tue, 17 Oct 2023 16:34:23 +0200
Message-Id: <20231017143424.430007-1-anaumann@ultratronik.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Spamd-Bar: +
Subject: [Buildroot] [PATCH 0/1] libgpiod v2
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
Cc: bstruempfl@ultratronik.de, Andreas Naumann <anaumann@ultratronik.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi everyone,
we would like to bump libgpiod to v2 and did so in attached patch.
However, this breaks API to v1 which some packages depend on, e.g.
swupdate. Is it preferred to create a new package libgpiod2 instead?


regards,
Andreas



Boerge Struempfel (1):
  package/libgpiod: Bumped to Version 2.0.2

 ...nfigure-switch-for-building-examples.patch | 91 -------------------
 package/libgpiod/libgpiod.hash                |  4 +-
 package/libgpiod/libgpiod.mk                  |  2 +-
 3 files changed, 3 insertions(+), 94 deletions(-)
 delete mode 100644 package/libgpiod/0001-build-add-a-configure-switch-for-building-examples.patch

-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
