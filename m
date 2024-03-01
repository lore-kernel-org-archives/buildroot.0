Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BF0AC5478C
	for <buildroot@archiver.kernel.org>; Fri,  1 Mar 2024 18:54:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EA20480E62;
	Fri,  1 Mar 2024 18:54:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7kZKlFHucbl9; Fri,  1 Mar 2024 18:54:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 24EC780E85
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 24EC780E85;
	Fri,  1 Mar 2024 18:54:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 669CC1BF354
 for <buildroot@lists.busybox.net>; Fri,  1 Mar 2024 18:54:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A34DC40197
 for <buildroot@lists.busybox.net>; Fri,  1 Mar 2024 18:54:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EAnKulkr6fbW for <buildroot@lists.busybox.net>;
 Fri,  1 Mar 2024 18:54:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.197;
 helo=relay5-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5512B40112
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5512B40112
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5512B40112
 for <buildroot@buildroot.org>; Fri,  1 Mar 2024 18:54:54 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 435881C0003;
 Fri,  1 Mar 2024 18:54:52 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rg81z-0072YQ-2A;
 Fri, 01 Mar 2024 19:54:51 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20240301183349.808102-1-fontaine.fabrice@gmail.com>
Date: Fri, 01 Mar 2024 19:54:51 +0100
In-Reply-To: <20240301183349.808102-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Fri, 1 Mar 2024 19:33:49 +0100")
Message-ID: <87h6hp7pfo.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/redis: disable -Werror
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
Cc: Titouan Christophe <titouanchristophe@gmail.com>,
 Daniel Price <daniel.price@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Disable -Werror to avoid the following build failure raised since bump
 > to version 7.2.1 in commit d49f53f8aaf0bff9c8d04c16485c844fef2832d0 and
 > https://github.com/redis/redis/commit/8e138ba44fc3eb676c0f31faac19d1acc6a4c7ed:

 > In function 'hi_sdsll2str',
 >     inlined from 'hi_sdsfromlonglong' at sds.c:500:15:
 > sds.c:457:12: error: writing 1 byte into a region of size 0 [-Werror=stringop-overflow=]
 >   457 |         *s = *p;
 >       |         ~~~^~~~

 > Fixes: d49f53f8aaf0bff9c8d04c16485c844fef2832d0
 >  - http://autobuild.buildroot.org/results/fdc9f940b348430cb4da8efecc5cc047b21df281
 >  - http://autobuild.buildroot.org/results/e5747674d52b065203a0442f7cab13e8be5f426b

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
