Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAB79CDD548
	for <buildroot@archiver.kernel.org>; Wed, 18 Sep 2024 16:48:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8067340FD9;
	Wed, 18 Sep 2024 16:48:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ciH9kv3ev86Q; Wed, 18 Sep 2024 16:48:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0C5AC4115C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0C5AC4115C;
	Wed, 18 Sep 2024 16:48:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 358DC1BF97A
 for <buildroot@lists.busybox.net>; Wed, 18 Sep 2024 16:47:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 30B6D4023F
 for <buildroot@lists.busybox.net>; Wed, 18 Sep 2024 16:47:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NuZfojYBFFZk for <buildroot@lists.busybox.net>;
 Wed, 18 Sep 2024 16:47:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.198;
 helo=relay6-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D36D0401EB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D36D0401EB
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D36D0401EB
 for <buildroot@buildroot.org>; Wed, 18 Sep 2024 16:47:41 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 449A6C0002
 for <buildroot@buildroot.org>; Wed, 18 Sep 2024 16:47:40 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1sqxq7-00DE5Y-2h
 for buildroot@buildroot.org; Wed, 18 Sep 2024 18:47:39 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
References: <20240824164103.8A3F4860C6@busybox.osuosl.org>
Date: Wed, 18 Sep 2024 18:47:39 +0200
In-Reply-To: <20240824164103.8A3F4860C6@busybox.osuosl.org> (Peter Korsgaard's
 message of "Sat, 24 Aug 2024 18:40:21 +0200")
Message-ID: <87a5g4rjro.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [git commit] package/dovecot: security bump version
 to 2.3.21.1
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

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > commit:
 > https://git.buildroot.net/buildroot/commit/?id=786484e631d34f9630baaa74006a8398aa19ad7d
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > Fixes CVE-2024-23184 & CVE-2024-23185:
 > https://dovecot.org/mailman3/hyperkitty/list/dovecot-news@dovecot.org/thread/2CSVL56LFPAXVLWMGXEIWZL736PSYHP5/

 > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2024.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
