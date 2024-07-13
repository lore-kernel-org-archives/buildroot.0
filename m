Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70C0AC3DA42
	for <buildroot@archiver.kernel.org>; Sat, 13 Jul 2024 11:00:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2C951605DB;
	Sat, 13 Jul 2024 11:00:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S86H-PDm6ebz; Sat, 13 Jul 2024 11:00:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4F1BE605EB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4F1BE605EB;
	Sat, 13 Jul 2024 11:00:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CC3CF1BF404
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 11:00:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B8D88400E5
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 11:00:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6WkngPFeHxBA for <buildroot@lists.busybox.net>;
 Sat, 13 Jul 2024 11:00:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.199;
 helo=relay9-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 129A7400BB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 129A7400BB
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 129A7400BB
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 11:00:42 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9FA06FF802;
 Sat, 13 Jul 2024 11:00:39 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1sSaUY-00Ci9o-2O;
 Sat, 13 Jul 2024 13:00:38 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
References: <20240426213551.1106068-1-fiona.klute@gmx.de>
 <20240709225111.10f5f98b@windsurf>
Date: Sat, 13 Jul 2024 13:00:38 +0200
In-Reply-To: <20240709225111.10f5f98b@windsurf> (Thomas Petazzoni via
 buildroot's message of "Tue, 9 Jul 2024 22:51:11 +0200")
Message-ID: <87zfqlftex.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/raspberrypi-usbboot: bump
 version to 20221215-105525
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
Cc: Fiona Klute <fiona.klute+wiwa@gmx.de>, fiona.klute@gmx.de,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Thomas" == Thomas Petazzoni via buildroot <buildroot@buildroot.org> writes:

 > On Fri, 26 Apr 2024 23:35:51 +0200
 > Fiona Klute via buildroot <buildroot@buildroot.org> wrote:

 >> From: Fiona Klute <fiona.klute+wiwa@gmx.de>
 >> 
 >> The "msd" (mass storage device) firmware files in 2021.07.01 don't
 >> work with some newer CM4 based devices, the one I had issues with is a
 >> RevPi Connect 4. Updating fixes the issue. Mass storage device mode is
 >> required to flash the eMMC of CM4 devices.
 >> 
 >> Signed-off-by: Fiona Klute <fiona.klute+wiwa@gmx.de>
 >> ---
 >> ...001-Makefile-allow-passing-CFLAGS-LDFLAGS.patch | 14 +++++++++-----
 >> .../raspberrypi-usbboot/raspberrypi-usbboot.hash   |  2 +-
 >> package/raspberrypi-usbboot/raspberrypi-usbboot.mk |  4 ++--
 >> 3 files changed, 12 insertions(+), 8 deletions(-)

 > For some reason, your changes on the patch 0001 did not apply, so I
 > fixed that up manually when applying. Patch is now applied. Thanks and
 > sorry for the delay!

Committed to 2024.02.x and 2024.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
