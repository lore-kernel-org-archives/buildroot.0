Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 243D9C4167B
	for <buildroot@archiver.kernel.org>; Wed, 29 Nov 2023 09:21:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BD5C181E5A;
	Wed, 29 Nov 2023 09:21:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BD5C181E5A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ow34gnj79jmJ; Wed, 29 Nov 2023 09:21:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1D1C081E2E;
	Wed, 29 Nov 2023 09:21:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1D1C081E2E
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6F71E1BF3D9
 for <buildroot@lists.busybox.net>; Wed, 29 Nov 2023 09:21:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 489314179B
 for <buildroot@lists.busybox.net>; Wed, 29 Nov 2023 09:21:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 489314179B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Db939DiTOI-A for <buildroot@lists.busybox.net>;
 Wed, 29 Nov 2023 09:21:31 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp4.osuosl.org (Postfix) with ESMTPS id ECC31405A2
 for <buildroot@buildroot.org>; Wed, 29 Nov 2023 09:21:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ECC31405A2
Received: by mail.gandi.net (Postfix) with ESMTPSA id D037A20013;
 Wed, 29 Nov 2023 09:21:27 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1r8Gl5-00173h-0K;
 Wed, 29 Nov 2023 10:21:27 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20231127221119.1361708-1-fontaine.fabrice@gmail.com>
Date: Wed, 29 Nov 2023 10:21:27 +0100
In-Reply-To: <20231127221119.1361708-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Mon, 27 Nov 2023 23:11:19 +0100")
Message-ID: <87o7fcap9k.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/gsl: fix musl build on m68k
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

 > Update patch to fix the following musl build failure with m68k which is
 > only raised (for an unknown reason) since bump to version 2.7.1 in commit
 > 3e48f8358e519f9c24262a6549d8f6c78ee01add:

 > In file included from fp.c:6:
 > fp-gnum68k.c:21:10: fatal error: fpu_control.h: No such file or directory
 >    21 | #include <fpu_control.h>
 >       |          ^~~~~~~~~~~~~~~

 > Add also upstream link to first patch iteration which was sent in
 > November 2022 but didn't get it any reply (like most of the other emails
 > sent to bug-gsl@gnu.org ...)

 > Fixes:
 >  - http://autobuild.buildroot.org/results/e59636f6ac148807c1c67f09eef0e0a9f5d52303

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
