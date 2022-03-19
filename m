Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AA50C433FE
	for <buildroot@archiver.kernel.org>; Sat, 19 Mar 2022 19:33:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BD51540492;
	Sat, 19 Mar 2022 19:33:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dwAp86qzhudg; Sat, 19 Mar 2022 19:33:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A17FA4048D;
	Sat, 19 Mar 2022 19:33:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CB8B41BF255
 for <buildroot@lists.busybox.net>; Sat, 19 Mar 2022 19:33:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B871680DB9
 for <buildroot@lists.busybox.net>; Sat, 19 Mar 2022 19:33:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9EW1F4qFC_Ap for <buildroot@lists.busybox.net>;
 Sat, 19 Mar 2022 19:33:47 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B38F180D8C
 for <buildroot@buildroot.org>; Sat, 19 Mar 2022 19:33:46 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 15C05FF802;
 Sat, 19 Mar 2022 19:33:42 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1nVepZ-00ElrQ-SW; Sat, 19 Mar 2022 20:33:41 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Arnout Vandecappelle <arnout@mind.be>
References: <20220222220255.22327-1-petr.vorel@gmail.com>
 <48945229-3116-363f-f61f-89d495695cc1@mind.be>
Date: Sat, 19 Mar 2022 20:33:41 +0100
In-Reply-To: <48945229-3116-363f-f61f-89d495695cc1@mind.be> (Arnout
 Vandecappelle's message of "Sat, 12 Mar 2022 20:43:40 +0100")
Message-ID: <87mthlpwiy.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [RFC][PATCH 1/1] package/bind: bump to version
 9.16.26
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

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

 > On 22/02/2022 23:02, Petr Vorel wrote:
 >> BIND 9.11 EOL in March, 2022. BIND 9.16 is current Stable/ESV version.
 >> Changes:
 >> * libuv (new dependency)
 >> * openssl is now mandatory
 >> * zlib must be detected with PKG_CONFIG_PATH (specifying zlib
 >> installation path is not supported)
 >> * bind9-config and isc-config.sh removed
 >> * updated COPYRIGHT hash
 >> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>

 >  Applied to master, thanks.

 >  I guess we'll get complaints if it doesn't work :-)

Committed to 2022.02.x given the immediate EOL of 9.11.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
