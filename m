Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59FD6C4345F
	for <buildroot@archiver.kernel.org>; Thu,  2 May 2024 07:50:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1901740EBE;
	Thu,  2 May 2024 07:50:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CuMwshihsGqk; Thu,  2 May 2024 07:50:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8D2824109D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8D2824109D;
	Thu,  2 May 2024 07:50:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3F6A11BF83C
 for <buildroot@lists.busybox.net>; Thu,  2 May 2024 07:50:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2BF87822A1
 for <buildroot@lists.busybox.net>; Thu,  2 May 2024 07:50:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y6xrTPHwZOH7 for <buildroot@lists.busybox.net>;
 Thu,  2 May 2024 07:50:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.199;
 helo=relay9-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 30AC08229F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 30AC08229F
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 30AC08229F
 for <buildroot@buildroot.org>; Thu,  2 May 2024 07:50:28 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 50346FF806;
 Thu,  2 May 2024 07:50:27 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1s2RD0-00AKbX-0a;
 Thu, 02 May 2024 09:50:26 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
References: <20230914165046.3687491-1-wojciech.nizinski@grinn-global.com>
 <20240403230810.5e8b9e21@windsurf>
Date: Thu, 02 May 2024 09:50:26 +0200
In-Reply-To: <20240403230810.5e8b9e21@windsurf> (Thomas Petazzoni via
 buildroot's message of "Wed, 3 Apr 2024 23:08:10 +0200")
Message-ID: <87bk5o8xfh.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] board/freescale/common/imx:
 imx8-bootloader-prepare: enable error checking
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Wojciech Nizinski <wojciech.nizinski@grinn-global.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Thomas" == Thomas Petazzoni via buildroot <buildroot@buildroot.org> writes:

 > On Thu, 14 Sep 2023 18:50:46 +0200
 > Wojciech Nizinski <wojciech.nizinski@grinn-global.com> wrote:

 >> Run script with 'errexit' bash option to detect any errors from
 >> subcommands.
 >> 
 >> It will fix situation where 'ddr_fw.bin' was missing but successfull
 >> build created broken boot image. Post image script report this by:
 >> 
 >> cat: /home/user/buildroot/output/images/ddr_fw.bin: No such file or
 >> directory
 >> 
 >> and build finish with success.
 >> 
 >> Signed-off-by: Wojciech Nizinski <wojciech.nizinski@grinn-global.com>
 >> ---
 >> board/freescale/common/imx/imx8-bootloader-prepare.sh | 1 +
 >> 1 file changed, 1 insertion(+)

 > Applied to master after changing to use set -e. Thanks!

Committed to 2024.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
