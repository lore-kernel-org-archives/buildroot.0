Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DBA8CF3195
	for <buildroot@archiver.kernel.org>; Wed,  2 Oct 2024 06:07:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 01A74818AC;
	Wed,  2 Oct 2024 06:07:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w1h1yvS4gEnd; Wed,  2 Oct 2024 06:07:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 20B8F81DF7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 20B8F81DF7;
	Wed,  2 Oct 2024 06:07:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DFD8C1BF847
 for <buildroot@lists.busybox.net>; Wed,  2 Oct 2024 06:07:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CEA6B40A39
 for <buildroot@lists.busybox.net>; Wed,  2 Oct 2024 06:07:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kAKFvkjMoXn7 for <buildroot@lists.busybox.net>;
 Wed,  2 Oct 2024 06:07:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.196;
 helo=relay4-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 25C92400C1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 25C92400C1
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 25C92400C1
 for <buildroot@buildroot.org>; Wed,  2 Oct 2024 06:07:28 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 17AE0E0002;
 Wed,  2 Oct 2024 06:07:25 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1svsWD-0078no-0P;
 Wed, 02 Oct 2024 08:07:25 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: James Hilliard <james.hilliard1@gmail.com>
References: <20240930223133.1202389-1-james.hilliard1@gmail.com>
 <20240930223133.1202389-2-james.hilliard1@gmail.com>
 <87plojfujn.fsf@dell.be.48ers.dk>
 <CADvTj4rw8hWgkVtz_QafMWcLGrxYi=Mitjm606L57AtXBoAXfA@mail.gmail.com>
Date: Wed, 02 Oct 2024 08:07:25 +0200
In-Reply-To: <CADvTj4rw8hWgkVtz_QafMWcLGrxYi=Mitjm606L57AtXBoAXfA@mail.gmail.com>
 (James Hilliard's message of "Tue, 1 Oct 2024 14:49:58 -0600")
Message-ID: <87h69vf36q.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 2/4] package/libcupsfilters: new package
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
Cc: Olivier Schonken <olivier.schonken@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "James" == James Hilliard <james.hilliard1@gmail.com> writes:

 > On Tue, Oct 1, 2024, 2:16 PM Peter Korsgaard <peter@korsgaard.com> wrote:
 >> >>>>> "James" == James Hilliard <james.hilliard1@gmail.com> writes:
 >> 
 >> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
 >> 
 >> We should probably use version 2.1b1 instead (or backport the fix) given
 >> the vulnerability:
 >> 
 >> 
 >> https://github.com/OpenPrinting/libcupsfilters/security/advisories/GHSA-w63j-6g73-wmg5


 > Maybe best to merge for now and backport if a final release doesn't show up
 > soon?

Is that backport something you would be interested in doing? I would
mainly do the cups-filters bump to fix the security vulnerability, so it
is not great to add two other vulnerabilities while we do that.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
