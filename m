Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EE4BCF857C
	for <buildroot@archiver.kernel.org>; Thu,  3 Oct 2024 11:13:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4768040102;
	Thu,  3 Oct 2024 11:13:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S1kI9bgB8xwl; Thu,  3 Oct 2024 11:13:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1885D40547
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1885D40547;
	Thu,  3 Oct 2024 11:13:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8CCFE1BF28B
 for <buildroot@lists.busybox.net>; Thu,  3 Oct 2024 11:13:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7AD2240547
 for <buildroot@lists.busybox.net>; Thu,  3 Oct 2024 11:13:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ql3Irxj1xwts for <buildroot@lists.busybox.net>;
 Thu,  3 Oct 2024 11:13:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.196;
 helo=relay4-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1606640102
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1606640102
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1606640102
 for <buildroot@buildroot.org>; Thu,  3 Oct 2024 11:13:39 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C8B71E0003;
 Thu,  3 Oct 2024 11:13:36 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1swJm4-000G1P-0l;
 Thu, 03 Oct 2024 13:13:36 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
References: <20240914114318.1912121-1-festevam@gmail.com>
 <d3159ae8-45a0-4957-95e7-3571f3fa6ccf@mind.be>
Date: Thu, 03 Oct 2024 13:13:36 +0200
In-Reply-To: <d3159ae8-45a0-4957-95e7-3571f3fa6ccf@mind.be> (Arnout
 Vandecappelle via buildroot's message of "Sat, 14 Sep 2024 18:31:40
 +0200")
Message-ID: <87wmipmobj.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/2] configs/imx7dpico: Select
 BR2_TARGET_UBOOT_NEEDS_OPENSSL
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
Cc: Fabio Estevam <festevam@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Arnout" == Arnout Vandecappelle via buildroot <buildroot@buildroot.org> writes:

 > On 14/09/2024 13:43, Fabio Estevam wrote:
 >> Select BR2_TARGET_UBOOT_NEEDS_OPENSSL to fix the following
 >> build warning:
 >> include/image.h:1471:12: fatal error: openssl/evp.h: No such file or
 >> directory
 >> 1471 | #  include <openssl/evp.h>
 >> Fixes: https://gitlab.com/buildroot.org/buildroot/-/jobs/7803199869
 >> Signed-off-by: Fabio Estevam <festevam@gmail.com>

 >  Applied both to master, thanks.

 >  If you're actively working with these boards, perhaps you could also
 >  add hashes for U-Boot and kernel and enable
 > BR2_DOWNLOAD_FORCE_CHECK_HASHES?


NIT: This is a build ERROR, not a warning and it was presumably
introduced by your recent u-boot bump in commit 8cf677f4
(configs/imx7dpico: bump kernel and U-Boot version). It would be great
to mention such things in future patches as it helps with figuring out
what needs to be backported to the stable branches.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
