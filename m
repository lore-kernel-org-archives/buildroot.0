Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA2B0C433EF
	for <buildroot@archiver.kernel.org>; Sat,  1 Jan 2022 23:53:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2C075401FB;
	Sat,  1 Jan 2022 23:53:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id L1KV_JPoP0Jw; Sat,  1 Jan 2022 23:53:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 91749401E5;
	Sat,  1 Jan 2022 23:53:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3F58D1BF2CF
 for <buildroot@lists.busybox.net>; Sat,  1 Jan 2022 23:53:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2D76540190
 for <buildroot@lists.busybox.net>; Sat,  1 Jan 2022 23:53:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fzEfMS7uVpue for <buildroot@lists.busybox.net>;
 Sat,  1 Jan 2022 23:53:39 +0000 (UTC)
X-Greylist: delayed 00:06:40 by SQLgrey-1.8.0
Received: from mail.steinkuehler.net (unknown [70.184.225.181])
 by smtp2.osuosl.org (Postfix) with ESMTP id D2D914014E
 for <buildroot@buildroot.org>; Sat,  1 Jan 2022 23:53:38 +0000 (UTC)
Received: (qmail 27653 invoked from network); 1 Jan 2022 17:46:57 -0600
Received: from 152.ks.newtek.dhcp (HELO ?10.34.1.152?) (charles@10.34.1.152)
 by mail.steinkuehler.net with SMTP; 1 Jan 2022 17:46:57 -0600
Message-ID: <d334bc81-6032-348b-2871-e3147b17c442@steinkuehler.net>
Date: Sat, 1 Jan 2022 17:46:53 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
To: buildroot@buildroot.org
Content-Language: en-US
From: Charles Steinkuehler <charles@steinkuehler.net>
Subject: [Buildroot] Buildroot + RAUC
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Buildroot has included RAUC for some time, but I was unable to find any 
working examples suitable for experimenting or as a foundation for a 
production system.  I have attempted to fill this void and have crafted 
a BR2_EXTERNAL project that layers a basic RAUC setup on top of 
Buildroot targeting the Raspberry Pi cm4io.  As I am new to both 
Buildroot and RAUC, I would appreciate any reviews or critiques of how I 
have managed the customization required for Buildroot, U-Boot, RAUC, 
Linux, and the device tree.

The project files and instructions are on github:
https://github.com/cdsteinkuehler/br2rauc

All comments welcome, especially the "no you fool, don't do it *THAT* 
way!" variety.  :)

-- 
Charles Steinkuehler
charles@steinkuehler.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
