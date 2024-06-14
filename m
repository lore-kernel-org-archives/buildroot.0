Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BDD8C27C6E
	for <buildroot@archiver.kernel.org>; Fri, 14 Jun 2024 20:59:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 079DF4097F;
	Fri, 14 Jun 2024 20:59:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zjrXesuPDHTi; Fri, 14 Jun 2024 20:59:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 21A4E414F2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 21A4E414F2;
	Fri, 14 Jun 2024 20:59:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AB2341BF321
 for <buildroot@lists.busybox.net>; Fri, 14 Jun 2024 20:59:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A3A02404FF
 for <buildroot@lists.busybox.net>; Fri, 14 Jun 2024 20:59:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MF_oYjjLou7x for <buildroot@lists.busybox.net>;
 Fri, 14 Jun 2024 20:59:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:660:530d:201::44; helo=mailgw-out1.grenoble.cnrs.fr;
 envelope-from=bonet@grenoble.cnrs.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0AB0F400C4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0AB0F400C4
Received: from mailgw-out1.grenoble.cnrs.fr (mailgw-out1.grenoble.cnrs.fr
 [IPv6:2001:660:530d:201::44])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0AB0F400C4
 for <buildroot@buildroot.org>; Fri, 14 Jun 2024 20:59:06 +0000 (UTC)
Received: from [IPV6:2a01:e0a:12:eba0:b724:5a8d:10c6:c8ef] (unknown
 [IPv6:2a01:e0a:12:eba0:b724:5a8d:10c6:c8ef])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mailgw-out1.grenoble.cnrs.fr (Postfix) with ESMTPSA id 64E52C0109;
 Fri, 14 Jun 2024 22:59:03 +0200 (CEST)
Message-ID: <645d83bb-1760-4632-b48a-03f94c7e716a@grenoble.cnrs.fr>
Date: Fri, 14 Jun 2024 22:59:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: James Knight <james.d.knight@live.com>, buildroot@buildroot.org
References: <CALAjcgXZKYjpsFV1E7Ry-0N5NEGV01hebSb8tEgoAtHvkfvCOA@mail.gmail.com>
Content-Language: en-US
From: Edgar Bonet <bonet@grenoble.cnrs.fr>
In-Reply-To: <CALAjcgXZKYjpsFV1E7Ry-0N5NEGV01hebSb8tEgoAtHvkfvCOA@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=grenoble.cnrs.fr; 
 s=202106-grenoble.cnrs.fr; t=1718398743;
 bh=FhS30wcsV+aJ7XG0AGKd+2B+v9xBEMTsK6U/SGguYwU=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=gG5SF26ZiwTz476ia4c5UTT7Svp6rFq/4agOe/xVg7iOi3Inw9M8eykv1DvXhw0rn
 l+61A3VkmmBpiDil/vMIde5IKQglfKttaGxiYASFRRv/Dn4D6K64BQqvee+ru9bjyH
 l0g4dyGvXYmzSoCn6VFnwbDRce4qY7y26c1Tu38XGCcN4gLb1kUWpbT7CXWeczI6pq
 zRotYvddingM1WDYTe6FhUJF9Jimw8fjnl0/2N2TpNUjTt0MMSAD2RpX/7ZknYdm5d
 IQbcWJeycHPNMU9EDYG0FIx3ysXC3d+/j4MgZ88RBnSiK6Sz/JPw8tHbhmjZInbvln
 palszf5YYiiug==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=grenoble.cnrs.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=grenoble.cnrs.fr header.i=@grenoble.cnrs.fr
 header.a=rsa-sha256 header.s=202106-grenoble.cnrs.fr header.b=gG5SF26Z
Subject: Re: [Buildroot] inquiry | configuring for a specific linux lts
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello!

James Knight wrote:
> Trying to figure out the best way with Buildroot to target a specific
> Linux LTS branch for images. At this time, using a setup that has an
> external toolchain build (v6.6.x Linux headers) and inside each
> project configurations a `BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE`
> option is specified to a value of (for example) `6.6.32`. As Buildroot
> evolves, it may update its own configuration and Linux hashes to a
> more recent version (e.g. v6.6.33). In turn, when updating the
> Buildroot version to use, there is a need to update all configurations
> to use the most recent LTS version.
> 
> I am looking for a capability somewhat provided by the existing
> `BR2_LINUX_KERNEL_LATEST_VERSION` option, but targeting a specific LTS
> version. For example:
> 
>     BR2_LINUX_KERNEL_LATEST_VERSION
>     BR2_LINUX_KERNEL_LATEST_LTS_0606_VERSION
>     BR2_LINUX_KERNEL_LATEST_LTS_0601_VERSION
>     BR2_LINUX_KERNEL_LATEST_LTS_0516_VERSION
>     ...
> 
> Then these configurations can use whatever the latest LTS version of a
> configured major-minor without updating.

Not sure this answers your question but, in your personal defcofig, you
don't need to keep `BR2_DOWNLOAD_FORCE_CHECK_HASHES`. Then, if you
replace

    BR2_LINUX_KERNEL_CUSTOM_VERSION=y
    BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.32"

by

    BR2_LINUX_KERNEL_CUSTOM_GIT=y
    BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git"
    BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="linux-6.6.y"

you should be using whatever the tip of the linux-6.6.y branch is at
build time.

I didn't test that though.

Regards,

Edgar.

> I imagine this may not be implemented since these additional
> configuration options may be a bit too much to maintain. Assuming such
> an approach is not desired, I wonder if it may be possible to support
> a `BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE` option where users can
> define a value such as `6.6.` (or `6.6.x` or whatever) and have
> Buildroot use whatever the most recent version it "supports" (e.g. has
> a hash reference).
> 
> For now, it seems the tasks needed to handle an updated Buildroot
> framework with a custom Linux version is to first have projects
> track/patch the hash version of Linux any time a custom version is
> set; and update both the version and patch-hash in a board
> configuration when wanting to update.
> 
> If I am overlooking another way to approach this, please let me know.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
