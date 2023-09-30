Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90F2EE77368
	for <buildroot@archiver.kernel.org>; Sat, 30 Sep 2023 10:29:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4742860008;
	Sat, 30 Sep 2023 10:29:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4742860008
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4dH4HgPQS_Go; Sat, 30 Sep 2023 10:29:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EB5F460FE6;
	Sat, 30 Sep 2023 10:29:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EB5F460FE6
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 38EE11BF297
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 10:29:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 23A4740135
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 10:29:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 23A4740135
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SzOgena2cArn for <buildroot@lists.busybox.net>;
 Sat, 30 Sep 2023 10:29:51 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 10E214010C
 for <buildroot@buildroot.org>; Sat, 30 Sep 2023 10:29:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 10E214010C
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9BBE360002;
 Sat, 30 Sep 2023 10:29:48 +0000 (UTC)
Received: from peko by dell.home with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1qmXEJ-00AOuI-Vx; Sat, 30 Sep 2023 12:29:48 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20230927205100.640507-1-fontaine.fabrice@gmail.com>
Date: Sat, 30 Sep 2023 12:29:47 +0200
In-Reply-To: <20230927205100.640507-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Wed, 27 Sep 2023 22:51:00 +0200")
Message-ID: <87zg149co4.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/libyang: security bump to
 version 2.1.111
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
Cc: Heiko Thiery <heiko.thiery@gmail.com>,
 Jan =?utf-8?Q?Kundr=C3=A1t?= <jan.kundrat@cesnet.cz>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > - Fix CVE-2023-26916: libyang from v2.0.164 to v2.1.30 was discovered to
 >   contain a NULL pointer dereference via the function lys_parse_mem at
 >   lys_parse_mem.c.
 > - Fix CVE-2023-26917: libyang from v2.0.164 to v2.1.30 was discovered to
 >   contain a NULL pointer dereference via the function
 >   lysp_stmt_validate_value at lys_parse_mem.c.

 > https://github.com/CESNET/libyang/releases/tag/v2.1.55
 > https://github.com/CESNET/libyang/releases/tag/v2.1.80
 > https://github.com/CESNET/libyang/releases/tag/v2.1.111

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2023.02.x and 2023.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
