Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38188C4345F
	for <buildroot@archiver.kernel.org>; Thu,  2 May 2024 16:57:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CD8DE409C6;
	Thu,  2 May 2024 16:57:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ABJUOwlcJSvA; Thu,  2 May 2024 16:57:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 943B2418F7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 943B2418F7;
	Thu,  2 May 2024 16:57:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8F5381BF296
 for <buildroot@lists.busybox.net>; Thu,  2 May 2024 16:57:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 84D0482C3E
 for <buildroot@lists.busybox.net>; Thu,  2 May 2024 16:57:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DC7Pk_fD_TuX for <buildroot@lists.busybox.net>;
 Thu,  2 May 2024 16:57:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.201;
 helo=relay8-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9A1C382C3C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9A1C382C3C
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9A1C382C3C
 for <buildroot@buildroot.org>; Thu,  2 May 2024 16:57:52 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5DBC61BF209;
 Thu,  2 May 2024 16:57:49 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1s2Zki-00AtBm-25;
 Thu, 02 May 2024 18:57:48 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
References: <20240306111212.1331451-1-anaumann@ultratronik.de>
 <834828e5-042f-4588-9ed6-10fa5a5e2502@mind.be>
Date: Thu, 02 May 2024 18:57:48 +0200
In-Reply-To: <834828e5-042f-4588-9ed6-10fa5a5e2502@mind.be> (Arnout
 Vandecappelle via buildroot's message of "Sun, 7 Apr 2024 18:11:13
 +0200")
Message-ID: <87y18s40dv.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/imx-gpu-viv: fix masking fb
 option
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
Cc: Gary Bisson <bisson.gary@gmail.com>,
 Andreas Naumann <anaumann@ultratronik.de>,
 Refik Tuzakli <tuzakli.refik@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Arnout" == Arnout Vandecappelle via buildroot <buildroot@buildroot.org> writes:

 >  Hi Andreas,
 > On 06/03/2024 12:12, Andreas Naumann wrote:
 >> Only the 32bit ARM blob provides the framebuffer backend. This is
 >> apparently independent of which imx8 derivate is used, so changed
 >> the condition for the config option accordingly.

 >  You should have included some references here so other people can
 >  double-check this information.

 >> Signed-off-by: Andreas Naumann <anaumann@ultratronik.de>
 >> ---
 >> package/freescale-imx/imx-gpu-viv/Config.in | 4 ++--
 >> 1 file changed, 2 insertions(+), 2 deletions(-)
 >> diff --git a/package/freescale-imx/imx-gpu-viv/Config.in
 >> b/package/freescale-imx/imx-gpu-viv/Config.in
 >> index 3e095b730cf..b8dff8f9ab6 100644
 >> --- a/package/freescale-imx/imx-gpu-viv/Config.in
 >> +++ b/package/freescale-imx/imx-gpu-viv/Config.in
 >> @@ -45,8 +45,8 @@ choice
 >> config BR2_PACKAGE_IMX_GPU_VIV_OUTPUT_FB
 >> bool "Framebuffer"
 >> -	# The i.MX8 blob doesn't support FB output
 >> -	depends on !BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8M
 >> +	# The i.MX8 aarch64 blob doesn't support FB output

 >  Or you can still add that later in a comment here.

 >  Applied to master, thanks.

Committed to 2024.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
