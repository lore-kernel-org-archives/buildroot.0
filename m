Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36BBAC001B0
	for <buildroot@archiver.kernel.org>; Sat, 15 Jul 2023 15:15:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CE898606F2;
	Sat, 15 Jul 2023 15:15:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CE898606F2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fbuqeLcbwc36; Sat, 15 Jul 2023 15:15:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1886D605AE;
	Sat, 15 Jul 2023 15:15:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1886D605AE
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5B5761BF408
 for <buildroot@lists.busybox.net>; Sat, 15 Jul 2023 15:15:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 42352605AE
 for <buildroot@lists.busybox.net>; Sat, 15 Jul 2023 15:15:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 42352605AE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AHmPxOSRF2XQ for <buildroot@lists.busybox.net>;
 Sat, 15 Jul 2023 15:15:50 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 020E2605A3
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 020E2605A3
 for <buildroot@buildroot.org>; Sat, 15 Jul 2023 15:15:49 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B48BE60004;
 Sat, 15 Jul 2023 15:15:46 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1qKgzp-008YzL-JH; Sat, 15 Jul 2023 17:15:45 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
References: <20230714164102.2175760-1-bernd@kuhls.net>
Date: Sat, 15 Jul 2023 17:15:45 +0200
In-Reply-To: <20230714164102.2175760-1-bernd@kuhls.net> (Bernd Kuhls's message
 of "Fri, 14 Jul 2023 18:41:02 +0200")
Message-ID: <87bkgdfboe.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH v2 1/1] package/libopenssl: bump version to
 3.0.9
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
Cc: Danny Wood <danny@rotronics.co.uk>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Bernd" == Bernd Kuhls <bernd@kuhls.net> writes:

 > From: Danny Wood <danny@rotronics.co.uk>
 > Rebase patches onto new version

 > Remove 0005-crypto-perlasm-ppc-xlate.pl-add-linux64v2-flavour.patch,
 > 0006-Add-support-for-io_pgetevents_time64-syscall.patch, and
 > 0007-Fixup-support-for-io_pgetevents_time64-syscall.patch as these are
 > already applied upstream

 > Updated license after switch to Apache license:
 > https://www.openssl.org/blog/blog/2021/06/17/OpenSSL3.0ReleaseCandidate/

 > [Bernd: fixed license file/hash]

 > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 > ---
 > v2: fixed license file/hash (Konrad)

Committed after updating .checkpackageinfo after those patches were
dropped, thanks. Hopefully it will not break too much stuff ..

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
