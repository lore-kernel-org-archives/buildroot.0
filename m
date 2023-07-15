Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 656E0EB64DC
	for <buildroot@archiver.kernel.org>; Sat, 15 Jul 2023 14:39:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A834E608A6;
	Sat, 15 Jul 2023 14:39:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A834E608A6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KUNtsJlJiqVX; Sat, 15 Jul 2023 14:39:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CFB7960864;
	Sat, 15 Jul 2023 14:39:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CFB7960864
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6E6351BF476
 for <buildroot@lists.busybox.net>; Sat, 15 Jul 2023 14:39:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 51D3140131
 for <buildroot@lists.busybox.net>; Sat, 15 Jul 2023 14:39:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 51D3140131
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xBdxD5SVLP70 for <buildroot@lists.busybox.net>;
 Sat, 15 Jul 2023 14:39:25 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AB051400CF
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AB051400CF
 for <buildroot@buildroot.org>; Sat, 15 Jul 2023 14:39:24 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C0302240004;
 Sat, 15 Jul 2023 14:39:20 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1qKgQZ-007x9m-MS; Sat, 15 Jul 2023 16:39:19 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
References: <20230714162339.1907504-1-bernd@kuhls.net>
 <20230714232518.6ed70c07@windsurf>
Date: Sat, 15 Jul 2023 16:39:19 +0200
In-Reply-To: <20230714232518.6ed70c07@windsurf> (Thomas Petazzoni via
 buildroot's message of "Fri, 14 Jul 2023 23:25:18 +0200")
Message-ID: <87fs5pfdd4.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/libopenssl: bump version to
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
Cc: Bernd Kuhls <bernd@kuhls.net>, Danny Wood <danny@rotronics.co.uk>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Thomas" == Thomas Petazzoni via buildroot <buildroot@buildroot.org> writes:

 > Hello,
 > On Fri, 14 Jul 2023 18:23:39 +0200
 > Bernd Kuhls <bernd@kuhls.net> wrote:

 >> From: Danny Wood <danny@rotronics.co.uk>
 >> 
 >> Rebase patches onto new version
 >> 
 >> Remove 0005-crypto-perlasm-ppc-xlate.pl-add-linux64v2-flavour.patch,
 >> 0006-Add-support-for-io_pgetevents_time64-syscall.patch, and
 >> 0007-Fixup-support-for-io_pgetevents_time64-syscall.patch as these are
 >> already applied upstream
 >> 
 >> Downloaded from
 >> https://lists.buildroot.org/pipermail/buildroot/2023-June/669230.html
 >> 
 >> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

 > How much build testing was done with this version bump? I know OpenSSL
 > 3.x breaks a few APIs compared to OpenSSL 1.x.

 > Could you do a test build with a significant number of packages using
 > OpenSSL in Buildroot, to assess the damage caused by this version bump,
 > and provide the defconfig used for this verification?

Danny already stated that he had built a significant amount of packages
(and provided an update to mariadb to fix a compatibility issue). Given
that our move to 3.x is long overdue (E.G. 1.1.1 goes EOL in September),
I think the best approach is just merging this as soon as possible and
then fix up any fallout before 2023.08.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
