Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 438B7C38147
	for <buildroot@archiver.kernel.org>; Sat, 16 Dec 2023 09:49:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CB2DE4209D;
	Sat, 16 Dec 2023 09:49:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CB2DE4209D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gmn6DOkmK-s5; Sat, 16 Dec 2023 09:49:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3A36441E81;
	Sat, 16 Dec 2023 09:49:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3A36441E81
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BD76A1BF346
 for <buildroot@lists.busybox.net>; Sat, 16 Dec 2023 09:49:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9674283F14
 for <buildroot@lists.busybox.net>; Sat, 16 Dec 2023 09:49:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9674283F14
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FFgdyjsMpTSQ for <buildroot@lists.busybox.net>;
 Sat, 16 Dec 2023 09:49:29 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 90AFC83F11
 for <buildroot@buildroot.org>; Sat, 16 Dec 2023 09:49:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 90AFC83F11
Received: by mail.gandi.net (Postfix) with ESMTPSA id D033220002;
 Sat, 16 Dec 2023 09:49:26 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rERIU-00FOun-0m;
 Sat, 16 Dec 2023 10:49:26 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Julien Olivain <ju.o@free.fr>
References: <20231211191400.61689-1-ju.o@free.fr>
Date: Sat, 16 Dec 2023 10:49:26 +0100
In-Reply-To: <20231211191400.61689-1-ju.o@free.fr> (Julien Olivain's message
 of "Mon, 11 Dec 2023 20:14:00 +0100")
Message-ID: <87bkaqbhp5.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/z3: bump to version 4.12.4
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

>>>>> "Julien" == Julien Olivain <ju.o@free.fr> writes:

 > For change log since 4.12.2, see:
 > https://github.com/Z3Prover/z3/blob/z3-4.12.4/RELEASE_NOTES.md#version-4124

 > Signed-off-by: Julien Olivain <ju.o@free.fr>
 > ---
 > Patch tested on branch master at commit b79fb3c with commands:

 >     utils/docker-run make check-package
 >     ...
 >     0 warnings generated

 >     support/testing/run-tests \
 >         -d dl -o output_folder \
 >         tests.package.test_z3
 >     ...
 >     OK

 >     utils/test-pkg -p z3
 >     ...
 >     6 builds, 4 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
