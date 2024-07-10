Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 659D9C3DA42
	for <buildroot@archiver.kernel.org>; Wed, 10 Jul 2024 22:03:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 131FF415CF;
	Wed, 10 Jul 2024 22:03:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lJQANUvYTksO; Wed, 10 Jul 2024 22:03:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E4C8D41600
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E4C8D41600;
	Wed, 10 Jul 2024 22:02:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8D8441BF292
 for <buildroot@lists.busybox.net>; Wed, 10 Jul 2024 22:02:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B55AF8343E
 for <buildroot@lists.busybox.net>; Wed, 10 Jul 2024 22:02:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NmullU-bf_pd for <buildroot@lists.busybox.net>;
 Wed, 10 Jul 2024 22:02:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::229;
 helo=relay9-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2AD7083613
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2AD7083613
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2AD7083613
 for <buildroot@buildroot.org>; Wed, 10 Jul 2024 22:02:41 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 83E07FF803;
 Wed, 10 Jul 2024 22:02:40 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1sRfOZ-008H6p-2l;
 Thu, 11 Jul 2024 00:02:39 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
References: <20240703072049.7CAFB83B31@busybox.osuosl.org>
Date: Thu, 11 Jul 2024 00:02:39 +0200
In-Reply-To: <20240703072049.7CAFB83B31@busybox.osuosl.org> (Arnout
 Vandecappelle via buildroot's message of "Wed, 3 Jul 2024 09:18:03
 +0200")
Message-ID: <8734ogkirk.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [git commit] gitlab: add default issue template
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Arnout" == Arnout Vandecappelle via buildroot <buildroot@buildroot.org> writes:

 > commit:
 > https://git.buildroot.net/buildroot/commit/?id=32aacc4737e106a7ddb2f2129d4ab9f2279dcf92
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > This introduces the default issue template, to help users provide issues
 > that are meaningful, and that will help reproduce the issue.

 > If needed, we can add more templates in the future.

 > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
 > [Arnout:
 >  - add link to mailing list;
 >  - rephrase "pristine Buildroot";
 >  - add a checklist item for "I'm using latest commit";
 >  - add a checklist item for "make clean; make";
 >  - add formal items for Buildroot commit sha1 and distro.]
 > Signed-off-by: Arnout Vandecappelle <arnout@mind.be>

Committed to 2024.02.x and 2024.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
