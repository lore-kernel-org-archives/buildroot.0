Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E28F6FF8864
	for <buildroot@archiver.kernel.org>; Mon, 27 Apr 2026 21:36:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D8812406E8;
	Mon, 27 Apr 2026 21:36:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bwPYAvCohVmh; Mon, 27 Apr 2026 21:36:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B24F9406D9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777325768;
	bh=l0KCfJx1ooQy65MREL/nAl3gwX1t5QoBML6Oqnh8EPU=;
	h=Date:From:To:cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RoovBqNF+yxj65ipmkidBWBqj3AhzG7Egt6oDOc49pfN3nLlJGl4HDwyh3H1U2ZRr
	 OaDcxdyM5D7jvYvbneGlbn+RknTelgXUonulZwcR+DPIt7/yj08IZox3yS6g9bjOnH
	 tNdqcWrVsUHDsg9Da+2x1bSd+kL1/iiGHx9R1AehH/xLyMpH/4nX755HZIfVLsvpoU
	 62df1sDTPtk16AOap9sqtvI/tJbLn6fOqbZeylEVZeGFSWX9hipfYHvtc7tbNMU8Sw
	 UqEOQ07RCgwVvn65asfUSBIDa44+/LA+laqw4a9blKhe0zR8CNDe1Lkld0ibwCvFDz
	 Co89FlPSVhZHg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B24F9406D9;
	Mon, 27 Apr 2026 21:36:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4F2EB231
 for <buildroot@buildroot.org>; Mon, 27 Apr 2026 21:36:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4036F607BA
 for <buildroot@buildroot.org>; Mon, 27 Apr 2026 21:36:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MCoWbDufUrn9 for <buildroot@buildroot.org>;
 Mon, 27 Apr 2026 21:36:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=64.142.111.50;
 helo=d.mail.sonic.net; envelope-from=sen@hastings.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3BF7B60642
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3BF7B60642
Received: from d.mail.sonic.net (d.mail.sonic.net [64.142.111.50])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3BF7B60642
 for <buildroot@buildroot.org>; Mon, 27 Apr 2026 21:36:05 +0000 (UTC)
Received: from obsidian (syn-068-189-041-004.res.spectrum.com [68.189.41.4]
 (may be forged)) (authenticated bits=0)
 by d.mail.sonic.net (8.16.1/8.16.1) with ESMTPSA id 63RLa3BA007558
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 27 Apr 2026 14:36:04 -0700
Date: Mon, 27 Apr 2026 14:36:03 -0700 (PDT)
From: Sen Hastings <sen@hastings.org>
To: Fiona Klute <fiona.klute@gmx.de>
cc: Buildroot ML <buildroot@buildroot.org>
In-Reply-To: <88d9e096-c542-4abe-a366-91e7d3fc5550@gmx.de>
Message-ID: <3d1abc1c-38cb-3c2f-dfb4-795f67279e82@hastings.org>
References: <88d9e096-c542-4abe-a366-91e7d3fc5550@gmx.de>
MIME-Version: 1.0
X-Sonic-CAuth: UmFuZG9tSVZ3LV4rTos7OTG0LipFowvpKJld4zQQ/q03/g3SvkRCZNcRyZ71CLihMJAC1YdZ9NOOKrUjOwPuWAlUMuPvzegU
X-Sonic-ID: C;zh2WF4FC8RGXP6If40Rrfg== M;Cs7bF4FC8RGXP6If40Rrfg==
X-Sonic-Spam-Details: not scanned (too big) by cerberusd
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=hastings.org
Subject: Re: [Buildroot] pkg-stats: Linux kernel handling bugs
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On Sun, 19 Apr 2026, Fiona Klute wrote:

> Hi everyone,
>
> I tried "make pkg-stats" on one of my builds today, and noticed a few issues 
> with the output for linux/linux.mk. Build is using:
>
> BR2_LINUX_KERNEL_LATEST_VERSION=y
> BR2_LINUX_KERNEL_VERSION="7.0"
>
> The version 7.0 is correctly shown in the "Current version" column, but there 
> are bugs in three others:
>
> * Hash file: No
>
> linux/7.0/linux.hash exists, maybe some issue parsing the symlinks involved?
>
> * Latest version: 6.19.13
>
> Links to https://release-monitoring.org/project/375247 which is "linux~6.x", 
> there's also "linux" at https://release-monitoring.org/project/358810/. 
> Grepping the project number doesn't yield anything, so it's not obvious to me 
> how it's determined.

see the function 'check_package_get_latest_version_by_distro' @ line 528,

pkg-stats queries the release monitoring HTTP api thusly:

     url = "https://release-monitoring.org/api/project/Buildroot/%s" %
pkg.name

so literally (I think):

https://release-monitoring.org/api/project/Buildroot/linux

curling that gives you JSON for linux~6.x (at the current moment),
presumably this is because it is the first result here:

https://release-monitoring.org/distro/Buildroot/search/?pattern=linux

see the api docs for more details:

https://release-monitoring.org/static/docs/api.html#get--api-project-(distro)-(path-package_name)

as for why the buildroot distro on release-monitoring.org uses these
major versioned linux projects (linux~6.x, linux~5.x, etc.) instead of
just linux, I have no clue. maybe someone needs to add a linux~7.x to
release monitoring.org?

also worth noting that there is a new HTTP api:
https://release-monitoring.org/static/docs/api.html#http-api-v2

and a python one:
https://release-monitoring.org/static/docs/api.html#python-apis

Sincerely,
sen-h

>
> * Upstream URL: invalid 404
>
> This is a weird one, it links to https://xenomai.org/downloads/ipipe/, which 
> appears only in linux/Config.ext.in under config BR2_LINUX_KERNEL_EXT_XENOMAI 
> (which I do not have enabled). That 404 might be a reason to revisit that 
> option, but in any case it shouldn't appear as the upstream URL for the 
> mainline kernel.
>
> I probably won't have time to dig into this any time soon, so I'm just 
> reporting these as bugs. Happy to test patches though!
>
> Best regards,
> Fiona
>
>
>
>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
