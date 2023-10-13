Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAA20CDB47E
	for <buildroot@archiver.kernel.org>; Fri, 13 Oct 2023 06:10:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7C657818EC;
	Fri, 13 Oct 2023 06:10:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7C657818EC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0hzm_ZYfNN4r; Fri, 13 Oct 2023 06:10:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D0C71818CA;
	Fri, 13 Oct 2023 06:10:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D0C71818CA
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D38A31BF3C8
 for <buildroot@lists.busybox.net>; Fri, 13 Oct 2023 06:10:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AF1E741496
 for <buildroot@lists.busybox.net>; Fri, 13 Oct 2023 06:10:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AF1E741496
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id x_Xo6jt54tUJ for <buildroot@lists.busybox.net>;
 Fri, 13 Oct 2023 06:10:49 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 40F5E402D2
 for <buildroot@buildroot.org>; Fri, 13 Oct 2023 06:10:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 40F5E402D2
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1DACF240008;
 Fri, 13 Oct 2023 06:10:45 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1qrBNf-006uDl-Na; Fri, 13 Oct 2023 08:10:39 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
References: <20230930164848.D376D83C18@busybox.osuosl.org>
Date: Fri, 13 Oct 2023 08:10:39 +0200
In-Reply-To: <20230930164848.D376D83C18@busybox.osuosl.org> (Thomas Petazzoni
 via buildroot's message of "Sat, 30 Sep 2023 18:48:23 +0200")
Message-ID: <87wmvr6oio.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [git commit] package/python-mako: add missing
 dependency on python-markupsafe
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Thomas" == Thomas Petazzoni via buildroot <buildroot@buildroot.org> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=2b506cb2dd031f2bdecc3c90111e31e145211d75
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > Mako imports markupsafe so it needs to be selected when selecting
 > BR2_PACKAGE_PYTHON_MAKO.

 > Fixes:

 >   https://bugs.busybox.net/show_bug.cgi?id=15628

 > Signed-off-by: Sebastian Weyer <sebastian.weyer@smile.fr>
 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2023.02.x and 2023.08.x, thanks.

> ---
 >  package/python-mako/Config.in | 1 +
 >  1 file changed, 1 insertion(+)

 > diff --git a/package/python-mako/Config.in b/package/python-mako/Config.in
 > index 442e290efa..e6a10c9c2e 100644
 > --- a/package/python-mako/Config.in
 > +++ b/package/python-mako/Config.in
 > @@ -1,5 +1,6 @@
 >  config BR2_PACKAGE_PYTHON_MAKO
 >  	bool "python-mako"
 > +	select BR2_PACKAGE_PYTHON_MARKUPSAFE # runtime
 >  	help
 >  	  Mako is a template library written in Python. It provides a
 >  	  familiar, non-XML syntax which compiles into Python modules
 > _______________________________________________
 > buildroot mailing list
 > buildroot@buildroot.org
 > https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
