Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F07A0C636D3
	for <buildroot@archiver.kernel.org>; Sun, 12 Feb 2023 08:29:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4EA6D8148D;
	Sun, 12 Feb 2023 08:29:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4EA6D8148D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rRmkoMywRTel; Sun, 12 Feb 2023 08:29:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4111D8148E;
	Sun, 12 Feb 2023 08:29:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4111D8148E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CEE191BF4E2
 for <buildroot@lists.busybox.net>; Sun, 12 Feb 2023 08:29:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9A1B48148E
 for <buildroot@lists.busybox.net>; Sun, 12 Feb 2023 08:29:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9A1B48148E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Lso6bHwCXgvY for <buildroot@lists.busybox.net>;
 Sun, 12 Feb 2023 08:29:32 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DCC918148D
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::231])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DCC918148D
 for <buildroot@buildroot.org>; Sun, 12 Feb 2023 08:29:31 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id BAB89100005
 for <buildroot@buildroot.org>; Sun, 12 Feb 2023 08:29:28 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>) id 1pR7jj-001uxw-KA
 for buildroot@buildroot.org; Sun, 12 Feb 2023 09:29:27 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
References: <20230210150456.4535-1-peter@korsgaard.com>
Date: Sun, 12 Feb 2023 09:29:27 +0100
In-Reply-To: <20230210150456.4535-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Fri, 10 Feb 2023 16:04:56 +0100")
Message-ID: <875yc7cmmw.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] support/dependencies/dependencies.sh:
 require diagnostics perl package for mosh
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes:
 > http://autobuild.buildroot.net/results/820/820e98b1c126469b1f180f078d102ded43b9c40e/

 > scripts/Makefile.am of mosh-1.4.0 needs the perl diagnostics module on the host:

 > make[3]: Entering directory '/home/buildroot/autobuild/instance-2/output-1/build/mosh-1.4.0/scripts'
 > perl -Mdiagnostics -c ./mosh.pl
 > Can't locate diagnostics.pm in @INC (you may need to install the
 > diagnostics module) (@INC contains:
 > /home/buildroot/autobuild/instance-2/output-1/host/lib/perl
 > /usr/local/lib64/perl5/5.36 /usr/local/share/perl5/5.36
 > /usr/lib64/perl5/vendor_perl /usr/share/perl5/vendor_perl
 > /usr/lib64/perl5 /usr/share/perl5).
 > BEGIN failed--compilation aborted.

 > So add a check for it in dependencies.sh similar to the other perl modules.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
