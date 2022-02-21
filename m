Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2285DC433EF
	for <buildroot@archiver.kernel.org>; Mon, 21 Feb 2022 20:56:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A32D3408D7;
	Mon, 21 Feb 2022 20:56:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sHn5jRrBEOhd; Mon, 21 Feb 2022 20:56:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D982F40629;
	Mon, 21 Feb 2022 20:56:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 59E3E1BF279
 for <buildroot@lists.busybox.net>; Mon, 21 Feb 2022 20:56:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 47D07813EC
 for <buildroot@lists.busybox.net>; Mon, 21 Feb 2022 20:56:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DQ_8n2PVjYYJ for <buildroot@lists.busybox.net>;
 Mon, 21 Feb 2022 20:56:46 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D9386813E6
 for <buildroot@buildroot.org>; Mon, 21 Feb 2022 20:56:45 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id D8C4EFF803;
 Mon, 21 Feb 2022 20:56:41 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1nMFjc-005kKH-Ms; Mon, 21 Feb 2022 21:56:40 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
References: <20220220211055.1273368-1-peter@korsgaard.com>
Date: Mon, 21 Feb 2022 21:56:40 +0100
In-Reply-To: <20220220211055.1273368-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Sun, 20 Feb 2022 22:10:54 +0100")
Message-ID: <8735kc7xbr.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH]
 support/testing/../sample_python_pyyaml_dec.py: unbreak after move to pyaml
 6.0
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
Cc: james.hilliard1@gmail.com, romain.naour@gmail.com,
 Ricardo Martincoski <ricardo.martincoski@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes https://gitlab.com/buildroot.org/buildroot/-/jobs/2088684091
 > python sample_python_pyyaml_dec.py
 > Traceback (most recent call last):
 >   File "/root/sample_python_pyyaml_dec.py", line 5, in <module>
 >     data = yaml.load(serialized)
 > TypeError: load() missing 1 required positional argument: 'Loader'

 > yaml.load() requires a loader argument since the move to version 6.0:
 > https://github.com/yaml/pyyaml/pull/561

 > The test does not need the extra functionality of load(), so instead move to
 > the recommended safe_load().

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
