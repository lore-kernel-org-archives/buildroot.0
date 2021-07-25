Return-Path: <SRS0=8L+i=MR=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 417A5C4338F
	for <buildroot@archiver.kernel.org>; Sun, 25 Jul 2021 13:00:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0AF9B60EB4
	for <buildroot@archiver.kernel.org>; Sun, 25 Jul 2021 13:00:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0AF9B60EB4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D8BE240203;
	Sun, 25 Jul 2021 13:00:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id R3AMzIa8WDXt; Sun, 25 Jul 2021 13:00:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3B07140231;
	Sun, 25 Jul 2021 13:00:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0CE531BF95A
 for <buildroot@lists.busybox.net>; Sun, 25 Jul 2021 12:58:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F02D84025E
 for <buildroot@lists.busybox.net>; Sun, 25 Jul 2021 12:58:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id p-h4d5wLg7fK for <buildroot@lists.busybox.net>;
 Sun, 25 Jul 2021 12:58:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D4C564023B
 for <buildroot@buildroot.org>; Sun, 25 Jul 2021 12:58:52 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id F195A200003;
 Sun, 25 Jul 2021 12:58:50 +0000 (UTC)
Date: Sun, 25 Jul 2021 14:58:49 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Adrian Perez de Castro <aperez@igalia.com>
Message-ID: <20210725145849.701b3171@windsurf>
In-Reply-To: <20210724205418.137180-1-aperez@igalia.com>
References: <20210724205418.137180-1-aperez@igalia.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/wpewebkit: security bump to
 version 2.32.3
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

On Sat, 24 Jul 2021 23:54:18 +0300
Adrian Perez de Castro <aperez@igalia.com> wrote:

> This is a minor release which provides fixes for CVE-2021-21775,
> CVE-2021-21779, CVE-2021-30663, CVE-2021-30665, CVE-2021-30689,
> CVE-2021-30720, CVE-2021-30734, CVE-2021-30744, CVE-2021-30749,
> CVE-2021-30795, CVE-2021-30797, and CVE-2021-30799.
> 
> Full release notes can be found at:
> 
>   https://wpewebkit.org/release/wpewebkit-2.32.3.html
> 
> An accompanying security advisory has been published at:
> 
>   https://wpewebkit.org/security/WSA-2021-0004.html
> 
> Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
> ---
>  package/wpewebkit/wpewebkit.hash | 9 +++++----
>  package/wpewebkit/wpewebkit.mk   | 2 +-
>  2 files changed, 6 insertions(+), 5 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
