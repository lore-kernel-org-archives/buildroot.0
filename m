Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AD5FC3DA42
	for <buildroot@archiver.kernel.org>; Sat, 13 Jul 2024 11:19:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DFC97400DD;
	Sat, 13 Jul 2024 11:19:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k6puFJUujYZZ; Sat, 13 Jul 2024 11:19:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B6F174018D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B6F174018D;
	Sat, 13 Jul 2024 11:19:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 261251BF4E4
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 11:19:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 12B3B40931
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 11:19:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LMfMAJ_47j1T for <buildroot@lists.busybox.net>;
 Sat, 13 Jul 2024 11:19:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.196;
 helo=relay4-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org AD2D240912
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AD2D240912
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AD2D240912
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 11:19:54 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A837AE0003;
 Sat, 13 Jul 2024 11:19:52 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1sSan9-00Ck02-3A;
 Sat, 13 Jul 2024 13:19:51 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Romain Naour <romain.naour@smile.fr>
References: <20240527100424.397567-1-romain.naour@smile.fr>
 <871q5jqesv.fsf@dell.be.48ers.dk>
 <c8db4a2c-bee2-4ecc-9bf3-f0e1444964aa@smile.fr>
Date: Sat, 13 Jul 2024 13:19:51 +0200
In-Reply-To: <c8db4a2c-bee2-4ecc-9bf3-f0e1444964aa@smile.fr> (Romain Naour's
 message of "Sat, 13 Jul 2024 00:15:47 +0200")
Message-ID: <87ikx9fsiw.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCHv2] configs/lepotato_defconfig: new defconfig
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
Cc: Kilian Zinnecker <kilian.zinnecker@mail.de>,
 Romain Naour via buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Romain" == Romain Naour <romain.naour@smile.fr> writes:

Hi,

 >> Is the vfat partition strictly needed or could you directly have the
 >> rootfs as the first/single partition like we do for lafrite?

 > I never tried without the vfat partition. But Lafrite board is the only one
 > without an SDcard connector and only use emmc flashed using a USB flash drive.

 > libre-computer-project seems to use genimage configuration with vfat partition
 > for lepotato:

 > https://github.com/libre-computer-project/libretech-buildroot/blob/rebase/board/librecomputer/genimage/initramfs/genimage.cfg#L1

OK, fine by me.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
