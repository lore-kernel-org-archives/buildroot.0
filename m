Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AC4DD3B98D
	for <buildroot@archiver.kernel.org>; Tue, 26 Nov 2024 13:05:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C935E84C92;
	Tue, 26 Nov 2024 13:05:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zcaasKIpyMrl; Tue, 26 Nov 2024 13:05:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EEDBB84C98
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EEDBB84C98;
	Tue, 26 Nov 2024 13:05:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id B05A51DA8
 for <buildroot@buildroot.org>; Tue, 26 Nov 2024 13:05:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9011B4BB4C
 for <buildroot@buildroot.org>; Tue, 26 Nov 2024 13:05:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 71FQkfJJ8JIg for <buildroot@buildroot.org>;
 Tue, 26 Nov 2024 13:05:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.194;
 helo=relay2-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org F05A74BE7B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F05A74BE7B
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F05A74BE7B
 for <buildroot@buildroot.org>; Tue, 26 Nov 2024 13:05:32 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A05D740003;
 Tue, 26 Nov 2024 13:05:29 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1tFvFx-008keP-0Y;
 Tue, 26 Nov 2024 14:05:29 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Michael Nosthoff via buildroot <buildroot@buildroot.org>
References: <20241111110541.1934934-2-buildroot@heine.tech>
Date: Tue, 26 Nov 2024 14:05:29 +0100
In-Reply-To: <20241111110541.1934934-2-buildroot@heine.tech> (Michael Nosthoff
 via buildroot's message of "Mon, 11 Nov 2024 12:05:39 +0100")
Message-ID: <87r06yno12.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH v2] package/boost: update download url
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

>>>>> "Michael" == Michael Nosthoff via buildroot <buildroot@buildroot.org> writes:

 > boost moved its package hosting from jfrog to their own url
 > provided by the C++ Alliance. According to [0] the old urls
 > might cease to exist after December 2024.

 > [0] https://lists.boost.org/Archives/boost/2024/05/256914.php

 > Signed-off-by: Michael Nosthoff <buildroot@heine.tech>

 > ---

 > v2: improved wording of commit message and include link to announcement.

Committed to 2024.02.x and 2024.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
