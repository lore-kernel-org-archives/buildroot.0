Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AACAC43334
	for <buildroot@archiver.kernel.org>; Tue, 19 Jul 2022 15:08:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EF836826C2;
	Tue, 19 Jul 2022 15:08:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EF836826C2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NPAWjF4O7VEw; Tue, 19 Jul 2022 15:08:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1CB3E826B4;
	Tue, 19 Jul 2022 15:08:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1CB3E826B4
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E9BC91BF951
 for <buildroot@lists.busybox.net>; Tue, 19 Jul 2022 15:08:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D2C8B826B4
 for <buildroot@lists.busybox.net>; Tue, 19 Jul 2022 15:08:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D2C8B826B4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Snwmb3Gz8RdJ for <buildroot@lists.busybox.net>;
 Tue, 19 Jul 2022 15:08:31 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A3EB8826AA
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A3EB8826AA
 for <buildroot@busybox.net>; Tue, 19 Jul 2022 15:08:30 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 77FAF20004;
 Tue, 19 Jul 2022 15:08:26 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1oDopl-002q7H-2b; Tue, 19 Jul 2022 17:08:25 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Nicola Di Lieto <nicola.dilieto@gmail.com>
References: <Yq2BgE6StduAjH5Z@einstein.dilieto.eu>
Date: Tue, 19 Jul 2022 17:08:25 +0200
In-Reply-To: <Yq2BgE6StduAjH5Z@einstein.dilieto.eu> (Nicola Di Lieto's message
 of "Sat, 18 Jun 2022 09:40:48 +0200")
Message-ID: <87lesp3zti.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/uacme: allow ualpn with mbedTLS
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Nicola" == Nicola Di Lieto <nicola.dilieto@gmail.com> writes:

 > Following the update to mbedTLS 2.28.0 in commit 0f8aab08, ualpn can
 > work with mbedTLS without restrictions.

 > References
 > https://git.buildroot.net/buildroot/commit?id=96c3b52132b41716ca445b4c73a1a8886c26e5ee
 > https://github.com/ndilieto/uacme/issues/23#issuecomment-1043409796
 > https://github.com/ndilieto/uacme/commit/bbee626cf5f60908f064c123f7a9622639348c3d
 > https://github.com/Mbed-TLS/mbedtls/pull/3243

 > Signed-off-by: Nicola Di Lieto <nicola.dilieto@gmail.com>

Committed to 2022.05.x and 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
