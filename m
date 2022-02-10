Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8ADDC433EF
	for <buildroot@archiver.kernel.org>; Thu, 10 Feb 2022 07:24:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8A0BB8142E;
	Thu, 10 Feb 2022 07:24:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TXQ34JwZsZ_y; Thu, 10 Feb 2022 07:24:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C433281437;
	Thu, 10 Feb 2022 07:24:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2431F1BF340
 for <buildroot@lists.busybox.net>; Thu, 10 Feb 2022 07:24:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 201394037C
 for <buildroot@lists.busybox.net>; Thu, 10 Feb 2022 07:24:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nU2JB3IPYqmZ for <buildroot@lists.busybox.net>;
 Thu, 10 Feb 2022 07:24:26 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AA8EA40127
 for <buildroot@buildroot.org>; Thu, 10 Feb 2022 07:24:25 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 1EAA3C000E;
 Thu, 10 Feb 2022 07:24:21 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1nI3oT-000342-A4; Thu, 10 Feb 2022 08:24:21 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Andreas Ziegler <br015@umbiko.net>
References: <mailman.6747.1644442447.66748.buildroot@buildroot.org>
 <2378b58c9e724d2bb27ec019e165798e@umbiko.net>
Date: Thu, 10 Feb 2022 08:24:21 +0100
In-Reply-To: <2378b58c9e724d2bb27ec019e165798e@umbiko.net> (Andreas Ziegler's
 message of "Thu, 10 Feb 2022 06:42:57 +0000")
Message-ID: <87zgmzw5ei.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 000/107] Drop python 2.7
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Andreas" == Andreas Ziegler <br015@umbiko.net> writes:

 > Hi Yann,
 > Hi Peter,

 > On 2022-02-09 21:34, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
 >> Peter ,All,
 >> 
 >> On 2022-02-09 17:50 +0100, Peter Korsgaard spake thusly:
 >>> Python 2.7 is EOL since April 2020 and almost all packages support
 >>> python 3, so drop it before the 2022.02 release.
 >>> 
 >>> It is a big series, but the changes are mainly mechanical in nature.
 >>> 
 >>> There is still some cleanup to do, E.G. the python2 support in
 >>> pkg-python and the host python-setuptools package - But this is IMHO
 >>> the minimum changes before -rc1.

 > There seem to be some more references to python(2) in packages; this
 > build failure is from package/crda:

 > # make clean && make
 >   ...
 > make[1]: *** No rule to make target 'host-python', needed by
 > '/home/data/buildroot.x86_64/build/host-python-pycryptodomex-3.13.0/.stamp_configured'. Stop.
 > make: *** [Makefile:23: _all] Error 2

Ahh yes, that is because we end up in package/pkg-python.mk with:

ifeq ($$($(2)_NEEDS_HOST_PYTHON),)
$(2)_DEPENDENCIES += $$(if $$(BR2_PACKAGE_PYTHON3),host-python3,host-python)

And you (presumably) don't have python3 enabled. I'll send a fix.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
