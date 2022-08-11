Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 440E6C19F2A
	for <buildroot@archiver.kernel.org>; Thu, 11 Aug 2022 09:43:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BB9D782F37;
	Thu, 11 Aug 2022 09:43:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BB9D782F37
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id D8dhJpguXtgS; Thu, 11 Aug 2022 09:43:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EC6EE82EC7;
	Thu, 11 Aug 2022 09:43:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EC6EE82EC7
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9BEB91BF414
 for <buildroot@lists.busybox.net>; Thu, 11 Aug 2022 09:43:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 76D1D60E64
 for <buildroot@lists.busybox.net>; Thu, 11 Aug 2022 09:43:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 76D1D60E64
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RL_RdXV0SxSK for <buildroot@lists.busybox.net>;
 Thu, 11 Aug 2022 09:43:12 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3BA6760B5B
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::231])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3BA6760B5B
 for <buildroot@buildroot.org>; Thu, 11 Aug 2022 09:43:11 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 0924C10000E;
 Thu, 11 Aug 2022 09:43:07 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1oM4iZ-002moA-3Z; Thu, 11 Aug 2022 11:43:07 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Florian Fainelli <f.fainelli@gmail.com>
References: <20220810210953.2294547-1-f.fainelli@gmail.com>
Date: Thu, 11 Aug 2022 11:43:07 +0200
In-Reply-To: <20220810210953.2294547-1-f.fainelli@gmail.com> (Florian
 Fainelli's message of "Wed, 10 Aug 2022 14:09:53 -0700")
Message-ID: <87ilmznmj8.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2] package/linux-tools: Allow installation
 of perf scripts
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
Cc: bernd.kuhls@t-online.de, chrismcc@gmail.com, fontaine.fabrice@gmail.com,
 thomas.petazzoni@bootlin.com, buildroot@buildroot.org, yann.morin.1998@free.fr
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Florian" == Florian Fainelli <f.fainelli@gmail.com> writes:

 > In order to run the full gamut of "perf tests" installing the perf
 > scripts is required, otherwise we run into errors similar to those:

 > 	failed to open shell test directory: /usr/libexec/perf-core/tests/shell

 > Make this possible by introducing a new option allowing us to install
 > perf scripts.

 > Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
 > ---
 > Changes in v2:

 > - updated based upon Fabrice's feedback

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
