Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED30DC83F01
	for <buildroot@archiver.kernel.org>; Sun, 27 Aug 2023 21:16:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3CD2360B14;
	Sun, 27 Aug 2023 21:16:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3CD2360B14
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NtG2sNunLiEZ; Sun, 27 Aug 2023 21:16:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9DEF860A9D;
	Sun, 27 Aug 2023 21:16:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9DEF860A9D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id ACF6D1BF4D7
 for <buildroot@lists.busybox.net>; Sun, 27 Aug 2023 21:16:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 865C681E4D
 for <buildroot@lists.busybox.net>; Sun, 27 Aug 2023 21:16:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 865C681E4D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KIcm1cwdfg4V for <buildroot@lists.busybox.net>;
 Sun, 27 Aug 2023 21:16:26 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0E72881E03
 for <buildroot@buildroot.org>; Sun, 27 Aug 2023 21:16:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0E72881E03
Received: by mail.gandi.net (Postfix) with ESMTPSA id D110F24000A;
 Sun, 27 Aug 2023 21:16:22 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1qaN7N-005KR6-Ue; Sun, 27 Aug 2023 23:16:21 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Marcus Hoffmann <marcus.hoffmann@othermo.de>
References: <20230720053031.33014-1-bernd@kuhls.net>
 <46d6aed9-d971-d754-b080-6b151eca3065@othermo.de>
 <87zg2d7jbo.fsf@48ers.dk>
Date: Sun, 27 Aug 2023 23:16:21 +0200
In-Reply-To: <87zg2d7jbo.fsf@48ers.dk> (Peter Korsgaard's message of "Sat, 26
 Aug 2023 20:24:43 +0200")
Message-ID: <87bkes6va2.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/libcurl: bump version to 8.2.0
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

>>>>> "Marcus" == Marcus Hoffmann <marcus.hoffmann@othermo.de> writes:
 >> On 20.07.23 07:30, Bernd Kuhls wrote:
 >>> Changelog: https://curl.se/changes.html#8_2_0

 >> This release contains a security fix as well:
 >> https://curl.se/docs/CVE-2023-32001.html

 > Correct. I have backported this to 2023.02.x and 2023.05.x.

They have now retracted the CVE as not a curl problem, but oh well. I
will not revert the bumps in 2023.02.x / 2023.05.x unless the new
version causes a lot of problems.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
