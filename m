Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9BDFC02181
	for <buildroot@archiver.kernel.org>; Wed, 22 Jan 2025 14:54:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7952F8509B;
	Wed, 22 Jan 2025 14:54:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KyjgHFpTUp9I; Wed, 22 Jan 2025 14:54:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9F2DE850A4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9F2DE850A4;
	Wed, 22 Jan 2025 14:54:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3FCCED7
 for <buildroot@buildroot.org>; Wed, 22 Jan 2025 14:54:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1FB32850BD
 for <buildroot@buildroot.org>; Wed, 22 Jan 2025 14:54:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ln79iKKcb0n8 for <buildroot@buildroot.org>;
 Wed, 22 Jan 2025 14:54:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::223;
 helo=relay3-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 44FDD850A1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 44FDD850A1
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 44FDD850A1
 for <buildroot@buildroot.org>; Wed, 22 Jan 2025 14:54:22 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 17CB760005;
 Wed, 22 Jan 2025 14:54:19 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1tac7X-008piF-1X;
 Wed, 22 Jan 2025 15:54:19 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Romain Naour via buildroot <buildroot@buildroot.org>
Cc: Romain Naour <romain.naour@smile.fr>,  Antoine Coutant
 <antoine.coutant@smile.fr>
References: <20250113130322.3962035-1-romain.naour@smile.fr>
 <20250113130322.3962035-3-romain.naour@smile.fr>
Date: Wed, 22 Jan 2025 15:54:19 +0100
In-Reply-To: <20250113130322.3962035-3-romain.naour@smile.fr> (Romain Naour
 via buildroot's message of "Mon, 13 Jan 2025 14:03:19 +0100")
Message-ID: <87wmemnbl0.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 3/6]
 toolchain/toolchain-external/toolchain-external-arm-aarch64-be: fix
 BR2_ARCH_NEEDS_GCC_AT_LEAST_X guard
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

>>>>> "Romain" == Romain Naour via buildroot <buildroot@buildroot.org> writes:

 > BR2_ARCH_NEEDS_GCC_AT_LEAST_X guards has been introduced by [1] to
 > prevent selecting an external toolchain that did not support the GCC
 > arch tuning the user had selected.

 > But it was not changed while updating to version 13.2-rel1.

 > Fixes: 50ae5ea963b7ed34b1511d4d2487bef083f5b1a7

 > [1] eed1670d8a6f0899f5fdfc26bd6d1609ebc19c7a

 > Cc: Antoine Coutant <antoine.coutant@smile.fr>
 > Signed-off-by: Romain Naour <romain.naour@smile.fr>

Committed to 2024.02.x and 2024.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
