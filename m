Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A320C25B76
	for <buildroot@archiver.kernel.org>; Sat,  8 Jun 2024 16:52:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5E38C40558;
	Sat,  8 Jun 2024 16:52:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wPGCfdpWRqeh; Sat,  8 Jun 2024 16:52:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3E38A40589
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3E38A40589;
	Sat,  8 Jun 2024 16:52:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A791D1BF414
 for <buildroot@lists.busybox.net>; Sat,  8 Jun 2024 16:52:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9520760709
 for <buildroot@lists.busybox.net>; Sat,  8 Jun 2024 16:52:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BFnC6dwWUCkm for <buildroot@lists.busybox.net>;
 Sat,  8 Jun 2024 16:52:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org AC492606FD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AC492606FD
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AC492606FD
 for <buildroot@buildroot.org>; Sat,  8 Jun 2024 16:52:13 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id F3E3B20003;
 Sat,  8 Jun 2024 16:52:11 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1sFzIZ-0026a9-1U;
 Sat, 08 Jun 2024 18:52:11 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: James Hilliard <james.hilliard1@gmail.com>
References: <20240528132218.2307479-1-james.hilliard1@gmail.com>
Date: Sat, 08 Jun 2024 18:52:11 +0200
In-Reply-To: <20240528132218.2307479-1-james.hilliard1@gmail.com> (James
 Hilliard's message of "Tue, 28 May 2024 07:22:18 -0600")
Message-ID: <87y17fxtqc.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH v2 1/1] utils/genrandconfig: switch to
 async/await format
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

>>>>> "James" == James Hilliard <james.hilliard1@gmail.com> writes:

 > This requires python 3.5 or newer but is a bit cleaner than the
 > previous coroutine method.

 > This should also fix a python3.12 issue:
 > [Tue, 28 May 2024 13:09:05] INFO: generate the configuration
 > Traceback (most recent call last):
 >   File "/home/autobuild/autobuild/instance-0/buildroot/utils/genrandconfig", line 833, in <module>
 >     ret = asyncio.run(gen_config(args))
 >           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
 >   File "/usr/lib/python3.12/asyncio/runners.py", line 194, in run
 >     return runner.run(main)
 >            ^^^^^^^^^^^^^^^^
 >   File "/usr/lib/python3.12/asyncio/runners.py", line 89, in run
 >     raise ValueError("a coroutine was expected, got {!r}".format(coro))
 > ValueError: a coroutine was expected, got <generator object gen_config at 0xffff7bd822c0>
 > [Tue, 28 May 2024 13:09:06] WARN: failed to generate configuration

 > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
 > ---
 > Changes v1 -> v2:
 >   - rebase
 >   - update commit message with python 3.12 fix info

Committed to 2024.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
