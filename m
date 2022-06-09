Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35662C43334
	for <buildroot@archiver.kernel.org>; Thu,  9 Jun 2022 20:25:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CF88641C37;
	Thu,  9 Jun 2022 20:25:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id M-3up2Kg1vEz; Thu,  9 Jun 2022 20:25:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B0B9941C2F;
	Thu,  9 Jun 2022 20:25:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 74E551BF384
 for <buildroot@lists.busybox.net>; Thu,  9 Jun 2022 20:25:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 712824100B
 for <buildroot@lists.busybox.net>; Thu,  9 Jun 2022 20:25:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id D8ul9_-Y5ZqE for <buildroot@lists.busybox.net>;
 Thu,  9 Jun 2022 20:25:17 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 708E840ADD
 for <buildroot@buildroot.org>; Thu,  9 Jun 2022 20:25:17 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id EF3B9200002;
 Thu,  9 Jun 2022 20:25:13 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1nzOiP-002Lmx-5l; Thu, 09 Jun 2022 22:25:13 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20220605152001.1669567-1-fontaine.fabrice@gmail.com>
Date: Thu, 09 Jun 2022 22:25:13 +0200
In-Reply-To: <20220605152001.1669567-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 5 Jun 2022 17:20:01 +0200")
Message-ID: <875yl91t5i.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/gensio: needs atomic
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Francisco Gonzalez <gzmorell@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > gensio needs atomic since bump to version 2.0.1 in commit
 > 0f8d4a6ecd874770ce677b617b2c7f459eb1505d and
 > https://github.com/cminyard/gensio/commit/5528267b54ac5a8ac0ecd7fd9ba481d654b0e92b:

 > /nvmedata/autobuild/instance-7/output-1/per-package/gensio/host/bin/../lib/gcc/arc-buildroot-linux-uclibc/11.3.0/../../../../arc-buildroot-linux-uclibc/bin/ld:
 > ../lib/.libs/libgensio.a(gensio_osops.o): in function
 > `gensio_addr_dup':
 > gensio_osops.c:(.text+0x1558): undefined reference to `__atomic_fetch_add_4'

 > Fixes:
 >  - http://autobuild.buildroot.org/results/229e4bd1ba1787953899875ab56721c9609f035a

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
