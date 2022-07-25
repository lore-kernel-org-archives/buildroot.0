Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C1EAC433EF
	for <buildroot@archiver.kernel.org>; Mon, 25 Jul 2022 15:25:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DA7444199E;
	Mon, 25 Jul 2022 15:25:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DA7444199E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lun0RgdPPgt5; Mon, 25 Jul 2022 15:25:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 74396410AA;
	Mon, 25 Jul 2022 15:25:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 74396410AA
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E34791BF2BD
 for <buildroot@lists.busybox.net>; Mon, 25 Jul 2022 15:25:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BCB9060C0D
 for <buildroot@lists.busybox.net>; Mon, 25 Jul 2022 15:25:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BCB9060C0D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id k97p3nH7eaQH for <buildroot@lists.busybox.net>;
 Mon, 25 Jul 2022 15:25:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E467660B0B
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E467660B0B
 for <buildroot@buildroot.org>; Mon, 25 Jul 2022 15:25:30 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPA id 27BCE24000B;
 Mon, 25 Jul 2022 15:25:26 +0000 (UTC)
To: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Peter Seiderer <ps.report@gmx.net>,
 Buildroot List <buildroot@buildroot.org>
Date: Mon, 25 Jul 2022 17:25:16 +0200
Message-Id: <20220725152522.1579992-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658762727;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=ioGgzhIxnomsyVJlFl7gbJMl/tsVnlMKiUVGPyLHRnM=;
 b=EoRHfst4xF2HlJoA47H2SC+ZdmrlaAVEVfWO695K7OGsSR0OrbqRen2nj/3OQWCln/GEGC
 P3XZvtNr/pUqQO/uS38HgYMk/vl9vhNxfzGE8BIpAnbimkHGjdm+AR55EKz9eHTMZoTRD+
 3Z4qgqbC2R4WRSlMIeU/xM+laZGQnZuOKZCbzilf83PMvI9fwMrle47qO2mHiYbarr/Xgr
 0EZmMaYjicGg+lLyaAKWh9wOWMLmP9FZpyHAIMEN4MOCeDrFqZM8ARRc0fWbrh86AlY0C2
 ZxH9bFJMjqZobNgU7NS3Whotl+6vsncNKN50BPviyI11oDckSrHWQufcptMPLw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=EoRHfst4
Subject: [Buildroot] [PATCH 0/5] Very initial Qt6 packaging
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

Here is a small patch series that introduce an initial, extremely
minimal package for Qt6. Don't be excited too soon: it is so minimal
that even GUI support is not included!

The goal of this series is just to get the process of Qt6 packaging
started, and be able to progressively on top of this initial base
rather than having one huge patch series to review.

I have taken some initial work from Peter Seiderer as a starting point
for this series (for the double-conversion and libb2 packages), but
for Qt6 I took a different approach than Peter in his initial series
at [1]: I made the qt6base package strictly minimal for now.

The individual patches have more details, especially the patch adding
qt6base itself.

Let me know if you have any question.

Thanks!

Thomas

[1] https://patchwork.ozlabs.org/project/buildroot/list/?series=229448

Peter Seiderer (2):
  package/double-conversion: new package
  package/libb2: new package

Thomas Petazzoni (3):
  package/pcre2: add pcre2-16 to the host variant
  package/qt6/qt6base: new package
  support/misc/toolchainfile.cmake.in: add definitions needed by Qt6

 DEVELOPERS                                    |  5 ++
 package/Config.in                             |  3 +
 package/double-conversion/Config.in           | 11 +++
 .../double-conversion/double-conversion.hash  |  3 +
 .../double-conversion/double-conversion.mk    | 14 ++++
 package/libb2/Config.in                       |  6 ++
 package/libb2/libb2.hash                      |  3 +
 package/libb2/libb2.mk                        | 18 +++++
 package/pcre2/pcre2.mk                        |  3 +
 package/qt6/Config.in                         | 43 ++++++++++
 package/qt6/qt6.mk                            | 12 +++
 ...al-qsimd_p.h-fix-build-on-ARM-v7-due.patch | 49 ++++++++++++
 package/qt6/qt6base/Config.in                 | 16 ++++
 package/qt6/qt6base/qt6base.mk                | 79 +++++++++++++++++++
 support/misc/toolchainfile.cmake.in           |  9 +++
 15 files changed, 274 insertions(+)
 create mode 100644 package/double-conversion/Config.in
 create mode 100644 package/double-conversion/double-conversion.hash
 create mode 100644 package/double-conversion/double-conversion.mk
 create mode 100644 package/libb2/Config.in
 create mode 100644 package/libb2/libb2.hash
 create mode 100644 package/libb2/libb2.mk
 create mode 100644 package/qt6/Config.in
 create mode 100644 package/qt6/qt6.mk
 create mode 100644 package/qt6/qt6base/0001-src-corelib-global-qsimd_p.h-fix-build-on-ARM-v7-due.patch
 create mode 100644 package/qt6/qt6base/Config.in
 create mode 100644 package/qt6/qt6base/qt6base.mk

-- 
2.37.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
