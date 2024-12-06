Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B4F4E77173
	for <buildroot@archiver.kernel.org>; Fri,  6 Dec 2024 19:52:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 05F60605A5;
	Fri,  6 Dec 2024 19:52:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FFBY6lS-QqIl; Fri,  6 Dec 2024 19:52:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1683B60618
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1683B60618;
	Fri,  6 Dec 2024 19:52:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id F17A8ED2
 for <buildroot@buildroot.org>; Fri,  6 Dec 2024 19:52:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id ECD314019E
 for <buildroot@buildroot.org>; Fri,  6 Dec 2024 19:52:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6v0G2nnrJ1tT for <buildroot@buildroot.org>;
 Fri,  6 Dec 2024 19:52:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::225;
 helo=relay5-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org F0AF14014B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F0AF14014B
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F0AF14014B
 for <buildroot@buildroot.org>; Fri,  6 Dec 2024 19:52:39 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2B3B21C0002;
 Fri,  6 Dec 2024 19:52:37 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1tJeNQ-0080ly-1Q;
 Fri, 06 Dec 2024 20:52:36 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Julien Olivain <ju.o@free.fr>
Cc: Neal Frager <neal.frager@amd.com>,  buildroot@buildroot.org,
 luca.ceresoli@bootlin.com,  brandon.maier@collins.com,
 thomas.petazzoni@bootlin.com,  romain.naour@smile.fr,
 michal.simek@amd.com,  yann.morin.1998@free.fr
References: <20241202064842.3705597-1-neal.frager@amd.com>
 <72d38922e8b03cf60ab30f94165eef45@free.fr>
Date: Fri, 06 Dec 2024 20:52:36 +0100
In-Reply-To: <72d38922e8b03cf60ab30f94165eef45@free.fr> (Julien Olivain's
 message of "Tue, 03 Dec 2024 21:11:04 +0100")
Message-ID: <87cyi47fnf.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH v1 1/1] board/zynqmp/kria/readme.txt: add
 usb start
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

>>>>> "Julien" == Julien Olivain <ju.o@free.fr> writes:

 > On 02/12/2024 07:48, Neal Frager via buildroot wrote:
 >> When halting the boot process in u-boot, the 'usb start' command
 >> does not
 >> automatically run.  Since the SD card is connected over a USB to SD
 >> card
 >> bridge on the kd240 and kr260 boards, the readme.txt instructions
 >> should
 >> document that the 'usb start' command needs to be manually enterred
 >> when
 >> following the reflashing instructions.  Otherwise, the command to
 >> read the
 >> boot.bin and u-boot.itb files from the SD card will fail.
 >> Signed-off-by: Neal Frager <neal.frager@amd.com>

 > Applied to master, thanks.

Committed to 2024.02.x and 2024.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
