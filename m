Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21F6DC25B0E
	for <buildroot@archiver.kernel.org>; Tue, 16 Aug 2022 20:07:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BA62760B20;
	Tue, 16 Aug 2022 20:07:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BA62760B20
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MahCpZPX8ibd; Tue, 16 Aug 2022 20:07:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E9851605E0;
	Tue, 16 Aug 2022 20:07:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E9851605E0
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 099CD1BF470
 for <buildroot@lists.busybox.net>; Tue, 16 Aug 2022 20:07:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D7E6681337
 for <buildroot@lists.busybox.net>; Tue, 16 Aug 2022 20:07:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D7E6681337
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id E_CAUf2sFDJW for <buildroot@lists.busybox.net>;
 Tue, 16 Aug 2022 20:07:10 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C355F81335
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C355F81335
 for <buildroot@buildroot.org>; Tue, 16 Aug 2022 20:07:09 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id C5A2120002;
 Tue, 16 Aug 2022 20:07:07 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1oO2qA-009ch6-VY; Tue, 16 Aug 2022 22:07:06 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20220723201014.218864-1-fontaine.fabrice@gmail.com>
Date: Tue, 16 Aug 2022 22:07:06 +0200
In-Reply-To: <20220723201014.218864-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sat, 23 Jul 2022 22:10:14 +0200")
Message-ID: <871qtgc5qt.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/jquery-validation: security
 bump to version 1.19.5
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

 > - Fix CVE-2021-43306: An exponential ReDoS (Regular Expression Denial
 >   of Service) can be triggered in the jquery-validation npm package,
 >   when an attacker is able to supply arbitrary input to the url2 method
 > - Fix CVE-2022-31147: The jQuery Validation Plugin (jquery-validation)
 >   provides drop-in validation for forms. Versions of jquery-validation
 >   prior to 1.19.5 are vulnerable to regular expression denial of service
 >   (ReDoS) when an attacker is able to supply arbitrary input to the url2
 >   method. This is due to an incomplete fix for CVE-2021-43306. Users
 >   should upgrade to version 1.19.5 to receive a patch.
 > - Use LICENSE.md instead of README.md which is available since version
 >   1.14.0 and
 >   https://github.com/jquery-validation/jquery-validation/commit/96b7036eb45375eb4861082d8ca442d94a9c666c

 > https://github.com/jquery-validation/jquery-validation/releases/tag/1.19.4
 > https://github.com/jquery-validation/jquery-validation/releases/tag/1.19.5

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2022.05.x and 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
