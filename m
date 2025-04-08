Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E51B6C369A2
	for <buildroot@archiver.kernel.org>; Tue,  8 Apr 2025 15:17:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0AC3D6105E;
	Tue,  8 Apr 2025 15:17:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9IxcIZ791wHJ; Tue,  8 Apr 2025 15:17:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D3CAA60906
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D3CAA60906;
	Tue,  8 Apr 2025 15:16:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1FDAADA
 for <buildroot@buildroot.org>; Tue,  8 Apr 2025 15:16:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F225C824E3
 for <buildroot@buildroot.org>; Tue,  8 Apr 2025 15:16:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QpMaq4otC2KO for <buildroot@buildroot.org>;
 Tue,  8 Apr 2025 15:16:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=45.157.188.10;
 helo=smtp-bc0a.mail.infomaniak.ch; envelope-from=foss+buildroot@0leil.net;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E31C080BF3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E31C080BF3
Received: from smtp-bc0a.mail.infomaniak.ch (smtp-bc0a.mail.infomaniak.ch
 [45.157.188.10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E31C080BF3
 for <buildroot@buildroot.org>; Tue,  8 Apr 2025 15:16:56 +0000 (UTC)
Received: from smtp-3-0001.mail.infomaniak.ch (unknown
 [IPv6:2001:1600:4:17::246c])
 by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4ZX8nL36xNzPyy;
 Tue,  8 Apr 2025 17:16:54 +0200 (CEST)
Received: from unknown by smtp-3-0001.mail.infomaniak.ch (Postfix) with ESMTPA
 id 4ZX8nK5Jm1z8Mf; Tue,  8 Apr 2025 17:16:53 +0200 (CEST)
From: Quentin Schulz <foss+buildroot@0leil.net>
Date: Tue, 08 Apr 2025 17:16:39 +0200
Message-Id: <20250408-libcamera-qcam-v1-0-680c8a48dc17@cherry.de>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIANc99WcC/23MzwrCMAwG8FcZOVvosnauuwo+gFfZoW1SLbip3
 RzC8N2tf/DkIYTvC/ktMHKKPEJbLJB4jmM8DzmUqwL80Q4HFpFyBpSopZJKnKLztudkxTVvwQ3
 Wxqs1YzCQny6JQ7y/wT3sthvoPmXi6y3j0/fys9vijyyFzuMM+9AYQ+RUO5cv3dmRhT/3fZzaQ
 lXWeVJ+TdRYqjVhQFliqEihwapGraWtmKB7PJ62QChP6AAAAA==
X-Change-ID: 20250404-libcamera-qcam-e8269c47e2f9
To: buildroot@buildroot.org
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Marcus Folkesson <marcus.folkesson@gmail.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.14.2
X-Infomaniak-Routing: alpha
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=0leil.net
Subject: [Buildroot] [PATCH RFC 0/2] add initial support for libcamera's qcam
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This adds initial support for qcam example GUI from libcamera. It is
based on Qt6 and uses openGL.

Sadly, the qt module from meson is currently broken (see first patch in
the series) and requires patching. Upstream isn't really happy with what
I suggested but I haven't understood what they don't like about it so
cannot currently suggest anything better, hence the RFC.

While qcam currently renders the camera liveview, all characters of the
GUI are squares. I have enabled fontconfig and UTF-8 locales but after
building everything (though I dircleaned qt6base once), so not entirely
sure what's missing or if it's PEBKAC, hence the RFC. Though that may be
acceptable? Do not know. Would appreciate pointers on how to debug this
(assumed) font issue.

I'm not planning on actively working on this as the only product we have
that could use this is currently stuck on qt5 so cannot use new qcam and
it would anyway only be for debug firmware releases. See this as a code
dump essentially. If there are hints or limited work required to have
this merged, I'll happily try to find time doing it but feel free to
take over the series or disregard it entirely.

This is based on top of
https://lore.kernel.org/buildroot/20250404-libcamera-0-5-0-v1-0-e2ca9d029aeb@cherry.de/T/#t

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
Quentin Schulz (2):
      package/meson: look for qt6 tools on Buildroot host machine
      package/libcamera: initial support for Qt6 qcam

 package/libcamera/libcamera.mk                     |  5 ++
 ...e-look-for-qt-tools-only-on-build-machine.patch | 56 ++++++++++++++++++++++
 2 files changed, 61 insertions(+)
---
base-commit: 43abcd4c7dd8ad65d2f2012f3d4292362550a3ed
change-id: 20250404-libcamera-qcam-e8269c47e2f9
prerequisite-change-id: 20250404-libcamera-0-5-0-b9ecf899ddb4:v1
prerequisite-patch-id: 854e58d76fc57aa774ca0d315ecae56b67c00c8a
prerequisite-patch-id: 4873ac99203f0d789d64aec048249d9ba6a15a82
prerequisite-patch-id: c4d504c6563a911ba550be263063cfd7bf04bcbe
prerequisite-patch-id: 4a74788db759d3b67650f1456ee4d64f9394f50a
prerequisite-patch-id: 73a4b5a3204b1a901da74a3ffe1672055404dd2f
prerequisite-patch-id: 90b567b9a37abb58747d965ea2e0fef41358844b
prerequisite-patch-id: 946aac34b70f001c24fc6fe86caab759a4591359
prerequisite-patch-id: cee428a4219c83704347f6f194694f21093034da
prerequisite-patch-id: 6bbbdc80dc639a1b2918d79ae101e1030f3312bd

Best regards,
-- 
Quentin Schulz <quentin.schulz@cherry.de>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
