Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D49ACC36010
	for <buildroot@archiver.kernel.org>; Fri,  4 Apr 2025 16:48:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4750140BFC;
	Fri,  4 Apr 2025 16:48:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0l-7wW7bDKDf; Fri,  4 Apr 2025 16:48:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5E00240B8C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5E00240B8C;
	Fri,  4 Apr 2025 16:48:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id E1AA7117
 for <buildroot@buildroot.org>; Fri,  4 Apr 2025 16:48:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C65F040B98
 for <buildroot@buildroot.org>; Fri,  4 Apr 2025 16:48:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ANBZcwTKubsS for <buildroot@buildroot.org>;
 Fri,  4 Apr 2025 16:48:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=83.166.143.171;
 helo=smtp-8fab.mail.infomaniak.ch; envelope-from=foss+buildroot@0leil.net;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0169F40BBD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0169F40BBD
Received: from smtp-8fab.mail.infomaniak.ch (smtp-8fab.mail.infomaniak.ch
 [83.166.143.171])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0169F40BBD
 for <buildroot@buildroot.org>; Fri,  4 Apr 2025 16:48:11 +0000 (UTC)
Received: from smtp-4-0001.mail.infomaniak.ch (smtp-4-0001.mail.infomaniak.ch
 [10.7.10.108])
 by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4ZTl0S60Zhzjq;
 Fri,  4 Apr 2025 18:48:08 +0200 (CEST)
Received: from unknown by smtp-4-0001.mail.infomaniak.ch (Postfix) with ESMTPA
 id 4ZTl0S2Mq3zjj5; Fri,  4 Apr 2025 18:48:08 +0200 (CEST)
From: Quentin Schulz <foss+buildroot@0leil.net>
Date: Fri, 04 Apr 2025 18:47:31 +0200
Message-Id: <20250404-libcamera-0-5-0-v1-0-e2ca9d029aeb@cherry.de>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIACMN8GcC/x2MSwqAIBQAryJvnWCikF0lWvh51oOyUIhAvHvSY
 hazmKlQMBMWmFmFjA8VulKXcWDgd5s25BS6gxRSCyUUP8h5e2K2XHDdcQZ9nIwJwSno1Z0x0vs
 fl7W1D7LBPjdhAAAA
X-Change-ID: 20250404-libcamera-0-5-0-b9ecf899ddb4
To: buildroot@buildroot.org
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Marcus Folkesson <marcus.folkesson@gmail.com>, 
 Eric Le Bihan <eric.le.bihan.dev@free.fr>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.14.2
X-Infomaniak-Routing: alpha
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=0leil.net
Subject: [Buildroot] [PATCH 0/9] package/libcamera: bump v0.5.0,
 new pipelines, misc improvements and bug fixing
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

This bumps libcamera to v0.5.0, its latest release.

This removes the boost dependency for the VC4 pipeline which hasn't been
needed for a while already.

This improves current reproducibility by adding optional dependencies to
the list of package dependencies whenever their symbols are enabled.

This improves future reproducibility by making all "auto" features
"disabled" so that new auto features aren't detected by meson when
building libcamera as a missing optional dependency in the package mk
file will introduce a reproducibility issue due to build order of
packages.

This adds knobs for Mali-C55 and PiSP pipelines as well as a package for
libpisp, a dependency for the latter pipeline in libcamera.

This also fixes documentation being built regardless of the
"documentation" feature being disabled, if sphinx-build-3 is available
on the host system.

Finally, this fixes a crash when running on Linux kernel predating 6.4.

Note this was only build tested.

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
Quentin Schulz (9):
      package/libcamera: remove dependency on boost for rpi/vc4 pipeline
      package/libcamera: fix documentation being built even if disabled
      package/libcamera: fix crash on Rockchip with kernels before 6.4
      package/libcamera: improve future reproducibility by forcing auto features to disabled
      package/libcamera: improve reproducibility for optional dependencies
      package/libcamera: add support for Arm Mali-C55 ISP pipeline
      package/libcamera: bump to 0.5.0
      package/libpisp: add new package
      package/libcamera: add support for PiSP pipeline

 package/Config.in                                  |   1 +
 ...amera-rkisp1-Eliminate-hard-coded-resizer.patch | 110 +++++++++++++++++++++
 ...t-automatically-build-documentation-if-sp.patch |  42 ++++++++
 package/libcamera/Config.in                        |  18 +++-
 package/libcamera/libcamera.hash                   |   2 +-
 package/libcamera/libcamera.mk                     |  47 +++++----
 package/libpisp/Config.in                          |  22 +++++
 package/libpisp/libpisp.hash                       |  11 +++
 package/libpisp/libpisp.mk                         |  33 +++++++
 9 files changed, 265 insertions(+), 21 deletions(-)
---
base-commit: 43abcd4c7dd8ad65d2f2012f3d4292362550a3ed
change-id: 20250404-libcamera-0-5-0-b9ecf899ddb4

Best regards,
-- 
Quentin Schulz <quentin.schulz@cherry.de>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
