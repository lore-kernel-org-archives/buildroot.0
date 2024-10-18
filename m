Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C0AFD2FFF8
	for <buildroot@archiver.kernel.org>; Fri, 18 Oct 2024 11:52:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2A2794075C;
	Fri, 18 Oct 2024 11:52:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OlnO5RrXZyem; Fri, 18 Oct 2024 11:52:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A78CB40721
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A78CB40721;
	Fri, 18 Oct 2024 11:52:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id CDEBF2804
 for <buildroot@buildroot.org>; Fri, 18 Oct 2024 11:52:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A587C60682
 for <buildroot@buildroot.org>; Fri, 18 Oct 2024 11:52:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KF_rO2KBBNyb for <buildroot@buildroot.org>;
 Fri, 18 Oct 2024 11:52:26 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=192.198.163.15;
 helo=mgamail.intel.com; envelope-from=andriy.shevchenko@linux.intel.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A5E4760674
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A5E4760674
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A5E4760674
 for <buildroot@buildroot.org>; Fri, 18 Oct 2024 11:52:25 +0000 (UTC)
X-CSE-ConnectionGUID: iFwZ28QjRSCBrAnSRrLRBA==
X-CSE-MsgGUID: /kP7pM8UTmqUMC/cy0iUfQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11228"; a="28916322"
X-IronPort-AV: E=Sophos;i="6.11,213,1725346800"; d="scan'208";a="28916322"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2024 04:52:25 -0700
X-CSE-ConnectionGUID: 8/PDeQLmQya1rRvpSgEtcA==
X-CSE-MsgGUID: iNJYkIICQKOk/OGiNg74+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,213,1725346800"; d="scan'208";a="109586295"
Received: from smile.fi.intel.com ([10.237.72.154])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2024 04:52:23 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1t1lWm-00000004RrG-3bSP; Fri, 18 Oct 2024 14:52:20 +0300
Date: Fri, 18 Oct 2024 14:52:20 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Aaron Sierra <aaron@bubbl-tek.com>
Cc: Vincent Fazio <vfazio@xes-inc.com>, Andy Yan <andyshrk@163.com>,
 buildroot <buildroot@buildroot.org>, Andy Yan <andyshrk@gmail.com>
Message-ID: <ZxJL9O0KM7WP7b-d@smile.fi.intel.com>
References: <PH1P110MB1603BAEB621A821D82C0A2C19F44A@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
 <Zw_FDy5XWpeQ78sG@smile.fi.intel.com>
 <1929b27b55e.1242e8abc627480.7414881916261699452@bubbl-tek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1929b27b55e.1242e8abc627480.7414881916261699452@bubbl-tek.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729252346; x=1760788346;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=O3Pg1ucfAaK0cXJHpx7MTVwFOP8oMxhPdMT9Hu8UPTE=;
 b=dtRzylOh547W0NGWJzDTQ+Ct6gBQfjqEtO9e7+ASGaWp5l5vuOi+Af2d
 b3I3Nfi5GkCEIRH04nsLIT8aGopjAgEIArPLn53NcSIVsqkIWyAnOpIaO
 SjSMJn8mgZE19rLA207LBj5qy0Vv5AqyC/pACk5MRUoEidV0g7OVNjckX
 5xxET1aSq99X/+QiGOVomatj08lPS3jmBKAb/ctKGRa83rjz86ZY1ysC+
 Ydw4Z5EzjlmPQQEBGP3hjJXhocZC6AHAH0eW0VvZvmHL1mwqyz2iqw7UW
 hSY1a32UIwJz7jlsSMjpm7Ooq7+Cx9S+Jimxa7mvl6p+gierpjt5WC4L1
 g==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=linux.intel.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=dtRzylOh
Subject: Re: [Buildroot] [PATCH v2 1/1] package: Add iotools package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, Oct 17, 2024 at 10:45:23AM -0500, Aaron Sierra wrote:
>  > On Mon, Oct 14, 2024 at 05:55:46PM +0000, Vincent Fazio wrote: 
>  > > Aaron, Andy, 
>  > > > From: buildroot buildroot-bounces@buildroot.org> On Behalf Of Aaron 
>  > > > Sierra 
>  > > > Sent: Monday, October 14, 2024 12:01 PM 
>  > > > ---- On Mon, 14 Oct 2024 10:38:22 -0500 Andy Shevchenko  wrote --- 

...

>  > > > 2. It would be nice if the package populated command symlinks in the target 
>  > > > filesystem. That could be done in a number of way, like using an explicit list of 
>  > > > commands maintained in the package Makefile (iotools.mk) or adding a host- 
>  > > > build dependency and leveraging the --list-cmds output to get the list of 
>  > > > embedded commands for linking. 
>  > > 
>  > > Caveat lector, I have not reviewed your patch or the sources in a while. 
>  > > 
>  > > WRT to this comment, I have this note from when we ported it: 
>  > > 
>  > > # we can't run make install because the symlink installation executes the binary 
>  > > # which isn't guaranteed to work in cross-compile scenarios 
>  > > define IOTOOLS_INSTALL_TARGET_CMDS 
>  > >     $(INSTALL) -D -m 0755 $(@D)/iotools $(TARGET_DIR)/usr/sbin/ 
>  > > 
>  > >     for link in $( IOTOOLS_LINKS); do \ 
>  > >         ln -sf iotools $(TARGET_DIR)/usr/sbin/$link; \ 
>  > >     done 
>  > > endef 
>  > > 
>  > > We then earlier in the mk file define the tools per platform, akin to: 
>  >  
>  > I deliberately won't populate those links. The naming is so generic 
>  > that it's a real chance to get a collision with all pain of splitting it 
>  > in the configuration what links we create and what not and what to do 
>  > with those that may collide. 
>  >  
>  > TL;DR: no, I don't think it's a good idea. 
> 
> For the benefit of the uninitiated, iotools operates similarly to Busybox,
> expressing behavior either by:
>     1. taking the command name from argv[0] (i.e. symlinks named for internal commands)
>        * This is the mechanism encouraged by the project's make install (i.e.
>          iotools --make-links)
>     2. taking the command name from argv[1] (i.e. iotools [[command] [arguments]])

There is a little nuance between two. When the Busybox is the *main(
shell/coreutils/util-linux/etc provider it must populate the links, many of
them (naming wise) are standardized by POSIX. In full opposition to the iotools
with unpredictable consequences of the potential name clashing (esp. those that
are called or/xor/and/etc.).

> I proposed populating the symlinks in the target filesystem to ensure the
> subcommands are ready-to-use for people already familiar with the tool. It sounds
> like you're advocating for #2 ("iotools_fallback") to be the primary mode of
> operation for Buildroot users.

Yes, I highly suggest not to go this way.

> Can you point to documentation that Buildroot users can use to _know_ that the
> second mode of operation is available and encouraged? I do not see any in the
> help output or in the project README. Here is the current help output:
> 
> $ ./iotools --help
> usage: ./iotools COMMAND
>   COMMANDS:
>     --make-links
>     --clean-links
>     --list-cmds
>     -v --version

Is it full output? Because to me it shows two screens of the listed commands.
I do not see an issue here.

> For the sake of usability, I think it's important to either improve utility and/or
> project documentation or reconsider your stated position on symlink population.

I am against populating the links.

> Feel free to ask for help with either direction you choose.

-- 
With Best Regards,
Andy Shevchenko


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
