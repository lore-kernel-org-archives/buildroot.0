Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5969ECAAD5
	for <buildroot@archiver.kernel.org>; Mon, 29 Aug 2022 19:16:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3EE73402F3;
	Mon, 29 Aug 2022 19:16:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3EE73402F3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hOjtMOayR-bA; Mon, 29 Aug 2022 19:16:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 416D9401AE;
	Mon, 29 Aug 2022 19:16:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 416D9401AE
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C4A861BF379
 for <buildroot@lists.busybox.net>; Mon, 29 Aug 2022 19:16:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9FB04401AE
 for <buildroot@lists.busybox.net>; Mon, 29 Aug 2022 19:16:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9FB04401AE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ss014jPsHIlD for <buildroot@lists.busybox.net>;
 Mon, 29 Aug 2022 19:16:10 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1BEF440198
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1BEF440198
 for <buildroot@buildroot.org>; Mon, 29 Aug 2022 19:16:09 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 6FC89240004;
 Mon, 29 Aug 2022 19:16:06 +0000 (UTC)
Date: Mon, 29 Aug 2022 21:16:05 +0200
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20220829211605.5cb4b256@windsurf>
In-Reply-To: <20220825200510.125728-1-yann.morin.1998@free.fr>
References: <20220825200510.125728-1-yann.morin.1998@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1661800567;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=o9uzVvsm4anWUdSvVoZL5QkdW7+WfdTWkS45Z8cgiNc=;
 b=Xdc4eXHdn/p8Hp9jpGdA9x+gJhvWquDI1M5wU1ksxsYL/TKNk3TlS9ugLL46z6WUIrT/6x
 Re/jIPKtRRoNGrnBeeLihGCkTVMQz3NOxQy1D7TL8bIVELt9LnNMXE9pZ50ewJ8NBR0Cdu
 Pzgd6cbH1ho3NzRJZkxECemxUW29gkL/bm7m0IN2ShmCH6tTALjYpC+dEV+7Qw7S0OZM8U
 xGwjK1E++eB+ZLbKEywB18Hh0mW4jP/VIFO8WcxKeXkykrDgCygN/GLJzZPAeAerU2sYFU
 mvsLb+1vhUFzopZ/pLsGffWNRfk3UrH8wRM+ntoj6AzKE/z3F00SK6adm7RNFQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Xdc4eXHd
Subject: Re: [Buildroot] [PATCH] package/python3: ensure pyc embed rooted
 paths
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Vincent Fazio <vfazio@xes-inc.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 25 Aug 2022 22:05:10 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> To report usable tracebacks, pyc files embed the path of the original py
> files, so that users can more easily try and debug the reported issue.
> 
> We genrate the pyc files by calling the python3-supplied compileall
> script, to scan the directry where python modules are installed. Since
> this is done on the build machine, we tell compileall.py to strip away
> the TARGET_DIR prefix, as that has no meaning at runtime.
> 
> However, compileall.py forgets [0] to keep a leading / in the front of
> the paths, thus generating non-rooted paths., e.g.:
>      /path/buildroot.ouput/targt/usr/lib/python3.10/argparse.py
> gets embedded as:
>      usr/lib/python3.10/argparse.py
> 
> This is a bit confusing but, as far as we could see, should be mostly be
> used for display purposes in tracebacks, and does not seem to impact
> actual functkionality.
> 
> We fix that by instructing compileall.py that the embeeded paths should
> be rooted to / which generates proper paths in tracebacks.
> 
> And alternate solution would be to swith gears, and tell compileall.py
> exactly the resulting runtime "base" directory, wihch replaces the
> stripping and prefixing; i.e. it's either:
>     -s $(TARGET_DIR) -p /
> or
>     -d /usr/lib/python$(PYTHON3_MAJOR_VERSION)
> 
> We choose to keep the first solution, because that is semantically what
> we really want to do: to strip the leading build-time path, rather than
> to force anything.
> 
> Note: the python test-suite was executed with both solutions (in a
> pyc-only setup), and the results were exactly the same; so in practice,
> -d or -s+-p yield the same results.
> 
> Many thanks go to Vincent for reporting the issue and suggesting the
> solutions.
> 
> Reported-by: Vincent Fazio <vfazio@xes-inc.com>
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> ---
>  package/python3/python3.mk | 1 +
>  1 file changed, 1 insertion(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
