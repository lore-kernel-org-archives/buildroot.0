Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5343DC4332F
	for <buildroot@archiver.kernel.org>; Tue, 25 Jan 2022 17:03:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B68B0408A3;
	Tue, 25 Jan 2022 17:03:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eoLlm1AAc4nj; Tue, 25 Jan 2022 17:03:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7AE7A4062A;
	Tue, 25 Jan 2022 17:03:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D28C71BF34E
 for <buildroot@lists.busybox.net>; Tue, 25 Jan 2022 17:03:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C028540209
 for <buildroot@lists.busybox.net>; Tue, 25 Jan 2022 17:03:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5SDy8Ls_G1WV for <buildroot@lists.busybox.net>;
 Tue, 25 Jan 2022 17:03:42 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp4.osuosl.org (Postfix) with ESMTPS id ABA1F401EF
 for <buildroot@buildroot.org>; Tue, 25 Jan 2022 17:03:41 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 421A0FF80A;
 Tue, 25 Jan 2022 17:03:39 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1nCPEI-00066s-IV; Tue, 25 Jan 2022 18:03:38 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabio Estevam <festevam@gmail.com>
References: <20211227175130.2986949-1-festevam@gmail.com>
 <20211227175130.2986949-2-festevam@gmail.com>
Date: Tue, 25 Jan 2022 18:03:38 +0100
In-Reply-To: <20211227175130.2986949-2-festevam@gmail.com> (Fabio Estevam's
 message of "Mon, 27 Dec 2021 14:51:29 -0300")
Message-ID: <87v8y7lpcl.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 2/3] configs/mx6cubox: Select
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

 > include/image.h:1178:12: fatal error: openssl/evp.h: No such file or directory
 >  1178 | #  include <openssl/evp.h>
 >       |            ^~~~~~~~~~~~~~~

 > Fixes:
 > - https://gitlab.com/buildroot.org/buildroot/-/jobs/1915006257
 > Signed-off-by: Fabio Estevam <festevam@gmail.com>

Committed to 2021.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
