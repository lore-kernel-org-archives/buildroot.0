Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57D15C433EF
	for <buildroot@archiver.kernel.org>; Wed, 23 Feb 2022 19:54:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EA63F41497;
	Wed, 23 Feb 2022 19:54:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id K3WOaxZdIOaA; Wed, 23 Feb 2022 19:54:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 40D72409C6;
	Wed, 23 Feb 2022 19:54:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 46FA01BF5EA
 for <buildroot@lists.busybox.net>; Wed, 23 Feb 2022 19:54:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 34D5E409C6
 for <buildroot@lists.busybox.net>; Wed, 23 Feb 2022 19:54:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OX8Edag42S1D for <buildroot@lists.busybox.net>;
 Wed, 23 Feb 2022 19:54:06 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F132340357
 for <buildroot@buildroot.org>; Wed, 23 Feb 2022 19:54:05 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id C51B8C0002;
 Wed, 23 Feb 2022 19:54:01 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1nMxi4-00CTNF-AH; Wed, 23 Feb 2022 20:54:00 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Luca Ceresoli <luca@lucaceresoli.net>
References: <20220223125118.2325363-1-neal.frager@xilinx.com>
 <ae77a8c9-9ecb-9050-b683-ccc52abc9d15@lucaceresoli.net>
Date: Wed, 23 Feb 2022 20:54:00 +0100
In-Reply-To: <ae77a8c9-9ecb-9050-b683-ccc52abc9d15@lucaceresoli.net> (Luca
 Ceresoli's message of "Wed, 23 Feb 2022 17:54:56 +0100")
Message-ID: <871qzt5pgn.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v1 1/1] configs/zynqmp_zcu10x: fix U-Boot
 dts config
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
Cc: Neal Frager <neal.frager@xilinx.com>, giulio.benetti@benettiengineering.com,
 michal.simek@xilinx.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Luca" == Luca Ceresoli <luca@lucaceresoli.net> writes:

 > Hi Neal,
 > On 23/02/22 13:51, Neal Frager wrote:
 >> This patch:
 >> - fixes U-Boot issue when DEVICE_TREE environment variable undefined

 > This appears unrelated from the version bumps. Please send separate patches.

 >> - bumps U-Boot to Xilinx 2022.01-171
 >> - bumps Linux to Xilinx 5.15-945

I don't have the zcu106 here anymore, but this new kernel didn't boot
here (no output after 'Starting Linux'). Does it boot for you?

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
