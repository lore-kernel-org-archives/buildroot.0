Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1740EE3F34
	for <buildroot@archiver.kernel.org>; Tue, 12 Sep 2023 21:22:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6A6718200E;
	Tue, 12 Sep 2023 21:22:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6A6718200E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LilOQGoYZymE; Tue, 12 Sep 2023 21:22:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CB1AE8200A;
	Tue, 12 Sep 2023 21:22:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CB1AE8200A
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 688AA1BF421
 for <buildroot@lists.busybox.net>; Tue, 12 Sep 2023 21:22:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4FCCC404C4
 for <buildroot@lists.busybox.net>; Tue, 12 Sep 2023 21:22:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4FCCC404C4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zFo0mreO4Wcq for <buildroot@lists.busybox.net>;
 Tue, 12 Sep 2023 21:22:53 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C76724002B
 for <buildroot@buildroot.org>; Tue, 12 Sep 2023 21:22:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C76724002B
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4BD3340003;
 Tue, 12 Sep 2023 21:22:49 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1qgAqO-001z2y-BX; Tue, 12 Sep 2023 23:22:48 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
References: <20230811093421.300794-1-b.bilas@grinn-global.com>
 <20230812125051.4b8b0b84@windsurf>
Date: Tue, 12 Sep 2023 23:22:48 +0200
In-Reply-To: <20230812125051.4b8b0b84@windsurf> (Thomas Petazzoni via
 buildroot's message of "Sat, 12 Aug 2023 12:50:51 +0200")
Message-ID: <877cov5bo7.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH] gdb: disable source-highlight
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
Cc: Bartosz Bilas <b.bilas@grinn-global.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Thomas" == Thomas Petazzoni via buildroot <buildroot@buildroot.org> writes:

 > On Fri, 11 Aug 2023 11:34:21 +0200
 > Bartosz Bilas <b.bilas@grinn-global.com> wrote:

 >> It's being found from the host's source-highlight library
 >> which results in the following build errors:
 >> 
 >> ../../gdb/source-cache.c:37:10: fatal error: srchilite/sourcehighlight.h: No such file or directory
 >> 37 | #include <srchilite/sourcehighlight.h>
 >> |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 >> compilation terminated.
 >> make[4]: *** [Makefile:1645: source-cache.o] Error 1
 >> make[4]: *** Waiting for unfinished jobs....
 >> 
 >> Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>

 > Thanks patch applied to master, after updating the commit title to use
 > "package/gdb: " as the prefix, to follow our convention.

 > Also, I am wondering if the same should not be done for the host
 > variant of gdb. Indeed, we don't want to rely on the system-provided
 > source highlight if it's not built by Buildroot. Could you have a look
 > into this, and if it makes sense, send a patch?

 > Thanks a lot!

Committed to 2023.02.x and 2023.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
