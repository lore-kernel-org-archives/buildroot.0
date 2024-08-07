Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4F67C3DA7F
	for <buildroot@archiver.kernel.org>; Wed,  7 Aug 2024 20:16:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8B90981434;
	Wed,  7 Aug 2024 20:16:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m2_0-Kp7EBNS; Wed,  7 Aug 2024 20:16:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A55FF81438
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A55FF81438;
	Wed,  7 Aug 2024 20:16:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9103B1BF2BE
 for <buildroot@lists.busybox.net>; Wed,  7 Aug 2024 20:16:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7D43440026
 for <buildroot@lists.busybox.net>; Wed,  7 Aug 2024 20:16:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fFwJHhP0lzcv for <buildroot@lists.busybox.net>;
 Wed,  7 Aug 2024 20:16:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::226;
 helo=relay6-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B4F14400D1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B4F14400D1
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B4F14400D1
 for <buildroot@buildroot.org>; Wed,  7 Aug 2024 20:16:16 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E1C9BC0005;
 Wed,  7 Aug 2024 20:16:13 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1sbn4v-002qAE-0e;
 Wed, 07 Aug 2024 22:16:13 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: James Hilliard <james.hilliard1@gmail.com>
References: <20240705011114.1313589-1-james.hilliard1@gmail.com>
Date: Wed, 07 Aug 2024 22:16:13 +0200
In-Reply-To: <20240705011114.1313589-1-james.hilliard1@gmail.com> (James
 Hilliard's message of "Thu, 4 Jul 2024 19:11:14 -0600")
Message-ID: <87v80cm6lu.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH v2 1/1] package/systemd: enable required
 oomd kernel options
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
Cc: Sen Hastings <sen@hastings.org>, Norbert Lange <nolange79@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "James" == James Hilliard <james.hilliard1@gmail.com> writes:

 > In order for systemd-oomd to run CONFIG_PSI and CONFIG_MEMCG must be
 > enabled in the kernel config.

 > See:
 > https://github.com/systemd/systemd/commit/e7b3f1a6c358dd3eaf0b50547bd52130ad4126ae
 > https://github.com/systemd/systemd/commit/aa329b89223a79793cde8288b1bc6e93db174938

 > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
 > ---
 > Changes v1 -> v2:
 >   - add links to readme commits

Committed to 2024.02.x and 2024.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
