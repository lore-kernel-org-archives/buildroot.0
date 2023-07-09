Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AD7EEB64DC
	for <buildroot@archiver.kernel.org>; Sun,  9 Jul 2023 22:15:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C64A24032B;
	Sun,  9 Jul 2023 22:15:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C64A24032B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8U7f8Ujyp3Rz; Sun,  9 Jul 2023 22:15:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A572140089;
	Sun,  9 Jul 2023 22:15:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A572140089
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F2B7D1BF484
 for <buildroot@lists.busybox.net>; Sun,  9 Jul 2023 22:15:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CB9558148E
 for <buildroot@lists.busybox.net>; Sun,  9 Jul 2023 22:15:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CB9558148E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QUwUndS1VhBC for <buildroot@lists.busybox.net>;
 Sun,  9 Jul 2023 22:15:41 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 914468146C
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 914468146C
 for <buildroot@buildroot.org>; Sun,  9 Jul 2023 22:15:41 +0000 (UTC)
X-GND-Sasl: peter@korsgaard.com
X-GND-Sasl: peter@korsgaard.com
X-GND-Sasl: peter@korsgaard.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 406A41BF205;
 Sun,  9 Jul 2023 22:15:38 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1qIcgr-005DNV-6x; Mon, 10 Jul 2023 00:15:37 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Danny Wood <danny@rotronics.co.uk>
References: <BE1P281MB166840C4621F6F53B7B1B3FEEC5FA@BE1P281MB1668.DEUP281.PROD.OUTLOOK.COM>
 <87v8fjpoqi.fsf@48ers.dk>
 <d23d2495-f724-98b8-1f09-23a3914f3510@rotronics.co.uk>
Date: Mon, 10 Jul 2023 00:15:37 +0200
In-Reply-To: <d23d2495-f724-98b8-1f09-23a3914f3510@rotronics.co.uk> (Danny
 Wood's message of "Thu, 22 Jun 2023 10:24:28 +0100")
Message-ID: <87sf9wybna.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] OpenSSL v3.0
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
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>, "May,
 Torsten" <torsten.may@ebee.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Danny" == Danny Wood <danny@rotronics.co.uk> writes:

 > On 19/06/2023 14:26, Peter Korsgaard wrote:
 >>>>>>> "May," == May, Torsten <torsten.may@ebee.de> writes:
 >> > Hi Peter,
 >> > as September is approaching quickly, is there any progress on that topic?
 >> 
 >> Unfortunately not. So far no patches for openssl 3.x have been
 >> submitted.
 >> 
 >> If you are using openssl then now would be a VERY good time to
 >> contribute an update to the 3.x series.
 >> 

 > Hi,

 > Attached is a patch I have made to build v3.0.9 of OpenSSL (LTS until 2026).

 > Everything in my build tree compiled fine with the new version apart
 > from MariaDB which also needed updating, attached is an additional
 > patch which updates MariaDB to v10.11.4 (LTS until 2026)

 > These both apply on top of the 2023.02.2 buildroot tar balls.

 > I have been running these updated packages for a couple of days and
 > haven't had any issues so far.

Committed the mariadb bump to master after fixing the README.md hash,
thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
