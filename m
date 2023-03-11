Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ADA7C74A44
	for <buildroot@archiver.kernel.org>; Sat, 11 Mar 2023 08:52:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 87970822E1;
	Sat, 11 Mar 2023 08:52:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 87970822E1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aT8uM8iml4c3; Sat, 11 Mar 2023 08:52:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DEFF7822B2;
	Sat, 11 Mar 2023 08:52:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DEFF7822B2
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7E4BE1BF312
 for <buildroot@lists.busybox.net>; Sat, 11 Mar 2023 08:52:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 542A3400D2
 for <buildroot@lists.busybox.net>; Sat, 11 Mar 2023 08:52:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 542A3400D2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HBOXpnGW3gCo for <buildroot@lists.busybox.net>;
 Sat, 11 Mar 2023 08:52:39 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C42BB400C8
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C42BB400C8
 for <buildroot@buildroot.org>; Sat, 11 Mar 2023 08:52:38 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 07CE11C0003;
 Sat, 11 Mar 2023 08:52:34 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1pauxt-007O3a-1Q; Sat, 11 Mar 2023 09:52:33 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20230221133608.966158-1-fontaine.fabrice@gmail.com>
Date: Sat, 11 Mar 2023 09:52:32 +0100
In-Reply-To: <20230221133608.966158-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Tue, 21 Feb 2023 14:36:08 +0100")
Message-ID: <87y1o31xgv.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] support/dependencies/dependencies.sh:
 require FileHandle perl package for ace
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

 > ace needs FileHandle module:
 > Can't locate FileHandle.pm in @INC (you may need to install the
 > FileHandle module) (@INC contains:
 > /home/buildroot/autobuild/instance-0/output-1/host/lib/perl
 > /usr/local/lib64/perl5/5.36 /usr/local/share/perl5/5.36
 > /usr/lib64/perl5/vendor_perl /usr/share/perl5/vendor_perl
 > /usr/lib64/perl5 /usr/share/perl5) at
 > /home/buildroot/autobuild/instance-0/output-1/build/ace-7.0.6/MPC/prj_install.pl
 > line 17.
 > BEGIN failed--compilation aborted at
 > /home/buildroot/autobuild/instance-0/output-1/build/ace-7.0.6/MPC/prj_install.pl
 > line 17.

 > Fixes:
 >  - http://autobuild.buildroot.org/results/9dee7c09fd7b41d276df0285a0f3dcae1a71f041

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
