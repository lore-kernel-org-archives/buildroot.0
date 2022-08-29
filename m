Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8B5AECAAD2
	for <buildroot@archiver.kernel.org>; Mon, 29 Aug 2022 19:16:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F0B9A40491;
	Mon, 29 Aug 2022 19:16:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F0B9A40491
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FEvDdjYemd-R; Mon, 29 Aug 2022 19:16:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9D9654042F;
	Mon, 29 Aug 2022 19:16:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9D9654042F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D72DB1BF379
 for <buildroot@lists.busybox.net>; Mon, 29 Aug 2022 19:16:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B1F71813E2
 for <buildroot@lists.busybox.net>; Mon, 29 Aug 2022 19:16:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B1F71813E2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RCTl1u_0HD9v for <buildroot@lists.busybox.net>;
 Mon, 29 Aug 2022 19:16:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8D987813DF
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8D987813DF
 for <buildroot@buildroot.org>; Mon, 29 Aug 2022 19:16:26 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id A7DA0240004;
 Mon, 29 Aug 2022 19:16:24 +0000 (UTC)
Date: Mon, 29 Aug 2022 21:16:23 +0200
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20220829211623.269b02af@windsurf>
In-Reply-To: <20220825201809.129034-1-yann.morin.1998@free.fr>
References: <20220825201809.129034-1-yann.morin.1998@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1661800585;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GXCOp9uPgQVM1KzxUhXW2pvSFhfG/rEPbg7ZZoR6chY=;
 b=MmjeF2sS1gMSRUPJVRSq6rgsu/alBlX4FxVDwmo5TavfdAbShv1D+vTkH6ZhMSfWNf6mCI
 iQLxa41SOY0SxHhkLoTFIUm47M+J/MAnQcXXPfZeqPuJ0cOag5nXc66f4BPh+Yy+D7+rHC
 +fUpgocYlZAJlF9fqLkhV6sT+V5Z0u9p0RehOIpy/x8wsYIz9dkzMPt1UjVpijX9K1WDyy
 0DKOixwaacuX3N5O8R5l1Ivn8nHvRm2C1QSZb6PLaPFYfnl1mSTUGGZp3Otx1pHy1c85Xl
 ntZJCjqPlwDYa1kWFOqPqx5fWzqGjM9xKNBPjVhn1UCsu4Qv9lnRG+ddQajyww==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=MmjeF2sS
Subject: Re: [Buildroot] [PATCH v2] package/python3: ensure pyc embed rooted
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

On Thu, 25 Aug 2022 22:18:09 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> To report usable tracebacks, pyc files embed the path of the original py
> files, so that users can more easily try and debug the reported issue.
> 
> We generate the pyc files by calling the python3-supplied compileall
> script, to scan the directory where python modules are installed. Since
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
> actual functionality.
> 
> We fix that by instructing compileall.py that the embedded paths should
> be rooted to / which generates proper paths in tracebacks.
> 
> And alternate solution would be to swith gears, and tell compileall.py
> exactly the resulting runtime "base" directory, which replaces the
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
> [0] Not sure whether this is a bug or a feature...
> 
> Reported-by: Vincent Fazio <vfazio@xes-inc.com>
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> 
> ---
> Changes v1 -> v2:
>   - fix some typoes
>   - add the [0] ref
> ---
>  package/python3/python3.mk | 1 +
>  1 file changed, 1 insertion(+)

Sorry, this is the one that I applied to master!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
