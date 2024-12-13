Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FDAFE7717F
	for <buildroot@archiver.kernel.org>; Fri, 13 Dec 2024 22:45:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D324782033;
	Fri, 13 Dec 2024 22:45:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rslKw0aAgD2y; Fri, 13 Dec 2024 22:45:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E808781749
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E808781749;
	Fri, 13 Dec 2024 22:45:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id E24B1ECE
 for <buildroot@buildroot.org>; Fri, 13 Dec 2024 22:45:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CD46740420
 for <buildroot@buildroot.org>; Fri, 13 Dec 2024 22:45:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Hs4WywObPPNX for <buildroot@buildroot.org>;
 Fri, 13 Dec 2024 22:45:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8C27640111
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8C27640111
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8C27640111
 for <buildroot@buildroot.org>; Fri, 13 Dec 2024 22:45:24 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 745EA20002;
 Fri, 13 Dec 2024 22:45:21 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1tMEPQ-00AjAA-30;
 Fri, 13 Dec 2024 23:45:20 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org
References: <20241116164727.16193-1-ju.o@free.fr>
Date: Fri, 13 Dec 2024 23:45:20 +0100
In-Reply-To: <20241116164727.16193-1-ju.o@free.fr> (Julien Olivain's message
 of "Sat, 16 Nov 2024 17:47:27 +0100")
Message-ID: <87cyhvurr3.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1]
 support/testing/tests/package/test_fwts.py: switch to neoverse-n1 cpu
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

 > The SBSA Reference Platform was updated to use the neoverse-n1 cpu
 > (armv8.2a) in Qemu v8.1 [1].

 > Commit c58a2a968 "configs/qemu_aarch64_sbsa_defconfig: switch to
 > neoverse-n1 (armv8.2a)" [2] reflected this change in
 > qemu_aarch64_sbsa_defconfig.

 > This commit updates the	test_fwts runtime test the same way.

 > This update is possible with the help of commits [3] and [4].

 > [1] https://gitlab.com/qemu-project/qemu/-/commit/1877272bad7b08b67312503ee66184279876c7bd
 > [2] https://gitlab.com/buildroot.org/buildroot/-/commit/c58a2a9687c045379c0f768c8c6c1c1a41842a85
 > [3] https://gitlab.com/buildroot.org/buildroot/-/commit/0d4177598ce7e73f2b97ac58c21fb177343643e3
 > [4] https://gitlab.com/buildroot.org/buildroot/-/commit/027ddcbff65bb9dc1799d89fc140a33e81d35421

 > Signed-off-by: Julien Olivain <ju.o@free.fr>
 > ---
 > Patch tested in:
 > https://gitlab.com/jolivain/buildroot/-/jobs/8388701667

Committed to 2024.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
