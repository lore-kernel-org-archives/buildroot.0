Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEED4C49EA1
	for <buildroot@archiver.kernel.org>; Tue,  6 Aug 2024 22:15:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8657360625;
	Tue,  6 Aug 2024 22:15:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SRnErBuf8IyS; Tue,  6 Aug 2024 22:15:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A633B606AE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A633B606AE;
	Tue,  6 Aug 2024 22:15:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EDF161BF302
 for <buildroot@lists.busybox.net>; Tue,  6 Aug 2024 22:15:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E8C01606AE
 for <buildroot@lists.busybox.net>; Tue,  6 Aug 2024 22:15:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D4qfv19sCns1 for <buildroot@lists.busybox.net>;
 Tue,  6 Aug 2024 22:15:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::224;
 helo=relay4-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org DAF8160625
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DAF8160625
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DAF8160625
 for <buildroot@buildroot.org>; Tue,  6 Aug 2024 22:15:02 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 18D49E0003;
 Tue,  6 Aug 2024 22:15:00 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1sbSSK-0004eJ-1Y;
 Wed, 07 Aug 2024 00:15:00 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
References: <20240702070232.2373630-1-dario.binacchi@amarulasolutions.com>
Date: Wed, 07 Aug 2024 00:15:00 +0200
In-Reply-To: <20240702070232.2373630-1-dario.binacchi@amarulasolutions.com>
 (Dario Binacchi's message of "Tue, 2 Jul 2024 09:02:32 +0200")
Message-ID: <87ed71qowr.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/gpm: update the patches to be
 applied with fuzz 0
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
Cc: Julien Boibessot <julien.boibessot@armadeus.com>,
 linux-amarula@amarulasolutions.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Dario" == Dario Binacchi <dario.binacchi@amarulasolutions.com> writes:

 > Commit 8f88a644ed7d6 ("support/scripts/apply-patches.sh: set the maximum
 > fuzz factor to 0") reduced the fuzz factor.

 > Due to this change, gpm fails to build with output:

 >     Applying 0003-src-Makefile.in-Really-install-unversioned-solibrary.patch using patch:
 >     patching file src/Makefile.in
 >     Hunk #1 FAILED at 115.
 >     1 out of 1 hunk FAILED -- saving rejects to file src/Makefile.in.rej

 > This commit refreshes the package patch on the current package version.

 > Fixes: 8f88a644ed7d6c9ea55fd4fbe9d7f37055920016
 > Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Committed to 2024.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
