Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B57E0C77B7C
	for <buildroot@archiver.kernel.org>; Sat, 27 May 2023 09:55:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 43A0E60BCF;
	Sat, 27 May 2023 09:55:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 43A0E60BCF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RU269wa33rWe; Sat, 27 May 2023 09:55:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 43FAF60E72;
	Sat, 27 May 2023 09:55:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 43FAF60E72
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A727C1BF34B
 for <buildroot@lists.busybox.net>; Sat, 27 May 2023 09:55:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7EDC4429EC
 for <buildroot@lists.busybox.net>; Sat, 27 May 2023 09:55:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7EDC4429EC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id M57YmK2Zd6HG for <buildroot@lists.busybox.net>;
 Sat, 27 May 2023 09:55:16 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4E7F8429D2
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4E7F8429D2
 for <buildroot@buildroot.org>; Sat, 27 May 2023 09:55:16 +0000 (UTC)
X-GND-Sasl: peter@korsgaard.com
X-GND-Sasl: peter@korsgaard.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2A6B020003;
 Sat, 27 May 2023 09:55:13 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1q2qdk-0072zk-93; Sat, 27 May 2023 11:55:12 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd.kuhls@t-online.de>
References: <20230524205629.2934876-1-bernd.kuhls@t-online.de>
 <20230524205629.2934876-2-bernd.kuhls@t-online.de>
Date: Sat, 27 May 2023 11:55:12 +0200
In-Reply-To: <20230524205629.2934876-2-bernd.kuhls@t-online.de> (Bernd Kuhls's
 message of "Wed, 24 May 2023 22:56:29 +0200")
Message-ID: <87pm6mumin.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 2/2] package/linux-headers: drop 6.2.x option
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

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > The 6.2.x series is now EOL upstream, so drop the linux-headers option
 > and add legacy handling for it.

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Committed, thanks.

> ---
 >  Config.in.legacy                     | 7 +++++++
 >  linux/linux.hash                     | 1 -
 >  package/linux-headers/Config.in.host | 5 -----
 >  3 files changed, 7 insertions(+), 6 deletions(-)

 > diff --git a/Config.in.legacy b/Config.in.legacy
 > index 1590343ca1..46aa0796a7 100644
 > --- a/Config.in.legacy
 > +++ b/Config.in.legacy
 > @@ -146,6 +146,13 @@ endif
 
 >  comment "Legacy options removed in 2023.05"
 
 > +config BR2_KERNEL_HEADERS_6_2
 > +	bool "kernel headers version 6.2.x are no longer supported"
 > +	select BR2_LEGACY
 > +	help
 > +	  Version 6.2.x of the Linux kernel headers are no longer
 > +	  maintained upstream and are now removed.
 > +
 >  config BR2_GCC_VERSION_10_X

Notice: This is not how Config.in.legacy looks on master, so I had to
manually fix it up when applying.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
