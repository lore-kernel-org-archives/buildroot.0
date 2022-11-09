Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F27BDC433FE
	for <buildroot@archiver.kernel.org>; Wed,  9 Nov 2022 13:28:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5E2B060F34;
	Wed,  9 Nov 2022 13:28:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5E2B060F34
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XXEszRfKYeit; Wed,  9 Nov 2022 13:28:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 982F160F29;
	Wed,  9 Nov 2022 13:28:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 982F160F29
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 677161BF3CB
 for <buildroot@lists.busybox.net>; Wed,  9 Nov 2022 13:28:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 42E2A4052C
 for <buildroot@lists.busybox.net>; Wed,  9 Nov 2022 13:28:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 42E2A4052C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MgRcdeT6Y3QJ for <buildroot@lists.busybox.net>;
 Wed,  9 Nov 2022 13:28:36 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CE97A402E5
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CE97A402E5
 for <buildroot@buildroot.org>; Wed,  9 Nov 2022 13:28:35 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 4D16660005;
 Wed,  9 Nov 2022 13:28:32 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1osl83-0015hq-FC; Wed, 09 Nov 2022 14:28:31 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
References: <20221026175705.3928406-1-thomas.petazzoni@bootlin.com>
Date: Wed, 09 Nov 2022 14:28:31 +0100
In-Reply-To: <20221026175705.3928406-1-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni via buildroot's message of "Wed, 26 Oct 2022 19:57:05
 +0200")
Message-ID: <87leokfe9s.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/nodejs: drop support for the MIPS
 architecture
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
Cc: Daniel Price <daniel.price@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Martin Bark <martin@barkynet.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Thomas" == Thomas Petazzoni via buildroot <buildroot@buildroot.org> writes:

 > The build of NodeJS fails on mipsel due to an issue in the V8 code:
 > ../../deps/v8/src/compiler/backend/mips/code-generator-mips.cc:4106:48: error: call of overloaded 'Operand(int64_t)' is ambiguous
 >  4106 |                 Operand(static_cast<int64_t>(0)));

 > There is apparently a lack of maintenance of the MIPS port of V8, as
 > is discussed in the Github issue at
 > https://github.com/nodejs/node/issues/26179.

 > Until this get improved/fixed, our best option is to drop support for
 > MIPS in our NodeJS package.

 > Fixes:

 >   http://autobuild.buildroot.net/results/0e6ee80c77bcb77afe18410e8d9da93b738cb0a4/

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

:/

Committed to 2022.08.x, thanks.

Perhaps this is only a >= nodejs 16.x issue? We don't seem to have any
similar build issues for 14.x on 2022.02.x.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
