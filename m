Return-Path: <SRS0=AoHb=QC=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEC00C433EF
	for <buildroot@archiver.kernel.org>; Mon, 15 Nov 2021 12:33:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DB83A61A7E
	for <buildroot@archiver.kernel.org>; Mon, 15 Nov 2021 12:33:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DB83A61A7E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=umbiko.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7523040220;
	Mon, 15 Nov 2021 12:33:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QLEl0m65PzUZ; Mon, 15 Nov 2021 12:33:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C42014021D;
	Mon, 15 Nov 2021 12:33:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0A3641BF343
 for <buildroot@lists.busybox.net>; Mon, 15 Nov 2021 12:33:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 04D7D4021C
 for <buildroot@lists.busybox.net>; Mon, 15 Nov 2021 12:33:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LcQFbQIp6pa6 for <buildroot@lists.busybox.net>;
 Mon, 15 Nov 2021 12:33:17 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from serv15.avernis.de (serv15.avernis.de [176.9.89.163])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C7556401F1
 for <buildroot@buildroot.org>; Mon, 15 Nov 2021 12:33:16 +0000 (UTC)
Received: from localhost.localdomain (unknown [151.43.3.160])
 by serv15.avernis.de (Postfix) with ESMTPSA id 19872C22A823;
 Mon, 15 Nov 2021 13:33:14 +0100 (CET)
From: Andreas Ziegler <br015@umbiko.net>
To: buildroot@buildroot.org
Date: Mon, 15 Nov 2021 13:32:10 +0100
Message-Id: <20211115123212.11841-1-br015@umbiko.net>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211114160803.5ce09ba5@windsurf>
References: <20211114160803.5ce09ba5@windsurf>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.3 at serv15.avernis.de
X-Virus-Status: Clean
Subject: [Buildroot] [PATCH v2 0/2] package/mpd: update to version 0.23.y
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
Cc: Andreas Ziegler <br015@umbiko.net>,
 =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In addition to various bug fixes, mpd version 0.23 introduces a new
dependency (mft) and a change in the configuration of the UPnP client
library. 

Both supported UPnP libraries are available as Buildroot packages,
there is no clear favourite, so the choice is left to the user.

The libraries necessary for optional new features (openmpt decoder,
pipewire and snapcast outputs) are currently not available as separate
Buildroot packages and were disabled.

The change log can be found in [1]

Buildroot changes:
  Correct a typo in toolchain dependency comment.
  Introduce new dependency for fmt library.
  Change configuration of UPnP plugin to submenu, allowing to optionally 
	select libupnp, libnpupnp or no UPnP. The default setting is 
	'no UPnP client functionality'.
  Adapt sparc patch to changes in source layout.
  Add legacy entry for existing MPD UPnP configuration.

This change updates mpd to version 0.23.3, tested on arm64 and i386. 

[1] https://raw.githubusercontent.com/MusicPlayerDaemon/MPD/v0.23.3/NEWS

Andreas Ziegler (2):
  package/mpd: correct typo in help message
  package/mpd: update to version 0.23.y

 Config.in.legacy                              |  8 ++++
 ...build-add-atomic-dependency-for-spar.patch |  4 +-
 package/mpd/Config.in                         | 43 ++++++++++++++++---
 package/mpd/mpd.hash                          |  2 +-
 package/mpd/mpd.mk                            | 23 +++++++---
 5 files changed, 65 insertions(+), 15 deletions(-)

-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
