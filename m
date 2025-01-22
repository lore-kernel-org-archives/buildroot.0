Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A906C02181
	for <buildroot@archiver.kernel.org>; Wed, 22 Jan 2025 15:44:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 060B284A77;
	Wed, 22 Jan 2025 15:44:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mlsk9ziqflnL; Wed, 22 Jan 2025 15:44:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 02CB084A72
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 02CB084A72;
	Wed, 22 Jan 2025 15:44:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3BD3C1DA8
 for <buildroot@buildroot.org>; Wed, 22 Jan 2025 15:44:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2570B404A8
 for <buildroot@buildroot.org>; Wed, 22 Jan 2025 15:44:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WpDeOjohMZMZ for <buildroot@buildroot.org>;
 Wed, 22 Jan 2025 15:44:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.198;
 helo=relay6-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 56AF540259
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 56AF540259
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 56AF540259
 for <buildroot@buildroot.org>; Wed, 22 Jan 2025 15:43:59 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7536FC0006;
 Wed, 22 Jan 2025 15:43:58 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1tactZ-008ufQ-2T;
 Wed, 22 Jan 2025 16:43:57 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org
References: <20250113212414.137066-1-ju.o@free.fr>
Date: Wed, 22 Jan 2025 16:43:57 +0100
In-Reply-To: <20250113212414.137066-1-ju.o@free.fr> (Julien Olivain's message
 of "Mon, 13 Jan 2025 22:24:14 +0100")
Message-ID: <87cygen9aa.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] Config.in: introduce the BR2_BROKEN
 hidden symbol
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

 > Commit [1]
 > "toolchain/toolchain-external/toolchain-external-synopsys-arc: mark
 > as broken" disabled BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC by adding a
 > depends on BR2_BROKEN. This symbol does not exist and generates
 > check-symbol failures, see [2].

 > This commit fixes this issue by introducing the BR2_BROKEN hidden symbol
 > that will be used to track those known to be broken features. This
 > symbol will help to track features that were broken for too long and
 > remove them.

 > Fixes: [2]

 > [1] https://gitlab.com/buildroot.org/buildroot/-/commit/11a8cdd2bbbd0ef4adf600e4792d75f6f2122ec8
 > [2] https://gitlab.com/buildroot.org/buildroot/-/jobs/8840476511

 > Signed-off-by: Julien Olivain <ju.o@free.fr>
 > ---
 > Patch tested in:
 > https://gitlab.com/jolivain/buildroot/-/pipelines/1623395115

Committed to 2024.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
