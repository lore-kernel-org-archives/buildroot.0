Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20CC7C4345F
	for <buildroot@archiver.kernel.org>; Sun, 28 Apr 2024 11:03:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DB7D140707;
	Sun, 28 Apr 2024 11:03:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SnGCuLuA9Nqs; Sun, 28 Apr 2024 11:03:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 97D624072E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 97D624072E;
	Sun, 28 Apr 2024 11:03:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 525001BF396
 for <buildroot@lists.busybox.net>; Sun, 28 Apr 2024 11:03:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3F10560611
 for <buildroot@lists.busybox.net>; Sun, 28 Apr 2024 11:03:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a7rTNgzU1WjM for <buildroot@lists.busybox.net>;
 Sun, 28 Apr 2024 11:03:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.195;
 helo=relay3-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 38206605C5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 38206605C5
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 38206605C5
 for <buildroot@buildroot.org>; Sun, 28 Apr 2024 11:03:06 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 21A8A60004;
 Sun, 28 Apr 2024 11:03:02 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1s12JC-003HgI-1L;
 Sun, 28 Apr 2024 13:03:02 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
References: <20240326143538.1D1BF8422F@busybox.osuosl.org>
 <87v841eomp.fsf@dell.be.48ers.dk>
Date: Sun, 28 Apr 2024 13:03:02 +0200
In-Reply-To: <87v841eomp.fsf@dell.be.48ers.dk> (Peter Korsgaard's message of
 "Sun, 28 Apr 2024 13:02:38 +0200")
Message-ID: <87o79teom1.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
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

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

>>>>> "Thomas" == Thomas Petazzoni via buildroot <buildroot@buildroot.org> writes:
 >> commit: https://git.buildroot.net/buildroot/commit/?id=e8fcd9876d9e0d0fff8b8aca2462d89d69b0601b
 >> branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 >> David's e-mail is bouncing:

 >> <david.bachelart@bbright.com>: host aspmx.l.google.com[2a00:1450:400c:c0c::1a]
 >> said: 550-5.1.1 The email account that you tried to reach does not exist.
 >> Please try 550-5.1.1 double-checking the recipient's email address for
 >> typos or 550-5.1.1 unnecessary spaces. For more information, go to 550
 >> 5.1.1  https://support.google.com/mail/?p=NoSuchUser
 >> n19-20020a05600c4f9300b00414111d4396si2497070wmq.117 - gsmtp (in reply to
 >> RCPT TO command)

 >> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

 > Committed, thanks.

.. to 2024.02.x naturally.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
