Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D178C5475B
	for <buildroot@archiver.kernel.org>; Fri,  1 Mar 2024 18:27:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D7558400C7;
	Fri,  1 Mar 2024 18:27:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dGp57ZMzF_qv; Fri,  1 Mar 2024 18:27:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0C26240197
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0C26240197;
	Fri,  1 Mar 2024 18:27:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 15D711BF354
 for <buildroot@lists.busybox.net>; Fri,  1 Mar 2024 18:26:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3BF8040197
 for <buildroot@lists.busybox.net>; Fri,  1 Mar 2024 18:26:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qpl8aTF_iAQ1 for <buildroot@lists.busybox.net>;
 Fri,  1 Mar 2024 18:26:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::229;
 helo=relay9-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4E1E8400C7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4E1E8400C7
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4E1E8400C7
 for <buildroot@buildroot.org>; Fri,  1 Mar 2024 18:26:57 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 58C51FF807;
 Fri,  1 Mar 2024 18:26:54 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rg7av-0071O7-27;
 Fri, 01 Mar 2024 19:26:53 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Romain Naour <romain.naour@smile.fr>
References: <20240225114414.2556543-1-romain.naour@smile.fr>
Date: Fri, 01 Mar 2024 19:26:53 +0100
In-Reply-To: <20240225114414.2556543-1-romain.naour@smile.fr> (Romain Naour's
 message of "Sun, 25 Feb 2024 12:44:13 +0100")
Message-ID: <87le717qqa.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/2] configs/qemu_microblaze{be,
 el}: remove xilinx xemaclite patch needed for qemu < 2.2.0
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Romain" == Romain Naour <romain.naour@smile.fr> writes:

 > We carried a patch for xilinx xemaclite that was made initially for
 > qemu < 2.2.0 [1].

 > Indeed, between Qemu 0.11.0 and 2.2.0 the devicetree binary blob
 > petalogix-s3adsp1800.dtb (bundled in Qemu sources) used a
 > compatible string 'xlnx,xps-ethernetlite-2.00.b' that was not
 > supported by the Linux kernel [2].

 > Theses patches could have been removed since Buildroot 2015.02

s/Theses/These/

You forgot to remove the patches from .checkpackageignore.

Committed with that fixed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
