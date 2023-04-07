Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E9C5C76196
	for <buildroot@archiver.kernel.org>; Fri,  7 Apr 2023 07:07:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BDB1141FEA;
	Fri,  7 Apr 2023 07:07:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BDB1141FEA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Z87mjn3Nud4k; Fri,  7 Apr 2023 07:07:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C792F41FA8;
	Fri,  7 Apr 2023 07:07:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C792F41FA8
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id ADF901BF3E1
 for <buildroot@lists.busybox.net>; Fri,  7 Apr 2023 07:07:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 929AA41FA8
 for <buildroot@lists.busybox.net>; Fri,  7 Apr 2023 07:07:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 929AA41FA8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UIuUgRdO3xGB for <buildroot@lists.busybox.net>;
 Fri,  7 Apr 2023 07:07:40 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1BA9841F54
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1BA9841F54
 for <buildroot@buildroot.org>; Fri,  7 Apr 2023 07:07:39 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 00DA124000A;
 Fri,  7 Apr 2023 07:07:35 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1pkgC6-00H6Be-RO; Fri, 07 Apr 2023 09:07:34 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Andreas Hilse via buildroot <buildroot@buildroot.org>
References: <CANabuZdh8oCUxYeg2A4Mer9b=cwRQQv1FB3BorQSVzNatvBkFQ@mail.gmail.com>
Date: Fri, 07 Apr 2023 09:07:34 +0200
In-Reply-To: <CANabuZdh8oCUxYeg2A4Mer9b=cwRQQv1FB3BorQSVzNatvBkFQ@mail.gmail.com>
 (Andreas Hilse via buildroot's message of "Thu, 6 Apr 2023 13:33:36
 +0200")
Message-ID: <87355cxj9l.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] memtest86+ new version
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
Cc: Andreas Hilse <andreas.hilse@googlemail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Andreas" == Andreas Hilse via buildroot <buildroot@buildroot.org> writes:

Hi,

 > Hello,
 > there is a new version of memtest86+ available, but the distribution
 > of releases has changed in a way that the prebuilt binaries are not
 > anymore contained in the source tarball.
 > Now there is a source and a binary archive available from the website
 > as well as a github repo.

 > Current .mk takes the prebuilt binary from the source tarball.

 > Since there still seem to be problems building from source (refer to
 > comment in .mk, tried with bootlin x86 toolchain), how could I go and
 > approach updating the package using the prebuilt binary and still
 > fulfill license obligations (deliver the source code), so that both
 > the source and binary archive are available with make legal-info?

We have <pkg>_ACTUAL_SOURCE_TARBALL for such exact case (E.G. we have
similar issues with the prebuilt toolchains). See the manual for
details:

https://buildroot.org/downloads/manual/manual.html#generic-package-reference

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
