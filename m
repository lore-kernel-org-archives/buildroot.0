Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F30D8C4332F
	for <buildroot@archiver.kernel.org>; Fri, 10 Nov 2023 17:39:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 67D0A423F4;
	Fri, 10 Nov 2023 17:39:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 67D0A423F4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YAcBreVMtuvO; Fri, 10 Nov 2023 17:39:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 55B9D4226E;
	Fri, 10 Nov 2023 17:39:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 55B9D4226E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1861F1BF311
 for <buildroot@lists.busybox.net>; Fri, 10 Nov 2023 17:39:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E558783B97
 for <buildroot@lists.busybox.net>; Fri, 10 Nov 2023 17:39:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E558783B97
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HZ7JNMnItt9x for <buildroot@lists.busybox.net>;
 Fri, 10 Nov 2023 17:39:25 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8B75B83B96
 for <buildroot@buildroot.org>; Fri, 10 Nov 2023 17:39:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8B75B83B96
Received: by mail.gandi.net (Postfix) with ESMTPSA id 422001BF205;
 Fri, 10 Nov 2023 17:39:22 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1r1VTV-004HMM-1p;
 Fri, 10 Nov 2023 18:39:21 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
References: <20231105142405.71631-1-giulio.benetti@benettiengineering.com>
Date: Fri, 10 Nov 2023 18:39:21 +0100
In-Reply-To: <20231105142405.71631-1-giulio.benetti@benettiengineering.com>
 (Giulio Benetti's message of "Sun, 5 Nov 2023 15:24:05 +0100")
Message-ID: <87ttptjynq.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH] package/nodejs/nodejs-src: fix arch check
 on additional modules
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
Cc: Daniel Price <daniel.price@gmail.com>, Martin Bark <martin@barkynet.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Giulio" == Giulio Benetti <giulio.benetti@benettiengineering.com> writes:

 > At the moment check-bin-arch script finds NodeJS modules containing
 > prebuilt binaries for different architectures and build fails.
 > So let check-bin-arch to ignore folder /usr/lib/node_modules by setting
 > NODEJS_SRC_BIN_ARCH_EXCLUDE to it.

 > Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
 > ---
 >  package/nodejs/nodejs-src/nodejs-src.mk | 3 +++
 >  1 file changed, 3 insertions(+)

 > diff --git a/package/nodejs/nodejs-src/nodejs-src.mk b/package/nodejs/nodejs-src/nodejs-src.mk
 > index 6fb550f158..8f934202b0 100644
 > --- a/package/nodejs/nodejs-src/nodejs-src.mk
 > +++ b/package/nodejs/nodejs-src/nodejs-src.mk
 > @@ -244,6 +244,9 @@ define NODEJS_SRC_INSTALL_MODULES
 >  	# help in diagnosing the problem.
 >  	$(NPM) install -g $(NODEJS_SRC_MODULES_LIST)
 >  endef
 > +
 > +# Exclude prebuilt binaries with different architectures and OS from check
 > +NODEJS_SRC_BIN_ARCH_EXCLUDE = /usr/lib/node_modules/
 >  endif

Committed to 2023.02.x and 2023.08.x (after moving it to the nodejs
package and adjusting the variable name to match), thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
