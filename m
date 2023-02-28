Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0151CC64EC4
	for <buildroot@archiver.kernel.org>; Tue, 28 Feb 2023 21:05:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 870D960B58;
	Tue, 28 Feb 2023 21:05:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 870D960B58
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ql9ZPyNSYdqA; Tue, 28 Feb 2023 21:05:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C21A660AEF;
	Tue, 28 Feb 2023 21:05:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C21A660AEF
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 53E2B1BF2BF
 for <buildroot@lists.busybox.net>; Tue, 28 Feb 2023 21:05:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2E5B740126
 for <buildroot@lists.busybox.net>; Tue, 28 Feb 2023 21:05:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2E5B740126
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ASeWMysTmHJ4 for <buildroot@lists.busybox.net>;
 Tue, 28 Feb 2023 21:05:47 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D9CC2400C8
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D9CC2400C8
 for <buildroot@buildroot.org>; Tue, 28 Feb 2023 21:05:46 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 17C391BF20B
 for <buildroot@buildroot.org>; Tue, 28 Feb 2023 21:05:43 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>) id 1pX7AN-00BOON-1E
 for buildroot@buildroot.org; Tue, 28 Feb 2023 22:05:43 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
References: <20230210150456.4535-1-peter@korsgaard.com>
Date: Tue, 28 Feb 2023 22:05:43 +0100
In-Reply-To: <20230210150456.4535-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Fri, 10 Feb 2023 16:04:56 +0100")
Message-ID: <878rghh55k.fsf@dell.be.48ers.dk>
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

 > make[3]: Entering directory
 > '/home/buildroot/autobuild/instance-2/output-1/build/mosh-1.4.0/scripts'
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

Committed to 2022.11.x and 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
