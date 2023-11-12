Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6633C4167D
	for <buildroot@archiver.kernel.org>; Sun, 12 Nov 2023 13:08:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5BDC040568;
	Sun, 12 Nov 2023 13:08:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5BDC040568
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ECMpbMbrSMJg; Sun, 12 Nov 2023 13:08:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3FD48414DE;
	Sun, 12 Nov 2023 13:08:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3FD48414DE
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BCE531BF377
 for <buildroot@lists.busybox.net>; Sun, 12 Nov 2023 13:08:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 930E1418CD
 for <buildroot@lists.busybox.net>; Sun, 12 Nov 2023 13:08:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 930E1418CD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6If6-2mugGyJ for <buildroot@lists.busybox.net>;
 Sun, 12 Nov 2023 13:08:07 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 22013415F4
 for <buildroot@buildroot.org>; Sun, 12 Nov 2023 13:08:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 22013415F4
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7E4331C0005;
 Sun, 12 Nov 2023 13:08:03 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1r2AC2-0094Ju-2j;
 Sun, 12 Nov 2023 14:08:02 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20231026203632.6065-1-fontaine.fabrice@gmail.com>
Date: Sun, 12 Nov 2023 14:08:02 +0100
In-Reply-To: <20231026203632.6065-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Thu, 26 Oct 2023 22:36:32 +0200")
Message-ID: <87cywfglvx.fsf@48ers.dk>
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

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Force CMAKE_BUILD_TYPE to Release to avoid the following build failure
 > with c-icap or php-memcached raised since bump to version 1.1.4 and
 > switch to cmake-package in commit
 > 7205df8a4f3c729b11a5f0c34885e6cf592f24b9:

 > Fixes:
 >  - http://autobuild.buildroot.org/results/bca84915550a72f1dc89c8661cba2545d6bc96ef
 >  - http://autobuild.buildroot.org/results/b140d225208e7fa44b935a119e74347caf710e55

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 > ---
 >  package/libmemcached/libmemcached.mk | 4 ++++
 >  1 file changed, 4 insertions(+)

 > diff --git a/package/libmemcached/libmemcached.mk b/package/libmemcached/libmemcached.mk
 > index bd63d78c97..2c268d4151 100644
 > --- a/package/libmemcached/libmemcached.mk
 > +++ b/package/libmemcached/libmemcached.mk
 > @@ -14,6 +14,10 @@ LIBMEMCACHED_LICENSE = BSD-3-Clause
 >  LIBMEMCACHED_LICENSE_FILES = LICENSE
 >  LIBMEMCACHED_CPE_ID_VENDOR = awesome
 
 > +# Force Release otherwise libraries will be suffixed by -dbg which will raise
 > +# unexpected build failures with packages that use libmemcached (e.g. c-icap)
 > +LIBMEMCACHED_CONF_OPTS = -DCMAKE_BUILD_TYPE=Release
 > +

As correctly warned by check-package:

Applying: package/libmemcached: force CMAKE_BUILD_TYPE
gpackage/libmemcached/libmemcached.mk:19: unconditional override of variable LIBMEMCACHED_CONF_OPTS

_CONF_OPTS already get set in line 10, so I changed this to be += and
applied, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
