Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDE37C25B75
	for <buildroot@archiver.kernel.org>; Sun, 26 May 2024 20:46:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A8D9360760;
	Sun, 26 May 2024 20:46:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O49Sf1K50eBG; Sun, 26 May 2024 20:46:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AF88C6078B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AF88C6078B;
	Sun, 26 May 2024 20:46:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8DFB01D140A
 for <buildroot@lists.busybox.net>; Sun, 26 May 2024 20:46:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7A68D40133
 for <buildroot@lists.busybox.net>; Sun, 26 May 2024 20:46:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hVhujcfp0uBe for <buildroot@lists.busybox.net>;
 Sun, 26 May 2024 20:46:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.194;
 helo=relay2-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E83DB400BF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E83DB400BF
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E83DB400BF
 for <buildroot@buildroot.org>; Sun, 26 May 2024 20:46:01 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 525E840003;
 Sun, 26 May 2024 20:45:58 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1sBKkf-004S4u-1y;
 Sun, 26 May 2024 22:45:57 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Peter Seiderer via buildroot <buildroot@buildroot.org>
References: <20240506144555.31709-1-ps.report@gmx.net>
 <20240506144555.31709-2-ps.report@gmx.net>
Date: Sun, 26 May 2024 22:45:57 +0200
In-Reply-To: <20240506144555.31709-2-ps.report@gmx.net> (Peter Seiderer via
 buildroot's message of "Mon, 6 May 2024 16:45:44 +0200")
Message-ID: <87fru4fgje.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH v1 1/8] boot/barebox/Config.in: source
 argument needs quotation marks
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
Cc: buildroot@busybox.net, Peter Seiderer <ps.report@gmx.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Peter" == Peter Seiderer via buildroot <buildroot@buildroot.org> writes:

 > Fixes the following error/warnings with kconfig from linux-6.9-rc5:
 >   boot/barebox/Config.in:79: syntax error
 >   boot/barebox/Config.in:79:warning: ignoring unsupported character '/'
 >   boot/barebox/Config.in:79:warning: ignoring unsupported character '/'
 >   boot/barebox/Config.in:79:warning: ignoring unsupported character '/'
 >   boot/barebox/Config.in:79:warning: ignoring unsupported character '.'
 >   boot/barebox/Config.in:79: invalid statement
 >   boot/barebox/Config.in:93: syntax error
 >   boot/barebox/Config.in:93:warning: ignoring unsupported character '/'
 >   boot/barebox/Config.in:93:warning: ignoring unsupported character '/'
 >   boot/barebox/Config.in:93:warning: ignoring unsupported character '/'
 >   boot/barebox/Config.in:93:warning: ignoring unsupported character '.'
 >   boot/barebox/Config.in:93: invalid statement

 > Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Committed to 2024.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
