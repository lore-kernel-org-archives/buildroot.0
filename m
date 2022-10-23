Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 134B3ECAAA1
	for <buildroot@archiver.kernel.org>; Sun, 23 Oct 2022 18:55:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8BE4E403E0;
	Sun, 23 Oct 2022 18:55:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8BE4E403E0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4zoh1dJkROn6; Sun, 23 Oct 2022 18:55:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C02F040395;
	Sun, 23 Oct 2022 18:55:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C02F040395
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 638571BF308
 for <buildroot@lists.busybox.net>; Sun, 23 Oct 2022 18:55:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4C470813D4
 for <buildroot@lists.busybox.net>; Sun, 23 Oct 2022 18:55:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4C470813D4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NupH-MGO2-0Y for <buildroot@lists.busybox.net>;
 Sun, 23 Oct 2022 18:55:53 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 32A7E813D1
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 32A7E813D1
 for <buildroot@buildroot.org>; Sun, 23 Oct 2022 18:55:52 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id CD7121C0002;
 Sun, 23 Oct 2022 18:55:49 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1omg8T-00Cc81-11; Sun, 23 Oct 2022 20:55:49 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20221022203335.131939-1-fontaine.fabrice@gmail.com>
Date: Sun, 23 Oct 2022 20:55:48 +0200
In-Reply-To: <20221022203335.131939-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sat, 22 Oct 2022 22:33:35 +0200")
Message-ID: <8735be2wuj.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2,1/1] package/uftp: bump to version 5.0.1
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
Cc: Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Version 5.0.1 - 8/2/2022
 >  - On very low speed transfers (<10Kbps) sessions would time out due to
 >    a very large interpacket transmission interval.  Fixed by putting a
 >    lower limit on the advertised GRTT of of the interpacket transmission
 >    interval.
 >  - Sending of ABORT messages on early shutdown would sometimes fail due
 >    to OpenSSL cleanup functions running before application cleanup.
 >    Changed the ordering of atexit() handlers to ensure OpenSSL cleanup
 >    happens last.
 >  - Fixed missing timestamp update when clients read CONG_CTRL messages
 >  - Fix to GRTT handling on server to ensure it doesn't fall below minumim.
 >  - Fixed bypassed checking of existing files on client for backup
 >  - Various logging fixes

 > https://sourceforge.net/projects/uftp-multicast/files/Changes.txt/download

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 > ---
 > Changes v1 -> v2:
 >  - Update tarball hash

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
