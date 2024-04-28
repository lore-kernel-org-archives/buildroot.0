Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21935C4345F
	for <buildroot@archiver.kernel.org>; Sun, 28 Apr 2024 11:02:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D96C5406D1;
	Sun, 28 Apr 2024 11:02:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PNjpwF5JqbiK; Sun, 28 Apr 2024 11:02:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9D1DF406F1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9D1DF406F1;
	Sun, 28 Apr 2024 11:02:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 94A701BF396
 for <buildroot@lists.busybox.net>; Sun, 28 Apr 2024 11:02:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7F998406F1
 for <buildroot@lists.busybox.net>; Sun, 28 Apr 2024 11:02:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9faAfABNAMnr for <buildroot@lists.busybox.net>;
 Sun, 28 Apr 2024 11:02:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.193;
 helo=relay1-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 20F7E406D1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 20F7E406D1
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 20F7E406D1
 for <buildroot@buildroot.org>; Sun, 28 Apr 2024 11:02:41 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4BC57240004;
 Sun, 28 Apr 2024 11:02:39 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1s12Io-003Hfw-1M;
 Sun, 28 Apr 2024 13:02:38 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
References: <20240326143538.1D1BF8422F@busybox.osuosl.org>
Date: Sun, 28 Apr 2024 13:02:38 +0200
In-Reply-To: <20240326143538.1D1BF8422F@busybox.osuosl.org> (Thomas Petazzoni
 via buildroot's message of "Tue, 26 Mar 2024 15:29:04 +0100")
Message-ID: <87v841eomp.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [git commit] DEVELOPERS: remove David Bachelart
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Thomas" == Thomas Petazzoni via buildroot <buildroot@buildroot.org> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=e8fcd9876d9e0d0fff8b8aca2462d89d69b0601b
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > David's e-mail is bouncing:

 > <david.bachelart@bbright.com>: host aspmx.l.google.com[2a00:1450:400c:c0c::1a]
 >     said: 550-5.1.1 The email account that you tried to reach does not exist.
 >     Please try 550-5.1.1 double-checking the recipient's email address for
 >     typos or 550-5.1.1 unnecessary spaces. For more information, go to 550
 >     5.1.1  https://support.google.com/mail/?p=NoSuchUser
 >     n19-20020a05600c4f9300b00414111d4396si2497070wmq.117 - gsmtp (in reply to
 >     RCPT TO command)

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
