Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 955DECE8D7A
	for <buildroot@archiver.kernel.org>; Thu, 19 Sep 2024 11:28:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 532D84011A;
	Thu, 19 Sep 2024 11:28:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lH2Ql-l5pwH7; Thu, 19 Sep 2024 11:28:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1B203410FC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1B203410FC;
	Thu, 19 Sep 2024 11:28:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 235241BF33B
 for <buildroot@lists.busybox.net>; Thu, 19 Sep 2024 11:27:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 105AD410FC
 for <buildroot@lists.busybox.net>; Thu, 19 Sep 2024 11:27:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IKwGXbp2MZyu for <buildroot@lists.busybox.net>;
 Thu, 19 Sep 2024 11:27:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.194;
 helo=relay2-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A57904011A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A57904011A
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A57904011A
 for <buildroot@buildroot.org>; Thu, 19 Sep 2024 11:27:56 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 180AB40002;
 Thu, 19 Sep 2024 11:27:52 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1srFKC-00ECb4-0A;
 Thu, 19 Sep 2024 13:27:52 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
References: <20240911155023.2921034-1-dario.binacchi@amarulasolutions.com>
Date: Thu, 19 Sep 2024 13:27:52 +0200
In-Reply-To: <20240911155023.2921034-1-dario.binacchi@amarulasolutions.com>
 (Dario Binacchi's message of "Wed, 11 Sep 2024 17:50:23 +0200")
Message-ID: <87r09fkhmv.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH v2 1/1] package/rp-pppoe: fixup download URL
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
Cc: Jaco Kroon <jaco@uls.co.za>, Dianne Skoll <dianne@skoll.ca>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Dario" == Dario Binacchi <dario.binacchi@amarulasolutions.com> writes:

 > As reported in [1], the download of rp-pppoe-3.15.tar.gz is no longer
 > guaranteed from the download section of the project.

 > Fortunately, Jacon Kroon is hosting the RP-PPPoE source code for versions
 > 3.15 and 4.0 in a location that permits automated downloads.

 > Fixes:
 > - http://autobuild.buildroot.org/results/8676456feec9dd401152887101ad1a9ce96cb769

 > [1] https://dianne.skoll.ca/pipermail/rp-pppoe/2024q3/000652.html

 > Cc: Jaco Kroon <jaco@uls.co.za>
 > Cc: Dianne Skoll <dianne@skoll.ca>
 > Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
 > ---
 > Changes v1 -> v2:
 >   - Change download URL.

Committed to 2024.02.x and 2024.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
