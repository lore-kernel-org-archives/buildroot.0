Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56CCEC4345F
	for <buildroot@archiver.kernel.org>; Sun, 28 Apr 2024 11:19:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 18C4440493;
	Sun, 28 Apr 2024 11:19:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ufq97sz2Np6G; Sun, 28 Apr 2024 11:19:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E7DC9407BE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E7DC9407BE;
	Sun, 28 Apr 2024 11:19:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D88EB1BF5DF
 for <buildroot@lists.busybox.net>; Sun, 28 Apr 2024 11:19:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C4A4C407BE
 for <buildroot@lists.busybox.net>; Sun, 28 Apr 2024 11:19:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0yUnlMJupWR1 for <buildroot@lists.busybox.net>;
 Sun, 28 Apr 2024 11:19:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.197;
 helo=relay5-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C2F5740493
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C2F5740493
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C2F5740493
 for <buildroot@buildroot.org>; Sun, 28 Apr 2024 11:19:45 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 42B8F1C0003;
 Sun, 28 Apr 2024 11:19:42 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1s12ZH-003IU4-32;
 Sun, 28 Apr 2024 13:19:39 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Adam Duskett <adam.duskett@amarulasolutions.com>
References: <20240221195520.1762497-1-bernd@kuhls.net>
 <CAHDQB6M6ruLtu-hg3cWBXUZfzbvd4yNj8QkrH8tWJoDxqjKh+g@mail.gmail.com>
Date: Sun, 28 Apr 2024 13:19:39 +0200
In-Reply-To: <CAHDQB6M6ruLtu-hg3cWBXUZfzbvd4yNj8QkrH8tWJoDxqjKh+g@mail.gmail.com>
 (Adam Duskett's message of "Sat, 23 Mar 2024 14:37:09 -0600")
Message-ID: <877cghenuc.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/libffi: bump version to 3.4.6
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
Cc: Bernd Kuhls <bernd@kuhls.net>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Adam" == Adam Duskett <adam.duskett@amarulasolutions.com> writes:

 > All:
 > Reviewed-by: Adam Duskett <adam.duskett@amarulasolutions.com>
 > Tested-by: Adam Duskett <adam.duskett@amarulasolutions.com>

 > This is needed for host builds with gcc14.

Host builds of what package exactly? I don't directly see any references
to any gcc-14 related fixes?

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
