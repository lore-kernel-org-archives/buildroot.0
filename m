Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D5F2C4332F
	for <buildroot@archiver.kernel.org>; Mon, 13 Nov 2023 18:54:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DE0FA40042;
	Mon, 13 Nov 2023 18:54:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DE0FA40042
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MRhzXUTWcSff; Mon, 13 Nov 2023 18:54:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C7E9640133;
	Mon, 13 Nov 2023 18:54:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C7E9640133
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 558E31BF228
 for <buildroot@lists.busybox.net>; Mon, 13 Nov 2023 18:54:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2DD7E40042
 for <buildroot@lists.busybox.net>; Mon, 13 Nov 2023 18:54:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2DD7E40042
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id F2PU3pTDvoNM for <buildroot@lists.busybox.net>;
 Mon, 13 Nov 2023 18:54:30 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A124240179
 for <buildroot@buildroot.org>; Mon, 13 Nov 2023 18:54:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A124240179
Received: by mail.gandi.net (Postfix) with ESMTPSA id F2D7240006;
 Mon, 13 Nov 2023 18:54:28 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1r2c4q-00BRV1-1F;
 Mon, 13 Nov 2023 19:54:28 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20231026203632.6065-1-fontaine.fabrice@gmail.com>
 <87cywfglvx.fsf@48ers.dk>
Date: Mon, 13 Nov 2023 19:54:28 +0100
In-Reply-To: <87cywfglvx.fsf@48ers.dk> (Peter Korsgaard's message of "Sun, 12
 Nov 2023 14:08:02 +0100")
Message-ID: <871qctfpqz.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/libmemcached: force
 CMAKE_BUILD_TYPE
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

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:
 >> Force CMAKE_BUILD_TYPE to Release to avoid the following build failure
 >> with c-icap or php-memcached raised since bump to version 1.1.4 and
 >> switch to cmake-package in commit
 >> 7205df8a4f3c729b11a5f0c34885e6cf592f24b9:

 >> Fixes:
 >> - http://autobuild.buildroot.org/results/bca84915550a72f1dc89c8661cba2545d6bc96ef
 >> - http://autobuild.buildroot.org/results/b140d225208e7fa44b935a119e74347caf710e55

 >> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 >> ---
 >> package/libmemcached/libmemcached.mk | 4 ++++
 >> 1 file changed, 4 insertions(+)

 >> diff --git a/package/libmemcached/libmemcached.mk b/package/libmemcached/libmemcached.mk
 >> index bd63d78c97..2c268d4151 100644
 >> --- a/package/libmemcached/libmemcached.mk
 >> +++ b/package/libmemcached/libmemcached.mk
 >> @@ -14,6 +14,10 @@ LIBMEMCACHED_LICENSE = BSD-3-Clause
 >> LIBMEMCACHED_LICENSE_FILES = LICENSE
 >> LIBMEMCACHED_CPE_ID_VENDOR = awesome
 
 >> +# Force Release otherwise libraries will be suffixed by -dbg which will raise
 >> +# unexpected build failures with packages that use libmemcached (e.g. c-icap)
 >> +LIBMEMCACHED_CONF_OPTS = -DCMAKE_BUILD_TYPE=Release
 >> +

 > As correctly warned by check-package:

 > Applying: package/libmemcached: force CMAKE_BUILD_TYPE
 > gpackage/libmemcached/libmemcached.mk:19: unconditional override of variable LIBMEMCACHED_CONF_OPTS

 > _CONF_OPTS already get set in line 10, so I changed this to be += and
 > applied, thanks.

Committed to 2023.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
