Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05816ECAA27
	for <buildroot@archiver.kernel.org>; Thu, 25 Aug 2022 20:09:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7CE1C40A93;
	Thu, 25 Aug 2022 20:09:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7CE1C40A93
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ApyzQSTIh2QQ; Thu, 25 Aug 2022 20:09:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 61375400FF;
	Thu, 25 Aug 2022 20:09:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 61375400FF
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A44231BF2FA
 for <buildroot@lists.busybox.net>; Thu, 25 Aug 2022 20:09:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7EE8A830FB
 for <buildroot@lists.busybox.net>; Thu, 25 Aug 2022 20:09:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7EE8A830FB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id L1K9nAQGfGED for <buildroot@lists.busybox.net>;
 Thu, 25 Aug 2022 20:09:21 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 16C54830E2
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 16C54830E2
 for <buildroot@buildroot.org>; Thu, 25 Aug 2022 20:09:20 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:85d1:e2d5:4fa1:5f52])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 6BBCDB00573;
 Thu, 25 Aug 2022 22:09:15 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 25 Aug 2022 22:09:15 +0200
Date: Thu, 25 Aug 2022 22:09:14 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Message-ID: <20220825200914.GB37358@scaer>
References: <20220825200510.125728-1-yann.morin.1998@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220825200510.125728-1-yann.morin.1998@free.fr>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1661458157;
 bh=hXZHHPwUQlvO2loN/1Lm7lQ5Gnxpb1bn75p5UkR4KFw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kLTKSyw1T5iz5wuQgpSF0Pqm0Ho+r3A+hH4eGIlrgQKcphw2s5nvFVOY8/i5TMwJB
 kGy8YtZLxNysUd89AFxLpAcfb8TE4BEP8wjmdxd0+zAk+exJb/9l51C3Hm7PADGNh/
 +cnS7AXxCrEPSHRZnVHTC6nXUqyYhrTQgjSKIlSZc5q3QN9jTP8fPDzr8FHW+83vo3
 ZgYnTffHx3JC5NHOu4MNCNw7irSf5i46ZR7S9g10AyjQwYFy3s/QL0oNEeiB/W1X3e
 W3XR67v+qpxzJc1V2LprE/tir18/zbaPhUq/moUUrVk8y6ZdMOxYq4CL6UOEXkfGoj
 MxHQph2j8cT0Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=kLTKSyw1
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
Cc: Vincent Fazio <vfazio@xes-inc.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 2022-08-25 22:05 +0200, Yann E. MORIN spake thusly:
> To report usable tracebacks, pyc files embed the path of the original py
> files, so that users can more easily try and debug the reported issue.
> 
> We genrate the pyc files by calling the python3-supplied compileall
> script, to scan the directry where python modules are installed. Since
> this is done on the build machine, we tell compileall.py to strip away
> the TARGET_DIR prefix, as that has no meaning at runtime.
> 
> However, compileall.py forgets [0] to keep a leading / in the front of

This [0] note should have been:

[0] not sure whether this is a bug or a feature...

Regards,
Yann E. MORIN.

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
> 
> diff --git a/package/python3/python3.mk b/package/python3/python3.mk
> index 9af384712a..a9821d9a33 100644
> --- a/package/python3/python3.mk
> +++ b/package/python3/python3.mk
> @@ -255,6 +255,7 @@ define PYTHON3_CREATE_PYC_FILES
>  		$(if $(VERBOSE),,-q) \
>  		$(if $(BR2_PACKAGE_PYTHON3_PYC_ONLY),-b) \
>  		-s $(TARGET_DIR) \
> +		-p / \
>  		$(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)
>  endef
>  
> -- 
> 2.25.1
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
