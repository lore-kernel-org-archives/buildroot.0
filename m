Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22687C636CC
	for <buildroot@archiver.kernel.org>; Wed, 15 Feb 2023 09:21:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ADB5781EBB;
	Wed, 15 Feb 2023 09:21:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ADB5781EBB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oCxTEUkcbehG; Wed, 15 Feb 2023 09:21:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id ED16881EA9;
	Wed, 15 Feb 2023 09:21:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ED16881EA9
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 301411BF255
 for <buildroot@lists.busybox.net>; Wed, 15 Feb 2023 09:21:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 15EF2402A7
 for <buildroot@lists.busybox.net>; Wed, 15 Feb 2023 09:21:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 15EF2402A7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7ZfSFrT0P02p for <buildroot@lists.busybox.net>;
 Wed, 15 Feb 2023 09:21:12 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0B2FB4005E
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::231])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0B2FB4005E
 for <buildroot@buildroot.org>; Wed, 15 Feb 2023 09:21:11 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 5E19E10000A;
 Wed, 15 Feb 2023 09:21:07 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1pSDyN-004qbn-1c; Wed, 15 Feb 2023 10:21:07 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: thomas@devoogdt.com
References: <20230211182546.633728-1-thomas@devoogdt.com>
 <20230211182546.633728-2-thomas@devoogdt.com>
Date: Wed, 15 Feb 2023 10:21:07 +0100
In-Reply-To: <20230211182546.633728-2-thomas@devoogdt.com>
 (thomas@devoogdt.com's message of "Sat, 11 Feb 2023 19:25:44 +0100")
Message-ID: <87ttzn473w.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2 2/3] package/fluent-bit: add support for
 non glibc toolchain
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
Cc: Thomas Devoogdt <thomas.devoogdt@barco.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "thomas" == thomas  <thomas@devoogdt.com> writes:

 > From: Thomas Devoogdt <thomas.devoogdt@barco.com>
 > - require threads and dynamic library support
 > - require sync_4 support
 > - provide fts.h trough musl-fts

 > static_assert is not available if no C++ toolchain or no glibc
 > is used, so add two patches to fix this

 > Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>

Committed, thanks. We do have xxhash and c-ares packages in Buildroot,
could you have a look at using those instead of these vendored
libraries?

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
