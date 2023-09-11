Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CE6DC71153
	for <buildroot@archiver.kernel.org>; Mon, 11 Sep 2023 18:55:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 33AA7414E9;
	Mon, 11 Sep 2023 18:55:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 33AA7414E9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XHsEWceznGFJ; Mon, 11 Sep 2023 18:55:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 83072414DA;
	Mon, 11 Sep 2023 18:55:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 83072414DA
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D95371BF20B
 for <buildroot@lists.busybox.net>; Mon, 11 Sep 2023 18:55:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AEFE961055
 for <buildroot@lists.busybox.net>; Mon, 11 Sep 2023 18:55:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AEFE961055
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8gICB_f4Ur_q for <buildroot@lists.busybox.net>;
 Mon, 11 Sep 2023 18:55:17 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3C1096104F
 for <buildroot@buildroot.org>; Mon, 11 Sep 2023 18:55:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3C1096104F
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0DBDAC0003;
 Mon, 11 Sep 2023 18:54:49 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1qfm3c-00Fir5-Vz; Mon, 11 Sep 2023 20:54:49 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
References: <20230808172625.20598-1-ps.report@gmx.net>
 <20230808200844.6db0eb89@windsurf>
Date: Mon, 11 Sep 2023 20:54:48 +0200
In-Reply-To: <20230808200844.6db0eb89@windsurf> (Thomas Petazzoni via
 buildroot's message of "Tue, 8 Aug 2023 20:08:44 +0200")
Message-ID: <87il8gbkw7.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH v1] package/ntpsec: bump version to 1.2.2a
 (fixes CVE-2023-4012)
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
Cc: Peter Seiderer <ps.report@gmx.net>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Thomas" == Thomas Petazzoni via buildroot <buildroot@buildroot.org> writes:

 > Hello Peter,
 > On Tue,  8 Aug 2023 19:26:25 +0200
 > Peter Seiderer <ps.report@gmx.net> wrote:

 >> Fixes CVE-2023-4012 (see [1] for details).
 >> 
 >> [1] https://gitlab.com/NTPsec/ntpsec/-/releases/NTPsec_1_2_2a
 >> 
 >> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

 > For security bumps, we like the commit title to be:

 > 	package/ntpsec: security bump to version 1.2.2a

 > and have the details of which CVE is addressed in the rest of the
 > commit message.

 > I fixed that up when applying to master. Thanks!

Committed to 2023.02.x and 2023.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
