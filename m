Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4206DC3DA7A
	for <buildroot@archiver.kernel.org>; Fri,  6 Jan 2023 07:28:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ABD5360F20;
	Fri,  6 Jan 2023 07:28:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ABD5360F20
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FbKS7mKpf8QE; Fri,  6 Jan 2023 07:28:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DE9F760E58;
	Fri,  6 Jan 2023 07:28:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DE9F760E58
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B8CFD1BF359
 for <buildroot@lists.busybox.net>; Fri,  6 Jan 2023 07:28:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A0297401AF
 for <buildroot@lists.busybox.net>; Fri,  6 Jan 2023 07:28:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A0297401AF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZY9Mui_PbJln for <buildroot@lists.busybox.net>;
 Fri,  6 Jan 2023 07:28:38 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1DB9140189
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1DB9140189
 for <buildroot@buildroot.org>; Fri,  6 Jan 2023 07:28:37 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id F1B73FF80C;
 Fri,  6 Jan 2023 07:28:35 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1pDh9W-006DJd-Re; Fri, 06 Jan 2023 08:28:34 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20221230103722.602850-1-fontaine.fabrice@gmail.com>
Date: Fri, 06 Jan 2023 08:28:34 +0100
In-Reply-To: <20221230103722.602850-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Fri, 30 Dec 2022 11:37:22 +0100")
Message-ID: <87zgawp1el.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/hiredis: fix debug install
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

 > hiredis suffix its debug libraries with "d" since version 1.1.0 and
 > https://github.com/redis/hiredis/commit/dde6916b42a4723b364355eff8fbb477723a789a
 > resulting in the following build failure with collectd since commit
 > bd7e90779861bb603fc1cca03f6fad4d951f7bd9:

 >     redis . . . . . . . . no (symbol 'redisCommand' not found) (dependency error)

 > Fixes:
 >  - http://autobuild.buildroot.org/results/394ebf2b6816c69dbdd7901491c0e3fd52befedc

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 > ---
 >  package/hiredis/hiredis.mk | 4 +++-
 >  1 file changed, 3 insertions(+), 1 deletion(-)

 > diff --git a/package/hiredis/hiredis.mk b/package/hiredis/hiredis.mk
 > index a5efb61acc..dbb59f44ba 100644
 > --- a/package/hiredis/hiredis.mk
 > +++ b/package/hiredis/hiredis.mk
 > @@ -11,7 +11,9 @@ HIREDIS_LICENSE = BSD-3-Clause
 >  HIREDIS_LICENSE_FILES = COPYING
 >  HIREDIS_CPE_ID_VENDOR = redis

Local change? On master this is set to redislabs

>  HIREDIS_INSTALL_STAGING = YES
 > -HIREDIS_CONF_OPTS = -DDISABLE_TESTS=ON
 > +# Set CMAKE_BUILD_TYPE to Release or the libraries will be suffixed with "d"
 > +# resulting in a build failure with collectd
 > +HIREDIS_CONF_OPTS = -DCMAKE_BUILD_TYPE=Release -DDISABLE_TESTS=ON

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
