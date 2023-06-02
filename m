Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18995C77B7A
	for <buildroot@archiver.kernel.org>; Fri,  2 Jun 2023 19:46:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B49404284D;
	Fri,  2 Jun 2023 19:46:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B49404284D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eyERod94hbT7; Fri,  2 Jun 2023 19:46:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A378342708;
	Fri,  2 Jun 2023 19:46:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A378342708
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 35E601BF255
 for <buildroot@lists.busybox.net>; Fri,  2 Jun 2023 19:46:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0F3F74012F
 for <buildroot@lists.busybox.net>; Fri,  2 Jun 2023 19:46:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0F3F74012F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RXLRGQbeM2Zm for <buildroot@lists.busybox.net>;
 Fri,  2 Jun 2023 19:46:42 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9585E400A4
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9585E400A4
 for <buildroot@buildroot.org>; Fri,  2 Jun 2023 19:46:42 +0000 (UTC)
X-GND-Sasl: peter@korsgaard.com
X-GND-Sasl: peter@korsgaard.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id B6C52E0002;
 Fri,  2 Jun 2023 19:46:40 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1q5AjP-00Bsxl-Tc; Fri, 02 Jun 2023 21:46:39 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Romain Naour <romain.naour@gmail.com>
References: <20230528190111.2430580-1-romain.naour@gmail.com>
 <20230528190111.2430580-5-romain.naour@gmail.com>
Date: Fri, 02 Jun 2023 21:46:39 +0200
In-Reply-To: <20230528190111.2430580-5-romain.naour@gmail.com> (Romain Naour's
 message of "Sun, 28 May 2023 21:01:11 +0200")
Message-ID: <87mt1hd4v4.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 5/5] package/ipython: add missing
 dependencies
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

>>>>> "Romain" == Romain Naour <romain.naour@gmail.com> writes:

 > As reported [1], the test TestIPythonPy3 fail since it was updated
 > to 8.6.0 release just after 2022.11.

 >   ModuleNotFoundError: No module named 'stack_data'

 > Indeed there is no such python3-stack-data in Buildroot.
 > For example, Fedora packaging added python3-stack-data while updating
 > to ipython 8.0.1.

 > With python-stack-data added, the test TestIPythonPy3 still fail
 > with:

 >   ModuleNotFoundError: No module named 'sqlite3'

 > Since ipython 8 sqlite3 fallback imports has been removed [2].

 > Fixes:
 > https://gitlab.com/buildroot.org/buildroot/-/jobs/4322819089

 > [1] http://lists.busybox.net/pipermail/buildroot/2023-May/668086.html
 > [2] https://github.com/ipython/ipython/commit/7a0bdabecfa745b60c3a711e1da2df378687e746

 > Signed-off-by: Romain Naour <romain.naour@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
