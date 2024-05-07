Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6AD7C10F1A
	for <buildroot@archiver.kernel.org>; Tue,  7 May 2024 20:50:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8335D81280;
	Tue,  7 May 2024 20:50:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 12rT7VhVC6WY; Tue,  7 May 2024 20:50:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8023E812C4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8023E812C4;
	Tue,  7 May 2024 20:50:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3FB201BF2C8
 for <buildroot@lists.busybox.net>; Tue,  7 May 2024 20:50:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2C53F4079A
 for <buildroot@lists.busybox.net>; Tue,  7 May 2024 20:50:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MuDRYpfq3Fco for <buildroot@lists.busybox.net>;
 Tue,  7 May 2024 20:50:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.197;
 helo=relay5-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 06A0C40791
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 06A0C40791
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 06A0C40791
 for <buildroot@buildroot.org>; Tue,  7 May 2024 20:50:44 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 023811C0004;
 Tue,  7 May 2024 20:50:42 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1s4Rlq-005Gmb-1U;
 Tue, 07 May 2024 22:50:42 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Peter Seiderer via buildroot <buildroot@buildroot.org>
References: <20240422073839.12672-1-ps.report@gmx.net>
Date: Tue, 07 May 2024 22:50:42 +0200
In-Reply-To: <20240422073839.12672-1-ps.report@gmx.net> (Peter Seiderer via
 buildroot's message of "Mon, 22 Apr 2024 09:38:39 +0200")
Message-ID: <87zft1tkgt.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH v1] package/speechd: set CPE_ID_VENDOR (to
 silence mismatched CVE warning)
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
Cc: buildroot@busybox.net, Peter Seiderer <ps.report@gmx.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Peter" == Peter Seiderer via buildroot <buildroot@buildroot.org> writes:

 > - set CPE_ID_VENDOR to silence mismatched CVE-2001-0956 ([1], [2]) warning
 >   clearly aiming some other product/version ("speechd 0.54 with Festival or
 >   rsynth speech synthesis package")

 > [1] https://security-tracker.debian.org/tracker/CVE-2001-0956
 > [2] https://github.com/advisories/GHSA-67cw-4jhh-3jm7

 > Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Committed to 2024.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
