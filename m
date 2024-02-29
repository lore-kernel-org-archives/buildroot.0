Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2138C54E41
	for <buildroot@archiver.kernel.org>; Thu, 29 Feb 2024 15:25:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9C45341834;
	Thu, 29 Feb 2024 15:25:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mafZzXShIRuC; Thu, 29 Feb 2024 15:24:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8DE514182A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8DE514182A;
	Thu, 29 Feb 2024 15:24:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B11761BF2B4
 for <buildroot@lists.busybox.net>; Thu, 29 Feb 2024 15:23:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9E86782337
 for <buildroot@lists.busybox.net>; Thu, 29 Feb 2024 15:23:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id W8VjR-bZqeY8 for <buildroot@lists.busybox.net>;
 Thu, 29 Feb 2024 15:23:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.198;
 helo=relay6-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A78148213F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A78148213F
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A78148213F
 for <buildroot@buildroot.org>; Thu, 29 Feb 2024 15:23:57 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id EB581C000E;
 Thu, 29 Feb 2024 15:23:55 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rfiGJ-004mpI-1A;
 Thu, 29 Feb 2024 16:23:55 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabio Estevam <festevam@gmail.com>
References: <20240115105827.3179346-1-festevam@gmail.com>
Date: Thu, 29 Feb 2024 16:23:55 +0100
In-Reply-To: <20240115105827.3179346-1-festevam@gmail.com> (Fabio Estevam's
 message of "Mon, 15 Jan 2024 07:58:27 -0300")
Message-ID: <87frxbgupg.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH] configs/imx8mpevk: select
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabio" == Fabio Estevam <festevam@gmail.com> writes:

 > Select BR2_TARGET_UBOOT_NEEDS_OPENSSL to fix the following build
 > error:

 > include/image.h:1394:12: fatal error: openssl/evp.h: No such file or directory
 >  1394 | #  include <openssl/evp.h>
 

 > Fixes: https://gitlab.com/buildroot.org/buildroot/-/jobs/5858180070
 > Signed-off-by: Fabio Estevam <festevam@gmail.com>

Committed to 2023.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
