Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D05DCF3967
	for <buildroot@archiver.kernel.org>; Thu, 19 Sep 2024 20:28:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0A84641498;
	Thu, 19 Sep 2024 20:28:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XwAqh9El2zVx; Thu, 19 Sep 2024 20:28:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CDCA6414BB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CDCA6414BB;
	Thu, 19 Sep 2024 20:28:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1603E1BF343
 for <buildroot@lists.busybox.net>; Thu, 19 Sep 2024 20:28:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F0DDD84C42
 for <buildroot@lists.busybox.net>; Thu, 19 Sep 2024 20:28:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8vL9-FNdBmD8 for <buildroot@lists.busybox.net>;
 Thu, 19 Sep 2024 20:28:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::221;
 helo=relay1-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org EA1A184C3E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EA1A184C3E
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EA1A184C3E
 for <buildroot@buildroot.org>; Thu, 19 Sep 2024 20:28:02 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 42FE5240003;
 Thu, 19 Sep 2024 20:27:59 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1srNks-00GepL-1Z;
 Thu, 19 Sep 2024 22:27:58 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
References: <20240909063340.533620-1-dario.binacchi@amarulasolutions.com>
 <20240914112624.52462119@windsurf>
Date: Thu, 19 Sep 2024 22:27:58 +0200
In-Reply-To: <20240914112624.52462119@windsurf> (Thomas Petazzoni via
 buildroot's message of "Sat, 14 Sep 2024 11:26:24 +0200")
Message-ID: <87a5g3jsmp.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/xenomai: fix build with gcc 11
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Thomas" == Thomas Petazzoni via buildroot <buildroot@buildroot.org> writes:

 > On Mon,  9 Sep 2024 08:33:39 +0200
 > Dario Binacchi <dario.binacchi@amarulasolutions.com> wrote:

 >> The commit adds an upstream patch to fix the following build failure:
 >> 
 >> latency.c: In function 'dump_histo_gnuplot':
 >> latency.c:415:9: error: 'fclose' called on pointer returned from a
 >> mismatched allocation function [-Werror=mismatched-dealloc]
 >> 415 |         fclose(ifp);
 >> |         ^~~~~~~~~~~
 >> latency.c:404:15: note: returned from 'popen'
 >> 404 |         ifp = popen(xconf, "r");
 >> |               ^~~~~~~~~~~~~~~~~
 >> 
 >> Fixes:
 >> - http://autobuild.buildroot.org/results/e15ccef2f2bd58482204b5061f77e76a8a540ebd
 >> 
 >> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
 >> ---
 >> ...y-Use-corresponding-pclose-for-popen.patch | 30 +++++++++++++++++++
 >> 1 file changed, 30 insertions(+)
 >> create mode 100644
 >> package/xenomai/3.0.10/0005-testsuite-latency-Use-corresponding-pclose-for-popen.patch

 > Applied to master, thanks.

Committed to 2024.02.x and 2024.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
