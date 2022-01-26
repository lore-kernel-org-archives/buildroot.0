Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B1A0C2BA4C
	for <buildroot@archiver.kernel.org>; Wed, 26 Jan 2022 18:36:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BED55416BF;
	Wed, 26 Jan 2022 18:36:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BVi6aSBUPzwW; Wed, 26 Jan 2022 18:36:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0DDA94168E;
	Wed, 26 Jan 2022 18:36:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D4EED1BF4D7
 for <buildroot@lists.busybox.net>; Wed, 26 Jan 2022 18:36:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C273583E5A
 for <buildroot@lists.busybox.net>; Wed, 26 Jan 2022 18:36:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tMmJ1GuE_H0U for <buildroot@lists.busybox.net>;
 Wed, 26 Jan 2022 18:36:20 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A2C4B83134
 for <buildroot@buildroot.org>; Wed, 26 Jan 2022 18:36:20 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 6A99720004;
 Wed, 26 Jan 2022 18:36:17 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1nCn9U-0004Go-6Q; Wed, 26 Jan 2022 19:36:16 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: James Hilliard <james.hilliard1@gmail.com>
References: <20220101000408.1538099-1-james.hilliard1@gmail.com>
 <87v8y6h8c7.fsf@dell.be.48ers.dk>
 <CADvTj4rOqP1pZnp4hz=xb3Y5wBK2eJO7v9EMsd2VGcgRScAu2w@mail.gmail.com>
Date: Wed, 26 Jan 2022 19:36:16 +0100
In-Reply-To: <CADvTj4rOqP1pZnp4hz=xb3Y5wBK2eJO7v9EMsd2VGcgRScAu2w@mail.gmail.com>
 (James Hilliard's message of "Wed, 26 Jan 2022 10:44:40 -0700")
Message-ID: <87sftafiov.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/python-aiohttp: add aiosignal
 runtime dependency
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
Cc: Asaf Kahlon <asafka7@gmail.com>, buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "James" == James Hilliard <james.hilliard1@gmail.com> writes:

 > On Wed, Jan 26, 2022 at 7:36 AM Peter Korsgaard <peter@korsgaard.com> wrote:
 >> 
 >> >>>>> "James" == James Hilliard <james.hilliard1@gmail.com> writes:
 >> 
 >> > Fixes:
 >> >   File "/usr/lib/python3.10/site-packages/aiohttp/__init__.py", line 6, in <module>
 >> >   File "/usr/lib/python3.10/site-packages/aiohttp/client.py", line 88, in <module>
 >> >   File "/usr/lib/python3.10/site-packages/aiohttp/tracing.py", line 5, in <module>
 >> > ModuleNotFoundError: No module named 'aiosignal'
 >> 
 >> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
 >> 
 >> When was this introduced? Do we need to backport this to 2021.02.x /
 >> 2021.11.x?

 > Looks like it's required for aiohttp v3.8.0 and newer, so we shouldn't
 > need to backport.

Ok, great. It is quite helpful to mention such things in the commit
messages.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
