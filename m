Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0A5EEB64DA
	for <buildroot@archiver.kernel.org>; Sat,  8 Jul 2023 22:29:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1CE9D60B1E;
	Sat,  8 Jul 2023 22:29:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1CE9D60B1E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UxFT9leB4_LG; Sat,  8 Jul 2023 22:29:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 60BE060AF2;
	Sat,  8 Jul 2023 22:29:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 60BE060AF2
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 519BF1BF3BE
 for <buildroot@lists.busybox.net>; Sat,  8 Jul 2023 22:29:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2B9E040497
 for <buildroot@lists.busybox.net>; Sat,  8 Jul 2023 22:29:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2B9E040497
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id I0EOpX5peEHQ for <buildroot@lists.busybox.net>;
 Sat,  8 Jul 2023 22:29:35 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 93FC0400CB
Received: from shout02.mail.de (shout02.mail.de [IPv6:2001:868:100:600::217])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 93FC0400CB
 for <buildroot@buildroot.org>; Sat,  8 Jul 2023 22:29:35 +0000 (UTC)
Received: from postfix02.mail.de (postfix02.bt.mail.de [10.0.121.126])
 by shout02.mail.de (Postfix) with ESMTP id AD946A0E8D;
 Sun,  9 Jul 2023 00:29:33 +0200 (CEST)
Received: from smtp04.mail.de (smtp04.bt.mail.de [10.0.121.214])
 by postfix02.mail.de (Postfix) with ESMTP id 91477A00E2;
 Sun,  9 Jul 2023 00:29:33 +0200 (CEST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp04.mail.de (Postfix) with ESMTPSA id E8CE2C00AB;
 Sun,  9 Jul 2023 00:29:31 +0200 (CEST)
To: buildroot@buildroot.org
Date: Sun,  9 Jul 2023 00:28:57 +0200
Message-Id: <20230708222900.8599-1-kilian.zinnecker@mail.de>
MIME-Version: 1.0
X-purgate: clean
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate-type: clean
X-purgate-Ad: Categorized by eleven eXpurgate (R) http://www.eleven.de
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate: clean
X-purgate-size: 1858
X-purgate-ID: 154282::1688855373-D97FCC09-C2E4BF35/0/0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=mail.de; s=mailde202009; t=1688855373;
 bh=VovP1yy+lckaMw9wILchGH2SHxkdl0ltZeAbsFeF9R8=;
 h=From:To:Cc:Subject:Date:Message-Id:From:To:CC:Subject:Reply-To;
 b=qR1Q27sEnGb9rLVMzVP2M5vnUchEsNVEzMOrPMRuBLtYmGNLdwmfvLKPegZ8HpUJM
 cOUykKg9veCQJHMeDFwSsnpzmBlzh3tDHb9VQquinBdDK/PfRWL3lks3l9wQejw39V
 urIjfc/Rs/XIatdJDj7isqkdiJ6+c2B+f2+IK1LJeaI3CG6DM33UfBV4nwW3PdsmGj
 1Kj2xEA0OykaWaDCdCBViYJ492bQztUn50bkmMf7VFMppgZebYnMx5OUETbrjmEpqH
 qlhoWrvL3uCCh26M9EWSiPIlGl+FuyfDfPyulGxmI7zII16hcCgLHPHTM0EWaV2klR
 zLDfPT/owXigA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mail.de header.i=@mail.de
 header.a=rsa-sha256 header.s=mailde202009 header.b=qR1Q27sE
Subject: [Buildroot] [PATCH v4 0/3] Add board support for Radxa Rock 5B
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
From: Kilian Zinnecker via buildroot <buildroot@buildroot.org>
Reply-To: Kilian Zinnecker <kilian.zinnecker@mail.de>
Cc: Andreas Ziegler <br015@umbiko.net>,
 Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Kilian Zinnecker <kilian.zinnecker@mail.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch series adds support for the Radxa Rock 5B board, featuring
the Rockchip RK3588 SoC. It adds a package for the Rockchip ATF binary
blobs, needed by U-Boot. It uses a modified Linux kernel from Radxa.
After build, a fit image with compressed kernel is generated, which is
then put into an SD card image alongside U-Boot and the root file
system.

Kilian Zinnecker (3):
  package: add rockchip-rkbin package
  configs: add rock5b/rock5b_defconfig
  board/radxa/rock5b: Add sdcard image scripts

 DEVELOPERS                                 |  5 +++
 board/radxa/rock5b/genimage.cfg            | 36 ++++++++++++++++
 board/radxa/rock5b/linux.fragment          |  1 +
 board/radxa/rock5b/post-image.sh           | 24 +++++++++++
 board/radxa/rock5b/rock5b.its              | 46 ++++++++++++++++++++
 board/radxa/rock5b/uboot.fragment          |  3 ++
 boot/uboot/Config.in                       |  9 ++++
 boot/uboot/uboot.mk                        | 16 +++++++
 configs/rock5b_defconfig                   | 47 ++++++++++++++++++++
 package/Config.in                          |  1 +
 package/rockchip-rkbin/Config.in           | 50 ++++++++++++++++++++++
 package/rockchip-rkbin/rockchip-rkbin.hash |  3 ++
 package/rockchip-rkbin/rockchip-rkbin.mk   | 50 ++++++++++++++++++++++
 13 files changed, 291 insertions(+)
 create mode 100644 board/radxa/rock5b/genimage.cfg
 create mode 100644 board/radxa/rock5b/linux.fragment
 create mode 100755 board/radxa/rock5b/post-image.sh
 create mode 100644 board/radxa/rock5b/rock5b.its
 create mode 100644 board/radxa/rock5b/uboot.fragment
 create mode 100644 configs/rock5b_defconfig
 create mode 100644 package/rockchip-rkbin/Config.in
 create mode 100644 package/rockchip-rkbin/rockchip-rkbin.hash
 create mode 100644 package/rockchip-rkbin/rockchip-rkbin.mk

-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
