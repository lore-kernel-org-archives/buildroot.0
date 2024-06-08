Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04CDFC25B76
	for <buildroot@archiver.kernel.org>; Sat,  8 Jun 2024 18:21:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ADA1A405AB;
	Sat,  8 Jun 2024 18:21:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NoFnov3tyXVp; Sat,  8 Jun 2024 18:21:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9375A406A6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9375A406A6;
	Sat,  8 Jun 2024 18:21:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 164CB1BF408
 for <buildroot@lists.busybox.net>; Sat,  8 Jun 2024 18:21:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0189C406A6
 for <buildroot@lists.busybox.net>; Sat,  8 Jun 2024 18:21:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rFCD0xO1qSPE for <buildroot@lists.busybox.net>;
 Sat,  8 Jun 2024 18:21:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::228;
 helo=relay8-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B8D55405AB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B8D55405AB
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B8D55405AB
 for <buildroot@buildroot.org>; Sat,  8 Jun 2024 18:21:38 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6A0821BF207;
 Sat,  8 Jun 2024 18:21:37 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1sG0h6-002I11-2e;
 Sat, 08 Jun 2024 20:21:36 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: James Hilliard <james.hilliard1@gmail.com>
References: <20240602204139.2508623-1-james.hilliard1@gmail.com>
 <Zl4rvlgxhcew9r6_@landeda>
 <CADvTj4pT1Nq8Z09H3_kg0Cydk7S4sYpiE0gUUWPXMx9x6wvLDQ@mail.gmail.com>
 <87mso0etab.fsf@dell.be.48ers.dk>
Date: Sat, 08 Jun 2024 20:21:36 +0200
In-Reply-To: <87mso0etab.fsf@dell.be.48ers.dk> (Peter Korsgaard's message of
 "Tue, 04 Jun 2024 15:23:08 +0200")
Message-ID: <87zfrvuwgf.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH v2 1/1] package/vala: bump to version 0.56.17
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

>>>>> "James" == James Hilliard <james.hilliard1@gmail.com> writes:
 >>> Applied to next, thanks.

 >> This probably should have gone in master since it's needed for build hosts
 >> with GCC 14.

 > That would have been useful info in the commit message.

 >> Otherwise we get error like this:
 >> http://autobuild.buildroot.net/results/f08/f087b879167252690ed198de771292142c6249f8/build-end.log

 > Cherry picked for master with a reference to that autobuilder failure
 > added, thanks.

Committed to 2024.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
