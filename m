Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D222DC5478C
	for <buildroot@archiver.kernel.org>; Wed, 28 Feb 2024 20:02:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A17C48248F;
	Wed, 28 Feb 2024 20:02:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XQVaOt2z5J5U; Wed, 28 Feb 2024 20:02:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BBBFB82499
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BBBFB82499;
	Wed, 28 Feb 2024 20:02:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 10A751BF4D5
 for <buildroot@lists.busybox.net>; Wed, 28 Feb 2024 20:02:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F211D60A48
 for <buildroot@lists.busybox.net>; Wed, 28 Feb 2024 20:02:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id z6gQwIJcRfmZ for <buildroot@lists.busybox.net>;
 Wed, 28 Feb 2024 20:02:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 734C560A3E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 734C560A3E
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 734C560A3E
 for <buildroot@buildroot.org>; Wed, 28 Feb 2024 20:02:41 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 061E220003;
 Wed, 28 Feb 2024 20:02:37 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rfQ8T-002xT4-0q;
 Wed, 28 Feb 2024 21:02:37 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
References: <20240212095514.11656-1-buildroot@bubu1.eu>
 <87cysgo3r9.fsf@48ers.dk>
Date: Wed, 28 Feb 2024 21:02:37 +0100
In-Reply-To: <87cysgo3r9.fsf@48ers.dk> (Peter Korsgaard's message of "Wed, 28
 Feb 2024 19:14:18 +0100")
Message-ID: <878r34nyqq.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH] package/python3: security bump to 3.12.2
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Marcus Hoffmann <buildroot@bubu1.eu>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

>>>>> "Marcus" == Marcus Hoffmann via buildroot <buildroot@buildroot.org> writes:
 >> Fixes the following security issue:
 >> * Skip .pth files with names starting with a dot or hidden file
 >> attribute. [1]

 >> [1] https://docs.python.org/release/3.12.2/whatsnew/changelog.html#security

 > I have in the man time reverted the 3.12.x bump for now because of

s/man/mean/ naturally.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
