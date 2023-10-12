Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFA13CDB46E
	for <buildroot@archiver.kernel.org>; Thu, 12 Oct 2023 16:47:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 72970405BE;
	Thu, 12 Oct 2023 16:47:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 72970405BE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gjj8XPhjuPAb; Thu, 12 Oct 2023 16:47:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C0F92400DC;
	Thu, 12 Oct 2023 16:47:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C0F92400DC
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E01E81BF2F8
 for <buildroot@lists.busybox.net>; Thu, 12 Oct 2023 16:47:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B719060644
 for <buildroot@lists.busybox.net>; Thu, 12 Oct 2023 16:47:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B719060644
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id q_j1fiV65HB9 for <buildroot@lists.busybox.net>;
 Thu, 12 Oct 2023 16:47:48 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 41FD160608
 for <buildroot@buildroot.org>; Thu, 12 Oct 2023 16:47:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 41FD160608
Received: by mail.gandi.net (Postfix) with ESMTPSA id 12046FF80A;
 Thu, 12 Oct 2023 16:47:43 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1qqyqX-003gaW-KA; Thu, 12 Oct 2023 18:47:37 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20230916135435.113400-1-fontaine.fabrice@gmail.com>
 <87edigaro0.fsf@48ers.dk>
Date: Thu, 12 Oct 2023 18:47:37 +0200
In-Reply-To: <87edigaro0.fsf@48ers.dk> (Peter Korsgaard's message of "Sat, 30
 Sep 2023 12:20:31 +0200")
Message-ID: <87pm1j949i.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/linux-pam: needs gcc >= 4.9
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
Cc: =?utf-8?Q?Herv=C3=A9?= Codina <herve.codina@bootlin.com>,
 Karoly Kasza <kaszak@gmail.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Raphael Pavlidis <raphael.pavlidis@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:
 >> linux-pam raises the following build failure with gcc 4.8 since bump to
 >> version 1.5.3 in commit f8147e27cdac8f998ec6644a09ce4e8d62b6433c and
 >> https://github.com/linux-pam/linux-pam/commit/8f9816b57e3a475fc2d2cbb106c188b778098f85:

 >> pam_access.c: In function 'pam_sm_authenticate':
 >> pam_access.c:1084:13: error: 'for' loop initial declarations are only allowed in C99 mode
 >> for (int i = 0; filename_list[i] != NULL; i++) {
 >> ^

 >> Those build failures could be fixed by adding -std=c99 but then the
 >> build will fails because stdadtomic.h is mandatory since
 >> https://github.com/linux-pam/linux-pam/commit/a35e092e24ee7632346a0e1b4a203c04d4cd2c62

 >> Fixes:
 >> - http://autobuild.buildroot.org/results/9b2ba987d2c873f4a7caea72707acb655279d16b

 >> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

 > Committed, thanks.

Committed to 2023.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
