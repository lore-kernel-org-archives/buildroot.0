Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BB8BE7737C
	for <buildroot@archiver.kernel.org>; Sat, 30 Sep 2023 17:11:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1A37E415AE;
	Sat, 30 Sep 2023 17:11:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1A37E415AE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dZwHXZaLLIpY; Sat, 30 Sep 2023 17:11:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0FEC640396;
	Sat, 30 Sep 2023 17:11:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0FEC640396
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 45C6F1BF2A7
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 17:11:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1BE6660F66
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 17:11:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1BE6660F66
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5Xpz12-CXNUq for <buildroot@lists.busybox.net>;
 Sat, 30 Sep 2023 17:11:00 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5F7BB60AE7
 for <buildroot@buildroot.org>; Sat, 30 Sep 2023 17:11:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5F7BB60AE7
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6DB80240003;
 Sat, 30 Sep 2023 17:10:57 +0000 (UTC)
Received: from peko by dell.home with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1qmdUW-00FPro-RO; Sat, 30 Sep 2023 19:10:56 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20230212130336.373391-1-fontaine.fabrice@gmail.com>
Date: Sat, 30 Sep 2023 19:10:56 +0200
In-Reply-To: <20230212130336.373391-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 12 Feb 2023 14:03:36 +0100")
Message-ID: <87lecn8u3j.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/olsr: fix build with gpsd >=
 3.25
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

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Fix the following build failure with gpsd >= 3.25 raised since commit
 > 3c7fece853f3def9a425eccc384b9dacb1010051:

 > In file included from src/configuration.h:50,
 >                  from src/configuration.c:46:
 > src/gpsdclient.h:64:8: error: redefinition of 'struct fixsource_t'
 >    64 | struct fixsource_t {
 >       |        ^~~~~~~~~~~
 > In file included from src/gpsdclient.h:49,
 >                  from src/configuration.h:50,
 >                  from src/configuration.c:46:
 > /tmp/instance-17/output-1/host/aarch64-buildroot-linux-gnu/sysroot/usr/include/gps.h:2714:8: note: originally defined here
 >  2714 | struct fixsource_t
 >       |        ^~~~~~~~~~~

 > Fixes:
 >  - http://autobuild.buildroot.org/results/47a619686bb47debd525c92aa7e14bee5c40ca9e

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Yanns fix apprently never made it upstream, so committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
