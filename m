Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4189ACFB421
	for <buildroot@archiver.kernel.org>; Tue,  8 Oct 2024 09:11:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E26C180B17;
	Tue,  8 Oct 2024 09:11:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K6pkAdHyjHWz; Tue,  8 Oct 2024 09:11:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 01BE580893
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 01BE580893;
	Tue,  8 Oct 2024 09:11:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E60011BF2A9
 for <buildroot@lists.busybox.net>; Tue,  8 Oct 2024 09:11:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D48F060622
 for <buildroot@lists.busybox.net>; Tue,  8 Oct 2024 09:11:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GX6CcSrLiI1U for <buildroot@lists.busybox.net>;
 Tue,  8 Oct 2024 09:11:31 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=176.9.89.163;
 helo=serv15.avernis.de; envelope-from=br015@umbiko.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2AF656060E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2AF656060E
Received: from serv15.avernis.de (serv15.avernis.de [176.9.89.163])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2AF656060E
 for <buildroot@buildroot.org>; Tue,  8 Oct 2024 09:11:30 +0000 (UTC)
Received: by serv15.avernis.de (Postfix) with ESMTPSA id 5A114BDE27B4;
 Tue,  8 Oct 2024 11:01:29 +0200 (CEST)
MIME-Version: 1.0
Date: Tue, 08 Oct 2024 09:01:29 +0000
From: Andreas Ziegler <br015@umbiko.net>
To: Andrew McCann <andrew.2.622266@gmail.com>
In-Reply-To: <mailman.4865.1728357518.52868.buildroot@buildroot.org>
References: <mailman.4865.1728357518.52868.buildroot@buildroot.org>
Message-ID: <7912d41040377bdd1c1da93e511c9694@umbiko.net>
X-Sender: br015@umbiko.net
X-Virus-Scanned: clamav-milter 1.0.5 at serv15.avernis.de
X-Virus-Status: Clean
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=umbiko.net; s=mail; 
 t=1728378089; bh=vYlk7pMA597Bbo8EU97i8ho8lc0UEIsb4UXQYYT/95A=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References;
 b=QDTSgZDi9GMaVfYDS3rLDQOGlsd4XQ2uzRElEMIVQOpA4hJGeuzCNJ6Z+nouKbNFb
 7ckWtw08WR+AIn47HfSLi66tq8tfiwCjO4yoqAXGsxdBHnv360NwjNgDkD/OvPvUZv
 U0A3KHNWUgk2dFs8ds/fT2gCObpFof7OogVDpJUI=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=umbiko.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=umbiko.net header.i=@umbiko.net header.a=rsa-sha256
 header.s=mail header.b=QDTSgZDi
Subject: Re: [Buildroot] Ethernet Connection
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
Cc: buildroot <buildroot@buildroot.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Andy,

On 2024-10-07 20:39, Andrew McCann wrote:
> 
> Can anyone comment on whether you expect the default rpi3b+ 
> configuration
> to connect to LAN?
> Regards
> Andy

It should work. I use a custom configuration, but it was derived from 
the Buildroot standard originally.

> On Wed, Oct 2, 2024 at 5:24?PM Andrew McCann 
> <andrew.2.622266@gmail.com>
> wrote:
> 
>> Hi All
>> 
>> I'm trying to get basic networking working with a Rpi-3b+.  I note 
>> that
>> with the default config, raspberrypi3_64_defconfig, eth0 is setup as 
>> the
>> network interface to configure through DHCP.  Also
>> BR2_PACKAGE_IFUPDOWN_SCRIPTS are enabled by default.

Don't you use a bespoke kernel? Check if the necessary modules are 
enabled.

ifupdown-scripts provides an init.d script and generates 
network/interfaces. Check if the latter matches your system.

Run '/etc/init.d/S40network restart' and follow up on any error 
messages.

>> However, when I boot the system with sdcard.img, the pi does not 
>> connect
>> to my network. Are there are things that I need to enable that are not 
>> part
>> of the default configuration?
>> 
>> My longer term goal is to ssh (using dropbear) into my pi via the LAN, 
>> and
>> use iwctl to configure iwd for wireless connectivity.  But first I 
>> need to
>> establish the LAN connection.  Please let me know any advice that you 
>> have,
>> or any documentation that you can recommend.

I relied on linux-from-scratch [1] and linux-wireless [2] while setting 
up wireless networking, but you might succeed just by adding 
wpa_supplicant and supplying the necessary configuration details.

The Buildroot package handles wpa_supplicant via an ifup/down script; if 
you use a (custom, via skeleton) init.d script instead, you need to 
adapt network/interfaces.

Kind regards,
Andreas

>> Regards
>> Andy

[1] https://www.linuxfromscratch.org/
[2] https://wireless.wiki.kernel.org/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
